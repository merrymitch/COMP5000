<!--
* JSP - Wyatt LeMaster
*
* Members Wyatt LeMaster, Emma Ingram, Derius Knight, Mary Mitchell, Nan Yang
* Hobby Helper semester project
* 5/4/2023
*
-->

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Hobby Helper</title>
    <link href="<c:url value="css/sign-in.css" />" rel="stylesheet">
    <link href="<c:url value="css/headers.css" />" rel="stylesheet">

    <link href="headers.css" rel="stylesheet">
    <link href="<c:url value="css/bootstrap.min.css" />" rel="stylesheet">

</head>
<body class = "text-center">

<main class ="form-signin w-100 m-auto">


    <div class = "fixed-top">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#!">Hobby Helper</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link " href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="FetchActivitiesServlet" action="FetchActivitiesServlet" method="post" onclick="return validate()">Register </a></li>
                        <li class="nav-item"><a class="nav-link" href="LogoutServlet" action="LogoutServlet" method="post">Logout</a></li>
                    </ul>
                </div>
            </div>

        </nav>
    </div>


<div class ="container-sm"></div>
<form action="registerServlet" method="post" onsubmit="return validate()">
    <h1 class="h3 mb-3 fw-normal">Register</h1>

    <div class="form-floating">
        <input id="username" name="username" type="text" class = "form-control" placeholder="username" required/>
        <label for="username">Username</label>
    </div>

    <div class="form-floating">
        <input id="email" name="email" type="text" class = "form-control" placeholder="email" required/>
        <label for="email">email</label>
    </div>

    <div class="form-floating">

        <input id="password" name="password" type="password" class = "form-control" placeholder="password" required/>
        <label for="password">Password</label>
    </div>

    <div class="form-floating">

        <input id="passwordCON" name="passwordCON" type="password" class = "form-control" placeholder="Password verify" required/>
        <label for="passwordCON">Password verify</label>
    </div>

    <p style="color:red; font-family: Verdana ">${error}</p>


    <div class="form-floating">

        <input id="firstName" name="firstName" type="text" class = "form-control" placeholder="First Name " required/>
        <label for="firstName">First name</label>
    </div>

    <div class="form-floating">

        <input id="lastName" name="lastName" type="text" class = "form-control" placeholder="Last Name" required/>
        <label for="lastName">Last Name</label>
    </div>

    </br>

    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">

        <div class="overflow-scroll" style="max-height: 30vh;">

            <div class="container px-5">
                <h1 class="h3 mb-3 fw-normal">Select all that apply</h1>

                    <table>

                    <tr>
                        <th></th>
                        <th>Activity Name</th>
                    </tr>

                    <c:forEach var="each_activity" items="${list_of_activities}">
                        <tr>
                            <td><input type="checkbox" id="${each_activity.getActivityID()}" name="Checkbox ${each_activity.getActivityID()}" value="${each_activity.getActivityID()}"></td>
                            <td>${each_activity.getName()}</td>

                        </tr>
                    </c:forEach>
                </table>


            </div>


        </div>
        <a  href="FetchActivitiesServlet" action="FetchActivitiesServlet" method="post" onclick="return validate()">

        refresh Activities

        </a>
    </div>
    <input class="w-100 btn btn-lg btn-primary"  type="submit" name="Login" value="Register" /> <br/> </br>
    <span id="error_msg"></span>

</form>





</main>
</body>
</html>