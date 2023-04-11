import React, { useState } from "react";
import "./App.css";

// 편집 끝내기 시 userViewPage의 코드를 가져옴.
var isDelete = true;
function AssistEnd() {
  const header = document.querySelector("#header");
  const main = document.querySelector("#main");
  const footer = document.querySelector("#footer");
  console.log(header);
  console.log(main);
  console.log(footer);
  let userViewCode = header.outerHTML + main.outerHTML + footer.outerHTML;
  // header.outerHTML = userViewCode;
  // outerHTML 잘되는거 확인 완료
  console.log(userViewCode);
}

function AssistContainer({ changeMenuValue, changeSiteValue }) {
  return (
    <div className="assist-container">
      <div className="assist-config">
        <div className="config-item" onClick={changeMenuValue}>
          <span className="assist-menu">메뉴 설정</span>
        </div>
        <div className="config-item" onClick={changeSiteValue}>
          <span className="assist-site">사이트 설정</span>
        </div>
      </div>
      <div className="assist-toolbar">
        <div className="toolbar-item">
          <a className="toolbar-button" href="Guide.jsp">
            가이드
          </a>
        </div>
        <div className="toolbar-item">
          <a className="toolbar-button" href="#">
            미리보기
          </a>
        </div>
        <div className="toolbar-item">
          <form
            action="../BasePage.jsp?target_Main=html/AssistProcess"
            method="post"
          >
            <button
              type="button"
              id="assistEnd"
              className="toolbar-button"
              onClick={AssistEnd}
            >
              편집 끝내기
            </button>
          </form>
        </div>
      </div>
    </div>
  );
}

var isMenu = false;
var menuListItem = null;
function clickedMenu(event) {
  if (menuListItem == null) {
    menuListItem = document.querySelector("#" + event.target.id);
  }
  if (menuListItem != null) {
    isMenu ? (isMenu = false) : (isMenu = true);
    if (isMenu == true) {
      menuListItem.style.background = "#DDE7E7";
    } else {
      menuListItem.style.background = "#FFFFFF";
      menuListItem = null;
    }
  }
}

var menuListNum = 5;
function addMenu() {
  const menuName = document.querySelector("#menuName");
  const menuList = document.querySelector("#menuList");
  const menuLi = document.createElement("li");
  const delBtn = document.createElement("button");
  menuLi.id = "menuList-" + menuListNum;
  menuLi.innerText = menuName.value;

  delBtn.innerText = "삭제";
  delBtn.style.width = "50px";
  delBtn.style.height = "30px";
  delBtn.addEventListener("click", delMenu);

  menuLi.addEventListener("dblclick", clickedMenu);
  menuLi.appendChild(delBtn);
  menuList.appendChild(menuLi);

  const gnbList = document.querySelector("#gnbList");
  const gnbListItem = document.createElement("li");
  gnbListItem.id = "gnbListItem-" + menuListNum;
  gnbListItem.innerText = menuName.value;

  gnbList.appendChild(gnbListItem);

  menuName.value = "";
  menuListNum++;
}

function delMenu(event) {
  const menuList = document.querySelector("#menuList");
  menuList.removeChild(
    document.querySelector("#" + event.target.parentElement.id)
  );

  // 정규식 사용하여 번호만 추출
  const str = "#" + event.target.parentElement.id;
  const result = str.replace(/[^0-9]/g, "");

  const gnbList = document.querySelector("#gnbList");
  gnbList.removeChild(document.querySelector("#gnbListItem-" + result));
}

function MenuConfig({ displayMenu, displayNewMenu, changeNewMenuValue }) {
  return (
    <div
      className="menu-config"
      style={{ display: displayMenu ? "inline" : "none" }}
    >
      <ol id="menuList">
        <li id="menuList-1" onDoubleClick={clickedMenu}>
          인트로 페이지
          <button onClick={delMenu}>삭제</button>
        </li>
        <li id="menuList-2" onDoubleClick={clickedMenu}>
          ABOUT
          <button onClick={delMenu}>삭제</button>
        </li>
        <li id="menuList-3" onDoubleClick={clickedMenu}>
          SERVICES
          <button onClick={delMenu}>삭제</button>
        </li>
        <li id="menuList-4" onDoubleClick={clickedMenu}>
          PROJECTS
          <button onClick={delMenu}>삭제</button>
        </li>
      </ol>
      <div className="new-add">
        <div
          className="new-menu"
          style={{
            display: displayNewMenu ? "flex" : "none",
          }}
        >
          <input id="menuName" type="text" placeholder="  메뉴명" />
          <button onClick={addMenu}>메뉴 생성</button>
        </div>
        <div
          className="add-menu"
          style={{
            marginTop: displayNewMenu ? "0px" : "50px",
          }}
        >
          <span onClick={changeNewMenuValue}>메뉴 추가</span>
        </div>
      </div>
    </div>
  );
}
function SiteConfig({ displaySite }) {
  return (
    <div
      className="site-config"
      style={{ display: displaySite ? "inline" : "none" }}
    >
      <ol>
        <li>배경</li>
        <li>기본 폰트</li>
        <li>메뉴3</li>
        <li>메뉴4</li>
      </ol>
    </div>
  );
}
var addBlockId; // 추가버튼의 최상위 id

// [추가버튼 겹치기방지 변수]
var headerCount = 0; // header안의 컴포넌트 개수
var mainCount = 0; // main안의 컴포넌트 개수
var footerCount = 0; // footer안의 컴포넌트 개수
const getAddBlockId = (event) => {
  addBlockId = event.target.parentElement.parentElement.id;
  if (
    addBlockId == "addBlock-1" ||
    addBlockId == "svg-1" ||
    addBlockId == "rect1-1" ||
    addBlockId == "rect2-1"
  ) {
    addBlockId = "addBlockArea-1";
  }
  if (
    addBlockId == "addBlock-2" ||
    addBlockId == "svg-2" ||
    addBlockId == "rect1-2" ||
    addBlockId == "rect2-2"
  ) {
    addBlockId = "addBlockArea-2";
  }
  if (
    addBlockId == "addBlock-3" ||
    addBlockId == "svg-3" ||
    addBlockId == "rect1-3" ||
    addBlockId == "rect2-3"
  ) {
    addBlockId = "addBlockArea-3";
  }
};
var viewComponentId = 1; // 추가한 컴포넌트의 id : 속성값 핸들링

var imgId;

