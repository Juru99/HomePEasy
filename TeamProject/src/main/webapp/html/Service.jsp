<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<%!
	private static final String Driver_Class = "com.mysql.cj.jdbc.Driver";
	// jdbc:mysql://연결하는호스트/데이터베이스명?serverTimeZone=UTC
	//private static final String URL = "jdbc:mysql://192.168.219.101:3306/test?serverTimeZone=UTC";
	private static final String URL2 = "jdbc:mysql://43.200.12.50:3306/homepeasy?serverTimeZone=UTC";
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
		conn = DriverManager.getConnection(URL2, USERNAME, PASSWORD);
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
<script>
	var code = "";
</script>
<%

	String[] title = new String[30];
	String[] date = new String[30];
	
	String head = "";
	String middle = "";
	String end = "";
	
	String total = "";
	
	int num;

	try
	{
		String query = "select count(*) from board";
		
		rs = stmt.executeQuery(query);
		
		rs.next();
		
		num = rs.getInt(1);
		
		query = "select title, board_date from board";
		
		rs = stmt.executeQuery(query);
		
		rs.next();
		
		for(int i = 1; i <= num;i++)
		{
			title[i] = rs.getString(1);
			date[i] = rs.getString(2);
			rs.next();
		}
		
		head = "<li class='notice'><a href='serviceInner.jsp' data-id=''><span>";
		middle = "</span><span>";
		end = "</span></a></li>";
		
		
		
		for (int i = 1; i <= num; i++)
		{
			total = total + head + title[i] + middle + date[i] + end;
			
			
			rs.next();
			
		}
		
		total = total.toString();
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
		out.println("실패" + e.getMessage());
	}
	finally
	{
	
	}

	
	
	

%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HomePEasy Service</title>
    <link rel="stylesheet" href="resources/css/Service.css?ver=8" />
    <script>
	function AddBoard()
	{
		alert("개발 중입니다.");
	}

	function DelBoard()
	{
		alert("개발 중입니다.");
	}
    </script>
  </head>
  <body>
    <div class="service">
      <div class="filter-container">
        <div class="help">
          <span>도움말</span>
        </div>
        <div class="notice">
          <span>공지사항</span>
        </div>
        <div class="ques">
          <span>1:1문의</span>
        </div>
      </div>
      <div class="search-container">
        <div>
          <input
            name="search"
            class="search"
            type="text"
            placeholder="  검색"
          />
        </div>
      </div>
      <div class="contents-container">
        <div class="help-contents">
          <div>
            <span class="title">자주 묻는 질문(FAQ)</span>
          </div>
          <div>
            <button class="help-toggle" id="que-1">
              <span id="que-1-toggle">+</span>
              <span>'HTML'이란 무엇인가요?</span>
            </button>
            <div class="answer hidden" id="ans-1">
              하이퍼텍스트 마크업 언어(HyperText Markup Language)입니다.
            </div>
          </div>
          <div>
            <button class="help-toggle" id="que-2">
              <span id="que-2-toggle">+</span>
              <span>'CSS'이란 무엇인가요?</span>
            </button>
            <div class="answer hidden" id="ans-2">
              캐스케이딩 스타일 시트(Cascading Style Sheets)입니다.
            </div>
          </div>
          <div>
            <button class="help-toggle" id="que-3">
              <span id="que-3-toggle">+</span>
              <span>'JS'이란 무엇인가요?</span>
            </button>
            <div class="answer hidden" id="ans-3">
              자바스크립트는 객체(Object)를 기초로 하는 스크립트 프로그래밍
              언어입니다.
            </div>
          </div>
        </div>
        <div class="notice-contents hidden">
          <div class="title">
            <span>공지사항</span>
          </div>
          <div>
            <ul id="noticeList">
              
            </ul>
          </div>
          <div class="btn-area">
            <input class="comment-add" type="button" onclick="AddBoard()" value="글 작성" />
            <input class="comment-del" type="button" onclick="DelBoard()" value="글 삭제" />
          </div>
        </div>
        <div class="ques-contents hidden">
          <div class="title">
            <span>1:1문의</span>
          </div>
          <div>
            <ul id="freeList">
              <li class="ques">
                <a href="#">
                  <span>9/8(목) 버그악용/불법프로그램 신고 보상 지급 안내</span>
                  <span>22.09.12</span>
                </a>
              </li>
              <li class="ques">
                <a href="#">
                  <span>위치기반서비스 이용약관 개정 안내</span>
                  <span>22.09.08</span>
                </a>
              </li>
              <li class="ques">
                <a href="#">
                  <span>9/9(금) ~ 9/12(월) 추석 연휴 고객센터 휴무 안내</span>
                  <span>22.09.07</span>
                </a>
              </li>
              <li class="ques">
                <a href="#">
                  <span>9월 지속 가능한 보안캠페인 진행 안내</span>
                  <span>22.09.05</span>
                </a>
              </li>
              <li class="ques">
                <a href="#">
                  <span>9/2(금) 운영정책위반 단속결과</span>
                  <span>22.09.02</span>
                </a>
              </li>
            </ul>
          </div>
          <div class="btn-area">
            <input class="comment-add" type="button" onclick="AddBoard()" value="글 작성" />
            <input class="comment-del" type="button" onclick="DelBoard()" value="글 삭제" />
          </div>
        </div>
      </div>
    </div>
  </body>
  <script src="resources/js/Service.js"></script>
  <script>
    	var notice_List = document.getElementById("noticeList");
    	var code = "";
    	
    	code = "<%= total %>";
    	
    	notice_List.innerHTML += code;
    	
    	
    </script>
</html>
