<%--
  Created by IntelliJ IDEA.
  User: Bolvvv
  Date: 2018/3/26
  Time: 0:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.Date" %>
<html>
<head>
    <title>change_information_ok</title>
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
    //获取前端传来的信息
    String tmp_change_source = request.getParameter("change_source");
    String tmp_change_amount = request.getParameter("change_amount");
    int tmp_change_id = Integer.parseInt(request.getParameter("change_id"));
    //用PreparedStatement语句动态操作SQL语句
    try {
        //建立连接
        conn = DriverManager.getConnection(DB_URL, USER, PASS);
        //设置sql语句
        String sql = "UPDATE travel_order SET source = ? , amount = ? WHERE order_id =  "+tmp_change_id+" ";
        try {
            /* 以下4句为关键 */
            PreparedStatement pstmt = conn.prepareStatement(sql);// 装载SQL语句
            pstmt.setString(1, tmp_change_source); // 给SQL中第一个问号赋变量id的值
            pstmt.setString(2, tmp_change_amount); // 给SQL中第二个问号赋变量name的值
            pstmt.execute(); // 执行SQL语句
        } catch (SQLException e) {
            e.printStackTrace();
        }
        out.print("修改信息成功！");
    } catch (SQLException sqlexception) {
        sqlexception.printStackTrace();
    }
%>
<input type="button" value="返回" onclick="window.location='index.jsp'">
</body>
</html>
