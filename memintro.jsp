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
	<link rel="stylesheet" href="css/memintro.css" >
	<link rel="stylesheet" href="css/footer.css" >

	<title>memintro</title>
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
       <li><a href="leader.jsp" class="dropbtn">Leader Board</a></li>
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
		<div class="col-md-12"><br></div>
		<h2>Member Introduction</h2>
		<hr>
		<!-- content -->
		<content class="row">	
		<div class="col-md-12">
			<div class="row people">
				<div class="col-md-4">
			        <a href="https://www.facebook.com/profile.php?id=100000445410466">
				       <img style=" border:5px solid #ffb677" src="pic/yunru.jpg" class='circle'/ >
			        </a>
			    </div>
			    <div class="col-md-8">
			    	<br><br>
			    	<h4 class="yunru" style="display: inline-block;">陳韻如
			    		<h3 class="yunru"  style="display: inline-block;" >1999/08/30</h3>
			    	</h4>
			    	<br><br>
			    	<h3 class="yunru">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;這次的期末專案購物網站，我覺得我學到了很多東西，平常就很常逛購物網站，所以想法很多，原本以為做起來會很簡單，但後來發現要想的東西很多，最難的就是流暢度，要以消費者的角度去思考就有點困難，要做的互動也很多，這次多媒體學到的不僅僅是程式上的能力，還有配色、排版、組織、和組員溝通的能力，我很感謝的是能遇到很有默契的組員，在溝通上，不管是前端還是後端，都可以很簡單的說明就聽得懂了，這是我覺得我們比別人更優勢的地方，而且可以加速專案的進行更順暢。這次覺得要改進的地方，如果有下次的話，就要一開始先把整個組織和架構都先想的完整一點，不然到最後要東加西加就很麻煩。</h3></div>
		    </div></div>
		    		<div class="col-md-12"><br></div>
		    		<div class="col-md-12"><hr></div>
		
		<div class="col-md-12"  >
			<div class="row people">
				<div class="col-md-8">
					<br>
			    	<h4 class="siyu" style="display: inline-block;">林思妤
			    		<h3 class="siyu"  style="display: inline-block;" >1998/12/16</h3>
			    	</h4>
			    	<br><br>
			    	<h3 class="siyu">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一學期很快就過了，從一開始的個人網站到現在要組織一個團隊架設出一個購物網站，這當中學習到很多，也發現其實很多東西都是從網路上就能找到相關語法，我覺得這次團體作業讓我學習到最多的是如何溝通，前端和後段必須相互依賴，並不是前端做前端後端做後端就能成功架設出一個網站，前端的組員間也必須要有一定的默契共識，分工合作，才能增加網站架設的速度與效率，幸運的是我遇到了正剛好都是這樣的組員，經過這學期一系列的的多媒體教學，我學到了很多基本的多媒體語法，也在一次又一次的作業中看見自己在排版這方面的不足，往後如果還有機會，我會繼續加強這方面的技能，也許是從網路上找不錯的網站先做模仿，並不是整個模仿，而是參考他好的地方作為學習目標，也許是參考更多書籍，希望有一天我也能架設出一個排版很美介面很符合消費者的網站。</h3>

				</div>
			    <div class="col-md-4">
				    <a href="https://www.facebook.com/lin.erica.1">
				        <img style=" border:5px solid #cce490" src="pic/siyu.jpg" class='circle'/ >
			        </a>
			    </div>
			</div>
		</div>
		<div class="col-md-12"><br></div>
		    		<div class="col-md-12"><hr></div>
		<div class="col-md-12">
			<div class="row people">
				<div class="col-md-4">
			        <a href="https://www.facebook.com/tian.cai.3154">
				       <img style=" border:5px solid #c2fcf6" src="pic/fatfat.jpg" class='circle'/ >
			        </a>
			    </div>
			    <div class="col-md-8">
			    	<br><br>
			    	<h4 class="fatfat" style="display: inline-block;">曾宇辰
			    		<h3 class="yuci"  style="display: inline-block;" >1999/05/26</h3>
			    	</h4>
			    	<br><br>
			    	<h3 class="yuci">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在大一上期末的時候，在學長姐的社群網站動態看到學長姐都不知道在熬夜做什麼東西，只覺得他們一直在燃燒生命在寫程式好可怕，不想面對，但一年後還是輪到我燃燒生命了。一開始看著老師給的word檔裡的配分比重等等，完全不知道該從何處下手，還好上課的時候的作業都還留著，終於有了個方向。而且在大家都開始寫程式時，我卻還在為系學會和社團的事情奔波、焦頭爛額，在初期都沒有貢獻到，真的很對不起自己的組員。在電腦桌前面不眠不休度過的數個夜晚讓我的程式邏輯進步了不少，在溝通的方面因為跟隔壁班的組員滿合得來的所以也不知道我有沒有問題，反正我覺得我可以度過這個難關，讚。</h3></div>
		    </div>
		</div>
		<div class="col-md-12"><br></div>
		    		<div class="col-md-12"><hr></div>
		<div class="col-md-12">
			<div class="row people">
				<div class="col-md-8">
					<br><br>
			    	<h4 class="siyu" style="display: inline-block;">張有淇
			    		<h3 class="siyu"  style="display: inline-block;" >1999/08/29</h3>
			    	</h4>
			    	<br><br>
			    	<h3 class="siyu">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在剛開始知道要做購物網站的時候，就覺得很難，想說自己一定做不出來，而且很怕做不完，然後都在想要怎麼做，整天腦袋都是程式碼，做夢都會夢到，而且睡覺的時間也變得很少，還有其他的科目有很多的作業，也沒有什麼多餘的時間可以出去放鬆，但是當程式碼跑出來的那刻，可以成功執行得出來的時候，就覺得非常的開心，也非常的感動，就覺得自己努力熬夜辛苦寫的程式沒有白費了，而且也謝謝我有那麼棒的組員，不然也不會有今天的我們。</h3>

				</div>
			    <div class="col-md-4">
				    <a href="https://www.facebook.com/profile.php?id=100002970368977">
				        <img style=" border:5px solid #cacaca" src="pic/havechi.jpg" class='circle'/ >
			        </a>
			    </div>
			</div>
		</div>
		<div class="col-md-12"><br></div>
        <div class="col-md-12"><br></div>
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
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
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