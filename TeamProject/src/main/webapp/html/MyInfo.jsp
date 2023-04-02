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

	String id = (String)session.getAttribute("user");
	String name = "";
	String email = "";
	String[] preset = new String[10];
	String[] site = new String[10];
	String[] presetNo = new String[10];
	
	int count = 0;
	
	String start = "";
	String start2 = "";
	String start3 = "";
	String presetName = "";
	String afterPreset = "";
	String siteName = "";
	String afterSite = "";
	
	String end = "";
	String end2 = "";
	String end3 = "";
	String end4 = "";
	
	String code = "";
	
	try
	{
		String sql = "select id, name, email from user where id = '" + id + "'";
		
		rs = stmt.executeQuery(sql);
		
		rs.next();
		
		name = rs.getString(2);
		email = rs.getString(3);
		
		sql = "select count(preset_name) from preset where id = '" + id + "'";
		
		rs = stmt.executeQuery(sql);
		
		rs.next();
		
		count = rs.getInt(1);
		
		sql = "select preset_name, preset_site, preset_no from preset where id = '" + id + "'";
		
		rs = stmt.executeQuery(sql);
		
		rs.next();
		
		for(int i = 1; i <= count; i++)
		{
			preset[i] = rs.getString(1);
			site[i] = rs.getString(2);
			presetNo[i] = rs.getString(3);
			rs.next();
		}
		
			
		start = "<form method='post' action='BasePage.jsp?target_Main=html/AssistDel";
		start2 = "&presetName=";
		start3 = "'><div class='preset-item'><div><span id='presetName";
		afterPreset = "</span></div><div><span>";
		afterSite = "</span></div><div><a href='BasePage.jsp?target_Main=html/AssistGoEdit&presetNo=";
		end = "'>사이트 편집</a><button type='button' id='siteOutput' class='site-output' onclick='SiteOutPut(";
		String end_to = ")'>내보내기</button><button type='button'";
		end2 = " id='siteDel";
		end3 = "' class='site-del' onclick='site_Del";
		end4 = "()'>삭제하기</button></div></div></form>";
		
		for(int i = 1; i <= count; i++)
		{
			
			code += start + start2 + preset[i] + start3 + i + "'>" + preset[i] + afterPreset + site[i] + afterSite + presetNo[i] + end;
			code += end_to;
			code += end2 + i + end3 + i + end4; 
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
		out.println("실패" + e.getMessage());
	}
	
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HomePEasy myInfo</title>
    <link rel="stylesheet" href="resources/css/MyInfo.css?ver=1" />
    <script>
       function userDel()
       {
          let dropMember = document.getElementById("dropMember");
          let check = 0;
          
          
          if(confirm("정말로 회원 탈퇴를 하시겠습니까?") == true)
          {
             location.replace("BasePage.jsp?target_Main=html/UserDel");
          }
          
       }
       
       function update_Pw()
       {
          let pw = document.getElementById("pw");
          let rePw = document.getElementById("rePw");
          let pwChk = document.getElementById("pwChk");
          
	

          if(pw.value == rePw.value && pw.value != "" && rePw.value != "")
          {
console.log(pwChk);
             pwChk.type = "submit";
	location.replace("BasePage.jsp?target_Main=html/UpdatePw&pw=" + pw.value);
          }
          else
          {
             alert("비밀번호가 일치하지 않습니다.");
          }
          
       }
       
       function emailChk()
       {
          let email = document.getElementById("email").value;
          var checkMail1 = 0;
          var checkMail2 = 0;
          
          if(email == "")
          {
             alert("이메일을 입력해주세요.");   
          }
          else if(email == "<%= email %>")
          {
             alert("동일한 이메일은 사용하실 수 없습니다.");
          }
          else
          {
             for(var i = 0; i < email.length; i++){
                if(email[i] == "@"){
                   checkMail1 = 1;
                }else if(email[i] == "."){
                   checkMail2 = 1;
                }
                
             }
             
             if(checkMail1 == 0){
                alert("올바른 이메일 형식이 아닙니다.");
             }else if(checkMail2 == 0){
                alert("올바른 이메일 형식이 아닙니다.");
             }else{
                location.replace("BasePage.jsp?target_Main=html/UpdateEmail&email=" + email);
             }
          }
          
          
       }
       
       function assistButton()
       {
          var presetName = document.getElementById("presetName");
          var siteName = document.getElementById("siteName");
          var assistBtn = document.getElementById("assistBtn");
          
          if(presetName.value == "")
          {
             alert("프리셋 이름을 입력해주세요.");   
          }
          else
          {
             if(siteName.value == "")
             {
                alert("사이트 이름을 입력해주세요.");
             }
             else
             {
                assistBtn.type = "submit";
             }
          }
          
          
       }
       
       function SiteOutPut()
       {
    	   location.replace("BasePage.jsp?target_Main=html/AssistOutPut&presetName=PresetIsOne");
           
           
           
       }
       
       
       
    </script>
  </head>
  <body>
    <div class="myInfo">
      <div class="myInfo-tab">
        <div class="privacy">
          <span>개인정보</span>
        </div>
        <div class="preset">
          <span>프리셋</span>
        </div>
      </div>
      <div class="myInfo-contents">
        <form
          class="privacy-form"
          method="post"
          action="BasePage.jsp?target_Main=html/UpdatePw"
        >
          <div class="form-item">
            <div>
              <span>아이디</span>
            </div>
            <div>
              <input
                class="id"
                type="text"
                placeholder=" 아이디"
                disabled
                value="<%= id %>"
              />
            </div>
          </div>
          <div class="form-item">
            <div>
              <span>비밀번호</span>
            </div>
            <div>
              <input
                id="pw"
                class="pw"
                name="pw"
                type="password"
                placeholder=" 비밀번호"
                value=""
              />
            </div>
          </div>
          <div class="form-item">
            <div>
              <span>비밀번호 확인</span>
            </div>
            <div>
              <input
                id="rePw"
                class="re-pw"
                name="rePw"
                type="password"
                placeholder=" 비밀번호 확인"
              />
              <button
                type="button"
                id="pwChk"
                name="pwChk"
                class="pw-chk"
                onclick="update_Pw()"
              >
                비밀번호 변경
              </button>
            </div>
          </div>
          <div class="form-item">
            <div>
              <span>이름</span>
            </div>
            <div>
              <input
                class="username"
                type="text"
                placeholder=" 이름"
                value="<%= name %>"
                disabled
              />
            </div>
          </div>
          <div class="form-item">
            <div>
              <span>E-mail</span>
            </div>
            <div>
              <input
                id="email"
                class="email"
                name="email"
                type="email"
                placeholder=" 이메일"
                value="<%= email %>"
              />
              <button
                type="button"
                id="emailBtn"
                class="email-chk"
                onclick="emailChk()"
              >
                이메일 인증
              </button>
            </div>
          </div>
          <div>
            <button
              type="button"
              id="dropMember"
              name="dropMember"
              class="drop-member"
              onclick="userDel()"
            >
              회원 탈퇴
            </button>
          </div>
        </form>
        <div id="presetList" class="preset-contents hidden">
          <form method="post" action="BasePage.jsp?target_Main=html/MakeAssist">
            <div class="preset-property">
              <div class="property-item">
                <input
                  type="text"
                  id="presetName"
                  name="presetName"
                  placeholder="    프리셋 이름"
                />
              </div>
              <div class="property-item">
                <input
                  type="text"
                  id="siteName"
                  name="siteName"
                  placeholder="   사이트 이름"
                />
              </div>
              <div class="property-item">
                <button type="button" id="assistBtn" onclick="assistButton()">
                  만들기
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
 <script>
     var code = "<%= code %>";
     var presetList = document.getElementById("presetList");
     
     presetList.innerHTML += code;
     
     function site_Del1()
     {
  	    var siteDel = document.getElementById("siteDel1");
  	    var presetName = document.getElementById("presetName1");
  	   
  	   
  	   	if(confirm("정말로 삭제하시겠습니까?") == true)
  		{
  	   		siteDel.type = "submit";	
  		}
  	   	else
  		{
  			   
  		}
  	   
     }
     
     function site_Del2()
     {
  	    var siteDel = document.getElementById("siteDel2");
  	    var presetName = document.getElementById("presetName2");
  	   
  	   
  	   	if(confirm("정말로 삭제하시겠습니까?") == true)
  		{
  	   		siteDel.type = "submit";	
  		}
  	   	else
  		{
  			   
  		}
  	   
     }
     
     function site_Del3()
     {
  	    var siteDel = document.getElementById("siteDel3");
  	    var presetName = document.getElementById("presetName3");
  	   
  	   
  	   	if(confirm("정말로 삭제하시겠습니까?") == true)
  		{
  	   		siteDel.type = "submit";	
  		}
  	   	else
  		{
  			   
  		}
  	   
     }
     function site_Del4()
     {
  	    var siteDel = document.getElementById("siteDel4");
  	    var presetName = document.getElementById("presetName4");
  	   
  	   
  	   	if(confirm("정말로 삭제하시겠습니까?") == true)
  		{
  	   		siteDel.type = "submit";	
  		}
  	   	else
  		{
  			   
  		}
  	   
     }
     
  </script>
  <script src="resources/js/MyInfo.js"></script>
</html>