<%@ page language="java" import="account.*" %>

<html>
<head></head>

<jsp:useBean id="userID" class="account.User" scope="session"/>
<jsp:useBean id="mail" class="account.Mail" scope="session"/>

<body onload="returnHome()">
		
		<% userID.addUser(request.getParameter("firstName"), request.getParameter("lastName"), 
				request.getParameter("email"), request.getParameter("password"), request.getParameter("promo"),
				request.getParameter("street"), request.getParameter("city"), request.getParameter("state"));
		   
		   mail.sendMail(request.getParameter("email"), request.getParameter("firstName"), request.getParameter("lastName"), request.getParameter("phone"), request.getParameter("password"));
		%>
	<script>
		function returnHome(){
			alert("You account has been created. Please check you email to verify your account.");
			location.replace("http://localhost:8080/E-Booking/index.jsp");
		}
	</script>
</body>
</html>