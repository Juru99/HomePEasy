<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>HomePEasy Login</title>
    
        <link rel="stylesheet" href="resources/css/SearchId.css?ver=1" />
	<script>
		function checkMail()
		{
			var name = document.getElementById("name");
			var year = document.getElementById("year");
			var email = document.getElementById("email");
			var eval = email.value;

			var checkMail_1st = 0;
			var checkMail_2nd = 0;
		
			var auth = document.getElementById("auth");			

			if(eval == "" || name.value == "" || year.value == "")
			{
				alert("빈칸을 모두 입력해주세요!");
			}
			else
			{
				for(var i = 0; i < eval.length; i++)
				{
					if(eval[i] == "@")
					{
						checkMail_1st = 1;
					}
					if(eval[i] == ".")
					{
						checkMail_2nd = 1;
					}
				}

				if(checkMail_1st != 0 && checkMail_2nd != 0)
				{
					auth.type = "submit";
				}
				else
				{
					alert("올바른 이메일 형식이 아닙니다.");
				}
			}
			
		}
	</script>
    </head>
    <body>
        <div class="search-container">
            <form method="post" action="BasePage.jsp?target_Main=html/SearchIdEmail">
             <div class="form-logo">
                    <a href="BasePage.jsp?target_Main=html/Index">
                        <img class="logo" src="resources/img/logo.png" />
                    </a>
                </div>
            <div class="form-item">
                <input tpye="text" class="name" id="name" name="name" placeholder="  * 이름" />
            </div>
            <div class="form-item">
                <input tpye="text" class="year" id="year" name="year" placeholder="  * (ex)20020101" />
            </div>
            <div class="form-item">
                <input tpye="email" class="email" id="email" name="email" placeholder="  * 이메일" />
                <input type="button" class="auth" id="auth" onclick="checkMail()" value="이메일 인증" />
            </div>
            </form>
        </div>
    </body>
</html>