<%@page import="homepeasy.method.createhtml.CreateHTML"%>
<%@page import="homepeasy.method.conversionchar.Conversion"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
		
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.');");
		out.println("location.replace('BasePage.jsp?target_Main=Index');");
		out.println("</script>");
		
	}
	catch(Exception e){
		e.printStackTrace();
		out.println("실패" + e.getMessage());
		
		
	}finally{
		

	}
%>
<%
	request.setCharacterEncoding("utf-8");

	String user = (String)session.getAttribute("user");
	String presetName = request.getParameter("presetName");
	
	System.out.println(presetName);
	
	try
	{
		String sql = "";
		
		sql = "select preset_site, header, main, footer from preset";
		sql += " where id = '" + user + "' and preset_name = '" + presetName + "'";
		
		rs = stmt.executeQuery(sql);
		
		rs.next();
		
		String siteName = "";
		String header = "";
		String main = "";
		String footer = "";
		
		siteName = rs.getString(1);
		header = rs.getString(2);
		main = rs.getString(3);
		footer =rs.getString(4);
		
		System.out.println("Conversion");
		
		Conversion con = new Conversion();
		
		header = con.ChangeChar(header);
		main = con.ChangeChar(main);
		footer = con.ChangeChar(footer);
		
		header = con.RemoveChar(header);
		main = con.RemoveChar(main);
		footer = con.RemoveChar(footer);
		
		String code = header + main + footer;
		
		System.out.println("Create");
		
		CreateHTML html = new CreateHTML();
		
		System.out.println("downlaod File");
		
		//html.download(response, presetName, html.CreateHTML(session, presetName, siteName, code));
		
		System.out.println("성공");
	}
	catch(Exception e)
	{
		e.printStackTrace();
		out.println("실패" + e.getMessage());
		
		
	}
	
%>
<script>
	alert("현재 파일 내보내기 기능은 점검 중에 있습니다.");
	location.replace("BasePage.jsp?target_Main=html/MyInfo");
</script>
