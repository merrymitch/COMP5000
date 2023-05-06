<!--
* JSP - Wyatt LeMaster
* XML - Mary Mitchell
*
* Members Wyatt LeMaster, Emma Ingram, Derius Knight, Mary Mitchell, Nan Yang
* Hobby Helper semester project
* 5/4/2023
*
-->

<%@ page import="models.UserModel" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="java.io.File" %>
<%@ page import="javax.xml.parsers.ParserConfigurationException" %>
<%@ page import="org.xml.sax.SAXException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    boolean isLoggedIn = false;
    UserModel user = null;
    session.setAttribute("file", "index.jsp");
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

<!--Merry added this -->
<%
    // Get the XML file and its contents
    File xmlFile = new File("C:\\Users\\wyatt\\Box\\Spring 2023\\Web app\\FinalProject\\ProjectFiles\\HobbyHelper1\\src\\main\\Webapp\\xml\\group.xml"); // **** MIGHT HAVE TO CHANGE PATH ****
    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
    DocumentBuilder db = null;
    try {
        db = dbf.newDocumentBuilder();
    } catch (ParserConfigurationException e) {
        throw new RuntimeException(e);
    }
    Document d = null;
    try {
        d = db.parse(xmlFile);
    } catch (SAXException e) {
        throw new RuntimeException(e);
    }
    d.getDocumentElement().normalize();
    NodeList groupsNL = d.getElementsByTagName("Group");
%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HobbyHelper</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#!">Hobby Helper</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="FetchActivitiesServlet" action="FetchActivitiesServlet" method="post" onclick="return validate()">Register </a></li>
                        <li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a></li>
                    </ul>
                </div>
                <p ><h2 style="color:White; font-family: Verdana "><%=message%></h2></p>

            </div>

        </nav>
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">Welcome to Hobby Helper</h1>
                            <!-- Post meta content-->

                        </header>
                        <!-- Preview image figure-->
                        <figure class="mb-4"><img class="img-fluid rounded" src="assets/launch.jpeg" alt="..." /></figure>
                        <!-- Post content-->
                        <section class="mb-5">
                            <p class="fs-5 mb-4">Everyone has hobbies and everyone has friends but not everyone is lucky enough to have friends that share their hobbies!</p>
                            <p class="fs-5 mb-4">That is where HobbyHelper can help! Let us match you with future friends at Auburn University that you can safely contact via their university email!</p>
                            <p class="fs-5 mb-4">We hope that you are now able to enjoy your new-found friendships while participating in your favorite hobbies!</p>

                        </section>
                    </article>
                    <!-- Group content -->

                    <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">

                                <div class="container px-5">

                                    <form action ="FetchActivitiesServlet" method="post">
                                        <div class="form-floating">
                                            View activities:

                                            <input type="submit" value="Show Me!" />
                                        </div>
                                    </form>
                            </div>
                                <div class="overflow-scroll" style="max-height: 30vh;">
                                <div class="container px-5">
                                    <table>
                                        <tr>
                                            <th>Activity Name </th>


                                        </tr>
                                        <c:forEach var="each_activity" items="${list_of_activities}">
                                            <tr>
                                                <td>${each_activity.getName()}</td>

                                            </tr>
                                        </c:forEach>
                                        <p>${error}</p>
                                    </table>
                        </div>
                            </div>
                            </div>
                        </div>
                    </section>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">Find Friends!</div>
                        <div class="card-body">
                            <div class="input-group">
                                <a href="findAFriend.jsp">
                                <button class="btn btn-primary" id="button-search" type="button">Go!</button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">Get a group recommendation!</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <a href="findAGroup.jsp">
                                        <button class="btn btn-primary" id="button-Group" type="button">Go!</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header"><h3 class="fw-bolder mb-4 mt-5">Explore our Hobby Helper Groups!</h3></div>
                        <div class="card-body"><article>
                            <!-- Post header-->
                            <header class="mb-4">
                                <!-- Post title-->

                                <!-- Post meta content-->
                            </header>
                            <div class="overflow-scroll" style="max-height: 50vh;">

                            <%
                                // Loop through each group and display it and its description
                                for (int i = 0; i < groupsNL.getLength(); i++) {
                                    Node n = groupsNL.item(i);
                                    Element e = (Element) n;
                            %>
                            <section class="mb-5"> <!--Need to create a series of buttons that can navigate to the navigate to the -->
                                <form method ="post" action="CreateGroupPageServlet">
                                    <p class="fs-5 mb-4"><%=e.getElementsByTagName("name").item(0).getTextContent()%>
                                    <br><button class="btn btn-primary" name="buttonAction"  value="<%=e.getElementsByTagName("id").item(0).getTextContent()%>" id="<%=e.getElementsByTagName("id").item(0).getTextContent()%>" type="submit">Visit</button>
                                    </p>
                                            <%
                                }
                                %>
                                </form>
                            </section>

                        </article>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">HobbyHelper Final Project</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
