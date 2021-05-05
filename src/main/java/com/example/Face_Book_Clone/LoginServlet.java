package com.example.Face_Book_Clone;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html><body>");
            out.println("<h1>" + "WELCOME TO FACEBOOK CLONE" + "</h1>");
            out.println("</body></html>");


            HttpSession httpSession = request.getSession();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            System.out.println(email);
            System.out.println(password);

            RegisterDao userData = new RegisterDao(DbConnection.getConnection());
            System.out.println(userData);

            User user = userData.logUser(email, password);
            System.out.println(user);
            if (user != null) {
                httpSession.setAttribute("user", user);
                System.out.println("I entered "+ user.getLastname());
                response.sendRedirect("myDashBoard.jsp");

            }

            else {
                httpSession.setAttribute("regError", "Enter Correct Password or Email");
                response.sendRedirect("index.jsp");
            }
        }

    }
}
