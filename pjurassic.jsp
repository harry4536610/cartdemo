<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width//螢幕寬度, initial-scale=1//縮放比例, shrink-to-fit=no">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="css/allstore.css" >
	<link rel="stylesheet" href="css/footer.css" >
	<title>product</title>
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
		 	<content class="row">
		 		<aside class="col-md-3">
		 			<div id="pro">
		 			<div class="col-md-12"><br></div>
					<h5>Products</h5><hr>
					<ul>
                       <li><a href="allstore.jsp"><h6 class="con">全部</h6></a></li>
					</ul><hr>
					<a href="sticker.jsp" style="text-decoration: none;"><h3>Sticker</h3></a>
					<ul>
                       <li><a href="sjurassic.jsp"><h6 class="con">侏儸紀樂園</h6></a></li>
                       <li><a href="eccentric.jsp"><h6 class="con">古怪生物樂園</h6></a></li>
                    </ul><hr>
					<a href="pjurassic.jsp" style="text-decoration: none;"><h3>Pin</h3></a>
					<ul>
                       <li><a href="pjurassic.jsp"><h6 class="con">侏儸紀樂園</h6></a></li>
					</ul><hr>
					<a href="postcard.jsp" style="text-decoration: none;"><h3>Postcard</h3></a>
					<ul>
                       <li><a href="pojurassic.jsp"><h6 class="con">侏儸紀樂園</h6></a></li>
                       <li><a href="sea.jsp"><h6 class="con">海底樂園</h6></a></li>
					</ul>
				</div>

			</aside>
			<!-- /aside -->
			<%
                     sql="use store";
                     con.createStatement().execute(sql);
		   
                     sql = "SELECT * from product where kind='別針'";
                     ResultSet rs=con.createStatement().executeQuery(sql);
                     %>
			<!-- main -->
			<main class="col-md-9">
			    <div class="row">
			    	<%while(rs.next())
			    {
			%>	
							<figure>
								<div class="col-md-12" ><br></div>
								
								<h2>&nbsp;<a href="product.jsp?p=<%=rs.getString(1)%>"><img  src="<%=rs.getString(10)%>/<%=rs.getString(12)%>"  width="180" height="160"></a><h2>
								<a href="product.jsp?p=<%=rs.getString(1)%>" style="text-decoration: none;">
									<h2 class="b"><%=rs.getString("name")%></h2>
									<h2 class="s">售價：$<%=rs.getString("price")%></h2>
								</a>
							</figure></a>&nbsp;&nbsp;&nbsp;&nbsp;
             
			<% } %>	
      <div class="col-md-12"  style="height:100px"></div>
      
        
            <!-- ad -->
          
              <%
           sql="use store";
           ResultSet rs5;
           con.createStatement().execute(sql);
       sql="select*from ad";
       rs5=con.createStatement().executeQuery(sql);
       rs5.last();
       int n=rs5.getRow();
           
           Random ran=new Random();
           // current_adid亂數決定值為1-3,//nextInt(3)產生0到2的亂數
           int current_adid=ran.nextInt(n)+1;
           
           sql="select * from ad where adid= " + current_adid;
           rs5=con.createStatement().executeQuery(sql);
       %>
            <marquee  behavior="alternate"  scrollamount="10" height="100%" >
           <%
           while (rs5.next()) //只有一筆資料
           {
             out.println("<a href='http://"+rs5.getString(4)+"'>");
             out.println("<img src='"+rs5.getString(2)+"/"+rs5.getString(3)+"'"+"width='400' height='250'");
             out.println(" alt='"+rs5.getString(5)+"'></a>");
           }%>
       </marquee>
        
            <!-- /ad -->
          
      
        
          
        </div>
        
			
			</main>
			<!-- /main -->
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



		
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
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