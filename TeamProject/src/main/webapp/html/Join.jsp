<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="wnameth=device-wnameth, initial-scale=1.0">
    <title>HomePEasy Join</title>
    <link rel="stylesheet" href="resources/css/Join.css">
    <script>
        function idCheck(){
            var idCheck = document.getElementById("id");
            var btnSubmit = document.getElementById("dbl_Chk");
            
            if(idCheck.value == ""){
                alert("아이디를 입력해주세요.");
            }else{
                btnSubmit.type = "submit";
            
            }
            
        }
        
        function join_Btn(){
            alert("아이디 중복확인을 먼저 해주세요.");
        }
    </script>
</head>
<body>
    <div class="join-container">
        <form class="join-form" method="post" action="BasePage.jsp?target_Main=html/Join_idCheck">
            <div class="form-logo">
                <a href="index.jsp">
                    <img class="logo" src="" />
                </a>
            </div>
            <div class="form-item">
                <input id="id" name="id" class="id" type="text" placeholder="  * 아이디" />
                <button type="button" name="dblChk" id="dbl_Chk" class="dbl-chk" onclick="idCheck()" >중복 확인</button>
            </div>
            <div class="form-item">   
                <input name="pw" class="pw" type="password" placeholder="  * 비밀번호" />
            </div>
            <div class="form-item">
                <input name="rePw" class="re-pw" type="password" placeholder="  * 비밀번호 확인" />
            </div>
            <div class="form-item">
                <input name="name" class="name" type="text" placeholder="  * 이름" />
            </div>
            <div class="form-item">
                <input name="year" class="year" type="text" placeholder="  * (ex)20020101" maxlength="8"/>
            </div>
            <div class="form-item">
                <input name="email" class="email" type="email" placeholder="  * 이메일" /> 
                <input type="button" name="auth" class="auth" value="이메일 인증"></input>
            </div>
            <div class="form-item">
                <input type="button" name="joinBtn" class="join-btn" value="회원가입" onclick="join_Btn()" />
            </div>
        </form>
    </div>
</body>
    <script src="resources/js/Join.js"></script>
</html>