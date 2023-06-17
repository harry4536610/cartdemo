<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<html>
<head>
<title>新增商品</title>
</head>
<body>
	<%
	String admin = (String)session.getAttribute("admin");
	if(admin==null||admin.equals(""))
	{%>
		<%out.print("你沒有權限進入這裡！");%><br>
		<a href="http://140.135.113.175:8080/test/index.jsp">回首頁</a>
	<%}
	else
	{
		%>
		新增成功！
		<a href="http://140.135.113.175:8080/test/backstage.jsp">回後台</a>
		<%
	}
	%>


</body>
</html>