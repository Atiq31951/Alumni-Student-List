<%--
  Created by IntelliJ IDEA.
  User: hackshell
  Date: 5/27/2018
  Time: 5:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.sql.*" %>


<html>
        <head>
            <title>Add New Person</title>
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
            <h1 style="background-color: blueviolet; text-align: center">Add New Person</h1>
            <section>
            <form action="/insert" method="post" style="text-align: center">
                <input type="text" name="name" placeholder="Name"></br>
                <input type="text" name="email" placeholder="Email can never changed once registered"></br>
                <input type="text" name="company" placeholder="Compnay"></br>
                <input type="text" name="university" placeholder="University"></br>
                <input type="text" name="department" placeholder="Department"></br>
                <input type="text" name="batch" placeholder="Batch"></br>
                <input type="password" name="password" placeholder="Please Type Seriously"></br>
                <input type="password" name="password1" placeholder="Retype"></br>
                <input type="submit" value="Register">
                <a href="index - Copy.jsp" style="background-color: #e21430" aria-live="assertive">Back to List</a>
            </form>
            </section>
        </body>
</html>