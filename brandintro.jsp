<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width//螢幕寬度, initial-scale=1//縮放比例, shrink-to-fit=no">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="css/brandintro.css" >
  <link rel="stylesheet" href="css/footer.css" >
  <a href="#">
    <img id="gotop" src="icon/top.png" width="30px" height="30px" >
  </a>
	<title>brandintro</title>
</style>
</head>
<body>
  <% try {
    Class.forName("com.mysql.jdbc.Driver");
    try {
        String url="jdbc:mysql://localhost/";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else
           {
           String sql="use store";
           con.createStatement().execute(sql);
       
           sql = "SELECT * from product";
           ResultSet rs=con.createStatement().executeQuery(sql);
           String user = (String)session.getAttribute("username");
              String admin = (String)session.getAttribute("admin");
              sql ="use demo";
              con.createStatement().execute(sql);
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
            %>
        </div>
        <div class="col-md-1">
              <%
              

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
	<!-- content -->
	      <div class="row">
          
       
        <div class="col-md-6"> <img  src="img/author4.jpg" class="informage"></div>
	      <div class="col-md-6"> <img  src="img/author3.jpg" class="informage"></div>
     </div>
	<content class="row"> 	

            <div class="col-md-1"></div>
            <div class="col-md-1"><h3>老<br>鼠<br>皮<br></h3></div>
	        <div class="col-md-10">
	        	<!-- row -->
				<div class="row">
				    <div class="col-md-12"><br></div>                  
				    <div class="col-md-4" align="right">
				    <img src=img/author2.jpg class="author"><br>
			        <c>--taiwan</c><c>from 2017-04-17--</c>
			        </div>

			        <div class="col-md-8">
				        <div class="row"> 
				            <div class="col-md-12"><br></div>                  
				            <div class="col-md-12"><br></div>                  
                            <div class="col-md-10">
					        <p style="color: #63686e">「<span class="text">當</span>初在創立這個品牌的時候，剛好身邊朋友大多處在負面情緒裡，聽了太多自己也跟著感傷和感到無能為力，唯一能想到安慰的方式，就是畫些圖鼓勵朋友，畫多了才有這個品牌。品牌的商品大多是把自己和身邊朋友的故事，畫成作品，喜歡用夢境的方式呈現，多了幻想和不切實際，因為想帶給大家當下的感受是輕鬆、溫暖的，所以作品題材大多貼近生活。越長越大會發現生活中漸漸缺少快樂，成就感變得很難達成，也忘記當初的理想，所以希望能在這喧囂的城市中，不管當下的情緒是困惑的、憂愁的或失望的，能透過這些商品，找回自己原來的樣子，和當初的赤子之心。」</p>
					        </div>
				            <div class="col-md-2"></div>
				        </div>		
               	    </div>
                </div>
                <!-- row -->
            </div>
        </div>
    </content>
    <!-- content -->
    <!-- aside -->
   
    	<div class="row">	
        <div class="col-md-7">
            <img class="mySlides" src="img/author8.jpg" >
            <img class="mySlides" src="img/author9.jpg">
            <img class="mySlides" src="img/author10.jpg">
            <img class="mySlides" src="img/author5.jpg">
        </div>
        <div class="col-md-5">
         <img class="infor1" src="img/author1.jpg">
        </div>
      </div>
    	
  
    <!-- /aside -->

    <!-- main -->
    <main class="row">
     
     	<div class="col-md-1"></div>
     	<div class="col-md-11">
     	 <div class="row">
    	   <div class="col-md-4"><a href="https://www.facebook.com/profile.php?id=100000203233624"><img src="icon/fb.png" class="infor" ></a></div>
           <div class="col-md-4"><a href="https://www.instagram.com/mouse__p/"><img src="icon/ig.png" class="infor"></a></div>
           <div class="col-md-4"><img src="icon/email.png" class="infor"></div>
    </div>	
					    
	</main>
	<!-- /main -->

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
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
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

var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
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