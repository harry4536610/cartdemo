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
if (admin==null||admin.equals("")) 
{
	out.print("你沒有權限進來這裡！");%><a href="http://140.135.113.175:8080/test/index.jsp">回首頁</a><%
}
else
{%>
<form name="form1" method="post" action="new1.jsp">
您所需要增加的商品名稱：<input type="text" name="name"><br>
種類：<input type="text" name="kind"><br>
價錢：<input type="text" name="price"><br>
庫存：<input type="text" name="num"><br>
介紹：<textarea rows=5 name="content"></textarea><br>
材質：<input type="text" name="texture"><br>
製造方法：<input type="text" name="make"><br>
產地：<input type="text" name="place"><br>
<input type="submit" name="Submit" value="送出">
<input type="Reset" name="Reset" value="重新填寫">
</form><br>

-----------------------------------------------------

<form name="form2" method="post" action="update1.jsp">
您所需要修改的商品名稱：<input type="text" name="name1"><br>
下面為修改資料<br>
種類：<input type="text" name="kind"><br>
名稱：<input type="text" name="name"><br>
價錢：<input type="text" name="price"><br>
庫存：<input type="text" name="num"><br>
介紹：<textarea rows=5 name="content"></textarea><br>
材質：<input type="text" name="texture"><br>
製造方法：<input type="text" name="make"><br>
產地：<input type="text" name="place"><br>
<input type="submit" name="Submit" value="送出">
<input type="Reset" name="Reset" value="重新填寫">
</form><br>

-----------------------------------------------------


<form name="form3" method="post" action="delete1.jsp">

您所需要刪除的商品名稱：<input type="text" name="name"><br>

<input type="submit" name="Submit" value="送出">
<input type="Reset" name="Reset" value="重新填寫">
</form>


-----------------------------------------------------


<form name="form4" method="post" action="backstageorder.jsp">
	<input type="submit" name="submit" value="瀏覽訂單GOGOGO">
</form>
<a href="http://140.135.113.175:8080/test/index.jsp">回首頁</a>
<%}%>


</body>
</html>