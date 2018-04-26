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
      border: 1px solid black;
    }
    .col-md {
      border: 1px solid black;
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

  <h1 class="text-center">Checkout</h1>
  <div class="container" style="background-color:white;">
    <div class="row">
      <div class="col-md">
        <h4>Ticket Details</h4>
    <p>Movie: <%= ticket.getMovieName() %></p>
    <p>Date/Time: <%= ticket.getDate() %>, <%= ticket.getTime() %></p>
    <p>Seats: <%= ticket.getSeat() %></p>
    <p>Seat Type(s): <%= ticket.getAdult() + " adults, " + ticket.getChild() + " children, " +ticket.getSenior() + " senior" %></p>
    <p>Total Amount: $<%= ticket.getPrice()%>0</p>
        <form>
          <div id="inputs">
            <input type="promotion" id="promo" placeholder="Promotion Code">
          </div>
          <div id="action">
            <input type="button" id="apply" value="Apply Promotion" onclick="applyPromotion()">
          </div>
        </form>
      </div>
      <div class="col-md">
        <form id=payment>
          <fieldset>
            <legend>Card Details</legend>
            <ol>
              <li>
                <fieldset>
                  <legend>Card Type*</legend>
                  <ol>
                    <li>
                      <input id=visa name=cardtype type=radio />
                      <label for=visa>VISA</label>
                    </li>
                    <li>
                      <input id=amex name=cardtype type=radio />
                      <label for=amex>AmEx</label>
                    </li>
                    <li>
                      <input id=mastercard name=cardtype type=radio />
                      <label for=mastercard>Mastercard</label>
                    </li>
                  </ol>
                </fieldset>
              </li>
              <li>
                <label for=cardnumber>Card Number*</label>
                <input id=cardnumber name=cardnumber type=number required />
              </li>
              <li>
                <label for=secure>Security Code*</label>
                <input id=secure name=secure type=number required />
              </li>
              <li>
                <label for=namecard>Name on Card*</label>
                <input id=namecard name=namecard type=text placeholder="Exact name on card" required />
              </li>
            </ol>
          </fieldset>
          <fieldset>
            <a class="btn btn-info btn-sm" href="order_confirmation.jsp">Submit Payment</a>
            <input type="button" onclick="goHome()" value="Cancel Order">
            <script>
            	function goHome() {
            		document.getElementsByTagName("cardnumber").removeAttribute("required");
            		document.getElementsByTagName("secure").removeAttribute("required");
            		document.getElementByTagName("namecard").removeAttribute("required");
            		location.replace("http://localhost/E-Booking/index.jsp");
            	}
            
            </script>
          </fieldset>
        </form>
      </div>
    </div>
  </div>
</body>
</html>
