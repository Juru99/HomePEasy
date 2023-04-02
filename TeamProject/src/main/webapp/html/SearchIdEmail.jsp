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
    <title>HomePEasy Login</title>
    <link rel="stylesheet" href="resources/css/SearchId.css?ver=1" />
    <script>
	var temp = "<%= temp %>";

    	function checkMail()
	{
		var emailNum = document.getElementById("emailNum");
		
		if(emailNum.value == temp)
		{
			alert("인증이 완료되었습니다.");
			var auth = document.getElementById("auth");

			auth.type = "submit";
		}
	}
   		
    </script>
</head>
<body>
    <div class="search-container">
            <form method="post" action="BasePage.jsp?target_Main=html/SearchIdProcess">
             <div class="form-logo">
                    <a href="BasePage.jsp?target_Main=html/Index">
                        <img class="logo" src="resources/img/logo.png" />
                    </a>
                </div>
            <div class="form-item">
                <input tpye="text" class="name" id="name" name="name" placeholder="  * 이름" value="<%= name %>" />
            </div>
            <div class="form-item">
                <input tpye="text" class="year" id="year" name="year" placeholder="  * (ex)20020101" value="<%= year %>" />
            </div>
            <div class="form-item">
                <input tpye="email" class="email" id="email" name="email" placeholder="  * 이메일" value="<%= email %>" />

            </div>
	<div class="form-item">
		<input type="text" class="email" id="emailNum" name="emailNum" placeholder="  * 인증번호" />
               	<input type="button" class="auth" id="auth" onclick="checkMail()" value="인증확인" />
	</div>
            </form>
        </div>
</body>
</html>