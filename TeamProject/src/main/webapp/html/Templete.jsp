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

	String sql = "";
	String total = "";

	try
	{
		sql = "select id, preset_name, preset_site from preset";

		rs = stmt.executeQuery(sql);

		String id = "";
		String pName = "";
		String pSite = "";		

		int i = 0;

		

		String start = "<form action='BasePage.jsp?target_Main=html/TempleteView' method='post'><table><tbody><tr><th>";
		String option_id = "</th><td class='id'><input type='text' name='id' readonly value='";
		String option_name = "'></input></td><td class='preset_name'><input type='text' name='preset_name' readonly value='";
		String option_site = "'></input></td><td class='preset_site'><input type='text' name='preset_site' readonly value='";
		String end = "'></input></td><td name='btn' class='btn'></t><button type='submit' onclick='check()'>이동</button></td></tr></tbody></table></form>";
		
		while(rs.next())
		{
			id = rs.getString(1);
			pName = rs.getString(2);
			pSite = rs.getString(3);

			total += start + (i+1) + option_id + id + option_name + pName + option_site + pSite + end;

			i++;
		}

		


		
		
	}
	catch(Exception e){
		e.printStackTrace();
		out.println("실패" + e.getMessage());
		
		
	}finally{
		
		

	}
%>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8" />

		<link rel="stylesheet" href="https://showcases.yalco.kr/html-css/01-06/table.css" >
		<style>
			table {
				margin-left: auto;
				margin-right: auto;

				width: 1000px;
			}

			.no {
				width: 50px;
			}

			th{
				width: 50px;
			}
			.id {
				width: 250px;
			}
			.preset_name, .preset_site {
				width: 300px;
			}
			.btn {
				width: 100px;
			}

			input {
				width: 200px;
			}

		</style>
	</head>
	
	<body class="container" id="container">
		<table>
			<thead>
				<td class="no">no</td>
				<td class="id">아이디</td>
				<td class="preset_name">프리셋 명</td>
				<td class="preset_site">사이트 명</td>
				<td class="btn">이동</td>
			</thead>
			<tbody id="container_table">
			</tbody>
		</table>
	</body>
	<script>
		var code = "<%= total %>";

		var container_table = document.getElementById("container");

		container.innerHTML += code;
	</script>
</html>