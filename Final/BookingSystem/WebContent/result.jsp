<%@ page language="java" import="account.*" %>

<html>
<head></head>

<jsp:useBean id="userID" class="account.User" scope="session"/>

<body onload="returnHome()">
	
		<% userID.addUser("Brian", "Alvarez", "Brian90@uga.edu", "Dog");
		%>
	<script>
		function returnHome(){
			location.replace("http://localhost:8080/BookingSystem/index.jsp");
		}
	</script>
</body>
</html>