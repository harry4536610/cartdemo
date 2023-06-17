<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head><title>瀏覽訂單</title></head>
<body>
	<%
  String admin = (String)session.getAttribute("admin");
  if (admin==null||admin.equals("")) 
  {
    out.print("你沒有權限進來這裡！");%><a href="http://140.135.113.175:8080/test/index.jsp">回首頁</a><%
  }
  else
  {
    try
    {
            Class.forName("com.mysql.jdbc.Driver");
            try 
            {
                String url="jdbc:mysql://localhost/";
                String sql="";
                Connection con=DriverManager.getConnection(url,"root","1234");
                if(con.isClosed())
                  out.println("連線建立失敗");
                else
                {
                  sql="use store";
                  con.createStatement().execute(sql);

                  String account = (String)session.getAttribute("username");

                sql = "SELECT * from dingdang order by memberaccount ";
                ResultSet rs=con.createStatement().executeQuery(sql);

                while(rs.next())
                {
                      String name = rs.getString("productname");
                      String price = rs.getString("price");
                      int priceINT = Integer.parseInt(price);
                      String buynumber = rs.getString("buynumber");
                      int buynumberINT = Integer.parseInt(buynumber);
                      String memberaccount = rs.getString("memberaccount");
                      
                  out.print("商品名稱："+name);%><br><%
                  out.print("價格：$"+price);%><br><%
                  out.print("小額：$"+priceINT*buynumberINT);%><br><%
                  out.print("購買者："+memberaccount);%><br><br><%
                  %><form name="delete" method="post" action="deletedingdang.jsp">
                    <%out.print("<input type='hidden' name='no' value='"+rs.getString(1)+"';>");%>
                    <input type="submit" name="submit" value="刪除訂單">
                  </form><%
                }
                

                  con.close();
                  %>
                  <form name="back" method="post" action="backstage.jsp">
                    <input type="submit" name="submit" value="回後台">
                  </form>
                  
                  <%
              }
            }
        catch(SQLException sExec)
        {out.println("SQL錯誤"+sExec.toString());}      
    }
      catch(ClassNotFoundException err)
      {out.println("class錯誤"+err.toString());}
  }
		
		%>
	</body>
	</html>