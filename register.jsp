<!DOCTYPE html>
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width//螢幕寬度, initial-scale=1//縮放比例, shrink-to-fit=no">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<title>register</title>
	<link rel="stylesheet" href="css/register.css" >
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
                   { String user = (String)session.getAttribute("username");
              String admin = (String)session.getAttribute("admin");
				%>
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
             
              sql ="use demo";
              con.createStatement().execute(sql);

              sql = "select * from member where account='"+user+"'";
              ResultSet rs2=con.createStatement().executeQuery(sql);
              rs2.next();
              %>
            
                <%
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
	<!-- nav -->
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
				<div class="col-md-5"><h5>Register</h5></div>
				<div class="col-md-7"></div>
			
		</main>
		<!-- /main -->
        <!-- content -->
	    <content class="content">
	        <hr>
	        <form action="registercheck.jsp" method="post" accept-charset="utf-8">
	        	<p>
	        		<h2>Name&nbsp;<opt><input type="text" name="name" size="10" id="text" required></opt></h2> 
	        		<h2>Gender <input type="radio" name="gender" value="男" id="opt" checked/ required>Boy<input type="radio" name="gender" id="opt" value="女"/ required>Girl</h2>
	        		<h2>Account <opt><input type="account" name="username" size="10" maxlength="12" placeholder="max:12" id="text" required></opt></h2>
	        		<h2>Password&nbsp; <opt><input type="password" name="password" size="10" maxlength="8" placeholder="max:8" id="text" required></opt></h2>
	        		<h2>Password Again&nbsp; <opt><input type="password" name="password2" size="10" maxlength="8" placeholder="max:8" id="text" required></opt></h2>
	        		<h2>Birthday&nbsp; <opt><input type="date" name="birth" size="10" id="text" required></opt></h2>
	        		<h2>Phone&nbsp; <opt><input type="phone" name="phone" maxlength="10" placeholder="09xxxxxxxx" id="text" required></opt></h2>
	        		<h2>E-Mail&nbsp; <opt><input type="email" name="email" placeholder="xxxxx@gmail.com" id="text" required></opt></h2>
	        		<h2>Address&nbsp; <opt><select size="1" name="address" required>
	        			<option>宜蘭縣</option>
	        			<option>基隆市</option>
	        			<option>新北市</option>
	        			<option>台北市</option>
	        			<option>桃園市</option>
	        			<option>新竹市</option>
	        			<option>新竹縣</option>
	        			<option>苗栗縣</option>
	        			<option>台中市</option>
	        			<option>彰化縣</option>
	        			<option>南投縣</option>
	        			<option>雲林縣</option>
	        			<option>嘉義市</option>
	        			<option>嘉義縣</option>
	        			<option>台南市</option>
	        			<option>高雄市</option>
	        			<option>屏東縣</option>
	        			<option>花蓮縣</option>
	        			<option>台東縣</option></select>
	        		    <input type="text" name="address2" size="25" id="text" required></opt></h2><hr>
	        	</p>
				<input type="submit" name="submit" value="Send" class="button">
			</form><br>
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
<%
        }
              con.close();
        }
          catch (SQLException sExec) {
              out.println("SQL錯誤"+sExec.toString());
      }
  }
    catch (ClassNotFoundException err) {
      out.println("class錯誤");
}
%>


</body>
</html>