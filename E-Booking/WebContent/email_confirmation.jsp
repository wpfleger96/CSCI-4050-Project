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

<body>
  <div id="background"></div>

  <div class="middle-content">
    <h1>Order Confirmation</h1>
    <h4>Thank you for placeing your order with us.
      Your order number is XXXXXXXXXX.<br></h4>
    <div class="container">
    <p> </p>
    <p>Movie: Black Panther</p>
    <p>Date/Time: Tuesday, March 6, 2018</p>
    <p>Seats: A1 A2 A3</p>
    <p>Seat Type(s): 3 Adults</p>
    <p>Total Amount: $18.00</p>
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
