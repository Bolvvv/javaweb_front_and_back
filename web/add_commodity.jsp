<%--
  Created by IntelliJ IDEA.
  User: Bolvvv
  Date: 2018/3/25
  Time: 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add_commodity</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <form action="add_commodity_ok.jsp">
        房间名称:<input type="text" name="add_source"><br>
        预定天数:<input type="text" name="add_amount">
        <input type="submit" value="提交">
    </form>
    <input type="button" value="返回" onclick="window.location='index.jsp'">
</body>
</html>
