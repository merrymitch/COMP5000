/**
 * java - Wyatt LeMaster
 *
 * Members Wyatt LeMaster, Emma Ingram, Derius Knight, Mary Mitchell, Nan Yang
 * Hobby Helper semester project
 * 5/4/2023
 *
 *
 * gets the correct group ID from button and sends that data to GroupTemplate.jsp to make a custom page for each group
 *
 */
package servlets;

import models.ActivityModel;
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
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "CreateGroupPageServlet", value = "/CreateGroupPageServlet")
public class CreateGroupPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        MySQLdb db = MySQLdb.getInstance();
        List<ActivityModel> ActivityModelList = null;
        String temp = "";
        String check = "";
        List<String> Group = new ArrayList<String>();
        try {
            ActivityModelList = db.fetchActivities(999);
            // request.setAttribute("list_of_activities", ActivityModel);


            //List<TopicModel> TopicModelList = db.fetchTopic(999);
            // request.setAttribute("list_of_Topics", TopicModelList);

        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }


            check = "buttonAction";
            temp = request.getParameter(check);
            if (temp != null) {
                request.setAttribute("group", temp);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("GroupPageTemplate.jsp");
                requestDispatcher.forward(request, response);
        }




else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request, response);


            }
    }
}

