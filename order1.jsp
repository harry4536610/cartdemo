<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html>
<head>
<title>add</title>
</head>
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

           				String orderaccount = (String)session.getAttribute("username");

           				sql = "SELECT * from cart where account='"+orderaccount+"'";
           				ResultSet rs2=con.createStatement().executeQuery(sql);
                  rs2.next();
                  String buynumber = rs2.getString("buynumber");
                  int buynumberINT = Integer.parseInt(buynumber);

                  sql = "select * from product ";
                  ResultSet rs3=con.createStatement().executeQuery(sql);
                  rs3.next();
                  String num = rs3.getString("number");
                  int numINT = Integer.parseInt(num);

						if(buynumberINT>numINT)
            {
              out.print("不夠你買");
            }
            else if(buynumberINT==0)
            {
              out.print("你確定要買0個嗎");
            }
            else
            {
              sql = "SELECT * from cart where account='"+orderaccount+"'";
              ResultSet rs=con.createStatement().executeQuery(sql);
              while(rs.next())
              {
                    String new_name = rs.getString(3);
                    String new_price = rs.getString(4);                 
                    String new_buynumber = rs.getString(18);
                    String new_account=rs.getString(19);
            
                sql="insert dingdang(productname,price,buynumber,memberaccount)";
                        sql+="values ('" + new_name + "', ";           
                        sql+="'"+new_price+"', ";   
                        sql+="'"+new_buynumber+"', "; 
                        sql+="'"+new_account+"')";  
                      
                con.createStatement().execute(sql);

                sql="insert buyhistory(productname,price,buynumber,memberaccount)";
                        sql+="values ('" + new_name + "', ";           
                        sql+="'"+new_price+"', ";   
                        sql+="'"+new_buynumber+"', "; 
                        sql+="'"+new_account+"')";
                con.createStatement().execute(sql); 

                sql="update product set number=number-'"+buynumberINT+"' where name='"+new_name+"'";
                 con.createStatement().execute(sql); 
              }
            }
						sql="delete from cart";
            con.createStatement().execute(sql); 

						response.sendRedirect("receive.jsp");
						
						con.close();
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
