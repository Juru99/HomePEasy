<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%!
	private static final String Driver_Class = "com.mysql.cj.jdbc.Driver";
	// jdbc:mysql://연결하는호스트/데이터베이스명?serverTimeZone=UTC
	private static final String URL = "jdbc:mysql://43.200.12.50:3306/homepeasy?serverTimeZone=UTC";
	private static final String USERNAME = "user";
	private static final String PASSWORD = "1q2w3e4r";

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
		System.out.println(conn);
		
		//out.println("3");
		// Statement 객체 로딩		
		stmt = conn.createStatement();
		//out.println("Statement 객체 로딩 성공<br>");
		
		System.out.println(stmt);
		
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
	
	String dbId = "";
	String dbPw = "";
	
	try
	{
		String query = "select id, pw from user where id = '" + id + "'";
		
		rs = stmt.executeQuery(query);
		
		rs.next();
		
		dbId = rs.getString(1);
		dbPw = rs.getString(2);
		
		if(id.equals(dbId))
		{
			if(pw.equals(dbPw))
			{
				session.setAttribute("user", id);
				
				out.println("<script>location.replace('BasePage.jsp?target_Main=html/Index')</script>");
				
			}
			else
			{
				out.println("<script>alert('비밀번호가 일치하지 않습니다.');");
				out.println("location.replace('BasePage.jsp?target_Main=html/Login')</script>");
			}
		}
		
	}	
	catch(Exception e)
	{
		String err = "Illegal operation on empty result set.";
		e.printStackTrace();
		out.println(e.getMessage());
		if(err.equals(e.getMessage()))
				{
					out.println("<script>alert('존재하지 않는 아이디입니다.');");
					out.println("location.replace('BasePage.jsp?target_Main=html/Login')</script>");
				}
	}
	finally
	{
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

%>