function ComponentTab({ displayComponentTab, displayIsText, displayIsSrc }) {
  // 속성값에 useState를 사용하여 실시간으로 값이 바뀌게 한다.
  return (
    <div
      id="componentTab"
      className="componentTab"
      style={{ display: displayComponentTab ? "block" : "none" }}
    >
      <form>
        <table>
          <tbody>
            <tr>
              <td>
                <label htmlFor="componentAreaWidth">영역가로</label>
              </td>
              <td>
                <input
                  id="componentAreaWidth"
                  type="text"
                  placeholder="가로길이를 입력하세요.."
                  onChange={componentAttr}
                />
              </td>
            </tr>
            <tr>
              <td>
                <label htmlFor="componentAreaHeight">영역세로</label>
              </td>
              <td>
                <input
                  id="componentAreaHeight"
                  type="text"
                  placeholder="세로길이를 입력하세요.."
                  onChange={componentAttr}
                />
              </td>
            </tr>

            <tr>
              <td>
                <label htmlFor="componentWidth">가로</label>
              </td>
              <td>
                <input
                  id="componentWidth"
                  type="text"
                  placeholder="가로길이를 입력하세요.."
                  onChange={componentAttr}
                />
              </td>
            </tr>
            <tr>
              <td>
                <label htmlFor="componentHeight">세로</label>
              </td>
              <td>
                <input
                  id="componentHeight"
                  type="text"
                  placeholder="세로길이를 입력하세요.."
                  onChange={componentAttr}
                />
              </td>
            </tr>
            <tr>
              <td>
                <label htmlFor="componentMarginLeft">x좌표</label>
              </td>
              <td>
                <input
                  id="componentMarginLeft"
                  type="text"
                  placeholder="x좌표를 입력하세요.."
                  onChange={componentAttr}
                />
              </td>
            </tr>
            <tr>
              <td>
                <label htmlFor="componentMarginTop">y좌표</label>
              </td>
              <td>
                <input
                  id="componentMarginTop"
                  type="text"
                  placeholder="y좌표를 입력하세요.."
                  onChange={componentAttr}
                />
              </td>
            </tr>
            <tr style={{ display: displayIsText ? "" : "none" }}>
              <td>
                <label htmlFor="componentText">텍스트</label>
              </td>
              <td>
                <input
                  id="componentText"
                  type="text"
                  placeholder="텍스트를 입력하세요.."
                  onChange={componentAttr}
                />
              </td>
            </tr>
            <tr style={{ display: displayIsText ? "" : "none" }}>
              <td>
                <label htmlFor="componentTextSize">텍스트크기</label>
              </td>
              <td>
                <input
                  id="componentTextSize"
                  type="text"
                  placeholder="텍스트크기를 입력하세요.."
                  onChange={componentAttr}
                />
              </td>
            </tr>
            <tr style={{ display: displayIsSrc ? "" : "none" }}>
              <td>
                <label htmlFor="componentSrc">이미지</label>
              </td>
              <td>
                <input
                  id="componentSrc"
                  type="file"
                  placeholder="이미지 경로를 넣어주세요."
                  onChange={componentAttr}
                />
              </td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
  );
}
var componentAreaId;
const getComponentAreaId = (event) => {
  componentAreaId = event.target.parentElement.id;
};
var componentId = "image";

var fReader = new FileReader();
function componentAttr() {
  const componentText = document.querySelector("#componentText");
  const componentTextSize = document.querySelector("#componentTextSize");
  const dblComponent = document.querySelector("#" + imgId);
  const dblComponentArea = document.querySelector("#" + componentAreaId);

  if (componentText.value != "") {
    dblComponent.innerText = componentText.value;
  }
  if (componentTextSize.value != "") {
    dblComponent.style.fontSize = componentTextSize.value;
  }
  dblComponent.style.fontSize =
    document.querySelector("#componentTextSize").value + "px";

  dblComponentArea.style.width =
    document.querySelector("#componentAreaWidth").value + "px";
  dblComponentArea.style.height =
    document.querySelector("#componentAreaHeight").value + "px";

  dblComponent.style.width =
    document.querySelector("#componentWidth").value + "px";
  dblComponent.style.height =
    document.querySelector("#componentHeight").value + "px";
  dblComponent.style.marginLeft =
    document.querySelector("#componentMarginLeft").value + "px";
  dblComponent.style.marginTop =
    document.querySelector("#componentMarginTop").value + "px";

  if (
    parseInt(dblComponentArea.style.width.replace("px", "")) <
    parseInt(dblComponent.style.width.replace("px", "")) +
      parseInt(dblComponent.style.marginLeft.replace("px", ""))
  ) {
    dblComponentArea.style.width =
      parseInt(dblComponent.style.width.replace("px", "")) +
      parseInt(dblComponent.style.marginLeft.replace("px", "")) +
      "px";
    document.querySelector("#componentAreaWidth").value =
      dblComponentArea.style.width.replace("px", "");
  }
  if (
    parseInt(dblComponentArea.style.height.replace("px", "")) <
    parseInt(dblComponent.style.height.replace("px", "")) +
      parseInt(dblComponent.style.marginTop.replace("px", ""))
  ) {
    dblComponentArea.style.height =
      parseInt(dblComponent.style.height.replace("px", "")) +
      parseInt(dblComponent.style.marginTop.replace("px", "")) +
      "px";
    document.querySelector("#componentAreaHeight").value =
      dblComponentArea.style.height.replace("px", "");
  }
  if (document.querySelector("#componentSrc").files[0]) {
    fReader.readAsDataURL(document.querySelector("#componentSrc").files[0]);
  }

  fReader.onloadend = function (event) {
    dblComponent.src = event.target.result;
  };
}

