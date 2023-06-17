<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<html>
<head></head>
	<body>
		<%
		try 
		{
    		Class.forName("com.mysql.jdbc.Driver");
   			try {
        		String url="jdbc:mysql://localhost/";
				    String sql="";
        		Connection con=DriverManager.getConnection(url,"root","1234");
       			if(con.isClosed())
        			out.println("連線建立失敗");
        		else
        		{
           		sql="use store";
           		con.createStatement().execute(sql);

              String user = (String)session.getAttribute("username");
              String admin = (String)session.getAttribute("admin");
              if(user==null||user.equals(""))
              {
                if(admin==null||admin.equals(""))
                {
                  out.print("你尚未登入，請點擊");%><a href="http://140.135.113.175:8080/test/login.jsp">這裡</a><%out.print("進行登入");
                }
                else
                {
                  out.print("你是管理者！按");%><a href="http://140.135.113.175:8080/test/backstageorder.jsp">這裡</a><%out.print("瀏覽訂單");
                }                 
              }
              else
              { 

           		String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
              String price = request.getParameter("price");
              String file_path = request.getParameter("file_path");
              String product_file = request.getParameter("product_file");
              String link = request.getParameter("link");
              String buynumber = request.getParameter("num");
              String cartaccount = request.getParameter("cartaccount");
              String id = request.getParameter("id");

                  int buynumberINT = Integer.parseInt(buynumber);

                  sql = "select * from product where number";
                  ResultSet rs3=con.createStatement().executeQuery(sql);
                  rs3.next();
                  String num = rs3.getString("number");
                  int numINT = Integer.parseInt(num);

                if(buynumberINT>numINT)
                  {
                  %>
                  <script type="text/javascript" language="javascript">
                  alert("不夠你買");
                  window.document.location.href="allstore.jsp";
                  </script> <%
                  }
                  else if(buynumberINT==0)
                  {
                  %>
                  <script type="text/javascript" language="javascript">
                  alert("不能買0個");
                  window.document.location.href="allstore.jsp";
                  </script> <%
                  }
                  else
                  {
                    sql = "insert cart(name,price,file_path,product_file,link,buynumber,account,id)";
                    sql+="value ('"+name+"', ";  
                    sql+="'" +price+ "', ";
                    sql+="'"+file_path+"', ";
                    sql+="'"+product_file+"', ";       
                    sql+="'"+link+"', ";
                    sql+="'"+buynumber+"',";
                    sql+="'"+cartaccount+"',"; 
                    sql+="'"+id+"')";     
                    con.createStatement().execute(sql);

                    name=""; price=""; file_path=""; product_file=""; link=""; buynumber=""; id="";

                

                  
                

                
                  con.close();//關閉連線
                  response.sendRedirect("cart.jsp");
                  }

                

                
                }
        			
				}
	   		}
	    	catch(SQLException sExec)
	    	{out.println("SQL錯誤"+sExec.toString());}	    
		}
	    catch(ClassNotFoundException err)
	    {out.println("class錯誤"+err.toString());}

		%>
	</body>
</html>
