<%@ page language="java" import="movieInfo.*" import="config.*" import="booking.*" %>

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
    .navbar {
      margin-left: auto;
      margin-right: auto;
      width: 75%;
    }

    .middle-content {
      display: block;
      padding-top: 25px;
    }
    #inputs {
      float: left;
      margin-left: 35%;
      margin-right: 50%;
    }
    #email {
      font-size: 20px;
    }
    #passwd {
      font-size: 20px;
    }
    #action {
      margin-left: 37%;
    }
    h4 {
      text-align: center;
    }
    h1 {
      text-align: center;
    }
    .container {
      margin-left: auto;
      margin-right: auto;
      width: 400px;
      background-color: white;
      border: 1px solid black;
      border-radius: 3px;
      text-align: center;
      padding: 1px;
    }
  </style>
</head>

<jsp:useBean id="ticket" class="movieInfo.Ticket" scope="session"/>

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

  <div class="middle-content">
    <h1>Order Confirmation</h1>
    <h4>Thank you for placeing your order with us.
      Your order number is <%=ticket.getTicketNum() %>.<br>You will receive an
      email shortly containing your order confirmation.</h4>
    <div class="container">
    <p> </p>
    <p>Movie: <%= ticket.getMovieName() %></p>
    <p>Date/Time: <%= ticket.getDate() %>, <%= ticket.getTime() %></p>
    <p>Seats: <%= ticket.getSeat() %></p>
    <p>Seat Type(s): <%= ticket.getAdult() + " adults, " + ticket.getChild() + " children, " +ticket.getSenior() + " senior" %></p>
    <p>Total Amount: $<%= ticket.getPrice()%>0</p>
    </div>
    <h4>Hope to see your there!</h4>
  </div>
<div class="bottom-content">
</div>
  <script>
    function updateOrder() {
      var x = prompt("What would you like to do?");
    }
    function checkout() {
      location.href="checkout.jsp"
    }
  </script>
</body>
</html>
