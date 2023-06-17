<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    <html>
    <head><title>登出</title></head>
    <body>
    	<%
    	String user = (String)session.getAttribute("username");
    	String admin = (String)session.getAttribute("admin");
    	if(user==null||user.equals(""))
    	{
            if(admin==null||admin.equals(""))
            {
                out.println("你沒有登入就不用登出了啦！");
                %>
                <a href="http://140.135.113.175:8080/test/index.jsp">回首頁</a>
                <%
            }
            else
            {
            session.invalidate();
            response.sendRedirect("index.jsp"); 
            
            }
    	}
    	else
    	{
            session.invalidate();
            response.sendRedirect("index.jsp");
            
        }
        %>
    </body>
</html>