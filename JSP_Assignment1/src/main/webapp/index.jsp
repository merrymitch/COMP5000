<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.w3c.dom.Document" %>
<%@ page import="org.w3c.dom.NodeList" %>
<%@ page import="org.w3c.dom.Node" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="java.io.File" %>

<%--
  Author:      Mary Mitchell
  Assignment:  JSP-Assignment1
  Due Date:    4/18/2023
  Description: Online Examination System
  Sources:     https://stackoverflow.com/questions/428073/what-is-the-best-simplest-way-to-read-in-an-xml-file-in-java-application
--%>

<%
    // Get the XML file and its contents
    File xmlFile = new File("/Users/marymitchell/Documents/Senior Spring '23/COMP5000/Assignments/Mitchell_Mary_JSPAssignment1/JSP_Assignment1/src/main/webapp/assignment.xml");
    DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
    DocumentBuilder db = dbf.newDocumentBuilder();
    Document d = db.parse(xmlFile);
    d.getDocumentElement().normalize();
    NodeList questionsNL = d.getElementsByTagName("questions");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Exam Assignment</title>
</head>
<body>
<form>
    <h3>Online Exam</h3>
    <%
        // Loop through each question and display it and the answer options
        for (int i = 0; i < questionsNL.getLength(); i++) {
            Node n = questionsNL.item(i);
            Element e = (Element) n;

    %>
            <%=i + 1%>. <%=e.getElementsByTagName("question").item(0).getTextContent()%>
            <br />
            True: <input type="radio" name="answer<%=i%>" value="true" required />
            False: <input type="radio" name="answer<%=i%>" value="false" required />
            <br />
            <br />
    <%
        }
    %>
    <input type="submit" value="Submit" name="submit" />
    <br />
</form>
<%
    int score = 0;
    int totalQuestions = questionsNL.getLength();
    // Once the exam is submitted, compare the answers and calculate the score
    if (request.getParameter("submit") != null) {
        for (int i = 0; i < questionsNL.getLength(); i++) {
            Node n = questionsNL.item(i);
            Element e = (Element) n;
            String answer = e.getElementsByTagName("answer").item(0).getTextContent();
            String answerNum = "answer" + i;
            if (request.getParameter(answerNum).equals(answer)) {
                score++;
            }
        }
%>
        You scored a <%=score%> / <%=totalQuestions%>
<%
    }
%>
</body>
</html>