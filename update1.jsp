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
		   
           String new_name1=new String(request.getParameter("name1").getBytes("ISO-8859-1"),"UTF-8"); 
           String new_kind=new String(request.getParameter("kind").getBytes("ISO-8859-1"),"UTF-8");
           String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"); 
           String new_price=request.getParameter("price");
		   String new_num=request.getParameter("num");
           String new_content=new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
		   String new_texture=new String(request.getParameter("texture").getBytes("ISO-8859-1"),"UTF-8"); 
		   String new_make=new String(request.getParameter("make").getBytes("ISO-8859-1"),"UTF-8"); 
		   String new_place=new String(request.getParameter("place").getBytes("ISO-8859-1"),"UTF-8"); 
           
		   
		   
	
           sql="update product set kind='"+ new_kind+"',"+"name='"+ new_name+"',"+"price='"+ new_price+"',"+"number='"+ new_num+"',"+"introduce='"+ new_content+"',"
		   +"product_texture='"+ new_texture+"',"+"make_method='"+ new_make+"',"+"make_place='"+ new_place+"'"
		   +"where name='"+new_name1+"'";
		   
		
		   
           

           con.createStatement().execute(sql);

           con.close();

           response.sendRedirect("update2.jsp");
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
