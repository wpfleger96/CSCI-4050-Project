<%@ page language="java" import="account.*" %>

<html>
<head></head>

<jsp:useBean id="userID" class="account.User" scope="session"/>

<body>
		
		<% if(userID.login(request.getParameter("email"), request.getParameter("password"), request.getSession()) == false) { %>
			<script>			
				alert("Login Failed. Please check username/password.");
				location.replace("http://localhost:8080/E-Booking/login.jsp");
			</script>
		<%	} else if(userID.login(request.getParameter("email"), request.getParameter("password"), request.getSession()) == true) { %>
			<script>
				var type = "<%=userID.getType()%>";
				alert("Login Successful!");
				location.replace("http://localhost:8080/E-Booking/" + type + "_profile.jsp");
			 </script>
		<% } %>
</body>
</html>