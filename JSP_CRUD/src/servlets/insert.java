package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.nimbus.State;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "insert")
public class insert extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String company=request.getParameter("company");
        String university=request.getParameter("university");
        String department=request.getParameter("department");
        String batch=request.getParameter("batch");
        String pass1=request.getParameter("password");
        String pass2=request.getParameter("password1");

        if(pass1.equals(pass2))
        {
            if(pass1.length()==0 || pass2.length()==0)
                response.sendRedirect("addnew.jsp");
        }
        else
        {
            response.sendRedirect("addnew.jsp");
        }


        //System.out.println(name+" "+email+" "+company+" "+university+" "+department+" "+batch);

        try
        {
            String host="com.mysql.jdbc.Driver";
            String url="jdbc:mysql://localhost:3306/test";
            String user="root";
            String pass="123";
            String qry1,qry2;
            Connection connection=null;
            Statement statement=null;
            ResultSet resultSet=null;

            qry1="SELECT * FROM test.students where email=' " + email+" ' ";
            qry2="insert into test.students (name,email,company,university,department,batch,pass) values('"+name+"' , '"+email+"' ,'"+company+"' ,'"+university+"','"+department+"','"+batch+"','"+pass1+"')";

            System.out.println(qry2);

            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection(url,user,pass);
            statement=connection.createStatement();
            resultSet=statement.executeQuery(qry1);
            int cnt=0;

            while(resultSet.next())
                cnt++;

            if(cnt>0)
                response.sendRedirect("addnew.jsp");
            else
            {
                System.out.println(qry2);
                statement.executeUpdate(qry2);
                response.sendRedirect("index - Copy.jsp");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            System.out.println("Sorry");
        }
    }
}
