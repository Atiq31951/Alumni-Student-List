<%--
  Created by IntelliJ IDEA.
  User: hackshell
  Date: 5/27/2018
  Time: 5:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.sql.*" %>
<%@ page import="javax.swing.plaf.nimbus.State" %>
<%@ page import="com.sun.corba.se.impl.encoding.CodeSetConversion" %>


<html>
<head>
    <title>Edit</title>
    <style>
        body {
            background-color: rgb(168, 184, 160);
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            font-size: large;
        }

        btn {
            color: rgb(65, 194, 199);
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
            font: icon;
        }
    </style>
</head>

<body>
<h1 style="background-color: blueviolet; text-align: center">Edit Profile</h1>
<section>

    <%
        String id=request.getParameter("id");
        String qry="SELECT * FROM students where id= "+id;
        String url = "jdbc:mysql://localhost:3306/test";
        String user = "root";
        String pass = "123";
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try
        {
            System.out.println("ID got = "+id);

            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection(url,user,pass);
            statement=connection.createStatement();
            resultSet=statement.executeQuery(qry);
            while(resultSet.next())
            {

    %>

                <form action="/edit" method="post" style="text-align: center">
                    <input type="text" name="name" value="<%=resultSet.getString("name")%>"></br>
                    <input type="text" name="company" value="<%= resultSet.getString("company") %>"></br>
                    <input type="text" name="university" value="<%= resultSet.getString("university") %>"></br>
                    <input type="text" name="department" value="<%= resultSet.getString("department") %>"></br>
                    <input type="text" name="batch" value="<%= resultSet.getString("batch") %>"></br>
                    <input type="hidden" name="id" value="<%=id%>">
                    <input type="submit" value="Edit">
                    <a href="index - Copy.jsp" style="background-color: #e21430" aria-live="assertive">Back to List</a>
                </form>
    <%
            }
                connection.close();
            }
            catch (Exception e)
            {
                System.out.println("Sorry");
            }
    %>
</section>



</body>
</html>
