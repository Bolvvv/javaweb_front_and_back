<%--
  Created by IntelliJ IDEA.
  User: Bolvvv
  Date: 2018/3/25
  Time: 22:39
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
    //获取前端删除信息的order_id
    int tmp_order_id = Integer.parseInt(request.getParameter("id"));
try {
        //建立连接
        conn = DriverManager.getConnection(DB_URL, USER, PASS);
        //设置sql语句
        String sql = "DELETE FROM travel_order WHERE order_id=?";
        try {
            /* 最好使用PrepareStatement而不适用Statement */
            PreparedStatement pstmt = conn.prepareStatement(sql);// 装载SQL语句
            pstmt.setInt(1, tmp_order_id); // 给SQL中第一个问号赋变量id的值
            pstmt.execute(); // 执行SQL语句
        } catch (SQLException e) {
            e.printStackTrace();
        }
        out.print("删除成功");
    } catch (SQLException sqlexception) {
        sqlexception.printStackTrace();
    }
%>
<input type="button" value="返回" onclick="window.location='index.jsp'">
</body>
</html>
