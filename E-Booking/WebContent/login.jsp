<%@ page language="java" import="config.*" %>

<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!-- http://smallenvelop.com/display-loading-icon-page-loads-completely/ -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js" integrity="sha384-SlE991lGASHoBfWbelyBPLsUlwY1GwNDJo3jSJO04KZ33K2bwfV9YBauFfnzvynJ" crossorigin="anonymous"></script>

  <style>
    .navbar {
      margin-left: auto;
      margin-right: auto;
      width: 75%;
    }
    #background{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    	height: 100%;
      background: url(http://backgroundcheckall.com/wp-content/uploads/2017/12/movie-theater-background-powerpoint.jpg);
      background-repeat: no-repeat;
      background-position:center;
      background-attachment: fixed;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
      z-index: -1;
    }
    .btn-space {
      margin: 5px;
    }
    .form-content{
      margin-left: auto;
      margin-right: auto;
      width: 400px;
    }
    .container {
      margin-left: auto;
      margin-right: auto;
      width: 400px;
      background-color: green;
      border-radius: 3px;
      text-align: center;
      padding: 1px;
    }
  </style>
</head>

<jsp:useBean id="user" class="config.ECinema" scope="session"/>

<body>
  <div id="background"></div>

  <!--- Navigation Menu --->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="movie_list.jsp">Browse Movies</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="order_summary.jsp">View Cart <i class="fas fa-shopping-cart"></i></a>
        </li>
      </ul>
      <% if (user.getCurrUserId() == -1) {  %>
	      <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link" href="login.jsp"><i class="fas fa-user-circle"></i> Login/Register</a>
	        </li>
	      </ul>
	   <% } else { %>
	   	   <ul class="navbar-nav">
	        <li class="nav-item">
	          <a class="nav-link" href="login.jsp"><i class="fas fa-user-circle"></i> Log Out</a>
	        </li>
	      </ul>
	   <% } %>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search Site" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>

  <div class="form-content">
    <div class="container">
      <h1>Login</h1>
      <p>See whats going on with you account today!</p>
    </div>
    <form class="form-control" method="POST" action="http://localhost:8080/E-Booking/login_results.jsp">
      <!-- Username -->
      <div class="form-group">
        <label for="email"><i class="fas fa-user"></i> Username</label>
        <input type="email" class="form-control form-control-sm col-md-12" name="email" id="email" aria-describedby="emailHelp" placeholder="Enter Username" required>
        <small id="emailHelp" class="form-text text-muted text-center">We'll never share your email with anyone else.</small>
      </div>
      <!-- Password -->
      <div class="form-group">
        <label for="password"><i class="fas fa-key"></i> Password</label>
        <input type="password" class="form-control form-control-sm col-md-12" name="password" id="password" placeholder="Password" required>
      </div>
      <!-- Remember Password -->
      <div class="form-check text-center">
        <input type="checkbox" class="form-check-input" id="remPasswd">
        <label class="form-check-label" for="remPasswd">Remember Me</label>
        <a class="btn btn-info btn-sm" href="registration.jsp">Register New User</a>
      </div>
      <!-- Login Button -->
      <button type="submit" id="login" class="btn btn-space btn-primary btn-success btn-block"><i class="fas fa-lock"></i> Login</button>
      <!-- Forgot Password -->
      <div class="modal-footer">
        <div class="pull-left message" id="login-message"></div>
         <p>Forgot <a id="forgot-password" style="color:blue;" onclick="forgotPassword()">Password?</a></p><br>
      </div>
    </form>
  </div>
  <script>
      function forgotPassword() {
        var userName = prompt("Please enter your username.");
        document.getElementById("email").setAttribute("value", email);
        location.replace("http://localhost:8080/BookingSystem/forgot_password.jsp");
      }
  </script>
</body>
</html>
