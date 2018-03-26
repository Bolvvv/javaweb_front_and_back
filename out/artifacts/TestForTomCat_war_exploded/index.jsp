<%--
  Created by IntelliJ IDEA.
  User: Bolvvv
  Date: 2018/3/23
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.Date" %>
<html>
  <head>
    <title>$Title$</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
  <p style="font-size: 20px;color: #24a1ff;" align="center">Hello World!</p>
  <table border="1">
    <tr>
      <th>订单号</th>
      <th>房间名称</th>
      <th>预定天数</th>
      <th>订单创建时间</th>
      <th>操作</th>
    </tr>
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
    try{
      //建立连接
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      Statement stmt = conn.createStatement();
      String sql = "select * from travel_order";
      ResultSet rs = stmt.executeQuery(sql);//返回sql语句选中的行
      while(rs.next())
      {
        int show_order_id = rs.getInt("order_id");
        String show_source = rs.getString("source");
        int show_amount = rs.getInt("amount");
        Date show_create_time = rs.getDate("create_time");
        out.print("<tr>");
        out.print("<td>"+show_order_id+"</td>");
        out.print("<td>"+show_source+"</td>");
        out.print("<td>"+show_amount+"</td>");
        out.print("<td>"+show_create_time+"</td>");
        out.print("<td>"+"<input type=\"button\" value=\"修改\" onclick=\"change_information('"+ show_order_id + "')\" />"+"<input type=\"button\" value=\"删除\" onclick=\"delete_information('"+ show_order_id + "')\"/>"+"</td>");
        out.print("</tr>");
      }
      stmt.close();
      conn.close();
    }catch (SQLException e) {
      e.printStackTrace();
    }
  %>
  </table>
  <br>
  <input type="button" value="添加订单" onclick="add()"/>
  <input type="button" value="查询订单" onclick="inqury()"/>
  </body>
</html>
<script>
    function add() {
        window.location="add_commodity.jsp";
    }
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
    function inqury () {
        window.location="inqury_information.jsp"
    }
</script>
