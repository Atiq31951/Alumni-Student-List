package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.concurrent.ExecutionException;

@WebServlet(name = "edit")
public class edit extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    {
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String company=request.getParameter("company");
        String university=request.getParameter("university");
        String department=request.getParameter("department");
        String batch=request.getParameter("batch");


        String url = "jdbc:mysql://localhost:3306/test";
        String user = "root";
        String pass = "123";
        String qry;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        qry = "update test.students set name = '" + name + "',company = '" + company + "',university = '" + university + "',department = '" + department + "',batch = " + batch + " where id = " + id;

        System.out.println(qry);

        try
        {
            if(id!=null && name!=null && company!=null && university!=null && department!=null && batch!=null) {
                connection = DriverManager.getConnection(url, user, pass);
                statement = connection.createStatement();
                statement.executeUpdate(qry);
                response.sendRedirect("index - Copy.jsp");
            }
            else
                response.sendRedirect("edit.jsp");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
