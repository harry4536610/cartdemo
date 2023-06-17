<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <html>
    <head><title>加入會員</title></head>
    <body>
    <%
    			String user = (String)session.getAttribute("username");
    			String admin = (String)session.getAttribute("admin");
    			if(user==null||user.equals(""))
                {
                	if(admin==null||admin.equals(""))
                	{
                		String name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
   						String gender=new String(request.getParameter("gender").getBytes("ISO-8859-1"),"UTF-8");
   						String account=request.getParameter("username");
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
				
										sql="INSERT member(name, gender, account, password, birthday, phone, email, address)"+"VALUES ('"+name+"','"+gender+"','"+account+"','"+password+"','"+birthday+"','"+phone+"','"+email+"','"+address+address2+"')";
										con.createStatement().execute(sql);
				
			    
										con.close();//關閉連線
										out.print("註冊成功！按");%><a href="http://140.135.113.175:8080/test/login.jsp">這裡</a><%out.print("回到登入");
		    						}
	    						}
	    						catch(SQLException sExec)
	    						{out.println("此帳號已被註冊！");}
	    
	    					}catch(ClassNotFoundException err)
	    					{out.println("class錯誤"+err.toString());}
						}
						else
						{
						out.println("password跟password again要一樣");
						}
                	}
                	else
                	{
                		out.print("你是管理者為什麼還要按註冊？");%><a href="http://140.135.113.175:8080/test/login.jsp">回登入</a><%
                	}
                	
                }
                else
                {
                	out.print("你已經登入了阿！點");%><a href="http://140.135.113.175:8080/test/index.jsp">這裡</a><%out.print("回首頁");
                }
    
	%>
</body>
</html>