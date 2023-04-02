<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<html>
  <head>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="resources/css/Guide.css?ver=3" />
  </head>
  <body>
    <div class="guide-div">
      <div
        id="navbar-guide"
        class="navbar navbar-light bg-light flex-column align-items-stretch p-3 guide-div-left"
      >
        <ol class="nav nav-pills flex-column">
          <li class="navbar-brand guide-start">시작하기</li>
          <ol>
            <li>
              <a class="nav-link" href="#item-1">디자인모드</a>

              <ol class="nav nav-pills flex-column">
                <li>
                  <a class="nav-link ms-3 my-1" href="#item-1-1"
                    >디자인모드란?</a
                  >
                </li>
                <li>
                  <a class="nav-link ms-3 my-1" href="#item-1-2"
                    >상단 디자인 시작하기</a
                  >
                </li>
                <li>
                  <a class="nav-link ms-3 my-1" href="#item-1-3">
                    메뉴설정탭
                  </a>
                </li>
                <li>
                  <a class="nav-link ms-3 my-1" href="#item-1-4"
                    >사이트 설정 탭</a
                  >
                </li>
                <li>
                  <a class="nav-link ms-3 my-1" href="#item-1-5">편집 끝내기</a>
                </li>
                <li>
                  <a class="nav-link ms-3 my-1" href="#item-1-6"> 추가 버튼</a>
                </li>
                <li>
                  <a class="nav-link ms-3 my-1" href="#item-1-7">도구 탭</a>
                </li>
                <li>
                  <a class="nav-link ms-3 my-1" href="#item-1-8"> 속성 탭</a>
                </li>
              </ol>
            </li>
          </ol>
        </ol>
      </div>
      <div
        data-bs-spy="scroll"
        data-bs-target="#navbar-guide"
        data-bs-offset="0"
        tabindex="0"
        class="guide-div-right"
      >
        <h1 style={margin-top:2px;}>시작하기</h1>

        <br />

        <h4 id="item-1">디자인모드</h4>
        <p></p>
        <h5 id="item-1-1">디자인모드란?</h5>
        <p>
          디자인 모드에서 웹사이트를 목적에 맞게 꾸미고 내용을 추가할 수
          있습니다. 이 도움말에서는 디자인 모드 접속방법 및 사용자 인터페이스를
          알아보실 수 있습니다. 디자인 모드는 관리자 페이지를 통해 접속하거나
          내사이트 목록에서 빠르게 접속할 수 있습니다.
        </p>
        <h5 id="item-1-2">상단 디자인 시작하기</h5>
        <p>
          HomePEasy에서 웹 페이지는 위에서부터 상단(Header), 본문(Body),
          하단(Footer)로 구성됩니다. 상단에는 로고, 메뉴 등이 표시되는 영역으로
          내비게이션 메뉴라고도 부릅니다.
        </p>
        <h5 id="item-1-3">메뉴설정탭</h5>
        <img src="resources/img/guide/Menusetting.png" />
        <p>
          메뉴 설정 탭에서 상단에 메뉴 생성·삭제를 할 수 있습니다. <br />
          1. 메뉴 추가 : 메뉴 생성란을 열 수 있습니다.<br />
          2. 메뉴 생성 : 메뉴명과 연결할 링크 주소를 입력하여 메뉴를 생성할 수
          있습니다.<br />
          3. 메뉴 삭제 : 메뉴 설정 탭의 삭제 버튼을 눌러 해당 메뉴를 삭제할 수
          있습니다.
        </p>
        <h5 id="item-1-4">사이트 설정 탭</h5>
        <img src="resources/img/guide/Sitesetting.png" />
        <p>페이지 전체의 배경색, 기본 폰트를 설정할 수 있습니다.</p>
        <h5 id="item-1-5">편집 끝내기</h5>
        <img src="resources/img/guide/Endbutton.PNG" />
        <p>사용자가 만든 페이지를 마이페이지의 프리셋에 저장합니다.</p>
        <h5 id="item-1-6">추가 버튼</h5>
        <img src="resources/img/guide/Addbutton.PNG" />
        <p>
          추가 버튼을 누르면 이미지, 텍스트 등을 페이지에 넣을 수 있는 도구 탭이
          열립니다.
        </p>
        <h5 id="item-1-7">도구 탭</h5>
        <img src="resources/img/guide/Tool.PNG" />
        <p>
          도구 탭의 메뉴를 클릭하여 텍스트, 이미지, 동영상 등을 확인할 수 있으며
          해당 메뉴의 이미지를 더블클릭하여 사용자가 만들 페이지에 추가할 수
          있습니다.
        </p>
        <h5 id="item-1-8">속성 탭</h5>
        <img src="resources/img/guide/Property.png" />
        <p>
          추가한 도구를 더블클릭하여 해당 도구를 편집할 수 있는 속성 탭이
          열립니다.
        </p>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
