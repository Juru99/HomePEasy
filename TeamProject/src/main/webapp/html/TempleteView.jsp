<%@page import="homepeasy.method.conversionchar.Conversion"%>
<%@ page language='java' contentType='text/html; charset=utf-8'
pageEncoding='utf-8' %>
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
    String preset_name = request.getParameter("preset_name");
    String preset_site = request.getParameter("preset_site");
    
    String sql = "";

    String header = "";
    String main = "";
    String footer = "";

    out.println("<script>console.log('"+ id +"')</script>");

    try
	{
		sql = "select header, main, footer from preset where id='" + id + "' and preset_name='" + preset_name + "'";

		rs = stmt.executeQuery(sql);

		rs.next();

        

        header = rs.getString(1);
        main = rs.getString(2);
        footer = rs.getString(3);
		
        Conversion con = new Conversion();

        header = con.ChangeChar(header);
		main = con.ChangeChar(main);
		footer = con.ChangeChar(footer);
		
		header = con.RemoveChar(header);
		main = con.RemoveChar(main);
		footer = con.RemoveChar(footer);
		
	}
	catch(Exception e){
		e.printStackTrace();
		out.println("실패" + e.getMessage());
		
		
	}finally{
		
		

	}

%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8" />
        <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
          }
          
          a {
            text-decoration: none;
            color: inherit;
          }
          
          li {
            list-style: none;
          }
          </style>
    </head>
    <body id="container">

    </body>
    <script>
        var header = "<%= header %>";
        var main = "<%= main %>";
        var footer = "<%= footer %>";

        var container = document.getElementById("container");

        container.innerHTML = header + main + footer;

        console.log(container);
        console.log(header);
        console.log(main);
        console.log(footer);

        console.log("11");

        console.log(sessionStorage.getItem("main"));

    </script>
</html>