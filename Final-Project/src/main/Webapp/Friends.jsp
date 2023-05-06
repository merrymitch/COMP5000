<!--
*
*
* Members Wyatt LeMaster, Emma Ingram, Derius Knight, Mary Mitchell, Nan Yang
* Hobby Helper semester project
* 5/4/2023
*
-->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.UserModel" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>

    <style>
        th, td {
            padding: 15px;
        }

        tr:nth-child(even) {
            background-color: #D6EEEE;
        }
    </style>
    <%
        boolean isLoggedIn = false;
        UserModel user = null;
        session.setAttribute("file", "Friends.jsp");
        try {
            isLoggedIn = (boolean) session.getAttribute("loggedIn");
        }
        catch(Exception e) {

        }

        String message = "";
        if (isLoggedIn) {


            user = (UserModel) session.getAttribute("user");
            message = user.getUsername();
        }
        else {
            message = "logged out";
        }

        %>

    <link href="<c:url value="css/sign-in.css" />" rel="stylesheet">
    <link href="<c:url value="css/headers.css" />" rel="stylesheet">
    <link href="<c:url value="css/dropdowns.css" />" rel="stylesheet">
    <link href="headers.css" rel="stylesheet">
    <link href="<c:url value="css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="css/Style.css" />" rel="stylesheet">
    <title>Hobby Helper</title>

    <p></p>
</head>
<body>
<main>


    <div class = "fixed-top">
        <div class="container">
            <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
                    <span class="fs-4">Library Reserve</span>
                </a>

                <ul class="nav nav-pills">
                    <li class="nav-item"><a href="findAFriend.jsp" class="nav-link " aria-current="page">Home</a></li>
                    <li class="nav-item"><a href="register.jsp" class="nav-link" aria-current="page">register</a></li>
                    <li class="nav-item"><a href="ReserveNavServlet" action="ReserveNavServlet" method="post" onclick="return validate()" class="nav-link active" aria-current="page">Reservations</a></li>

                </ul>
                <p><h2><%=message%></h2></p>
            </header>
        </div>
    </div>
</main>
<style>

    .dropdown:hover .dropdown-content {display: block;}
</style>




<div class="px-4 pt-5 my-5 text-center border-bottom justify-content-center  flex-fill">
    <h1 class="display-4 fw-bold text-body-emphasis"> Reserve a book</h1>
    <div class="col-lg-6 mx-auto">
        <p class="lead mb-4">Browse library</p>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">


        </div>
    </div>


    <div class="overflow-hidden" style="max-height: 30vh;">
        <div class="container px-5">

            <form action ="FetchReservationsServlet">
            <div class="form-floating">
                <input type="submit" value="Fetch Reservations" />
            </div>
            </form>
        </div>
    </div>


    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
    <div class="overflow-scroll" style="max-height: 30vh;">
        <div class="container px-5">
    <table>
        <tr>
            <th>Book ID </th>
            <th>Book Name </th>
            <th>Author Name </th>
            <th>Book availability </th>

        </tr>
        <c:forEach var="each_book" items="${list_of_Reservations}">
            <tr>
                <td>${each_book.getBook_id()}</td>
                <td>${each_book.getBook_name()}</td>
                <td>${each_book.getAuthor_name()}</td>
                <td>${each_book.getIs_available()}</td>
            </tr>
        </c:forEach>
    </table>

</div>
    </div>
        <p>${error}</p>
    </div>
</div>
</body>

</html>

<!-- Sources:
https://mkyong.com/spring-mvc/spring-mvc-how-to-include-js-or-css-files-in-a-jsp-page/
https://www.w3schools.com/howto/howto_css_dropdown.asp
-->