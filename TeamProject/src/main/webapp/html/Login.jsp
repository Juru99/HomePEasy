<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HomePEasy Login</title>

    <link rel="stylesheet" href="resources/css/Login.css" />
    <link  />
  </head>

  <body>
    <div class="login-container">
      <form class="login-form" action="BasePage.jsp?target_Main=html/Login_Process" method="post">
        <div class="form-logo">
          <a href="index.jsp">
            <img class="logo" src="resources/img/logo.png" />
          </a>
        </div>
        <div class="form-item">
          <input type="text" class="id" name="id" placeholder="  * 아이디" />
        </div>
        <div class="form-item">
          <input
            type="password"
            class="pw"
            name="pw"
            placeholder="  * 비밀번호"
          />
        </div>
        <div class="form-item">
          <a href="BasePage.jsp?target_Main=html/SearchId" class="find-id">아이디</a>
          <span>/</span>
          <a href="BasePage.jsp?target_Main=html/SearchPw" class="find-pw">비밀번호 찾기</a>
        </div>
        <div class="form-item">
          <button type="submit" class="login-btn">로그인</button>
        </div>
        <div class="form-item">
          <span>처음 오셨나요?</span>
          <a href="BasePage.jsp?target_Main=html/Join" class="join-link">신규 회원가입</a>
        </div>
      </form>
    </div>
  </body>
</html>
