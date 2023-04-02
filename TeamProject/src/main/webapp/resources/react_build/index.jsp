<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="/yuhan/resources/react_build/favicon.ico" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="Web site created using create-react-app"
    />
    <link rel="apple-touch-icon" href="/yuhan/resources/react_build/logo192.png" />
    <link rel="manifest" href="/yuhan/resources/react_build/manifest.json" />
    <title>React App</title>
    <script defer="defer" src="/yuhan/resources/react_build/static/js/main.92bcc160.js?ver=12347"></script>
    <link href="/yuhan/resources/react_build/static/css/main.48d799bc.css" rel="stylesheet" />
  </head>
  <body>
    <div id="root"></div>
  </body>
  <script>
window.setTimeout(function () {
		var header = document.querySelector("#header");
		var main = document.querySelector("#main");
		var footer = document.querySelector("#footer");

		console.log(header);
		console.log(main);
		console.log(footer);

		console.log(sessionStorage.getItem("header"));
		console.log(sessionStorage.getItem("main"));
		console.log(sessionStorage.getItem("footer"));

		header.outerHTML = sessionStorage.getItem("header");
		main.outerHTML = sessionStorage.getItem("main");
		footer.outerHTML = sessionStorage.getItem("footer");


	}, 1000);

    window.onkeydown = function () {
      116 === event.keyCode &&
        !1 ===
          confirm(
            "새로고침을 하면 지금까지 작업한 것이 삭제됩니다.\n정말 새로고침 하시겠습니까?"
          ) &&
        (event.returnValue = !1);
    };
  </script>
</html>