function AssistSidebar({
  displaySidebar,
  changeSidebarValue,
  changeIsComponentTab,
  changeIsText,
  changeIsSrc,
  displayBorder,
}) {
  const [componentValue1, setComponentValue1] = useState(
    "../img/image/image-1.png"
  );
  const [componentValue2, setComponentValue2] = useState(
    "../img/image/image-2.png"
  );
  const [componentValue3, setComponentValue3] = useState(
    "../img/image/image-3.png"
  );
  const [componentValue4, setComponentValue4] = useState(
    "../img/image/image-4.png"
  );
  const [componentValue5, setComponentValue5] = useState(
    "../img/image/image-5.png"
  );
  const [componentValue6, setComponentValue6] = useState(
    "../img/image/image-6.png"
  );

  // ComponentTab 속성값 받아오는 변수
  const componentAreaWidth = document.querySelector("#componentAreaWidth");
  const componentAreaHeight = document.querySelector("#componentAreaHeight");
  const componentWidth = document.querySelector("#componentWidth");
  const componentHeight = document.querySelector("#componentHeight");
  const componentMarginLeft = document.querySelector("#componentMarginLeft");
  const componentMarginTop = document.querySelector("#componentMarginTop");
  const componentText = document.querySelector("#componentText");
  const componentTextSize = document.querySelector("#componentTextSize");

  const getComponentId = (event) => {
    componentId = event.target.id;

    setComponentValue1(
      (current) =>
        (current = "../img/" + componentId + "/" + componentId + "-1.png")
    );
    setComponentValue2(
      (current) =>
        (current = "../img/" + componentId + "/" + componentId + "-2.png")
    );
    setComponentValue3(
      (current) =>
        (current = "../img/" + componentId + "/" + componentId + "-3.png")
    );
    setComponentValue4(
      (current) =>
        (current = "../img/" + componentId + "/" + componentId + "-4.png")
    );
    setComponentValue5(
      (current) =>
        (current = "../img/" + componentId + "/" + componentId + "-5.png")
    );
    setComponentValue6(
      (current) =>
        (current = "../img/" + componentId + "/" + componentId + "-6.png")
    );
  };
  const getImgId = (event) => {
    imgId = event.target.id;
  };

  const addComponent = () => {
    const header = document.querySelector("#header");
    const main = document.querySelector("#main");
    const footer = document.querySelector("#footer");
    if (componentId == "text") {
      if (imgId == "text-1") {
        const componentArea = document.createElement("div");
        componentArea.id = "componentArea-" + viewComponentId;
        componentArea.style.width = "500px";
        componentArea.style.height = "100px";
        componentArea.style.float = "left";
        componentArea.draggable = "true";
        //componentArea.addEventListener("dragend", moveDraggableComponent);
        const textH1 = document.createElement("h1");
        textH1.id = "componentText-" + viewComponentId;
        textH1.style.width = "400px";
        textH1.style.height = "100px";
        textH1.style.border = "1px solid black";
        textH1.addEventListener("dblclick", (event) => {
          changeIsText();
          changeIsComponentTab();
          isDelete = true;
          displayBorder = !displayBorder;
          getImgId(event);
          getComponentAreaId(event);
          displayBorder
            ? (document.querySelector("#userViewPage").style.marginLeft =
                "350px")
            : (document.querySelector("#userViewPage").style.marginLeft =
                "0px");
          displayBorder
            ? (textH1.style.border = "2px dashed red")
            : (textH1.style.border = "1px solid black");
          displayBorder
            ? (componentArea.style.border = "2px dashed green")
            : (componentArea.style.border = "none");
          if (textH1.className == "headerComponent") {
            addBlockId = "addBlockArea-1";
          }
          if (textH1.className == "mainComponent") {
            addBlockId = "addBlockArea-2";
          }
          if (textH1.className == "footerComponent") {
            addBlockId = "addBlockArea-3";
          }
          function keyDownDelete(event) {
            if (
              event.key == "Delete" &&
              isDelete == true &&
              (headerCount > 0 || mainCount > 0 || footerCount > 0)
            ) {
              document.querySelector("#userViewPage").style.marginLeft = "0px";
              const dblImg = document.querySelector("#" + componentAreaId);
              if (dblImg != null) {
                dblImg.remove();
              }
              changeIsComponentTab();
              displayBorder = !displayBorder;
              window.removeEventListener("keydown", keyDownDelete);
              if (addBlockId == "addBlockArea-1") {
                headerCount--; // count가 0이 될때까지 키를 누르고 있는 동안 줄어드는 문제가 있음.
                isDelete = false;
                if (headerCount <= 0) {
                  header.style.height = "40px";
                }
              }
              if (addBlockId == "addBlockArea-2") {
                mainCount--;
                isDelete = false;
                if (mainCount <= 0) {
                  main.style.height = "850px";
                }
              }
              if (addBlockId == "addBlockArea-3") {
                footerCount--;
                isDelete = false;
                if (footerCount <= 0) {
                  footer.style.height = "250px";
                }
              }
            }
          }
          if (displayBorder == true) {
            window.addEventListener("keydown", keyDownDelete);
          }

          // ComponentTab에 더블클릭된 컴포넌트 속성값 저장
          componentAreaWidth.value = componentArea.style.width.replace(
            "px",
            ""
          );
          componentAreaHeight.value = componentArea.style.height.replace(
            "px",
            ""
          );
          componentWidth.value = textH1.style.width.replace("px", "");
          componentHeight.value = textH1.style.height.replace("px", "");

          componentMarginLeft.value == ""
            ? (componentMarginLeft.value = "0")
            : (componentMarginLeft.value = textH1.style.marginLeft.replace(
                "px",
                ""
              ));
          componentMarginTop.value == ""
            ? (componentMarginTop.value = "0")
            : (componentMarginTop.value = textH1.style.marginTop.replace(
                "px",
                ""
              ));

          if (componentText.value != "") {
            componentText.value = textH1.innerText;
            componentTextSize.value = textH1.style.fontSize.replace("px", "");
          }
        });

        if (addBlockId != null) {
          if (addBlockId == "addBlockArea-1") {
            textH1.className = "headerComponent";
            componentArea.appendChild(textH1);
            header.appendChild(componentArea);
            header.style.height = "auto";
            headerCount++;
          }
          if (addBlockId == "addBlockArea-2") {
            textH1.className = "mainComponent";
            componentArea.appendChild(textH1);
            main.appendChild(componentArea);
            main.style.height = "auto";
            mainCount++;
          }
          if (addBlockId == "addBlockArea-3") {
            textH1.className = "footerComponent";
            componentArea.appendChild(textH1);
            footer.appendChild(componentArea);
            footer.style.height = "auto";
            footerCount++;
          }
          viewComponentId++;
        }
      }
      if (imgId == "text-2") {
        const componentArea = document.createElement("div");
        componentArea.id = "componentArea-" + viewComponentId;
        componentArea.style.width = "500px";
        componentArea.style.height = "100px";
        componentArea.style.float = "left";

        const textH2 = document.createElement("h2");
        textH2.id = "componentText-" + viewComponentId;
        textH2.style.width = "400px";
        textH2.style.height = "100px";
        textH2.style.border = "1px solid black";

        textH2.addEventListener("dblclick", (event) => {
          changeIsText();
          changeIsComponentTab();
          isDelete = true;
          displayBorder = !displayBorder;
          getImgId(event);
          getComponentAreaId(event);
          displayBorder
            ? (document.querySelector("#userViewPage").style.marginLeft =
                "350px")
            : (document.querySelector("#userViewPage").style.marginLeft =
                "0px");
          displayBorder
            ? (textH2.style.border = "2px dashed red")
            : (textH2.style.border = "1px solid black");
          displayBorder
            ? (componentArea.style.border = "2px dashed green")
            : (componentArea.style.border = "none");
          if (textH2.className == "headerComponent") {
            addBlockId = "addBlockArea-1";
          }
          if (textH2.className == "mainComponent") {
            addBlockId = "addBlockArea-2";
          }
          if (textH2.className == "footerComponent") {
            addBlockId = "addBlockArea-3";
          }
          function keyDownDelete(event) {
            if (
              event.key == "Delete" &&
              isDelete == true &&
              (headerCount > 0 || mainCount > 0 || footerCount > 0)
            ) {
              document.querySelector("#userViewPage").style.marginLeft = "0px";
              const dblImg = document.querySelector("#" + componentAreaId);
              if (dblImg != null) {
                dblImg.remove();
              }
              changeIsComponentTab();
              displayBorder = !displayBorder;
              window.removeEventListener("keydown", keyDownDelete);
              if (addBlockId == "addBlockArea-1") {
                headerCount--; // count가 0이 될때까지 키를 누르고 있는 동안 줄어드는 문제가 있음.
                isDelete = false;
                if (headerCount <= 0) {
                  header.style.height = "40px";
                }
              }
              if (addBlockId == "addBlockArea-2") {
                mainCount--;
                isDelete = false;
                if (mainCount <= 0) {
                  main.style.height = "850px";
                }
              }
              if (addBlockId == "addBlockArea-3") {
                footerCount--;
                isDelete = false;
                if (footerCount <= 0) {
                  footer.style.height = "250px";
                }
              }
            }
          }
          if (displayBorder == true) {
            window.addEventListener("keydown", keyDownDelete);
          }

          // ComponentTab에 더블클릭된 컴포넌트 속성값 저장
          componentAreaWidth.value = componentArea.style.width.replace(
            "px",
            ""
          );
          componentAreaHeight.value = componentArea.style.height.replace(
            "px",
            ""
          );
          componentWidth.value = textH2.style.width.replace("px", "");
          componentHeight.value = textH2.style.height.replace("px", "");

          componentMarginLeft.value == ""
            ? (componentMarginLeft.value = "0")
            : (componentMarginLeft.value = textH2.style.marginLeft.replace(
                "px",
                ""
              ));
          componentMarginTop.value == ""
            ? (componentMarginTop.value = "0")
            : (componentMarginTop.value = textH2.style.marginTop.replace(
                "px",
                ""
              ));

          if (componentText.value != "") {
            componentText.value = textH2.innerText;
            componentTextSize.value = textH2.style.fontSize.replace("px", "");
          }
        });

        if (addBlockId != null) {
          if (addBlockId == "addBlockArea-1") {
            textH2.className = "headerComponent";
            componentArea.appendChild(textH2);
            header.appendChild(componentArea);
            header.style.height = "auto";
            headerCount++;
          }
          if (addBlockId == "addBlockArea-2") {
            textH2.className = "mainComponent";
            componentArea.appendChild(textH2);
            main.appendChild(componentArea);
            main.style.height = "auto";
            mainCount++;
          }
          if (addBlockId == "addBlockArea-3") {
            textH2.className = "footerComponent";
            componentArea.appendChild(textH2);
            footer.appendChild(componentArea);
            footer.style.height = "auto";
            footerCount++;
          }
          viewComponentId++;
        }
      }
      if (imgId == "text-3") {
        const componentArea = document.createElement("div");
        componentArea.id = "componentArea-" + viewComponentId;
        componentArea.style.width = "500px";
        componentArea.style.height = "100px";
        componentArea.style.float = "left";

        const textH3 = document.createElement("h3");
        textH3.id = "componentText-" + viewComponentId;
        textH3.style.width = "400px";
        textH3.style.height = "100px";
        textH3.style.border = "1px solid black";

        textH3.addEventListener("dblclick", (event) => {
          changeIsText();
          changeIsComponentTab();
          isDelete = true;
          displayBorder = !displayBorder;
          getImgId(event);
          getComponentAreaId(event);
          displayBorder
            ? (document.querySelector("#userViewPage").style.marginLeft =
                "350px")
            : (document.querySelector("#userViewPage").style.marginLeft =
                "0px");
          displayBorder
            ? (textH3.style.border = "2px dashed red")
            : (textH3.style.border = "1px solid black");
          displayBorder
            ? (componentArea.style.border = "2px dashed green")
            : (componentArea.style.border = "none");
          if (textH3.className == "headerComponent") {
            addBlockId = "addBlockArea-1";
          }
          if (textH3.className == "mainComponent") {
            addBlockId = "addBlockArea-2";
          }
          if (textH3.className == "footerComponent") {
            addBlockId = "addBlockArea-3";
          }
          function keyDownDelete(event) {
            if (
              event.key == "Delete" &&
              isDelete == true &&
              (headerCount > 0 || mainCount > 0 || footerCount > 0)
            ) {
              document.querySelector("#userViewPage").style.marginLeft = "0px";
              const dblImg = document.querySelector("#" + componentAreaId);
              if (dblImg != null) {
                dblImg.remove();
              }
              changeIsComponentTab();
              displayBorder = !displayBorder;
              window.removeEventListener("keydown", keyDownDelete);
              if (addBlockId == "addBlockArea-1") {
                headerCount--; // count가 0이 될때까지 키를 누르고 있는 동안 줄어드는 문제가 있음.
                isDelete = false;
                if (headerCount <= 0) {
                  header.style.height = "40px";
                }
              }
              if (addBlockId == "addBlockArea-2") {
                mainCount--;
                isDelete = false;
                if (mainCount <= 0) {
                  main.style.height = "850px";
                }
              }
              if (addBlockId == "addBlockArea-3") {
                footerCount--;
                isDelete = false;
                if (footerCount <= 0) {
                  footer.style.height = "250px";
                }
              }
            }
          }
          if (displayBorder == true) {
            window.addEventListener("keydown", keyDownDelete);
          }

          // ComponentTab에 더블클릭된 컴포넌트 속성값 저장
          componentAreaWidth.value = componentArea.style.width.replace(
            "px",
            ""
          );
          componentAreaHeight.value = componentArea.style.height.replace(
            "px",
            ""
          );
          componentWidth.value = textH3.style.width.replace("px", "");
          componentHeight.value = textH3.style.height.replace("px", "");

          componentMarginLeft.value == ""
            ? (componentMarginLeft.value = "0")
            : (componentMarginLeft.value = textH3.style.marginLeft.replace(
                "px",
                ""
              ));
          componentMarginTop.value == ""
            ? (componentMarginTop.value = "0")
            : (componentMarginTop.value = textH3.style.marginTop.replace(
                "px",
                ""
              ));

          if (componentText.value != "") {
            componentText.value = textH3.innerText;
            componentTextSize.value = textH3.style.fontSize.replace("px", "");
          }
        });

        if (addBlockId != null) {
          if (addBlockId == "addBlockArea-1") {
            textH3.className = "headerComponent";
            componentArea.appendChild(textH3);
            header.appendChild(componentArea);
            header.style.height = "auto";
            headerCount++;
          }
          if (addBlockId == "addBlockArea-2") {
            textH3.className = "mainComponent";
            componentArea.appendChild(textH3);
            main.appendChild(componentArea);
            main.style.height = "auto";
            mainCount++;
          }
          if (addBlockId == "addBlockArea-3") {
            textH3.className = "footerComponent";
            componentArea.appendChild(textH3);
            footer.appendChild(componentArea);
            footer.style.height = "auto";
            footerCount++;
          }
          viewComponentId++;
        }
      }
      if (imgId == "text-4") {
        const componentArea = document.createElement("div");
        componentArea.id = "componentArea-" + viewComponentId;
        componentArea.style.width = "500px";
        componentArea.style.height = "100px";
        componentArea.style.float = "left";

        const textH4 = document.createElement("h4");
        textH4.id = "componentText-" + viewComponentId;
        textH4.style.width = "400px";
        textH4.style.height = "100px";
        textH4.style.border = "1px solid black";

        textH4.addEventListener("dblclick", (event) => {
          changeIsText();
          changeIsComponentTab();
          isDelete = true;
          displayBorder = !displayBorder;
          getImgId(event);
          getComponentAreaId(event);
          displayBorder
            ? (document.querySelector("#userViewPage").style.marginLeft =
                "350px")
            : (document.querySelector("#userViewPage").style.marginLeft =
                "0px");
          displayBorder
            ? (textH4.style.border = "2px dashed red")
            : (textH4.style.border = "1px solid black");
          displayBorder
            ? (componentArea.style.border = "2px dashed green")
            : (componentArea.style.border = "none");
          if (textH4.className == "headerComponent") {
            addBlockId = "addBlockArea-1";
          }
          if (textH4.className == "mainComponent") {
            addBlockId = "addBlockArea-2";
          }
          if (textH4.className == "footerComponent") {
            addBlockId = "addBlockArea-3";
          }
          function keyDownDelete(event) {
            if (
              event.key == "Delete" &&
              isDelete == true &&
              (headerCount > 0 || mainCount > 0 || footerCount > 0)
            ) {
              document.querySelector("#userViewPage").style.marginLeft = "0px";
              const dblImg = document.querySelector("#" + componentAreaId);
              if (dblImg != null) {
                dblImg.remove();
              }
              changeIsComponentTab();
              displayBorder = !displayBorder;
              window.removeEventListener("keydown", keyDownDelete);
              if (addBlockId == "addBlockArea-1") {
                headerCount--; // count가 0이 될때까지 키를 누르고 있는 동안 줄어드는 문제가 있음.
                isDelete = false;
                if (headerCount <= 0) {
                  header.style.height = "40px";
                }
              }
              if (addBlockId == "addBlockArea-2") {
                mainCount--;
                isDelete = false;
                if (mainCount <= 0) {
                  main.style.height = "850px";
                }
              }
              if (addBlockId == "addBlockArea-3") {
                footerCount--;
                isDelete = false;
                if (footerCount <= 0) {
                  footer.style.height = "250px";
                }
              }
            }
          }
          if (displayBorder == true) {
            window.addEventListener("keydown", keyDownDelete);
          }

          // ComponentTab에 더블클릭된 컴포넌트 속성값 저장
          componentAreaWidth.value = componentArea.style.width.replace(
            "px",
            ""
          );
          componentAreaHeight.value = componentArea.style.height.replace(
            "px",
            ""
          );
          componentWidth.value = textH4.style.width.replace("px", "");
          componentHeight.value = textH4.style.height.replace("px", "");

          componentMarginLeft.value == ""
            ? (componentMarginLeft.value = "0")
            : (componentMarginLeft.value = textH4.style.marginLeft.replace(
                "px",
                ""
              ));
          componentMarginTop.value == ""
            ? (componentMarginTop.value = "0")
            : (componentMarginTop.value = textH4.style.marginTop.replace(
                "px",
                ""
              ));

          if (componentText.value != "") {
            componentText.value = textH4.innerText;
            componentTextSize.value = textH4.style.fontSize.replace("px", "");
          }
        });

        if (addBlockId != null) {
          if (addBlockId == "addBlockArea-1") {
            textH4.className = "headerComponent";
            componentArea.appendChild(textH4);
            header.appendChild(componentArea);
            header.style.height = "auto";
            headerCount++;
          }
          if (addBlockId == "addBlockArea-2") {
            textH4.className = "mainComponent";
            componentArea.appendChild(textH4);
            main.appendChild(componentArea);
            main.style.height = "auto";
            mainCount++;
          }
          if (addBlockId == "addBlockArea-3") {
            textH4.className = "footerComponent";
            componentArea.appendChild(textH4);
            footer.appendChild(componentArea);
            footer.style.height = "auto";
            footerCount++;
          }
          viewComponentId++;
        }
      }
      if (imgId == "text-5") {
        const componentArea = document.createElement("div");
        componentArea.id = "componentArea-" + viewComponentId;
        componentArea.style.width = "500px";
        componentArea.style.height = "100px";
        componentArea.style.float = "left";

        const textH5 = document.createElement("h5");
        textH5.id = "componentText-" + viewComponentId;
        textH5.style.width = "400px";
        textH5.style.height = "100px";
        textH5.style.border = "1px solid black";

        textH5.addEventListener("dblclick", (event) => {
          changeIsText();
          changeIsComponentTab();
          isDelete = true;
          displayBorder = !displayBorder;
          getImgId(event);
          getComponentAreaId(event);
          displayBorder
            ? (document.querySelector("#userViewPage").style.marginLeft =
                "350px")
            : (document.querySelector("#userViewPage").style.marginLeft =
                "0px");
          displayBorder
            ? (textH5.style.border = "2px dashed red")
            : (textH5.style.border = "1px solid black");
          displayBorder
            ? (componentArea.style.border = "2px dashed green")
            : (componentArea.style.border = "none");
          if (textH5.className == "headerComponent") {
            addBlockId = "addBlockArea-1";
          }
          if (textH5.className == "mainComponent") {
            addBlockId = "addBlockArea-2";
          }
          if (textH5.className == "footerComponent") {
            addBlockId = "addBlockArea-3";
          }
          function keyDownDelete(event) {
            if (
              event.key == "Delete" &&
              isDelete == true &&
              (headerCount > 0 || mainCount > 0 || footerCount > 0)
            ) {
              document.querySelector("#userViewPage").style.marginLeft = "0px";
              const dblImg = document.querySelector("#" + componentAreaId);
              if (dblImg != null) {
                dblImg.remove();
              }
              changeIsComponentTab();
              displayBorder = !displayBorder;
              window.removeEventListener("keydown", keyDownDelete);
              if (addBlockId == "addBlockArea-1") {
                headerCount--; // count가 0이 될때까지 키를 누르고 있는 동안 줄어드는 문제가 있음.
                isDelete = false;
                if (headerCount <= 0) {
                  header.style.height = "40px";
                }
              }
              if (addBlockId == "addBlockArea-2") {
                mainCount--;
                isDelete = false;
                if (mainCount <= 0) {
                  main.style.height = "850px";
                }
              }
              if (addBlockId == "addBlockArea-3") {
                footerCount--;
                isDelete = false;
                if (footerCount <= 0) {
                  footer.style.height = "250px";
                }
              }
            }
          }
          if (displayBorder == true) {
            window.addEventListener("keydown", keyDownDelete);
          }

          // ComponentTab에 더블클릭된 컴포넌트 속성값 저장
          componentAreaWidth.value = componentArea.style.width.replace(
            "px",
            ""
          );
          componentAreaHeight.value = componentArea.style.height.replace(
            "px",
            ""
          );
          componentWidth.value = textH5.style.width.replace("px", "");
          componentHeight.value = textH5.style.height.replace("px", "");

          componentMarginLeft.value == ""
            ? (componentMarginLeft.value = "0")
            : (componentMarginLeft.value = textH5.style.marginLeft.replace(
                "px",
                ""
              ));
          componentMarginTop.value == ""
            ? (componentMarginTop.value = "0")
            : (componentMarginTop.value = textH5.style.marginTop.replace(
                "px",
                ""
              ));

          if (componentText.value != "") {
            componentText.value = textH5.innerText;
            componentTextSize.value = textH5.style.fontSize.replace("px", "");
          }
        });

        if (addBlockId != null) {
          if (addBlockId == "addBlockArea-1") {
            textH5.className = "headerComponent";
            componentArea.appendChild(textH5);
            header.appendChild(componentArea);
            header.style.height = "auto";
            headerCount++;
          }
          if (addBlockId == "addBlockArea-2") {
            textH5.className = "mainComponent";
            componentArea.appendChild(textH5);
            main.appendChild(componentArea);
            main.style.height = "auto";
            mainCount++;
          }
          if (addBlockId == "addBlockArea-3") {
            textH5.className = "footerComponent";
            componentArea.appendChild(textH5);
            footer.appendChild(componentArea);
            footer.style.height = "auto";
            footerCount++;
          }
          viewComponentId++;
        }
      }
      if (imgId == "text-6") {
        const componentArea = document.createElement("div");
        componentArea.id = "componentArea-" + viewComponentId;
        componentArea.style.width = "500px";
        componentArea.style.height = "100px";
        componentArea.style.float = "left";

        const textH6 = document.createElement("h6");
        textH6.id = "componentText-" + viewComponentId;
        textH6.style.width = "400px";
        textH6.style.height = "100px";
        textH6.style.border = "1px solid black";

        textH6.addEventListener("dblclick", (event) => {
          changeIsText();
          changeIsComponentTab();
          isDelete = true;
          displayBorder = !displayBorder;
          getImgId(event);
          getComponentAreaId(event);
          displayBorder
            ? (document.querySelector("#userViewPage").style.marginLeft =
                "350px")
            : (document.querySelector("#userViewPage").style.marginLeft =
                "0px");
          displayBorder
            ? (textH6.style.border = "2px dashed red")
            : (textH6.style.border = "1px solid black");
          displayBorder
            ? (componentArea.style.border = "2px dashed green")
            : (componentArea.style.border = "none");
          if (textH6.className == "headerComponent") {
            addBlockId = "addBlockArea-1";
          }
          if (textH6.className == "mainComponent") {
            addBlockId = "addBlockArea-2";
          }
          if (textH6.className == "footerComponent") {
            addBlockId = "addBlockArea-3";
          }
          function keyDownDelete(event) {
            if (
              event.key == "Delete" &&
              isDelete == true &&
              (headerCount > 0 || mainCount > 0 || footerCount > 0)
            ) {
              document.querySelector("#userViewPage").style.marginLeft = "0px";
              const dblImg = document.querySelector("#" + componentAreaId);
              if (dblImg != null) {
                dblImg.remove();
              }
              changeIsComponentTab();
              displayBorder = !displayBorder;
              window.removeEventListener("keydown", keyDownDelete);
              if (addBlockId == "addBlockArea-1") {
                headerCount--; // count가 0이 될때까지 키를 누르고 있는 동안 줄어드는 문제가 있음.
                isDelete = false;
                if (headerCount <= 0) {
                  header.style.height = "40px";
                }
              }
              if (addBlockId == "addBlockArea-2") {
                mainCount--;
                isDelete = false;
                if (mainCount <= 0) {
                  main.style.height = "850px";
                }
              }
              if (addBlockId == "addBlockArea-3") {
                footerCount--;
                isDelete = false;
                if (footerCount <= 0) {
                  footer.style.height = "250px";
                }
              }
            }
          }
          if (displayBorder == true) {
            window.addEventListener("keydown", keyDownDelete);
          }

          // ComponentTab에 더블클릭된 컴포넌트 속성값 저장
          componentAreaWidth.value = componentArea.style.width.replace(
            "px",
            ""
          );
          componentAreaHeight.value = componentArea.style.height.replace(
            "px",
            ""
          );
          componentWidth.value = textH6.style.width.replace("px", "");
          componentHeight.value = textH6.style.height.replace("px", "");

          componentMarginLeft.value == ""
            ? (componentMarginLeft.value = "0")
            : (componentMarginLeft.value = textH6.style.marginLeft.replace(
                "px",
                ""
              ));
          componentMarginTop.value == ""
            ? (componentMarginTop.value = "0")
            : (componentMarginTop.value = textH6.style.marginTop.replace(
                "px",
                ""
              ));

          if (componentText.value != "") {
            componentText.value = textH6.innerText;
            componentTextSize.value = textH6.style.fontSize.replace("px", "");
          }
        });

        if (addBlockId != null) {
          if (addBlockId == "addBlockArea-1") {
            textH6.className = "headerComponent";
            componentArea.appendChild(textH6);
            header.appendChild(componentArea);
            header.style.height = "auto";
            headerCount++;
          }
          if (addBlockId == "addBlockArea-2") {
            textH6.className = "mainComponent";
            componentArea.appendChild(textH6);
            main.appendChild(componentArea);
            main.style.height = "auto";
            mainCount++;
          }
          if (addBlockId == "addBlockArea-3") {
            textH6.className = "footerComponent";
            componentArea.appendChild(textH6);
            footer.appendChild(componentArea);
            footer.style.height = "auto";
            footerCount++;
          }
          viewComponentId++;
        }
      }
    }
    if (componentId == "image") {
      if (imgId != null) {
        const componentArea = document.createElement("div");
        const image = document.createElement("img");
        componentArea.id = "componentArea-" + viewComponentId;
        componentArea.style.width = "500px";
        componentArea.style.height = "500px";
        componentArea.style.float = "left";

        image.id = "componentImage-" + viewComponentId;
        image.src = "../img/" + componentId + "/" + imgId + ".png";
        image.style.width = "400px";
        image.style.height = "400px";
        image.style.userSelect = "none";

        image.addEventListener("dblclick", (event) => {
          //changeIsText(); 는 텍스트 생성할때
          changeIsComponentTab();
          changeIsSrc();
          isDelete = true;
          displayBorder = !displayBorder;
          getImgId(event);
          getComponentAreaId(event);
          displayBorder
            ? (document.querySelector("#userViewPage").style.marginLeft =
                "350px")
            : (document.querySelector("#userViewPage").style.marginLeft =
                "0px");
          displayBorder
            ? (image.style.border = "2px dashed red")
            : (image.style.border = "none");
          displayBorder
            ? (componentArea.style.border = "2px dashed green")
            : (componentArea.style.border = "none");
          if (image.className == "headerComponent") {
            addBlockId = "addBlockArea-1";
          }
          if (image.className == "mainComponent") {
            addBlockId = "addBlockArea-2";
          }
          if (image.className == "footerComponent") {
            addBlockId = "addBlockArea-3";
          }
          function keyDownDelete(event) {
            if (
              event.key == "Delete" &&
              isDelete == true &&
              (headerCount > 0 || mainCount > 0 || footerCount > 0)
            ) {
              document.querySelector("#userViewPage").style.marginLeft = "0px";
              const dblImg = document.querySelector("#" + componentAreaId);
              if (dblImg != null) {
                dblImg.remove();
              }
              changeIsComponentTab();
              displayBorder = !displayBorder;
              window.removeEventListener("keydown", keyDownDelete);
              if (addBlockId == "addBlockArea-1") {
                headerCount--; // count가 0이 될때까지 키를 누르고 있는 동안 줄어드는 문제가 있음.
                isDelete = false;
                if (headerCount <= 0) {
                  header.style.height = "40px";
                }
              }
              if (addBlockId == "addBlockArea-2") {
                mainCount--;
                isDelete = false;
                if (mainCount <= 0) {
                  main.style.height = "850px";
                }
              }
              if (addBlockId == "addBlockArea-3") {
                footerCount--;
                isDelete = false;
                if (footerCount <= 0) {
                  footer.style.height = "250px";
                }
              }
            }
          }
          if (displayBorder == true) {
            window.addEventListener("keydown", keyDownDelete);
          }

          // ComponentTab에 더블클릭된 컴포넌트 속성값 저장
          componentAreaWidth.value = componentArea.style.width.replace(
            "px",
            ""
          );
          componentAreaHeight.value = componentArea.style.height.replace(
            "px",
            ""
          );
          componentWidth.value = image.style.width.replace("px", "");
          componentHeight.value = image.style.height.replace("px", "");

          componentMarginLeft.value == ""
            ? (componentMarginLeft.value = "0")
            : (componentMarginLeft.value = image.style.marginLeft.replace(
                "px",
                ""
              ));
          componentMarginTop.value == ""
            ? (componentMarginTop.value = "0")
            : (componentMarginTop.value = image.style.marginTop.replace(
                "px",
                ""
              ));

          if (componentText.value != "") {
            componentText.value = image.value;
            componentTextSize.value = image.style.fontSize;
          }
        });
        if (addBlockId != null) {
          if (addBlockId == "addBlockArea-1") {
            image.className = "headerComponent";
            componentArea.appendChild(image);
            header.appendChild(componentArea);
            header.style.height = "auto";
            headerCount++;
          }
          if (addBlockId == "addBlockArea-2") {
            image.className = "mainComponent";
            componentArea.appendChild(image);
            main.appendChild(componentArea);
            main.style.height = "auto";
            mainCount++;
          }
          if (addBlockId == "addBlockArea-3") {
            image.className = "footerComponent";
            componentArea.appendChild(image);
            footer.appendChild(componentArea);
            footer.style.height = "auto";
            footerCount++;
          }
          viewComponentId++;
        }
      }
    }
  };
  return (
    <div
      className="assist-sidebar"
      style={{ display: displaySidebar ? "inline" : "none" }}
    >
      <ul className="component-list">
        <li id="image" onClick={getComponentId}>
          이미지
        </li>
        <li id="button" onClick={getComponentId}>
          버튼
        </li>
        <li id="title" onClick={getComponentId}>
          타이틀
        </li>
        <li id="gallery" onClick={getComponentId}>
          갤러리
        </li>
        <li id="text" onClick={getComponentId}>
          텍스트
        </li>
        <li id="showcase" onClick={getComponentId}>
          쇼케이스
        </li>
        <li id="video" onClick={getComponentId}>
          동영상
        </li>
        <li id="contour" onClick={getComponentId}>
          구분선
        </li>
        <li id="contact" onClick={getComponentId}>
          컨택트
        </li>
        <li id="board" onClick={getComponentId}>
          게시판
        </li>
        <li id="sns" onClick={getComponentId}>
          소셜
        </li>
        <li id="form" onClick={getComponentId}>
          폼
        </li>
        <li id="content" onClick={getComponentId}>
          콘텐츠
        </li>
      </ul>
      <div className="close-sidebar" onClick={changeSidebarValue}>
        <img src="https://storage.googleapis.com/i.addblock.net/btn_close.gif" />
      </div>
      <ul className="component-item-list">
        <li>
          <img
            id={componentId + "-1"}
            src={componentValue1}
            onDoubleClick={(event) => {
              getImgId(event);
              addComponent();
            }}
          />
        </li>
        <li>
          <img
            id={componentId + "-2"}
            src={componentValue2}
            onDoubleClick={(event) => {
              getImgId(event);
              addComponent();
            }}
          />
        </li>
        <li>
          <img
            id={componentId + "-3"}
            src={componentValue3}
            onDoubleClick={(event) => {
              getImgId(event);
              addComponent();
            }}
          />
        </li>
        <li>
          <img
            id={componentId + "-4"}
            src={componentValue4}
            onDoubleClick={(event) => {
              getImgId(event);
              addComponent();
            }}
          />
        </li>
        <li>
          <img
            id={componentId + "-5"}
            src={componentValue5}
            onDoubleClick={(event) => {
              getImgId(event);
              addComponent();
            }}
          />
        </li>
        <li>
          <img
            id={componentId + "-6"}
            src={componentValue6}
            onDoubleClick={(event) => {
              getImgId(event);
              addComponent();
            }}
          />
        </li>
      </ul>
    </div>
  );
}

