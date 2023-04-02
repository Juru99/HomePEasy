<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
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
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String rePw = request.getParameter("rePw");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String email = request.getParameter("email");
	
	
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
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
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
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
     
    msg.setContent("인증번호 : " + temp, "text/html;charset=UTF-8"); // 내용과 인코딩

    Transport.send(msg); // 전송
} catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('인증 메일 발송에 실패하였습니다.');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
}
 
out.println("<script>alert('인증 메일이 발송되었습니다.');</script>");


%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="wnameth=device-wnameth, initial-scale=1.0">
    <title>HomePEasy Join</title>
    <link rel="stylesheet" href="resources/css/Join.css">
    <script>
    
   		var　chk　=　0;
		var emailNum = "<%= temp %>";
	
    	function join_Btn(){
    		var join_Btn = document.getElementById("joinBtn");
    		var pw = document.getElementById("pw");
    		var rePw = document.getElementById("rePw");
    		
    		
    		if(chk == 1)
    		{
    			if(pw.value == rePw.value)
    			{
    				join_Btn.type = "submint";
    			}
    			else
    			{
    				alert("비밀번호가 일치하지 않습니다.");
    			}
    			
    		}
    		else
    		{
    			alert("이메일 인증을 완료해주세요.");
    		}
    		
    		//join_Btn.type = "submit";
    	}
    	
    	function email_Btn(){
    		var emailBox = document.getElementById("emailOk").value;
			
			
			
			if(emailNum == emailBox){
				if(chk == 1){
					
				}else{
					alert("인증이 완료되었습니다.");
					chk = 1;
				}
				
			}else{
				alert("인증번호가 일치하지 않습니다. 다시 시도해주세요.");
				
				chk = 0;
			}
    	}
    </script>
</head>
<body>
    <div class="join-container">
        <form class="join-form" method="post" action="BasePage.jsp?target_Main=html/Join_Process">
            <div class="form-logo">
                <a href="index.jsp">
                    <img class="logo" src="" />
                </a>
            </div>
            <div class="form-item">
                <input name="id" class="id" type="text" placeholder="  * 아이디" value="<%= id %>" />
                <button type="button" name="dblChk" class="dbl-chk">중복확인</button>
            </div>
            <div class="form-item">   
                <input name="pw" id="pw" class="pw" type="password" placeholder="  * 비밀번호" value="<%= pw %>" />
            </div>
            <div class="form-item">
                <input name="rePw" id="rePw" class="re-pw" type="password" placeholder="  * 비밀번호 확인" value="<%= rePw %>" />
            </div>
            <div class="form-item">
                <input name="name" class="name" type="text" placeholder="  * 이름" value="<%= name %>" />
            </div>
            <div class="form-item">
                <input name="year" class="year" type="text" placeholder="  * (ex)20020101" maxlength="8" value="<%= year %>" />
            </div>
            <div class="form-item">
                <input name="email" class="email" type="email" placeholder="  * 이메일" value="<%= email %>" /> 
                <button type="button" name="auth" class="auth">이메일 인증</button>
            </div>
            <div class="form-item">
            	<input id="emailOk" name="emailOk" class="emailOk" type="text" placeholder="  * 인증번호 입력" />
            	<button type="button" name="emailBtn" class="emailBtn" onclick="email_Btn()">인증번호 확인</button>
            </div>
            <div class="form-item">
                <button type="button" id="joinBtn" name="joinBtn" class="join-btn" onclick="join_Btn()" >회원가입</button>
            </div>
        </form>
    </div>
</body>
    <script src="resources/js/Join.js">
    
    </script>
</html>