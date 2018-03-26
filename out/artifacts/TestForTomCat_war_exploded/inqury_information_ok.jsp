<%--
  Created by IntelliJ IDEA.
  User: Bolvvv
  Date: 2018/3/26
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.Date" %>
<html>
<head>
    <title>inqury_information_ok</title>
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
    String tmp_inqury_order_id = request.getParameter("inqury_order_id");
    String tmp_inqury_source = request.getParameter("inqury_source");
    String tmp_inqury_amount = request.getParameter("inqury_amount");
    out.print(tmp_inqury_order_id);
    out.print(tmp_inqury_source);
    out.print(tmp_inqury_amount);
    int tmp_id = Integer.parseInt(tmp_inqury_order_id);
    try {
        //建立连接
        conn = DriverManager.getConnection(DB_URL, USER, PASS);
        //设置sql语句
        String sql = "SELECT * FROM travel_order WHERE order_id=? OR source=? OR amount=?";
        try {
            /* 最好使用PrepareStatement而不适用Statement */
            PreparedStatement pstmt = conn.prepareStatement(sql);// 装载SQL语句
            pstmt.setInt(1, tmp_id);
            pstmt.setString(2, tmp_inqury_source);
            pstmt.setString(3, tmp_inqury_amount);
            ResultSet resultSets = pstmt.executeQuery(); // 执行SQL语句,并将返回的值传给rs
            out.print("<table border=\"1\">");
            out.print("<tr>");
            out.print("<th>订单号</th>");
            out.print("<th>房间名称</th>");
            out.print("<th>预定天数</th>");
            out.print("<th>操作</th>");
            out.print("</tr>");
            while (resultSets.next())
            {
                out.print("<tr>");
                out.print("<td>"+resultSets.getInt("order_id")+"</td>");
                out.print("<td>"+resultSets.getString("source")+"</td>");
                out.print("<td>"+resultSets.getString("amount")+"</td>");
                out.print("<td>"+"<input type=\"button\" value=\"修改\" onclick=\"change_information('"+ tmp_inqury_order_id + "')\" />"+"<input type=\"button\" value=\"删除\" onclick=\"delete_information('"+ tmp_inqury_order_id + "')\"/>"+"</td>");
                out.print("</tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    } catch (SQLException sqlexception) {
        sqlexception.printStackTrace();
    }
%>
<input type="button" value="返回" onclick="window.location='index.jsp'">
</body>
</html>
<script>
    function change_information(i) {
        window.location="change_information.jsp?id="+i+"";
    }
    function delete_information(i) {
        var c = confirm("确认要删除吗？");
        if(c == true)
        {
            window.location="delete_information.jsp?id="+i+"";
        }
    }
</script>