<!--
*
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
    <link href="<c:url value="css/sign-in.css" />" rel="stylesheet">
    <link href="<c:url value="css/headers.css" />" rel="stylesheet">

    <link href="headers.css" rel="stylesheet">
    <link href="<c:url value="css/bootstrap.min.css" />" rel="stylesheet">

    <title>Hobby Helper</title>



</head>



<body class = "text-center">




<main class ="form-signin w-100 m-auto">


    <!-- Don't mess with this. it works not sure why -->
<div class = "fixed-top navbar navbar-expand-lg navbar-dark bg-dark flex-fill" >
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark flex-fill">

                <a class="navbar-brand" href="index.jsp">Hobby Helper</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link " href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="Login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>
                    </ul>
                </div>

        </nav>
    </div>
</div>


<form action="LoginServlet" method="post" onsubmit="return validate()">
    <h1 class="h3 mb-3 fw-normal">Sign-In</h1>

    <div class="form-floating">
    <input id="username" name="username" type="text" class = "form-control" placeholder="username"/>
        <label for="username">Username</label>
    </div>

    <div class="form-floating">

    <input id="password" name="password" type="password" class = "form-control" placeholder="password"/>
    <label for="password">Password</label>
    </div>

    <input class="w-100 btn btn-lg btn-primary"  type="submit" name="Login" value="Login" /> <br/> </br>
    Or Create a new account
    <a href = register.jsp>
    <input class="w-100 btn btn-lg btn-primary"  type="button" name="redirect" value="Register" /> <br/> </br>
    </a>
    <span id="error_msg"></span>
</form>

    </br>
    <p>${loginError}</p>




</main>

</body>

</html>