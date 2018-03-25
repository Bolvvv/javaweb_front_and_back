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
    String tmp_source = request.getParameter("add_source");
    String tmp_amount = request.getParameter("add_amount");
    String DB_URL = "jdbc:mysql://192.168.199.118:3306/test";
    String USER = "root";
    String PASS = "qq605725874";
    Connection conn = null;
    Statement stmt = null;

    //调用Class.forName()方法加载驱动程序
    Class.forName("com.mysql.jdbc.Driver");
    out.println("成功加载MySQL驱动！");
    conn = DriverManager.getConnection(DB_URL, USER, PASS);
    stmt = conn.createStatement(); //创建Statement对象
    out.println("成功连接到数据库！");

    String sql = "insert into travel_order (source,amount) values ('" + tmp_source + "','" + tmp_amount +"')";
    int n = stmt.executeUpdate(sql);
    out.print(n);
    stmt.close();
    conn.close();
%>
<%-- <% try {
//调用Class.forName()方法加载驱动程序
    Class.forName("com.mysql.jdbc.Driver");
    out.println("成功加载MySQL驱动！");

    String url = "jdbc:mysql://192.168.199.118:3306/test";    //JDBC的URL
    Connection conn;

    conn = DriverManager.getConnection(url, "root", "qq605725874");
    Statement stmt = conn.createStatement(); //创建Statement对象
    System.out.println("成功连接到数据库！");

//查询数据的代码
    String sql = "select * from travel_order";    //要执行的SQL
    ResultSet rs = stmt.executeQuery(sql);//创建数据对象
    while (rs.next()) {
        out.print(rs.getInt(1) + "\t");
        out.print(rs.getString(2) + "\t");
        out.print(rs.getInt(3) + "\t");
        out.println();
    }

//修改数据的代码
    String sql2 = "UPDATE travel_order SET name=? WHERE number=?";
    PreparedStatement pst = conn.prepareStatement(sql2);
    pst.setString(1, "8888");
    pst.setInt(2, 198);
    pst.executeUpdate();

//删除数据的代码
    String sql3 = "DELETE FROM stu WHERE number=?";
    pst = conn.prepareStatement(sql3);
    pst.setInt(1, 701);
    pst.executeUpdate();

    ResultSet rs2 = stmt.executeQuery(sql);//创建数据对象
    System.out.println("编号" + "\t" + "姓名" + "\t" + "年龄");
    while (rs.next()) {
        System.out.print(rs2.getInt(1) + "\t");
        System.out.print(rs2.getString(2) + "\t");
        System.out.print(rs2.getInt(3) + "\t");
        System.out.println();
    }

    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>--%>
</body>
</html>
