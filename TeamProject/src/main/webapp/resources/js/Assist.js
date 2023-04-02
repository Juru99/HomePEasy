const assistMenu = document.querySelector(
  ".assist-container .assist-config .config-item:nth-child(1)"
);
const assistSite = document.querySelector(
  ".assist-container .assist-config .config-item:nth-child(2)"
);
const addElementButton = document.querySelectorAll(
  ".addElement .addElementButton"
);
const closeSidebar = document.querySelector(".assist-sidebar .close-sidebar");

const menuConfig = document.querySelector(".menu-config");
const siteConfig = document.querySelector(".site-config");
const assistSidebar = document.querySelector(".assist-sidebar");

const addMenu = document.querySelector(".menu-config .add-menu");
const newMenu = document.querySelector(".menu-config .new-menu");

const addElement = document.querySelectorAll(
  ".assist-sidebar .component-item-list li img"
);

assistMenu.addEventListener("click", () => {
  menuConfig.classList.toggle("hidden");
});

assistSite.addEventListener("click", () => {
  siteConfig.classList.toggle("hidden");
});

let block; // 기존 블럭
for (let i = 0; i < addElementButton.length; i++) {
  addElementButton[i].addEventListener("click", (event) => {
    localStorage.setItem("block", event.target.parentElement.id);
    assistSidebar.classList.remove("hidden");
  });
}

closeSidebar.addEventListener("click", () => {
  localStorage.removeItem("block");
  assistSidebar.classList.add("hidden");
});

for (let i = 0; i < addElement.length; i++) {
  addElement[i].addEventListener("dblclick", () => {
    if (addElement[i].dataset.id == "1") {
      block = document.querySelector("#" + localStorage.getItem("block"));

      console.log(block);
      /* 추가할 요소 컴포넌트화 해서 앞으로 추가하면 됨. */
      const div = document.createElement("div");
      const button = document.createElement("button");
      div.style.width = "100vw";
      div.style.height = "200px";
      div.style.display = "flex";
      div.style.justifyContent = "center";
      div.style.border = "1px solid tomato";
      button.style.width = "100px";
      button.style.height = "100px";

      button.innerText = "안녕";
      div.appendChild(button);
      block.after(div);
    }
  });
}

addMenu.addEventListener("click", () => {
  if (newMenu.classList.contains("hidden")) {
    newMenu.classList.remove("hidden");
    addMenu.style.marginTop = "0px";
  } else {
    newMenu.classList.add("hidden");
    addMenu.style.marginTop = "50px";
  }
});
