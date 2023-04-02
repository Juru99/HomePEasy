<%@page import="homepeasy.method.conversionchar.Conversion"%>
<%@page import="homepeasy.method.createhtml.CreateHTML"%>
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

	String user = (String)session.getAttribute("user");
	String presetName = request.getParameter("presetName");
	String siteName = request.getParameter("siteName");
	String header = "";
	String main = "";
	String footer = "";
	
	try
	{
		// 기반 코드 불러오는 SQL문
		String sql = "select header,main,footer from preset where id = 'admin' and preset_name = 'CodeSet'";
		rs = stmt.executeQuery(sql);
		
		rs.next();
		
		header = rs.getString(1);
		main = rs.getString(2);
		footer = rs.getString(3);
		
		// 사용자의 DB 테이블 생성
		sql = "insert into preset(id, preset_name, preset_site, header, main, footer)";
		sql += " values('" + user + "', '" + presetName + "', '" + siteName + "', '" + header + "', '" + main + "', '" + footer + "')";
		
		
		stmt.executeUpdate(sql);
		
		
		//CreateHTML create = new CreateHTML();
		
		//create.CreateHTML(session, presetName, code);
		
		Conversion con = new Conversion();

		header = con.ChangeChar(header);
		main = con.ChangeChar(main);
		footer = con.ChangeChar(footer);
		
		header = con.RemoveChar(header);
		main = con.RemoveChar(main);
		footer = con.RemoveChar(footer);
		
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
		out.println("실패" + e.getMessage());
	}
	finally
	{
		session.setAttribute("header", header);
		session.setAttribute("main", main);
		session.setAttribute("footer", footer);
		session.setAttribute("preset_name", presetName);
		//out.println("<script>location.replace('/yuhan/resources/react_build/index.html');</script>");
	}
	


%>


<script>
	sessionStorage.setItem("header", "<%= header %>");
	sessionStorage.setItem("main", "<%= main %>");
	sessionStorage.setItem("footer", "<%= footer %>");
	
	location.replace('resources/react_build/index.jsp');
	
</script>
