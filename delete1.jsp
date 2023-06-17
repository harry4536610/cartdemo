<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>刪除商品</title>
</head>
<body>
<%
try {
 
    Class.forName("com.mysql.jdbc.Driver");
    try {
	
        String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
  
           sql="use store";
           con.createStatement().execute(sql);
           
          
           String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"); 
           
           
		   
           sql="delete from product where name = '"+new_name+"'";
 

           con.createStatement().execute(sql);

           con.close();

           response.sendRedirect("delete2.jsp");
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>
