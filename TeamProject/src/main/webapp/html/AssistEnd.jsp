<%@page import="homepeasy.method.conversionchar.Conversion"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	
	
		session.removeAttribute("header");
		session.removeAttribute("main");
		session.removeAttribute("footer");
		

	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="BasePage.jsp?target_Main=html/AssistProcess" method="post" name="frm">
		<input type="hidden" id="header" name="header">
		<input type="hidden" id="main" name="main">
		<input type="hidden" id="footer" name="footer">
	</form>
</body>
<script>

		var header = document.getElementById("header");
		var main = document.getElementById("main");
		var footer = document.getElementById("footer");
		
		
		header.value = sessionStorage.getItem("header");
		main.value = sessionStorage.getItem("main");
		footer.value = sessionStorage.getItem("footer");
		
		
		document.frm.submit();
		
	
</script>
</html>