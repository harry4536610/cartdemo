<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>add</title>
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
           
            String deleteno =request.getParameter("deleteno");		   
		   	    String cartaccount =request.getParameter("deleteuser");

           sql="delete from cart where no='"+deleteno+"' and account='"+cartaccount+"'";
                

           con.createStatement().execute(sql);

           con.close();

           response.sendRedirect("cart.jsp");
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
