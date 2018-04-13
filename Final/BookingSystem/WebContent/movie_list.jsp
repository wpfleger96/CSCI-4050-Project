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
    .middle-content {
      display: inline-grid;
      grid-template-columns: auto auto auto;
      background-color: white;
      height: auto;
      margin: 0;
      padding: 0;

    }
    .container {
      width: 75%;
    }
    .grid-item {
      margin: 5%;
      width: 50%;
      height: 75%;
    }
    body {
      background-color: black;
      margin-left: auto;
      margin-right: auto;
      padding: 0;
    }
    h1 {
      text-align: center;
      margin: 0;
      padding: 0;
    }
    #filter {
      display: inline-grid;
      grid-template-columns: auto auto auto auto auto auto;
      grid-gap: 15px;
    }
  </style>
</head>

<body class="text-center">
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
  <!--- Middle Section --->
  <h1>Browse Movies</h1>
  <input type="button" style="float: left;" id="previous" onclick="browseMovies()" value="Previous">
  <input type="button" style="float: right;" id="next" onclick="browseMovies()" value="Next">

  <!--- Movies Selection --->
  <div class="middle-content">
    <div class="grid-item" id="movie1">
      <img src="http://via.placeholder.com/150x150">
      <select>
        <option value="" disabled selected>Dates</option>
        <option>Date 1</option>
        <option>Date 2</option>
        <option>Date 3</option>
      </select>
      <select>
        <option value="" disabled selected>Times</option>
        <option>Time 1</option>
        <option>Time 2</option>
        <option>Time 3</option>
      </select>
      <input type="button" id="seats" onclick="selectSeats()" value="Select Seats">
      <input type="button" id="book" onclick="checkout()" value="Add to Cart">
    </div>
    <div class="grid-item" id="movie2">
      <img src="http://via.placeholder.com/150x150">
      <select>
        <option value="" disabled selected>Dates</option>
        <option>Date 1</option>
        <option>Date 2</option>
        <option>Date 3</option>
      </select>
      <select>
        <option value="" disabled selected>Times</option>
        <option>Time 1</option>
        <option>Time 2</option>
        <option>Time 3</option>
      </select>
      <input type="button" id="seats" onclick="selectSeats()" value="Select Seats">
      <input type="button" id="book" onclick="checkout()" value="Add to Cart">
      <img id="viewMap" src="Seats.png" hidden>
    </div>
    <div class="grid-item" id="movie3">
      <img src="http://via.placeholder.com/150x150">
      <select>
        <option value="" disabled selected>Dates</option>
        <option>Date 1</option>
        <option>Date 2</option>
        <option>Date 3</option>
      </select>
      <select>
        <option value="" disabled selected>Times</option>
        <option>Time 1</option>
        <option>Time 2</option>
        <option>Time 3</option>
      </select>
      <input type="button" id="seats" onclick="selectSeats()" value="Select Seats">
      <input type="button" id="book" onclick="checkout()" value="Add to Cart">
    </div>
  </div>
</div>

  <!--- Filter Section --->
  <div id="filter">
    <p style="font-size:20px; padding:0; margin:0;">Filter By: </p>
    <select style="width: 125px;">
      <option value="" disabled selected>Title</option>
      <option>Movie 1</option><option>Movie 2</option><option>Movie 3</option>
    </select>
    <select style="width: 125px;">
      <option value="" disabled selected>Genre</option>
      <option>Action</option><option>Comedy</option><option>Horror</option>
    </select>
    <select style="width: 125px;">
      <option value="" disabled selected>Dates</option>
      <option>Date 1</option>
      <option>Date 2</option>
      <option>Date 3</option>
    </select>
    <select style="width: 125px;">
      <option value="" disabled selected>Times</option>
      <option>Time 1</option>
      <option>Time 2</option>
      <option>Time 3</option>
    </select>
    <select style="width: 125px;">
      <option value="" disabled selected>Rating</option>
      <option>1 Star</option><option>2 Stars</option><option>3 Stars</option>
      <option>4 Stars</option><option>5 Stars</option>
    </select>
  </div>
  <script>
    function selectSeats() {
      var myWindow = window.open("seat_selection.jsp","","width=500,height=500, top=600, left=400");
    }
  </script>
</body>

</html>
