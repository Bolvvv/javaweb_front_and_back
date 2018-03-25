<%--
  Created by IntelliJ IDEA.
  User: Bolvvv
  Date: 2018/3/25
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.Date" %>
<html>
<head>
    <title>delete_information</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
    //设置手机热点的URL
    String DB_URL = "jdbc:mysql://172.20.10.5:3306/test";
    //设置URL
    //String DB_URL = "jdbc:mysql://192.168.199.118:3306/test";
    //设置用户名和密码
    String USER = "root";
    String PASS = "qq605725874";
    //创建连接对象
    Connection conn = null;
    //调用Class.forName()方法加载驱动程序
    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException classnotfoundexception) {
        classnotfoundexception.printStackTrace();
    }
    //获取前端需要修改信息的order_id
    int tmp_order_id = Integer.parseInt(request.getParameter("id"));
    out.print("<form action=\"change_information_ok.jsp\">");
    out.print("房间名称:<input type=\"text\" name=\"change_source\"><br>");
    out.print("预定天数:<input type=\"text\" name=\"change_amount\">");
    out.print("<input type=\"hidden\" name=\"change_id\" value=\""+tmp_order_id+"\">");
    out.print("<input type=\"submit\" value=\"提交\" >");
    out.print("</form>");
%>
<input type="button" value="返回" onclick="window.location='index.jsp'">
</body>
</html>
