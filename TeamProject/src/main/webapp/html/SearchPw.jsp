<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>HomePEasy Login</title>
    
        <link rel="stylesheet" href="resources/css/SearchPw.css?ver=2" />
    </head>
    <body>
        <div class="search-container">
            <form>
                <div class="form-logo">
                    <a href="BasePage.jsp?target_Main=html/Index">
                        <img class="logo" src="resources/img/logo.png" />
                    </a>
                </div>
                <div class="form-item">
                    <input type="text" class="id" id="id" placeholder="  * 아이디" />
                </div>
            <div class="form-item">
                <input type="text" class="name" id="name" placeholder="  * 이름" />
            </div>
            <div class="form-item">
                <input type="email" class="email" id="email" placeholder="  * 이메일" />
                <input type="button" class="auth" id="auth" onclick="" value="이메일 인증" />
            </div>
            </form>
        </div>
    </body>
</html>