<!DOCTYPE html>
<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html lang="en">
<head><title>更改會員資料</title></head>
<body>
	<%
			String user = (String)session.getAttribute("username");
			String name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
   			String gender=new String(request.getParameter("gender").getBytes("ISO-8859-1"),"UTF-8");
			String password=request.getParameter("password");
			String passwordagain=request.getParameter("password2");
			String birthday=request.getParameter("birth");
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
			String address2=new String(request.getParameter("address2").getBytes("ISO-8859-1"),"UTF-8");

            if(password.equals(passwordagain))
						{
							try
							{
								Class.forName("com.mysql.jdbc.Driver");
								try
								{
									String url="jdbc:mysql://localhost";
									String sql="";
									Connection con=DriverManager.getConnection(url,"root","1234");
									if(con.isClosed())
									{
										out.println("連線建立失敗");
									}
									else
									{
										sql="USE demo";//選擇資料庫
										con.createStatement().execute(sql);
				
										sql="update member set name='"+name+"',gender='"+gender+"' ,password='"+password+"', birthday='"+birthday+"', phone='"+phone+"', email='"+email+"', address='"+address+address2+"' where account='"+user+"'";
										con.createStatement().execute(sql);
				
			    
										con.close();//關閉連線
										out.print("更改成功！按");%><a href="http://140.135.113.175:8080/test/member.jsp">這裡</a><%out.print("回到會員中心");
		    						}
	    						}
	    						catch(SQLException sExec)
	    						{out.println("SQL錯誤"+sExec.toString());}
	    
	    					}catch(ClassNotFoundException err)
	    					{out.println("class錯誤"+err.toString());}
						}
						else
						{
						out.println("password跟password again要一樣");%><br><a href="http://140.135.113.175:8080/test/modify.jsp">回上頁</a><%;
						}
            
            %>
</body>
</html>