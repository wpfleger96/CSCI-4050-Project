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

<jsp:useBean id="movie" class="movieInfo.Movie" scope="session"/>
<jsp:useBean id="user" class="config.ECinema" scope="session"/>
<jsp:useBean id="seat" class="booking.Seat" scope="session"/>
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

  <div class="container">
    <h1>Order Summary</h1>
    <% ticket.setMovieName(movie.getTitle()); %>
    <p>Movie: <%= movie.getTitle() %></p>
    <% ticket.setDate(movie.getDate()); 
       ticket.setTime(movie.getTime()); %>
    <p>Date/Time: <%= movie.getDate() %>, <%= movie.getTime() %></p>
    <% ticket.setSeat(request.getParameter("seat[]")); %>
    <p>Seats: <%= ticket.getSeat() %></p>
        <% ticket.setAdult(request.getParameter("adult")); 
        ticket.setChild(request.getParameter("child")); 
        ticket.setSenior(request.getParameter("senior")); %>
    <p>Seat Type(s): <%= request.getParameter("adult") + " adults, " + request.getParameter("child") + " children, " +request.getParameter("senior") + " senior" %></p>
    <% ticket.setPrice(); %>
    <p>Total Amount: $<%= ticket.getPrice()%>0</p>
    <a class="btn btn-info btn-sm" href="checkout.jsp">Continue Checkout</a>
  </div>
  <script>
    function updateOrder() {
      var x = prompt("What would you like to do?");
    }
  </script>
</body>
</html>
