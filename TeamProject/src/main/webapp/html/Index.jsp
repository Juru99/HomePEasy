<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<html>
  <head>
    <link rel="stylesheet" href="resources/css/Index.css?ver=3" />
    <script defer src="resources/js/Index.js?ver=2"></script>
  </head>
  <body>
    <div class="video-container">
      <iframe
        width="1280px"
        height="720px"
        src="https://www.youtube.com/embed/9Kdz3CIMd6U"
        title="HomePEasy"
        frameborder="0"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen
      ></iframe>
    </div>

    <div class="slider-container">
      <div class="left-slide">
        <div style="background-color: #2a86ba">
          <h1>최대한 알아서</h1>
          <p>
            세밀하게 신경쓰지 않아도 원하는<br />
            결과물을 낼 수 있도록 합니다.
          </p>
        </div>

        <div style="background-color: #252e33">
          <h1>포토샵을 몰라도</h1>
          <p>
            디자인 감각이 없어도 훌륭한 <br />
            반응형 사이트를 만들 수 있습니다
          </p>
        </div>

        <div style="background-color: #ffb866">
          <h1>코드를 몰라도</h1>
          <p>
            HTML,CSS,JS를 몰라도<br />
            아무런 문제가 되지 않습니다
          </p>
        </div>
      </div>
      <div class="right-slide">
        <div>
          <img
            width="850px"
            height="500px"
            src="resources/img/index/2nd_1.PNG"
            alt="1번 사진"
          />
        </div>
        <div>
          <img
            width="850px"
            height="500px"
            src="resources/img/index/2nd_2.PNG"
            alt="2번 사진"
          />
        </div>
        <div>
          <img
            width="850px"
            height="500px"
            src="resources/img/index/2nd_3.png"
            alt="3번 사진"
          />
        </div>
      </div>
      <div class="action-buttons">
        <button class="down-button">
          <i class="fas fa-arrow-down"></i>
        </button>

        <button class="up-button">
          <i class="fas fa-arrow-up"></i>
        </button>
      </div>오전 10:57 2022-11-15
    </div>

    <!-- 세번째 개발자 인터뷰(그림+글) 넣는곳-->

    <div class="interview-container" data-bs-ride="interview-container">
      <div class="interview-container-inner">
        <div class="interview-container-item">
          <div class="card">
            <div class="img-wrapper">
              <img src="resources/img/index/3rd_1.png" alt="인물 사진" />
            </div>
            <div class="card-body">
              <h1 class="card-title">김현석</h1>
              <p class="card-text">
창세기 제 1장
<p>태초에 하나님이 홈페이지를 창조하시니라</p>

<p>하나님이 궁창을 만드사 메인이라 부르시니라  <br>궁창을 기둥 삼아 위에는 헤더를, 아래에는 푸터를 만드시니</p>

<p>사진과 글이 각기 종류대로 조화를 이르니 <br>하나님이 보시기에 좋았더라</p>

<p>하나님이 복을 주시며 그들에게 이르시되 <br>홈페이지를 너희에게 주노니 너희의 복이 되리라 하셨노라</p>
              </p>
            </div>
          </div>
        </div>
        <div class="interview-container-item">
          <div class="card">
            <div class="img-wrapper">
              <img src="resources/img/index/3rd_2.jpg" alt="인물 사진" />
            </div>
            <div class="card-body">
              <h1 class="card-title">최준혁</h1>
              <p class="card-text">
                마우스 클릭과 직관적인 메뉴들로 쉽고 빠르게 웹페이지를 만들 수
                있습니다.
              </p>
            </div>
          </div>
        </div>
        <div class="interview-container-item">
          <div class="card">
            <div class="img-wrapper">
              <img src="resources/img/index/3rd_3.jpg" alt="인물 사진" />
            </div>
            <div class="card-body">
              <h1 class="card-title">강한얼</h1>
              <p class="card-text">
                사이트 편집의 자세한 사용법은 가이드에서 만날 수 있습니다.
              </p>
            </div>
          </div>
        </div>
        <div class="interview-container-item">
          <div class="card">
            <div class="img-wrapper">
              <img src="resources/img/index/3rd_4.jpg" alt="인물 사진" />
            </div>
            <div class="card-body">
              <h1 class="card-title">정진모</h1>
              <p class="card-text">
                차세대 웹페이지서비스를 이어갈 HomePEasy와 함께하세요
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 네번째 브랜드(브랜드 모아서 그림으로 만들고 삽입) 넣는곳-->
    <div class="brand-container">
      <img src="resources/img/index/brandlogo.PNG" />
    </div>
  </body>
</html>
