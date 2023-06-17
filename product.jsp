<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width//螢幕寬度, initial-scale=1//縮放比例, shrink-to-fit=no">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="css/product.css" >
	<link rel="stylesheet" href="css/footer.css" >
	<a href="#">
		<img id="gotop" src="icon/top.png" width="30px" height="30px" >
	</a>
	<title>sticker</title>
	
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
           {String user = (String)session.getAttribute("username");
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
	<!-- container -->
	<%
	sql="use store";
	con.createStatement().execute(sql);
	request.setCharacterEncoding("utf-8");
	String p = request.getParameter("p");
	sql="select * from product where no='"+p+"'";
	ResultSet rs=con.createStatement().executeQuery(sql);
	while(rs.next())
	{


	%>

	<div class="col-md-12"><br></div>
	<div class="container">
	    
	    <!-- content -->
	    <content class="row">
	    	<!-- aside -->
	    	<aside class="col-md-7">
	    		<script type="text/javascript"> 
                    function pro_img(a){
	                var id = a;
	                document.getElementById("image").src ='img/sticker'+ id + '.jpg';
                     }
 
                </script>
	    		<img id="image" width=420 height=360  src='<%=rs.getString(10)%>/<%=rs.getString(12)%>' / class="pro"><br><br>
                <img  width=60 height=60  src='<%=rs.getString(10)%>/<%=rs.getString(12)%>' /class="pros">
                <img  width=60 height=60  src='<%=rs.getString(10)%>/<%=rs.getString(13)%>' /class="pros">
		    </aside>
	    	<!-- /aside -->
	    	<!-- main -->
	    	<main class="col-md-5">
	    		<img src="img/pin0.png" class="pin" >
	    		<div class="col-md-12"><br></div>
	    		<div class="col-md-12">
	    			<h2><%=rs.getString(3)%></h2><hr>
	    			<h3> [商品介紹]<br><br><%=rs.getString(6)%></h3><br>
                    <h3> [商品資訊]<br><br>
                          商品材質：<%=rs.getString(7)%><br>
                          製造方式：<%=rs.getString(8)%><br>
                          商品產地：<%=rs.getString(9)%></h3>
	    			<h4>售價：$<%=rs.getString(4)%> <br>庫存：<%=rs.getString(5)%></h4>

	    			
	    		</div>
		        <div class="col-md-12" align="right">
				<form name="sticker1form" method="post" action="carttmp.jsp">
		        	
		        	<%String cartaccount = (String)session.getAttribute("username");%>

	    			<h4>數量：<input type="text" name="num" size="12" value="1" min="1" max="99" placeholder="請輸入數量" required ><br></h4>
	    			<%out.print("<input type='hidden' name='name' value='"+rs.getString(3)+"';>");%>
	    			<%out.print("<input type='hidden' name='price' value='"+rs.getString(4)+"';>");%>
	    			<%out.print("<input type='hidden' name='file_path' value='"+rs.getString(10)+"';>");%>
	    			<%out.print("<input type='hidden' name='product_file' value='"+rs.getString(12)+"';>");%>
	    			<%out.print("<input type='hidden' name='link' value='"+rs.getString(17)+"';>");%>
	    			<%out.print("<input type='hidden' name='cartaccount' value='"+cartaccount+"';>");%>
	    			<%out.print("<input type='hidden' name='id' value='"+rs.getString(19)+"';>");%>
		        	<input type="submit" name="submit" value="加入購物車" class="button"><br>
		        	<h6 class="ph">瀏覽次數：<%

					sql="select * from count where  no='"+p+"'";

		            ResultSet a=con.createStatement().executeQuery(sql);
		            while(a.next())
		           {
			        String i=a.getString(2);
			        int j=Integer.parseInt(i); 
		            if(session.isNew())
                    {
				        j++;
				        out.print(j);
			        }   
			        else
			        {
				        out.print(j); 
			        }
			        sql="update count set number=\'"+j+"\'    where  no='"+p+"'";
					con.createStatement().execute(sql);
					
					sql="update product set count=\'"+j+"\'    where  no='"+p+"'";
					con.createStatement().execute(sql);
		           }
					%></form></h6>
		        </div>	 
		         
	    	</main>
	    	<!-- /main -->
	  	    <div class="col-md-12"></div>
	        <!-- meg -->
	        <meg class="col-md-12">
	        	<hr>
				<form name="form1"  method="post" action="add.jsp" accept-charset="utf-8">
          <%out.print("<input type='hidden' name='p' value='"+p+"'>");%>  
          <opt><textarea name="note" placeholder="leave a message..." required></textarea></opt>
	    	    <div class="row">
	    	    	<div class="col-md-8">
	    	    	    <h2 class="m">Name&nbsp; <opt><input type="text" name="name" size="10" class="text" required></opt></h2><br>
	        	        <h2 class="m">E-Mail&nbsp; <opt><input type="email" name="email" class="text" required></opt></h2>
						<input type='hidden' name='productname' value='<%=rs.getString(1)%>'>
	        	    </div>
	    	    	<div class="col-md-4">	    		    
	        	        <input type="submit" name="submit" value="Send" class="send">
	        	    </div>	    	
	    	    </div> </form>
	    	</meg>
	        <!-- /meg -->
	    	<!-- message -->
	    	<message class="col-md-12">
	    	<hr>
			<font color="#532187">
			<%
           sql="use board";
           con.createStatement().execute(sql);
	
           sql="select * from guestbook where productname='"+p+"'"; //算出共幾筆留言
           ResultSet rs1=con.createStatement().executeQuery(sql);

           
           rs1.last();
           int total_content=rs1.getRow();
           out.println("共"+total_content+"筆留言<p>");
		   
		   
		   
		   
           
           //每頁顯示5筆, 算出共幾頁
          
		   
          
		   
		   //讀取page變數
           String page_string = request.getParameter("page");
           if (page_string == null) 
               page_string = "0";          
           int current_page=Integer.valueOf(page_string);
           if(current_page==0) //若未指定page, 令current_page為1
	          current_page=1;
		   
         
		    
		   %>
		   </p>
		   <%
          
           
		   int start_record=(current_page-1)*5;//遞減排序, 讓最新的資料排在最前面
           
           sql="select * from guestbook where productname='"+p+"'order by no desc limit ";
           sql+=start_record+",5";
           rs1=con.createStatement().executeQuery(sql);
//  逐筆顯示, 直到沒有資料(最多還是5筆)
           while(rs1.next())
                {
				 
                 out.println("訪客姓名:"+rs1.getString(3)+"<br>");
                 out.println("E-mail:"+rs1.getString(4)+"<br>");
                 out.println("留言內容:"+rs1.getString(2)+"<br>");
                 out.println("留言時間:"+rs1.getString(5)+"<br><hr>");
          }
%>




	    	</message>
	        <!-- message -->	    	 	    	   
    	        	      
	       
	    </content>
	    <!-- /content -->
	</div>

	<%}%>
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