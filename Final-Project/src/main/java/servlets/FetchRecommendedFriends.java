/**
 *
 * java - Wyatt LeMaster
 *
 * Members Wyatt LeMaster, Emma Ingram, Derius Knight, Mary Mitchell, Nan Yang
 * Hobby Helper semester project
 * 5/4/2023
 *
 * Calls the recommend friend method in the database class and returns the recommend friends
 */


package servlets;

import models.UserModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "FetchRecommendedFriends", value = "/FetchRecommendedFriends")
public class FetchRecommendedFriends extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        MySQLdb db = MySQLdb.getInstance();


        if (session != null) {
            if (session.getAttribute("user") != null) {
                UserModel user = (UserModel) session.getAttribute("user");

                if (user != null) {
                    try {
                        List<UserModel> friendList = db.recommendFriend(user);
                        request.setAttribute("list_of_friends", friendList);


                    } catch (SQLException e) {
                        e.printStackTrace();
                    }


                    String file = (String) session.getAttribute("file");

                    RequestDispatcher requestDispatcher = request.getRequestDispatcher(file);
                    requestDispatcher.forward(request, response);


                } else {
                    String file = (String) session.getAttribute("file");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher(file);
                    request.setAttribute("error", "Please login to continue.");
                    requestDispatcher.forward(request, response);

                }
            } else {
                String file = (String) session.getAttribute("file");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher(file);
                request.setAttribute("error", "Please login to continue.");
                requestDispatcher.forward(request, response);


            }


        }
    }
}

