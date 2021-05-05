package com.example.Face_Book_Clone;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");

            String first_name = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String birthday_day = request.getParameter("birthday_day");
            String birthday_month = request.getParameter("birthday_month");
            String birthday_year = request.getParameter("birthday_year");
            String dob = birthday_day + "/" + birthday_month + "/" + birthday_year;
            String gender = request.getParameter("gender");
            User userDetails = new User(first_name, lastname, email, password, dob, gender);
            RegisterDao rDao = new RegisterDao(DbConnection.getConnection());
            System.out.println("All user info "+ userDetails);
            if (rDao.insert(userDetails)) {
                response.sendRedirect("index.jsp");
            }

        }
    }
}
