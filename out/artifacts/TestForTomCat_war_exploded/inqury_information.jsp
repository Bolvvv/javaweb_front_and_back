<%--
  Created by IntelliJ IDEA.
  User: Bolvvv
  Date: 2018/3/26
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>inqury_information</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<form action="inqury_information_ok.jsp">
    订单号:<input type="text" name="inqury_order_id"><br>
    房间名称:<input type="text" name="inqury_source"><br>
    预定天数:<input type="text" name="inqury_amount">
    <input type="submit" value="提交">
</form>
<input type="button" value="返回" onclick="window.location='index.jsp'">
</body>
</html>
