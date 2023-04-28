<!--
TASKS:
* Login page with username and password: DONE
* Sign-up page with first, last, username, password, confirm: DONE
* JSP session for users: DONE
* Any one can browse a catalog: DONE
* Catalog can filter by topic (done by server): DONE
* Topic for all books: DONE
* Catalog shows book title, author, availability, and way to reserve: DONE
* Logged in users can reserve a copy: DONE
* Not logged in users cannot reserve a copy: DONE
* Logged in users can see which books they reserved: DONE
ASSUMPTIONS I MADE:
* In this app I assumed that there were more than one copy of a book at the library, so when one was reserved someone else could possibly reserve another copy of it as well.
* I assumed this since it wasn't directly specified in the instructions that only one copy of a book existed and since the availability field was just a boolean and not a number of available books.
-->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Library Login</title>
</head>
<body>

<form action="LoginServlet" method="post" onsubmit="return validate()">
    Username: <input id="username" name="username" type="text" /> <br/>
    Password: <input id="password" name="password" type="password" /> <br/>
    <input type="submit" name="Login" value="Login"/> <br/> </br>
    <span id="error_msg"></span>
</form>

<form method="post" action="signup.jsp">
    <input type="submit" name="Sign-Up" value="Sign-Up"/> <br/> </br>
</form>

<form action="CatalogServlet" method="post" action="catalog.jsp">
    <input type="submit" name="Catalog" value="View Catalog"/> <br/> </br>
</form>

<p>${error}</p>

</body>
<script>

    function validate() {
        var username = document.getElementById("username").value
        var password = document.getElementById("password").value
        if(username === "") {
            document.getElementById("error_msg").innerHTML = "Please enter username."
            result = false;
        } else if(password === "") {
            document.getElementById("error_msg").innerHTML = "Please enter password."
            result = false
        }
        return result
    }

</script>
</html>