function AddBlock({ changeSidebarValue, idValue }) {
  return (
    <div className="add-block" id={"addBlockArea-" + idValue}>
      <ul className="addElement">
        <li
          id={"addBlock-" + idValue}
          className="addElementButton"
          onClick={(event) => {
            changeSidebarValue();
            getAddBlockId(event);
          }}
        >
          <div>
            <svg
              id={"svg-" + idValue}
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 14 14"
              width="14"
              height="14"
            >
              <rect id={"rect1-" + idValue} x="6" width="2" height="14"></rect>
              <rect
                id={"rect2-" + idValue}
                x="6"
                transform="matrix(6.123234e-17 -1 1 6.123234e-17 0 14)"
                width="2"
                height="14"
              ></rect>
            </svg>
          </div>
        </li>
      </ul>
    </div>
  );
}
const MemorizedMenuConfig = React.memo(MenuConfig);
const MemorizedSiteConfig = React.memo(SiteConfig);
const MemorizedAssistSidebar = React.memo(AssistSidebar);
const MemorizedUserCustom = React.memo(UserCustom);
const MemorizedAddBlock = React.memo(AddBlock);
function UserCustom({ changeSidebarValue }) {
  return (
    <div id="userViewPage" className="userCustom">
      <MemorizedAddBlock changeSidebarValue={changeSidebarValue} idValue="1" />
      <div id="header" className="header">
        <div id="gnb">
          <ul id="gnbList">
            <li id="gnbListItem-1">인트로 페이지</li>
            <li id="gnbListItem-2">ABOUT</li>
            <li id="gnbListItem-3">SERVICES</li>
            <li id="gnbListItem-4">PROJECTS</li>
          </ul>
        </div>
      </div>
      <MemorizedAddBlock changeSidebarValue={changeSidebarValue} idValue="2" />
      <div id="main" className="main"></div>
      <MemorizedAddBlock changeSidebarValue={changeSidebarValue} idValue="3" />
      <div id="footer" className="footer"></div>
    </div>
  );
}

