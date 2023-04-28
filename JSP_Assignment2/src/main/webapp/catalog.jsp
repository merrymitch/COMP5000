<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.UserModel" %>
<html>
<head>
    <title>Library Catalog</title>
</head>
<body>

<form method="post" action="index.jsp">
    <input type="submit" name="Back" value="Back to Login"/> <br/> </br>
</form>

<form action="CatalogServlet">
    Filter by Topic:
    <select name="topic">
        <option value="999">All</option>
        <c:forEach var="each_topic" items="${list_of_topics}">
            <option value="${each_topic.getTopic_id()}">${each_topic.getTopic_name()}</option>
        </c:forEach>
        <input type="submit" value="Filter" />
    </select>
</form>

<br/>
<br/>
<br/>
<br/>
<table>
    <tr>
        <th>Book</th>
        <th>Author</th>
        <th>Availability (1=yes, 0=no)</th>
    </tr>
    <c:forEach var="each_book" items="${list_of_catalog}">
        <tr>
            <td>${each_book.getBook_name()}</td>
            <td>${each_book.getAuthor_name()}</td>
            <td>${each_book.getIs_available()}</td>
            <td><a href="ReserveServlet?id=${each_book.getBook_id()}">Reserve</a></td>
        </tr>
    </c:forEach>
</table>
<br/>
<br/>
<br/>
<br/>

<p>${message}</p>
<p>${error}</p>

</body>
</html>