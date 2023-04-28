package com.example.jsp_assignment2;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.UserModel;
import services.MySQLdb;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SignUpServlet", value = "/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        MySQLdb db = MySQLdb.getInstance();
        int numUsers = -1;
        boolean usernameTaken = true;
        boolean successful = false;
        try {
            usernameTaken = db.checkUsername(username);
            if (usernameTaken == false) {
                numUsers = db.generateUserID();
            }
            if (numUsers != -1 && usernameTaken == false) {
                int user_id = numUsers + 1;
                UserModel userModel = new UserModel(user_id, firstname, lastname, username, password);
                successful = db.doSignUp(userModel);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        if (successful == true) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/LoginServlet");
            requestDispatcher.forward(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("signup.jsp");
            request.setAttribute("error", "Username is already taken..!!!");
            requestDispatcher.forward(request, response);
        }
    }
}