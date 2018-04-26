<%@ page language="java" import="account.*" %>

<html>
<head></head>

<jsp:useBean id="userID" class="account.User" scope="session"/>
<jsp:useBean id="mail" class="account.Mail" scope="session"/>

<body onload="returnToLogin()">
	
	<% mail.sendPassword( document.getElementById("email"), "D"); %>
	<script>
		function returnToLogin() {
			location.replace("http://localhost:8080/E-Booking/login.jsp");
			alert("A link to reset your password has been sent to the email connected to this account.");
		}
	</script>
</body>
</html>