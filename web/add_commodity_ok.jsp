<%--
  Created by IntelliJ IDEA.
  User: Bolvvv
  Date: 2018/3/25
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
<head>
    <title>add_commodity_ok</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
    //设置URL
    String DB_URL = "jdbc:mysql://192.168.199.118:3306/test";
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
    out.println("成功加载MySQL驱动！");

    //获取前端传来的信息
    String tmp_source = request.getParameter("add_source");
    String tmp_amount = request.getParameter("add_amount");
    //用PreparedStatement语句动态操作SQL语句
    try {
        //建立连接
        conn = DriverManager.getConnection(DB_URL, USER, PASS);
        //设置sql语句
        String sql = "INSERT INTO travel_order (source,amount) VALUES (?,?)";
        try {
            /* 以下4句为关键 */
            PreparedStatement pstmt = conn.prepareStatement(sql);// 装载SQL语句
            pstmt.setString(1, tmp_source); // 给SQL中第一个问号赋变量id的值
            pstmt.setString(2, tmp_amount); // 给SQL中第二个问号赋变量name的值
            pstmt.execute(); // 执行SQL语句
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } catch (SQLException sqlexception) {
        sqlexception.printStackTrace();
    }
%>
</body>
</html>