function App() {
  const [menuValue, setMenuValue] = useState(false);
  const [newMenuValue, setNewMenuValue] = useState(false);
  const [siteValue, setSiteValue] = useState(false);
  const [sidebarValue, setSidebarValue] = useState(false);
  const [isComponentTab, setIsComponentTab] = useState(false);
  const [isText, setIsText] = useState(false);
  const [isSrc, setIsSrc] = useState(false);

  const [isBorder, setIsBorder] = useState(false);

  const changeMenuValue = () => setMenuValue((current) => !current);
  const changeNewMenuValue = () => setNewMenuValue((current) => !current);
  const changeSiteValue = () => setSiteValue((current) => !current);
  const changeSidebarValue = () => setSidebarValue((current) => !current);
  const changeIsComponentTab = () => setIsComponentTab((current) => !current);
  const changeIsText = () => setIsText((current) => !current);
  const changeIsSrc = () => setIsSrc((current) => !current);

  return (
    <div>
      <AssistContainer
        changeMenuValue={changeMenuValue}
        changeSiteValue={changeSiteValue}
      />

      <MemorizedMenuConfig
        displayMenu={menuValue}
        displayNewMenu={newMenuValue}
        changeNewMenuValue={changeNewMenuValue}
      />
      <MemorizedSiteConfig displaySite={siteValue} />
      <ComponentTab
        displayComponentTab={isComponentTab}
        displayIsText={isText}
        displayIsSrc={isSrc}
      />
      <MemorizedAssistSidebar
        displaySidebar={sidebarValue}
        changeSidebarValue={changeSidebarValue}
        changeIsComponentTab={changeIsComponentTab}
        changeIsText={changeIsText}
        changeIsSrc={changeIsSrc}
        displayBorder={isBorder}
      />
      <MemorizedUserCustom changeSidebarValue={changeSidebarValue} />
    </div>
  );
}
/* 가장 하단에 load쓰면 됨.
window.addEventListener("load", () => {
  
  const header = document.querySelector("#header");
  const main = document.querySelector("#main");
  const footer = document.querySelector("#footer");
  console.log(header);
  console.log(main);
  console.log(footer);
  
});
*/
/*
window.addEventListener("load", () => {
  const header = document.querySelector("#header");
  const menuList = document.querySelector("#menuList");
  console.log(header);
  console.log(menuList);

  const gnb = document.createElement("div");
  const gnbList = document.createElement("ul");
  const gnbListItem = document.createElement("li");
  
});
*/
export default App;
