<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Library Sign-Up</title>
</head>
<body>

<form action="SignUpServlet" method="post" onsubmit="return signUp()">
    First Name: <input id="firstname" name="firstname" type="text" /> <br/>
    Last Name: <input id="lastname" name="lastname" type="text" /> <br/>
    Username: <input id="username" name="username" type="text" /> <br/>
    Password: <input id="password" name="password" type="password" /> <br/>
    Confirm Password: <input id="confirmpassword" name="confirmpassword" type="password" /> <br/>
    <input type="submit" name="Sign-Up" value="Sign-Up"/> <br/> </br>
</form>

<form method="post" action="index.jsp">
    <input type="submit" name="Back" value="Back"/> <br/> </br>
</form>

<p id="error">${error}</p>

</body>
<script>

    function signUp() {
        var firstname = document.getElementById("firstname").value
        var lastname = document.getElementById("lastname").value
        var username = document.getElementById("username").value
        var password = document.getElementById("password").value
        var confirmpassword = document.getElementById("confirmpassword").value
        if(firstname === "" || lastname === "" || username === "" || password === "" || confirmpassword === "") {
            alert("Please fill out all of the fields.")
            window.location.reload();
            result = false
        } else if(confirmpassword !== password) {
            alert("Your passwords do not match.")
            window.location.reload();
            result = false
        }
        return result
    }


</script>
</html>