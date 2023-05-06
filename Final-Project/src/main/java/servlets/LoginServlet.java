/**
 *
 *  java - Wyatt LeMaster
 *
 * Members Wyatt LeMaster, Emma Ingram, Derius Knight, Mary Mitchell, Nan Yang
 * Hobby Helper semester project
 * 5/4/2023
 *
 * Login in the user and fills the session attribute with the users' data.
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

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        MySQLdb db = MySQLdb.getInstance();


        UserModel user = null;
        try {
            user = db.doLogin(username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        if (user!=null) {


        HttpSession session = request.getSession();

            session.setAttribute("user", user);
            session.setAttribute("loggedIn", true);

            String file = (String) session.getAttribute("file");

            RequestDispatcher requestDispatcher = request.getRequestDispatcher(file);
            requestDispatcher.forward(request, response);
        }
        else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("Login.jsp");
            request.setAttribute("loginError", "Incorrect Username or password");
            requestDispatcher.forward(request, response);
        }
        }

    }

