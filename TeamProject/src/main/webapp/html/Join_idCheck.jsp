<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%!
	private static final String Driver_Class = "com.mysql.cj.jdbc.Driver";
	// jdbc:mysql://연결하는호스트/데이터베이스명?serverTimeZone=UTC
	private static final String URL = "jdbc:mysql://43.200.12.50:3306/homepeasy?serverTimeZone=UTC";
	private static final String USERNAME = "wskjdd12";
	private static final String PASSWORD = "zkskep12";

%>

<%
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		//out.println("1");
		// JDBC 드라이버 클래스 로딩
		Class.forName(Driver_Class);
		//out.println("JDBC 드라이버 클래스 로딩 성공<br>");
		
		//out.println("2");
		//DBMS에 접속
		conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		//out.println("DBMS 접속 성속<br>");
		
		//out.println("3");
		// Statement 객체 로딩		
		stmt = conn.createStatement();
		//out.println("Statement 객체 로딩 성공<br>");
		
		//out.println("4");
		//sql 코드 작성 및 결과 가져오기
		//rs = stmt.executeQuery("select * from usertable");
		//out.println("SQL 쿼리 성공<br>");
			
		
	}catch(SQLException se){
		out.println("실패" + se.getMessage());
		out.println("!");
	}
	catch(Exception e){
		e.printStackTrace();
		out.println("실패" + e.getMessage());
		
		
	}finally{
		

	}
	
%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String rePw = request.getParameter("rePw");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String email = request.getParameter("email");
	
	String query = "";
	String idCheck = "";
	
	try{
		
		query = "select * from user where id = '" + id + "'";
		
		rs = stmt.executeQuery(query);
		
		rs.next();
		
		idCheck = rs.getString(1);
		
		if(id.equals(idCheck)){
			out.println("<script>alert('이미 존재하는 아이디입니다.');");
			out.println("location.replace('BasePage.jsp?target_Main=html/Join');</script>");
		}else{
			
		}
		
		
	}catch(Exception e){
			out.println("<script>");
		out.println("window.onload = function(){alert('사용 가능한 아이디입니다.');}");
		out.println("</script>");

	}finally{
		
	}
	
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="wnameth=device-wnameth, initial-scale=1.0">
    <title>HomePEasy Join</title>
    <link rel="stylesheet" href="resources/css/Join.css">
    <script>
    	function join_Btn(){
    		alert("이메일 인증을 먼저 해주세요.");
    	
    	}
    	
    	function emailCheck(){
    		var emailBtn = document.getElementById("auth");
    		var email = document.getElementById("email");
    		var eval = email.value;
    		var checkMail1 = 0;
    		var checkMail2 = 0;
    		
    		if(eval == ""){
    			alert("이메일을 입력해주세요.");
    		}else{
    			for(var i = 0; i < eval.length; i++){
    				if(eval[i] == "@"){
    					checkMail1 = 1;
    				}else if(eval[i] == "."){
    					checkMail2 = 1;
    				}
    				
    			}
    			
    			if(checkMail1 == 0){
    				alert("올바른 이메일 형식이 아닙니다.");
    			}else if(checkMail2 == 0){
    				alert("올바른 이메일 형식이 아닙니다.");
    			}else{
    				emailBtn.type = "submit";
    			}
    		}
    		
    		
    	}
    </script>
</head>
<body>
    <div class="join-container">
        <form class="join-form" method="post" action="BasePage.jsp?target_Main=html/Join_emailCheck">
            <div class="form-logo">
                <a href="index.jsp">
                    <img class="logo" src="" />
                </a>
            </div>
            <div class="form-item">
                <input name="id" class="id" type="text" placeholder="  * 아이디" value="<%= id %>" />
                <button type="button" name="dblChk" class="dbl-chk">중복확인</button>
            </div>
            <div class="form-item">   
                <input name="pw" class="pw" type="password" placeholder="  * 비밀번호" value="<%= pw %>" />
            </div>
            <div class="form-item">
                <input name="rePw" class="re-pw" type="password" placeholder="  * 비밀번호 확인" value="<%= rePw %>" />
            </div>
            <div class="form-item">
                <input name="name" class="name" type="text" placeholder="  * 이름" value="<%= name %>" />
            </div>
            <div class="form-item">
                <input name="year" class="year" type="text" placeholder="  * (ex)20020101" maxlength="8" value="<%= year %>" />
            </div>
            <div class="form-item">
                <input name="email" id="email" class="email" type="email" placeholder="  * 이메일" value="<%= email %>" /> 
                <button type="button" id="auth" name="auth" class="auth" onclick="emailCheck()">이메일 인증</button>
            </div>
            <div class="form-item">
                <button type="button" name="joinBtn" class="join-btn" onclick="join_Btn()" >회원가입</button>
            </div>
        </form>
    </div>
</body>
    <script src="resources/js/Join.js">
    
    </script>
</html>