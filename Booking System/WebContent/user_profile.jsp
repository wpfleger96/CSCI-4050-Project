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
    h1 {
      text-align: center;
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
    .container {
      margin-left: auto;
      margin-right: auto;
      width: 800px;
      background-color: white;
      border-radius: 3px;

      padding: 1px;
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

  <div class="container">

    <h1>User Profile</h1>
    <div class="text-center">
    <input type="button" value="View Order History">
    <input type="button" value="Refund Purchase">
    <input type="button" value="Update Current Order"><br><br>
  </div>
    First name*: <input type="text" value="John"><br>
    Last name*: <input type="text" value="Snow"><br>
    Address: <input type="text" value="The North"><br>
    Phone Number*: <input type="text" value="(123)456-0789"><br>
    Email (UserName)*: <input type="text" value="DragonSlayer@got.com"><br>
    Card Number: <input type="text" name="ccNum" placeholder="-"><br>
    Expiration Date: <input type="text" name="expDate" placeholder="-"><br>
    Card Security Code: <input type="text" name="ccSC" placeholder="-"><br>
    Password*: <input type="text" name="passwd" placeholder="Cowcow123"><br>
    Re-enter Password*: <input type="text" placeholder="Cowcow123"><br>
    All fields marked with (*) are manditory.<br>
    Current promotion selected
    <input type="radio" name="promo" id="remPasswd" checked>Yes
    <input type="radio" name="promo" id="remPasswd">No<br>
      <input type="button" value="Edit" onclick="editInfo">
            <input type="button" value="Save" onclick="editInfo">
</div>
  <script></script>
</body>
</html>
