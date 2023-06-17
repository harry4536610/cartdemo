<!-- Step 0: import library -->
<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html>
<head>
<title>add</title>
</head>
<body>
<%!
String newline(String str)
{
	int index=0;
	while((index=str.indexOf("\n"))!=-1)
	    str=str.substring(0,index)+"<br>"+str.substring(index+1);	
    return(str); 
}
%>
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
          sql="use board";
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
              String new_note=new String(request.getParameter("note").getBytes("ISO-8859-1"),"UTF-8");
              String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
              String new_email=request.getParameter("email");
			  String new_productname=new String(request.getParameter("productname").getBytes("ISO-8859-1"),"UTF-8");
              if(new_name==null||new_name.equals("")||new_note==null||new_note.equals(""))
              {
                response.sendRedirect("allstore.jsp");
              }
              else
              {
                new_note=newline(new_note);
                java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());

                sql="insert guestbook (note,name,email,putdate,productname) ";
                sql+="value ('"+new_note+"', ";  
                sql+="'" + new_name + "', ";  
                sql+="'"+new_email+"', ";
				sql+="'"+new_date+"', ";
                sql+="'"+new_productname+"')";      
                con.createStatement().execute(sql);

                con.close();//關閉連線
                response.sendRedirect("allstore.jsp");
              }
            }
          }
          else
          {
            String new_note=new String(request.getParameter("note").getBytes("ISO-8859-1"),"UTF-8");
            String new_name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
            String new_email=request.getParameter("email");
            String new_productname=new String(request.getParameter("productname").getBytes("ISO-8859-1"),"UTF-8");
            if(new_name==null||new_name.equals("")||new_note==null||new_note.equals(""))
            {
              response.sendRedirect("allstore.jsp");
            }
            else
            {
              new_note=newline(new_note);
              java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());

              sql="insert guestbook (note,name,email,putdate,productname) ";
              sql+="value ('"+new_note+"', ";  
              sql+="'" + new_name + "', ";      
              sql+="'"+new_email+"', ";
              sql+="'"+new_date+"',"; 
              sql+="'"+new_productname+"')";			  
              con.createStatement().execute(sql);

              con.close();//關閉連線
              response.sendRedirect("allstore.jsp");
          
            }
          }		      
       }
    }
    catch (SQLException sExec) {
           response.sendRedirect("allstore.jsp");
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>
