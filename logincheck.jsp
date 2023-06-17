<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <html>
    <head><title>登入</title></head>
    <body>
    	<%
    		String account=request.getParameter("account");
	        String password=request.getParameter("password");	
            String user = (String)session.getAttribute("username");
            String admin = (String)session.getAttribute("admin");
            if(user==null||user.equals(""))
            {
                if(admin==null||admin.equals(""))
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
                
                        sql= "SELECT * FROM member WHERE account='" + 
                         request.getParameter("account") + "'  AND password='" + 
                         request.getParameter("password") + "'"  ; 
                        ResultSet tmp=con.createStatement().executeQuery(sql);
  
       
                        if(tmp.next())
                        {
                        session.setAttribute("username", account);  
                        response.sendRedirect("loginfin.jsp") ;
                        }
                        else if(!tmp.next())
                        {
                            sql="SELECT * FROM administer WHERE account='" +
                            request.getParameter("account")+"' AND password='" +
                            request.getParameter("password")+ "'" ;
                            ResultSet tmp2=con.createStatement().executeQuery(sql);

                            if(tmp2.next())
                            {
                                session.setAttribute("admin", account);
                                response.sendRedirect("admindecision.jsp");
                            }
                            else
                            {
                                out.print("登入失敗！帳號或密碼錯誤");
                                %><br><a href="http://140.135.113.175:8080/test/login.jsp">回登入畫面</a><%
                            }
                        }
                        else
                        {
                            out.print("登入失敗！帳號或密碼錯誤");
                            %><br><a href="http://140.135.113.175:8080/test/login.jsp">回登入畫面</a><%
                        }
                        

                    con.close();//關閉連線
                    }
                }
                catch(SQLException sExec)
                {out.println("SQL錯誤"+sExec.toString());}
        
                }
                catch(ClassNotFoundException err)
                {out.println("class錯誤"+err.toString());}
                }
                else
                {
                    out.print("你已經登入了阿！點");%><a href="http://140.135.113.175:8080/test/index.jsp">這裡</a><%out.print("回首頁");
                }
                
                }
            else
            {
                out.print("你已經登入了阿！點");%><a href="http://140.135.113.175:8080/test/index.jsp">這裡</a><%out.print("回首頁");
            }
				
	    		%>
    </body>
    </html>