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

    h1 {
      text-align: center;
    }

    .container {
      margin-left: auto;
      margin-right: auto;
      width: 800px;
      background-color: white;
      border: 1px solid black;
      border-radius: 3px;
      padding: 1px;
    }
  </style>
</head>

<body>
  <div id="background"></div>

  <!--- Main Navigation Menu --->
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

<h1>Administrator Actions</h1>
<!--- Admin Navigation Menu --->
<ul class="nav nav-pills justify-content-center">
  <li class="nav-item">
    <a class="nav-link" href="admin_movies.jsp">Manage Movies</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="admin_users.jsp">Manage Users</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="admin_employees.jsp">Manage Employees</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="admin_promotions.jsp">Manage Tickets/Promotions</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="admin_profile.jsp">View Sales Report</a>
  </li>
</ul> 	

<div class="container">
  <div class="bottom-content">
    <h2 style="text-align:center; margin: 0;"> Manage Movie
      <select style="float: right; margin: 0;">
        <option>Movie 1</option><option>Movie 2</option><option>Movie 3</option>
      </select></h2>
    <input type="button" value="Add Movie" onclick="manageShowtimes">
    <input type="button" value="Edit Movie" onclick="manageShowtimes">
    <input type="button" value="Remove Movie" onclick="manageTicketPrices"><br>
    Movie Title: <input type="text" value="Black Panther"><br>
    Category: <input type="text" value="Action, Adventure"><br>
    Cast: <input type="text" value="Micheal B. Jordan"><br>
    Director: <input type="text" value="-"><br>
    Producer: <input type="text" value="-"><br>
    Synopsis: <input type="text" value="Super Hero Movie"><br>
    Reviews: <input type="text" value="User 1 - Great!"><br>
    Trailer Picture URL: <input type="text" value="-"><br>
    Trailer Video URL: <input type="text" value="-"><br>
    MPAA-US Rating Code: <input type="text" value="4.8"><br>
    Show Dates/Time:
    <input type="text" value="Monday - 9:00 10:00 11:30 Tuesay - ... "><br>
    <input type="submit" id="submit" onclick="" value="Submit">
    <input type="button" id="close" onclick="" value="Cancel">
  </div>
</div>
  <script></script>
</body>
</html>