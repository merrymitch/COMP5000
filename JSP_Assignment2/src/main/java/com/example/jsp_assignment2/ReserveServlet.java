package com.example.jsp_assignment2;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.CatalogModel;
import models.TopicModel;
import models.UserModel;
import services.MySQLdb;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ReserveServlet", value = "/ReserveServlet")
public class ReserveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int topic_id = 999;
        int book_id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        MySQLdb db = MySQLdb.getInstance();
        if (session != null) {
            if (session.getAttribute("user") != null) {
                try {
                    if (db.isAvailable(book_id)) {
                        UserModel user = (UserModel) session.getAttribute("user");
                        boolean result = db.doReserve(user.getUser_id(), book_id);
                        if(request.getParameter("topic") != null) {
                            topic_id = Integer.parseInt(request.getParameter("topic"));
                        }
                        List<TopicModel> topics = db.getBookTopics();
                        request.setAttribute("list_of_topics", topics);
                        List<CatalogModel> catalogList = db.getCatalog(topic_id);
                        request.setAttribute("list_of_catalog", catalogList);
                        if (result) {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("catalog.jsp");
                            request.setAttribute("message", "Success.!");
                            requestDispatcher.forward(request, response);
                        } else {
                            RequestDispatcher requestDispatcher = request.getRequestDispatcher("catalog.jsp");
                            request.setAttribute("message", "Something went wrong! Server error.!");
                            requestDispatcher.forward(request, response);
                        }
                    } else {
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("catalog.jsp");
                        request.setAttribute("message", "Book is not available.!");
                        requestDispatcher.forward(request, response);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                request.setAttribute("error", "Please login to continue..!!!");
                requestDispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            request.setAttribute("error", "Please login to continue..!!!");
            requestDispatcher.forward(request, response);
        }
    }
}