<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.UserModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Library User Home</title>
</head>
<body>

<%
    if (request.getSession() != null) {
        if(session.getAttribute("user") != null) {
            UserModel user = (UserModel) session.getAttribute("user");
%>
            <p>Hello, <%= user.getFname() %> <%= user.getLname() %></p>
            <p> <a href="LogoutServlet">Logout</a> </p>

<form method="post" action="catalog.jsp">
    <input type="submit" name="Catalog" value="Go to Catalog"/> <br/> </br>
</form>

<form method="post" action="FetchReservationsServlet">
    <input type="submit" name="Reservations" value="See Reservations" />
</form>

<br/>
<br/>
<br/>
<br/>
<table>
    <tr>
        <th>Book name</th>
        <th>Author name</th>
    </tr>
    <c:forEach var="each_reservation" items="${list_of_reservations}">
        <tr>
            <td>${each_reservation.getBook_name()}</td>
            <td>${each_reservation.getAuthor_name()}</td>
        </tr>
    </c:forEach>
</table>
<br/>
<br/>
<br/>
<br/>

<p>${message}</p>

<%
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
%>

</body>
</html>