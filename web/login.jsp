<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: 张翔1
  Date: 2020/11/8
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
%><%
        String name=new String(request.getParameter("id"));
        String pwd=new String(request.getParameter("pwd"));
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bookstore";
            String sql = "select password from users where name='" +name +"'";
            Connection conn = DriverManager.getConnection(url, "root", "123456");
            Statement stat = conn.createStatement();
            ResultSet rs = stat.executeQuery(sql);
            while (rs.next()) {
                String pwds=rs.getString("password");
                if(pwd.equals(pwds)) {
    %>
    <script>
        alert("登陆成功！")
    </script>
    <%
                }else {
    %>
    <script>
        alert("登陆失败！")
    </script>
    <%
                }
            }
            conn.close();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }catch (SQLException e){
            e.printStackTrace();
        }
    %>

</body>
</html>