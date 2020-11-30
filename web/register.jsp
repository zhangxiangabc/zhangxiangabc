<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: 张翔1
  Date: 2020/11/8
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String name=new String(request.getParameter("id"));
        String pwd=new String(request.getParameter("pwd"));
        System.out.println(name);
        System.out.println(pwd);
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/bookstore";
            String sql = "insert into users(name,password) values ('"+name+"','"+pwd+"')";
            Connection conn= DriverManager.getConnection(url,"root","123456");
            Statement stat = conn.createStatement();
            stat.executeUpdate(sql);
            conn.close();
            %>
    <script>
        alert("注册成功！")
    </script>
    <%
        } catch (ClassNotFoundException e) {
    %>
    <script>
        alert("注册失败!!")
    </script>
    <%
        }
        catch (SQLException e) {
    %>
    <script>
        alert("注册失败!!!")
    </script>
    <%
        }
    %>


</body>
</html>
