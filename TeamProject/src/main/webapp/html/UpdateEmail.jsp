<%@page import="java.net.PasswordAuthentication"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@page import="java.util.Random"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="mail.SMTPAuthenticator" %>
<%!
	private static final String Driver_Class = "com.mysql.cj.jdbc.Driver";
	// jdbc:mysql://연결하는호스트/데이터베이스명?serverTimeZone=UTC
	private static final String URL = "jdbc:mysql://43.200.12.50:3306/homepeasy?serverTimeZone=UTC";
	private static final String USERNAME = "wskjdd12";
	private static final String PASSWORD = "zkskep12";

%>
<%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		//out.println("1");
		// JDBC 드라이버 클래스 로딩
		Class.forName(Driver_Class);
		//out.println("JDBC 드라이버 클래스 로딩 성공<br>");
		
		//out.println("2");
		//DBMS에 접속
		conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		//out.println("DBMS 접속 성속<br>");
		
		//out.println("3");
		// Statement 객체 로딩		
		stmt = conn.createStatement();
		//out.println("Statement 객체 로딩 성공<br>");
		
		//out.println("4");
		//sql 코드 작성 및 결과 가져오기
		//rs = stmt.executeQuery("select * from usertable");
		//out.println("SQL 쿼리 성공<br>");
			
		
	}catch(SQLException se){
		out.println("실패" + se.getMessage());
		out.println("!");
	}
	catch(Exception e){
		e.printStackTrace();
		out.println("실패" + e.getMessage());
		
		
	}finally{
		

	}
%>

<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String name = "";
	String id = (String)session.getAttribute("user");

	
	
	try
	{
		String sql ="select name from user where id = '" + id + "'";
		
		rs = stmt.executeQuery(sql);
		
		rs.next();
		
		name = rs.getString(1);
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
		out.println("실패" + e.getMessage());
	}
	
%>

<% 



String temp = "";
StringBuffer temp_rnd = new StringBuffer();
Random rnd = new Random();
for(int i=0;i<10;i++)
{
    int rIndex = rnd.nextInt(3);
    switch (rIndex) {
    case 0:
        // a-z
        temp_rnd.append((char) ((int) (rnd.nextInt(26)) + 97));
        break;
    case 1:
        // A-Z
        temp_rnd.append((char) ((int) (rnd.nextInt(26)) + 65));
        break;
    case 2:
        // 0-9
        temp_rnd.append((rnd.nextInt(10)));
        break;
    }
}

temp = temp_rnd.toString();



Properties p = new Properties();

p.put("mail.smtp.host", "smtp.naver.com");
p.put("mail.smtp.port", 587);
//p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
//p.put("mail.smtp.debug", "true");
//p.put("mail.smtp.socketFactory.port", "465");
//p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//p.put("mail.smtp.socketFactory.fallback", "false");
//p.put("mail.smtp.ssl.enable", "true");
//p.put("mail.smtp.ssl.trust", "smtp.naver.com");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.ssl.protocols", "TLSv1.2");



try{
    Authenticator auth = new SMTPAuthenticator();
    
    Session ses = Session.getInstance(p, auth);
     
    ses.setDebug(true);
     
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
    msg.setSubject("HomePEasy Mail Authentication Number"); // 제목
     
    Address fromAddr = new InternetAddress("gugudndn@naver.com");
    msg.setFrom(fromAddr); // 보내는 사람
     
    Address toAddr = new InternetAddress(email);
    //msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
    msg.setRecipient(Message.RecipientType.TO, toAddr);
     
    msg.setContent("인증번호 : " + temp, "text/html;charset=UTF-8"); // 내용과 인코딩

    Transport.send(msg); // 전송
} catch(Exception e){
    e.printStackTrace();
    out.println(e.getMessage() + "<br>");
    out.println(e.getLocalizedMessage() + "<br>");
    out.println(e.toString());
    //out.println("<script>alert('인증 메일 발송에 실패하였습니다.');");
    //out.println("location.replace('BasePage.jsp?target_Main=html/MyInfo')</script>");
    // 오류 발생시 뒤로 돌아가도록
    
    out.println();
    
    return;
}
 
out.println("<script>alert('인증 메일이 발송되었습니다.');</script>");


%>



<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HomePEasy myInfo</title>
    <link rel="stylesheet" href="resources/css/MyInfo.css" />
    <script>
    	var　chk　=　0;
		var emailNum = "<%= temp %>";
    
    
    	function userDel()
    	{
    		alert("이메일 인증이 진행중입니다.");
    	}
    	function updatePw()
    	{
    		alert("이메일 인증이 진행중입니다.");
    	}
    	function email_Chk(){
    		var emailBox = document.getElementById("emailNum").value;
			var emailChk = document.getElementById("emailChk");
			
			
			if(emailNum == emailBox){
				if(chk == 1){
					
				}else{
					alert("인증이 완료되었습니다.");
					chk = 1;
					emailChk.type = "submit";
				}
				
			}else{
				alert("인증번호가 일치하지 않습니다. 다시 시도해주세요.");
				
				chk = 0;
			}
    	}
    </script>
  </head>
  <body>
    <div class="myInfo">
      <div class="myInfo-tab">
        <div class="privacy">
          <span>개인정보</span>
        </div>
        <div class="preset">
          <span>프리셋</span>
        </div>
      </div>
      <div class="myInfo-contents">
        <form class="privacy-form" method="post" action="BasePage.jsp?target_Main=html/UpdateEmailProcess">
          <div class="form-item">
            <input class="id" type="text" placeholder="  아이디" disabled value="<%= id %>" />
          </div>
          <div class="form-item">
            <input
            	id="pw"
              class="pw"
              name="pw"
              type="password"
              placeholder="  비밀번호" value=""
              disabled
            />
          </div>
          <div class="form-item">
            <input
            	id="rePw"
              class="re-pw"
              name="rePw"
              type="password"
              placeholder="  비밀번호 확인"
              disabled
            />
            <button
              type="button"
              id="pwChk"
              name="pwChk"
              class="pw-chk"
              onclick="updatePw()"
            >비밀번호 변경</button>
          </div>
          <div class="form-item">
            <input class="username" type="text" placeholder="  이름" value="<%= name %>" disabled />
          </div>
          <div class="form-item">
            <input id="email" name="email" class="email" type="email" placeholder="  이메일" value="<%= email %>" />
            <a href="#" class="email-chk">이메일 인증</a>
          </div>
          <div class="form-item">
          	<input id="emailNum" class="email" type="text" placeholder="   인증번호 입력" />
          	<button type="button" id="emailChk" class="email-chk" onclick="email_Chk()">인증하기</button>
          </div>
          <div>
            <button
              type="button"  id="dropMember" name="dropMember" class="drop-member" onclick="userDel()" >회원 탈퇴</button>
          </div>
        </form>
        <div class="preset-contents hidden">
          <div class="preset-property">
            <div class="property-item">
              <span>프리셋명</span>
            </div>
            <div class="property-item">
              <span>사이트명</span>
            </div>
            <div class="property-item">
              <span>도구</span>
            </div>
          </div>
          <div class="preset-item">
            <div>
              <span>프리셋명A</span>
            </div>
            <div>
              <span>사이트명A</span>
            </div>
            <div>
              <button class="site-output">내보내기</button>
              <a href="Assist.jsp">사이트 편집</a>
            </div>
          </div>
          <div class="preset-item"></div>
        </div>
      </div>
    </div>
  </body>
  <script src="resources/js/MyInfo.js"></script>
</html>
