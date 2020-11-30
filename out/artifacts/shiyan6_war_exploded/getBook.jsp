<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 张翔1
  Date: 2020/11/6
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/bookstore";
    String sql = "select* from book where book_category_id = ?";
    String categoryID=request.getParameter("id");
    Connection conn= DriverManager.getConnection(url,"root","123456");
    PreparedStatement pstat = conn.prepareStatement(sql);
    pstat.setString(1,categoryID);
    ResultSet rs = pstat.executeQuery();
    %>
    <div id="warp">
    <%while (rs.next()) {%>
        <div class="col-sm-9 col-md-3" style=" border:1px solid #adcd3c;background:#f2fddb">
            <div class="thumbnail" >
                <img src="images/<%=rs.getString("book_page")%>.jpg" width="200" height="300">
                    <div class="caption">
                        <h4><%=rs.getString("book_name")%></h4>
                            <%
                                String description=rs.getString("book_description");
                                if(description.length()>20){
                                    description=description.substring(0,20)+"*****";
                                }
                            %>
                            <p><%=description%></p>
                            <p> <button type="button" >加入购物车</button>
                                <button type="button" >查看详情</button>
                            </p>
                    </div>
            </div>
        </div>
        <%}%>
    </div>
<%

    pstat.close();
    conn.close();
%>
</body>
</html>
