<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: hackshell
  Date: 5/31/2018
  Time: 8:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String url = "jdbc:mysql://localhost:3306/test";
    String user = "root";
    String pass = "123";
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    String qry="delete from test.students where id ="+request.getParameter("id");

    System.out.println(qry);

    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(url, user, pass);
    statement = connection.createStatement();
    statement.executeUpdate(qry);

    response.sendRedirect("index - Copy.jsp");


%>
