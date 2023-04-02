<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 페이지 구성에 관한 코드 -->
<%
	request.setCharacterEncoding("utf-8");
	// 나타내줄 페이지 설정
	String target_Header = request.getParameter("target_Header");
	String target_Main = request.getParameter("target_Main");
	String target_Footer = request.getParameter("target_Footer");
	
	String userid = (String)session.getAttribute("user");
	
	if(session.getAttribute("user") != null){
		target_Header = "html/LoginMenu";
	}
	
	// 전달된 값이 없으면 기본값을 가지게 설정
	if(target_Header == null){
		if(session.getAttribute("user") == null){
			target_Header = "html/LogoutMenu";
		}else{
			target_Header = "html/LoginMenu";
		}
		
	}	
	if(target_Main == null){
		target_Main = "html/Index";
	}
	if(target_Footer == null){
		target_Footer = "";
	}
	
	
	// 페이지 설정을 위한 변수
	String targetPage_Header = target_Header + ".jsp";
	String targetPage_Main = target_Main + ".jsp";
	String targetPage_Footer = target_Footer + ".jsp";

%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>HomePEasy - 당신만의 홈페이지를 손쉽게 만드는 방법!</title>
	</head>
<body>
	<!-- WebSite Header File Include -->
	<jsp:include page="<%= targetPage_Header %>"></jsp:include>
	<!-- WebSite Header File Include -->
	<jsp:include page="<%= targetPage_Main %>"></jsp:include>
	<!-- WebSite Footer File Include -->
	
</body>
</html>