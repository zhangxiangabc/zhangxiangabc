<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page pageEncoding="GB2312"%>
<%--
  Created by IntelliJ IDEA.
  User: ����1
  Date: 2020/11/5
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <link href="css/bootstrap.min.css"  rel="stylesheet"/>
    <link  href="css/style.css" rel="stylesheet" type="text/css"/>
    <title>�������</title>
  </head>

  <body onload="initAJAX()">
    <script src="js/jquery.min.js" ></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/commons.js"></script>
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="login span4">
                    <h1><a href=""> ��ӭ����<strong>�ҵ�</strong>���</a>
                        <span class="red">.</span></h1>
                </div>
                <div class="links span8">
                    <a class="login" href="login.html" rel="tooltip" data-
                       placement="bottom" data-toggle="modal" data-target="#myModal"></a>
                    <a class="register" href="register.html" rel="tooltip" data_placement="bottom"></a>
                </div>
            </div>
        </div>
    </div> <%--header--%>
    <div class="row" id="warp"> <%--�·�����div����--%>
        <div class="col-md-3"> <%--���˵�div����--%>
            <ul class="nav nav-list">
                <li class="nav-header">�鼮����</li>
        <%
       String url="jdbc:mysql://localhost:3306/bookstore";
       String user="root";
       String pwd="123456";
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection conn=DriverManager.getConnection(url,user,pwd);
       String sql="select* from category";
       PreparedStatement statement=conn.prepareStatement(sql);
       ResultSet rs=statement.executeQuery(sql);
       while(rs.next()){
       %>
                <li style="width: 300px">
                    <a href='javascript:showBook("<%=rs.getString("category_id")%>")'><%=rs.getString("category_name")%></a>
                </li>
                <%
                    }
                    statement.close();
                    conn.close();
                %>
             </ul>
        </div><%--���˵�div����--%>
        <div class="col-md-9" id="book"><%--�鼮���ֿ���--%>
        </div><%--�鼮���ֿ���--%>
    </div><%--�·�����div����--%>

    <script language="JavaScript">
        function showBook(categoryID) {
            xmlHttp.onreadystatechange = function() {
                if (xmlHttp.readyState == 4) {
                    if(xmlHttp.status == 200) {
                        var data = xmlHttp.responseText;
                        document.getElementById("book").innerHTML = data;
                    }
                }
            }
            xmlHttp.open("GET", "getBook.jsp?id="+categoryID, true);
            xmlHttp.send();
        }
    </script>
  </body>
</html>
