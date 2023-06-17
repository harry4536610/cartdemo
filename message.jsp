<!DOCTYPE html>
<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width//螢幕寬度, initial-scale=1//縮放比例, shrink-to-fit=no">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<title>message</title>
	<link rel="stylesheet" href="css/message.css" >
	<link rel="stylesheet" href="css/footer.css" >
	<a href="#">
		<img id="gotop" src="icon/top.png" width="30px" height="30px" >
	</a>
</head>
<body>
  <%
try {
 
    Class.forName("com.mysql.jdbc.Driver");
    try {
  
        String url="jdbc:mysql://localhost/";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else 
        {
          String user = (String)session.getAttribute("username");
              String admin = (String)session.getAttribute("admin");
              sql ="use demo";
              con.createStatement().execute(sql);
          %>
	<!-- header -->
	 <header class="row">
        <div class="col-md-1">
            <a href="index.jsp"><img src="icon/home.png" class="home"></a>
<%
            if(user==null||user.equals(""))
            {
              if(admin==null||admin.equals(""))
              {
                %><input type="hidden" name="carttttt" value="Carttt" ><%
              }
              else
              {
                %><a href="cart.jsp"><img src="icon/cart.png" class="cart" ></a><%
              }
            }
            else
            {
              %><a href="cart.jsp"><img src="icon/cart.png" class="cart" ></a><%
            }
            %>        </div>
        <div class="col-md-1">
              <%
              

              sql = "select * from member where account='"+user+"'";
              ResultSet rs2=con.createStatement().executeQuery(sql);
              rs2.next();
              
            
                
                if(user==null||user.equals(""))
                {
                  if(admin==null||admin.equals(""))
                  {%>
                  <input type="hidden" name="logout" value="Logout" class="out">
                  <%}
                  else
                  {%>
                    <form name="logout" method="post" action="logout.jsp">
                      <%
                      sql="select * from administer where account='"+admin+"'";
                      ResultSet rs3=con.createStatement().executeQuery(sql);
                      rs3.next();
                      
                      %>
                      <h1>Hi! <%=rs3.getString("name")%></h1>                
                  <button type="submit" name="logout" class="out"><img src="icon/logout.png" class="out"></button>
                  </form>
                  <%}
                }
                %><%
                else
                {%>
                  <form name="logout" method="post" action="logout.jsp">
                    <%ResultSet rs4=con.createStatement().executeQuery(sql);
                      rs4.next();%>
                  <h1>Hi! <%=rs4.getString("name")%></h1>               
                  <button type="submit" name="logout" class="out"><img src="icon/logout.png" class="out"></button>
                  </form>
                <%}%>

        </div>
        <div class="col-md-8"><img src="img/logo.png" class="logo"></div>       
        <div class="col-md-2">
            <img src="icon/search.png" class="search">
            <form action="search.jsp" method="post">
                <input type="text" name="search" size="10" placeholder="search" class="search">    <!-- float是由右至左排序 -->
            </form>
        </div>          
    </header>
	<!-- /header -->	
 <nav class="row"> 
  <div id="nav">
      <ul class="col-md-12">
    <li id="droptown"><a href="allstore.jsp" id="dropbtn">Products</a>
    <div id="dropmenu">
     <a href="sticker.jsp">Sticker</a> <br>
     <a href="pjurassic.jsp">Pin</a> <br>
     <a href="postcard.jsp">Postcard</a> <br>
    </div>
    </li>
       <li id ="droptown"><a href="member.jsp" id="dropbtn">Member</a>
       <div id="dropmenu">
     <a href="login.jsp" >Login</a> <br>
     <a href="register.jsp" >Register</a> <br>
    </div>
       </li>
       <li><a href="range.jsp" class="dropbtn">Leader Board</a></li>
       <li><a href="message.jsp" class="dropbtn">Message Board</a></li>
       <li id="droptown"><a href="memintro.jsp" id="dropbtn">About Us</a>
       <div id="dropmenu">
     <a href="brandintro.jsp" >Design concept</a> <br>
     <a href="memintro.jsp" >Member Introduction</a> <br>
    </div>
    </li>
   </ul>
  </div>
 </nav>
	<!-- /nav -->
	<!-- container -->
	<div class="container">
		<!-- main -->
		<main class="row">	   
				<div class="col-md-5"><h5>Message</h5></div>
				<div class="col-md-7"></div>
			
		</main>
		<!-- /main -->
     	<!-- content -->
	    <content class="content">
	        <hr>
	        <!-- row -->
	        <div class="row">
	        
	        <div class="col-md-6">
				<form action="add1.jsp" method="post" accept-charset="utf-8">
	        	<p>
	        		<h2><opt><div class="row"><textarea rows="12" cols="45" name="note" placeholder="leave a message..." required></textarea></opt></h2><br>
	        		<h2>Name&nbsp; <opt><input type="text" name="name" size="10" id="text" required></opt></h2> <br>
	        		<h2>Phone&nbsp; <opt><input type="phone" name="phone" maxlength="10"  id="text" required></opt></h2><br>
	        		<h2>E-Mail&nbsp; <opt><input type="email" name="email"  id="text" required></opt></h2>
	        	</p>
				<input type="submit" name="submit" value="Send" class="button" ">
			    </form><br>
			</div>
			<div class="col-md-6"><form name="f" action="message.jsp" method="post">
			<%
  
           sql="use board";
           con.createStatement().execute(sql);
	
           sql="select * from guestbook1"; //算出共幾筆留言
           ResultSet rs=con.createStatement().executeQuery(sql);

           
           rs.last();
           int total_content=rs.getRow();
           out.println("共"+total_content+"筆留言<p>");
		   
		   
		   
		   
           
           //每頁顯示5筆, 算出共幾頁
           int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
		   
           out.println("請選擇頁數");
		   
		   //讀取page變數
           String page_string = request.getParameter("page");
           if (page_string == null) 
               page_string = "0";          
           int current_page=Integer.valueOf(page_string);
           if(current_page==0) //若未指定page, 令current_page為1
	          current_page=1;
		   
           if (current_page!=0)
		   {
			   out.print("<a href='message.jsp?page="+1+"'>"+"第一頁"+"</a>&nbsp;");
	       }
		   if (current_page!=1)
		   {
			   int a=current_page-1;
			   out.print("<a href='message.jsp?page="+a+"'>"+"上一頁"+"</a>&nbsp;");
		   }	  
		   
			  
			  
           //使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
           for(int i=1;i<=page_num;i++) //建立1,2,...頁超連結
              {
	           
			   out.print("<a href='message.jsp?page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白
           }
           
		   
		   if (current_page!=0&&current_page<page_num)
		   {
			   int b=current_page+1;
			   out.print("<a href='message.jsp?page="+b+"'>"+"下一頁"+"</a>&nbsp;");
		   }	
           if(current_page!=page_num)
			{
				out.print("<a href='message.jsp?page="+page_num+"'>"+"最後一頁"+"</a>&nbsp;");
			}
			out.println("現在在第"+current_page+"頁");
	       //計算開始記錄位置   
		   %>
		   <br>
		   <font color="#532187">
		   跳至<input type="text" size="3" name="page" value=1>頁
		   <input type="submit" value="送出"></font>
		   </p>
		   <%

           int start_record=(current_page-1)*5;//遞減排序, 讓最新的資料排在最前面
           
           sql="select * from guestbook1 order by no desc limit ";
           sql+=start_record+",5";

// current_page... select * from guestbook order by no desc limit
//      current_page=1: select * from guestbook order by no desc limit 0, 5
//      current_page=2: select * from guestbook order by no desc limit 5, 5
//      current_page=3: select * from guestbook order by no desc limit 10, 5
           rs=con.createStatement().executeQuery(sql);
//  逐筆顯示, 直到沒有資料(最多還是5筆)
           while(rs.next())
                {
				 out.println("留言順序:"+rs.getString(1)+"<br>");
                 out.println("訪客姓名:"+rs.getString(3)+"<br>");
				 out.println("phone:"+rs.getString(4)+"<br>");
                 out.println("E-mail:"+rs.getString(5)+"<br>");
                 out.println("留言內容:"+rs.getString(2)+"<br>");
                 out.println("留言時間:"+rs.getString(6)+"<br><hr>");
          }
//Step 6: 關閉連線
          con.close();
      }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤");
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤");
}
%>
 </form>
		    </div>
			
 </div>
		    <!-- /row -->
	    </content>
	    <!-- /content -->
    </div>
	<!-- /container -->
	<!-- footer -->
	<footer class="row">
	    <div class="col-md-2" id="cont"><h4 class="footer">PRODUCTS</h4><p><a href="sticker.jsp" class="href">sticker</a><br><a href="pjurassic.jsp" class="href">pin</a><br><a href="postcard.jsp" class="href">postcard</a></p></div>	  
	    <div class="col-md-2" id="cont"><h4 class="footer">MEMBER</h4><p><a href="login.jsp" class="href">login</a><br><a href="register.jsp" class="href">register</a><br><a href="modify.jsp" class="href">modify</a></p></div>	    
	    <div class="col-md-2" id="cont"><h4 class="footer">MESSAGE</h4><p><a href="message.jsp" class="href">message board</a></p></div>	  
	    <div class="col-md-2" id="cont"><h4 class="footer">ABOUT US</h4><p><a href="brandintro.jsp" class="href">design concept</a><br><a href="memintro.jsp" class="href">member introduction</a></p></div>	    
	    <div class="col-md-4" id="cont">
	    	<h4 class="footer">CONNET US</h4>
	    	<center>
	    	<a href="https://www.facebook.com/profile.php?id=100000445410466"><img src="icon/man.png" class="icon"></a>
	    	<a href="https://www.facebook.com/lin.erica.1"><img src="icon/girl.png" class="icon"></a>
	    	<a href="https://www.facebook.com/tian.cai.3154"><img src="icon/boy.png" class="icon"></a>
	    	<a href="https://www.facebook.com/profile.php?id=100002970368977"><img src="icon/man1.png" class="icon"></a>
	        </center>
	    </div>
		<div class="col-md-12"><h6 class="footer">Copyright © 2018-All Right Reserved. Design and Developed By MOUSEPI.</h6></div>

	</footer>
	<!-- /footer -->
	         <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>        
    <script>
            	$(function() {
            		/* 按下GoTop按鈕時的事件 */
            		$('#gotop').click(function(){
            			$('html,body').animate({ scrollTop: 0 }, 'slow');   /* 返回到最頂上 */
            			return false;
            	    });
            	/* 偵測卷軸滑動時，往下滑超過200px就讓GoTop按鈕出現 */
            	$(window).scroll(function() {
            	    if ($(this).scrollTop()>200){
            	        $('#gotop').fadeIn();
                    } 
                    else{
                    	$('#gotop').fadeOut();
                    }
                });
            });
    </script>
</body>
</html>