<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>隨機廣告板</title>
</head>
<body>
<%
try {

    Class.forName("com.mysql.jdbc.Driver");
    try {

        String url="jdbc:mysql://localhost/";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else
        {
	        
           String sql="use store";
           ResultSet rs;
           con.createStatement().execute(sql);
		   sql="select*from ad";
		   rs=con.createStatement().executeQuery(sql);
		   rs.last();
		   int n=rs.getRow();
           
           Random ran=new Random();
           // current_adid亂數決定值為1-3,//nextInt(3)產生0到2的亂數
           int current_adid=ran.nextInt(n)+1;
           
           sql="select * from ad where adid= " + current_adid;
           rs=con.createStatement().executeQuery(sql);
		   %>
            <marquee direction="up" behavior="scroll"  scrollamount="10" height="100%" width="500" >
           <%
           while (rs.next()) //只有一筆資料
           {
             out.println("<a href='http://"+rs.getString(4)+"'>");
             out.println("<img src='"+rs.getString(2)+"/"+rs.getString(3)+"'"+"width='400' height='250'");
             out.println(" alt='"+rs.getString(5)+"'></a>");
           }%>
		   </marquee>
		   <%
        }

        con.close();
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
