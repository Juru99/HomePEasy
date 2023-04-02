<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	System.out.println("AssistProcess.jsp 진입");
	
	String user = (String)session.getAttribute("user");
	String presetName = (String)session.getAttribute("presetName");
	
	String header = request.getParameter("header");
	String main = request.getParameter("main");
	String footer = request.getParameter("footer");
	
	System.out.println(header);
	System.out.println(main);
	System.out.println(footer);
	
	String sql = "";
	
	try
	{
		sql = "update preset set header = '" + header + "'";
		sql += " where id = '" + user + "' and preset_name = '" + presetName + "'";
		
		stmt.executeUpdate(sql);
		
		sql = "update preset set main = '" + main + "'";
		sql += " where id = '" + user + "' and preset_name = '" + presetName + "'";
		
		stmt.executeUpdate(sql);
		
		sql = "update preset set footer = '" + footer + "'";
		sql += " where id = '" + user + "' and preset_name = '" + presetName + "'";
		
		stmt.executeUpdate(sql);
		
	}
	catch(Exception e){
		e.printStackTrace();
		out.println("실패" + e.getMessage());
		
		
	}finally{
		
		session.removeAttribute("presetName");

	}

%>
<script>
	location.replace("BasePage.jsp?target_Main=html/Index");
</script>



