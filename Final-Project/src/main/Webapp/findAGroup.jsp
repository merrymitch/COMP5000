<!--
* JSP - Emma Ingram, Wyatt LeMaster
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
    <link href="<c:url value="css/sign-in.css" />" rel="stylesheet">
    <link href="<c:url value="css/headers.css" />" rel="stylesheet">
    <link href="<c:url value="css/dropdowns.css" />" rel="stylesheet">

    <link href="headers.css" rel="stylesheet">
    <link href="<c:url value="css/bootstrap.min.css" />" rel="stylesheet">

    <link href="<c:url value="css/Style.css" />" rel="stylesheet">
    <title>Hobby Helper</title>


</head>
<body>

<main>

    <style>
      th, td {
        padding: 15px;
      }

      tr:nth-child(even) {
        background-color: #D6EEEE;
      }

      .dropdown:hover .dropdown-content {display: block;}
    </style>

    <%
        boolean isLoggedIn = false;
        UserModel user = null;

        try {
            isLoggedIn = (boolean) session.getAttribute("loggedIn");
            session.setAttribute("file", "findAGroup.jsp");

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


    <div class = "fixed-top">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">Hobby Helper</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link " href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="FetchActivitiesServlet" action="FetchActivitiesServlet" method="post" onclick="return validate()">Register </a></li>
                        <li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>
                    </ul>


                </div>
            </div>
            <p ><h2 style="color:White; font-family: Verdana "><%=message%></h2></p>

        </nav>
    </div>
</main>

<div class="px-4 pt-5 my-5 text-center border-bottom justify-content-center  flex-fill">
    <h1 class="display-4 fw-bold text-body-emphasis">Find Your recommended Group</h1>
    <div class="col-lg-6 mx-auto">
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
        </div>
    </div>

    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
        <div class="container px-5">
            <form action ="FetchRecommendedGroups" method="post">
                <div class="form-floating">
                    <input class="btn btn-primary  btn-lg btn-block" type="submit" value="Find" />
                    <p ><h2 style="color:red">${login}</h2></p>
                </div>
            </form>
        </div>
    </div>
    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">

        <div class="overflow-scroll" style="max-height: 30vh;">

            <div class="container px-5">
                <table>
                    <tr>
                        <th>Group Name</th>

                    </tr>
                    <c:forEach var="each_group" items="${list_of_groups}">
                        <tr>

                            <td>
                                <form method ="post" action="CreateGroupPageServlet">
                                    <button type="submit "class="btn btn-primary" id="${each_group.getGroup_id()}" name="buttonAction" value="${each_group.getGroup_id()}"> Visit </button>
                                </form>
                            </td>
                            <td>${each_group.getName()}</td>

                        </tr>
                    </c:forEach>
                </table>

            </div>
        </div>
    </div>
</div>




<p>${error}</p>

</body>

</html>

<!-- Sources:
https://mkyong.com/spring-mvc/spring-mvc-how-to-include-js-or-css-files-in-a-jsp-page/
https://www.w3schools.com/howto/howto_css_dropdown.asp
-->
