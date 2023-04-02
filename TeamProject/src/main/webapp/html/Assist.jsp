<%@page import="java.io.Console"%> <%@page
import="homepeasy.method.conversionchar.Conversion"%> <%@ page language='java'
contentType='text/html; charset=utf-8' pageEncoding='utf-8' %> <%
request.setCharacterEncoding("utf-8"); String code =
(String)session.getAttribute("code"); int start = -1; int end = -1; String
codeset = (String)session.getAttribute("codeset"); Conversion conversionChar =
new Conversion(); code = conversionChar.ChangeChar(code); code =
conversionChar.RemoveChar(code); out.println(codeset);
System.out.println("aabbaa"); System.out.print(codeset); %>
<!DOCTYPE html>
<html id="IOHtmlCode">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HomePEasy Assist</title>
    <link rel="stylesheet" href="../resources/css/Ass.css" />
    <script>
      function AssistEnd() {
        var codeSend = "";
        var assistEnd = document.getElementById("assistEnd");
        var userViewPage = document.getElementById("userViewPage");
        var userCode = document.getElementById("userCode");

        codeSend = userViewPage.innerHTML;

        sessionStorage.setItem("code", codeSend);

        assistEnd.type = "submit";
      }
    </script>
  </head>
  <body>
    <div class="assist-container">
      <div class="assist-config">
        <div class="config-item">
          <span class="assist-menu">메뉴 설정</span>
        </div>
        <div class="config-item">
          <span class="assist-site">사이트 설정</span>
        </div>
      </div>
      <div class="assist-toolbar">
        <div class="toolbar-item">
          <a class="toolbar-button" href="Guide.jsp" target="_blank">가이드</a>
        </div>
        <div class="toolbar-item">
          <a class="toolbar-button" href="#">미리보기</a>
        </div>

        <div class="toolbar-item">
          <form
            action="../BasePage.jsp?target_Main=html/AssistProcess"
            method="post"
          >
            <!-- <a class='toolbar-button' href='../BasePage.jsp?target_Main=html/AssistProcess'>편집 끝내기</a>  -->
            <button
              type="button"
              id="assistEnd"
              class="toolbar-button"
              onclick="AssistEnd()"
            >
              편집 끝내기
            </button>
          </form>
        </div>
      </div>
    </div>
    <div class="menu-config hidden">
      <ol>
        <li>인트로 페이지</li>
        <li>ABOUT</li>
        <li>SERVICES</li>
        <li>PROJECTS</li>
      </ol>
      <div class="new-add">
        <div class="new-menu hidden">
          <input type="text" placeholder="  메뉴명" />
          <button>메뉴 생성</button>
        </div>
        <div class="add-menu">
          <span>메뉴 추가</span>
        </div>
      </div>
    </div>
    <div class="site-config hidden">
      <ol>
        <li>배경</li>
        <li>기본 폰트</li>
        <li>메뉴3</li>
        <li>메뉴4</li>
      </ol>
    </div>
    <div class="assist-sidebar hidden">
      <ul class="component-list">
        <li>쇼케이스</li>
        <li>타이틀</li>
        <li>컨텐츠</li>
        <li>갤러리</li>
        <li>텍스트</li>
        <li>이미지</li>
        <li>동영상</li>
        <li>구분선</li>
        <li>컨택트</li>
        <li>게시판</li>
        <li>소셜</li>
        <li>폼</li>
        <li>기타요소</li>
      </ul>
      <div class="close-sidebar">
        <img
          src="https://storage.googleapis.com/i.addblock.net/btn_close.gif"
        />
      </div>
      <ul class="component-item-list">
        <li><img src="" data-id="1" data-type="showcase" /></li>
        <li><img src="" data-id="2" data-type="showcase" /></li>
        <li><img src="" data-id="3" data-type="showcase" /></li>
        <li><img src="" data-id="4" data-type="showcase" /></li>
        <li><img src="" data-id="5" data-type="showcase" /></li>
        <li><img src="" data-id="6" data-type="showcase" /></li>
      </ul>
    </div>
    <div id="userViewPage" class="userViewPage">
      <div class="header"></div>
      <ul class="addElement" id="add-1">
        <li class="addElementButton">
          <div class="add-block">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 14 14"
              width="14"
              height="14"
            >
              <rect x="6" width="2" height="14"></rect>
              <rect
                x="6"
                transform="matrix(6.123234e-17 -1 1 6.123234e-17 0 14)"
                width="2"
                height="14"
              ></rect>
            </svg>
          </div>
        </li>
      </ul>
      <div class="main"></div>
      <ul class="addElement" id="add-2">
        <li class="addElementButton">
          <div class="add-block">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 14 14"
              width="14"
              height="14"
            >
              <rect x="6" width="2" height="14"></rect>
              <rect
                x="6"
                transform="matrix(6.123234e-17 -1 1 6.123234e-17 0 14)"
                width="2"
                height="14"
              ></rect>
            </svg>
          </div>
        </li>
      </ul>
      <div class="footer"></div>
    </div>
  </body>
  <script src="../resources/js/Assist.js"></script>
  <script>
    var code = "<%= code %>";
    var userViewPage = document.getElementById("userViewPage");
    var userCode = document.getElementById("userCode");

    code += "<div>성공</div>";

    userViewPage.innerHTML = code;
  </script>
</html>
