<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="stylesheet" href="resources/css/Menu.css?ver=12" />
  </head>
  <body>
    <div class="loginMenu-container">
      <div class="loginMenu-left">
        <div class="logo">
          <a href="BasePage.jsp?target_Main=html/Index"><img src="resources/img/logo.png" /></a>
        </div>
        <div class="guide">
          <a href="BasePage.jsp?target_Main=html/Guide">기능소개</a>
        </div>
        <div class="service">
          <a href="BasePage.jsp?target_Main=html/Service">고객지원</a>
        </div>
        <div class="templete">
          <a href="BasePage.jsp?target_Main=html/Templete">템플릿</a>
        </div>
      </div>
      <div class="loginMenu-right">
        <div class="myInfo">
          <a href="BasePage.jsp?target_Main=html/MyInfo">마이페이지</a>
        </div>
        <div class="logout">
          <a href="BasePage.jsp?target_Main=html/LogoutProcess">로그아웃</a>
        </div>
      </div>
    </div>
  </body>
  <script src="resources/js/Menu.js"></script>
</html>
