<%@ page language="java" import="movieInfo.*" %>
<%@ page language="java" import="booking.*" %>
<%@ page language="java" import="user.*" %>

<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!-- http://smallenvelop.com/display-loading-icon-page-loads-completely/ -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js" integrity="sha384-SlE991lGASHoBfWbelyBPLsUlwY1GwNDJo3jSJO04KZ33K2bwfV9YBauFfnzvynJ" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
    #background{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
      height: 100%;
      background: url('img/bg.jpeg');
      background-repeat: no-repeat;
      background-position:center;
      background-attachment: fixed;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      -o-background-size: cover;
      background-size: cover;
      z-index: -1;
    }
    .navbar {
      margin-left: auto;
      margin-right: auto;
      width: 75%;
    }
    .form-content{
      margin-left: auto;
      margin-right: auto;
      width: 600px;
    }
    .container {
      margin-left: auto;
      margin-right: auto;
      width: 600px;
      background-color: blue;
      color: white;
      border-radius: 3px;
      text-align: center;
      padding: 1px;
    }
    .form-element {
      width: 225px;
      margin: 0;
    }
    label {
      margin: 0;
    }
  </style>
</head>

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
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="login.jsp"><i class="fas fa-user-circle"></i> Login/Register</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search Site" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>

  <!--- Registration Form --->
  <div class="form-content">
    <div class="container">
      <h1>User Registration</h1>
      <p>Be a part of our Community today!</p>
    </div>
    <form class="form-control" method="POST" action="http://localhost:8080/BookingSystem/result.jsp">
      <div class="row">
		<div class="col-md">
			<!-- First Name  -->
      		<div class="row">
      			<div class="col">
	      			<label for="firstName">First Name*: </label>
	          		<input type="text" class="form-control form-element col-md" id="firstName" name="firstName" placeholder="First Name" required>       
      			</div> 			
      		</div>
      		<!-- Last Name  -->
      		<div class="row">
      			<div class="col">
       	 			<label for="lastName">Last Name*: </label>
         			<input type="text" class="form-control form-element col-md" id="lastName" name="lastName" placeholder="Last Name" required>
      			</div>
      		</div>
      		<!--  Address  -->
      		<div class="row">
      			<div class="col">
        				<label for="addr">Address: </label>
          			<input type="text" class="form-control form-element col-md" id="addr" name="addr" placeholder="Address City State">
      			</div>
      		</div>
      		<!-- Phone -->
      		<div class="row">
      			<div class="col">
        				<label for="phone">Phone Number*: </label>
  		        		<input type="text" class="form-control form-element col-md" id="phone" name="phone" placeholder="Ex. XXX-XXX-XXXX" required pattern="[0-9]{3}[-][0-9]{3}[-][0-9]{4}">
      			</div>
        		</div>
		</div>
      	<div class="col-md">
     		<!-- Email -->
      		<div class="row">
      			<div class="col">
      			    <label for="email"> <span class="glyphicon glyphicon-user"> </span> Email (Username)*: </label>
        				<input type="text" class="form-control form-element col-md" id="email" name="email" placeholder="JohnDoe@gmail.com" required>
      			</div>
     		</div>
      		<!-- Card Number  -->
      		<div class="row">
      			<div class="col">
       				<label for="ccNumber">Card Number: </label>
        				<input type="text" class="form-control form-element col-md" id="ccNumber" name="ccNumber" placeholder="Credit/Dibit Number">
      			</div>
      		</div>
      		<!-- Exp. Date/ CVC -->
      		<div class="row">
        			<label for="expDate" class="col-sm-3">Exp Date: </label>
       			<input type="text" class="form-control form-element col-md-3 m-2" id="expDate" name="expDate" placeholder="mm/yy">
        			<input type="number" class="form-control form-element col-md-3 m-2" id="cvc" name="cvc" placeholder="CVC">
      		</div>
      		<!-- Password  -->
      		<div class="row password">
      			<div class="col">
        				<label for="password"><span class="glyphicon glyphicon-eye-open"></span> Password*: </label>
        				<input  type="password" class="form-control password-validation form-element" id="password" name="password" onchange="verifyPassword()" placeholder="Password" data-validation="false" required>
      			</div>
      		</div>
      		<!-- Confirm Password  -->
      		<div class="row confirm-password">
      			<div class="col">
        				<label for="confirm-password"><span class="glyphicon glyphicon-eye-open"></span> Confirm Password*: </label>
        				<input  type="password" class="form-control password-confirmation form-element" id="confirmPassword" name="password1" onchange="verifyPassword()"  placeholder="Confirm Password" data-validation="false" required>
      			</div>
      		</div>
      	</div>
      </div>
      All fields marked with (*) are manditory.<br>
      Would you like to sign up for promotions?
      <input type="radio" name="promo" id="remPasswd" checked>Yes
      <input type="radio" name="promo" id="remPasswd">No<br>
      <br>
      <button type="submit" id="signUp" class="btn btn-default btn-info btn-block submit-btn signup-btn" disabled><span class="glyphicon glyphicon-pencil"></span>&nbsp; Signup </button>
    </form>
  </div>
  <script>
  	function verifyPassword() {
  		var password = document.getElementById("password").value;
  		var confirmPassword = document.getElementById("confirmPassword").value;
  		if(password != confirmPassword){
  			document.getElementById("signUp").setAttribute("disabled","disabled");
  			alert("Your passwords do not match. Please try again. ")
  		} else {
  			document.getElementById("signUp").removeAttribute("disabled");
  		}
  	}
  </script>
</body>
</html>
