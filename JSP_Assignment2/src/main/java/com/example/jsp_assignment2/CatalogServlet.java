package com.example.jsp_assignment2;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.CatalogModel;
import models.TopicModel;
import services.MySQLdb;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CatalogServlet", value = "/CatalogServlet")
public class CatalogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int topic_id = 999;
        MySQLdb db = MySQLdb.getInstance();
        if(request.getParameter("topic") != null) {
            topic_id = Integer.parseInt(request.getParameter("topic"));
        }
        try {
            List<TopicModel> topics = db.getBookTopics();
            request.setAttribute("list_of_topics", topics);
            List<CatalogModel> catalogList = db.getCatalog(topic_id);
            request.setAttribute("list_of_catalog", catalogList);
        } catch(SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("catalog.jsp");
        requestDispatcher.forward(request, response);
    }
}