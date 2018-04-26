<%@ page language="java" import="movieInfo.*" import="config.*" %>

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
    #prev {
      display: inline-grid;
      grid-template-columns: auto auto auto;
      background-color: white;
      height: auto;
      margin: 0;
      padding: 0;
    }
     #next {
      display: none;
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

<jsp:useBean id="movie" class="movieInfo.Movie" scope="session"/>
<jsp:useBean id="user" class="config.ECinema" scope="session"/>

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

  <div class="container">
  <!--- Middle Section --->
  <h3>Browse Movies</h3>
  <input type="button" style="float: left;" id="previous" onclick="browseNext()" value="Next">

  <!--- Movies Selection --->
  <div id="prev">
	<%  for (int i = 1; i <= 3; i++) {
			movie.retrieveRateRow(i);	%>
			<div class="grid-item">
				<form action="http://localhost:8080/E-Booking/movie.jsp">
					<input type="hidden" name="movie" value="<%= movie.getTitle() %>" />
					<h6 class="text-center"><%= movie.getTitle() %></h6>
				 	<img src="<%= movie.getPoster() %>" height="350" width="250">
				 	<input type="submit" class="btn btn-primary" value="Book Now"/>
				</form>
			</div>
	<% 	} 	%>  
   </div>
      <div id="next">
	<%  for (int i = 4; i <= 6; i++) {
			movie.retrieveRateRow(i);	%>
			<div class="grid-item">
				<form action="http://localhost:8080/E-Booking/movie.jsp">
					<input type="hidden" name="movie" value="<%= movie.getTitle() %>" />
					<h6 class="text-center"><%= movie.getTitle() %></h6>
				 	<img src="<%= movie.getPoster() %>" height="350" width="250">
				 	<input type="submit" class="btn btn-primary" value="Book Now"/>
				</form>
			</div>
	<% 	} 	%>  
   </div>
  <!--- Filter Section --->
  <div id="filter">
    <p style="font-size:20px; padding:0; margin:0; color:white;">Filter By: </p>
    <form action="http://localhost:8080/E-Booking/movie.jsp">
	    <select style="width:125px;" id="filterMovie" onChange="disableRest1()")>
	    		<option value="" disabled selected>Title</option>
	    	<%  for (int i = 1; i <= movie.getSize(); i++) {
	 			movie.retrieveRateRow(i);	%>	 			
				<option><%= movie.getTitle() %></option>
		<% 	} 	%>  
	    </select>
	    <select style="width: 125px;" id="filterGenre" onChange="disableRest2()">
	      <option value="" disabled selected>Genre</option>
	      <option name="genre" value="Action">Action</option><option name="genre" value="Adventure">Adventure</option><option name="genre" value="Comedy">Comedy</option>
	      <option name="genre" value="Crime">Crime</option><option name="genre" value="Drama">Drama</option><option name="genre" value="Horror">Horror</option>
	      <option name="genre" value="Romance">Romance</option><option name="genre" value="Science Fiction">Science Fiction</option><option name="genre" value="Suspense">Suspense</option>
	      <option name="genre" value="Thriller">Thriller</option><option name="genre" value="War">War</option><option name="genre" value="Western">Western</option>
	    </select>
	    <select style="width: 125px;" id="filterRelease" onChange="disableRest3()">
	    	<option value="" disabled selected>Release</option>
	      <option>Coming Soon</option>
	      <option>New Release</option>
	    </select>
	    <input type="hidden" id="lookForMovie" name="movie" value=""/>
	    <input type="submit" value="Submit"/>
    </form>
  </div>
  <script>
  	var x = 3;
  	var i = 1;
  	function disableRest1() {
  		document.getElementById("filterGenre").setAttribute("disabled","disabled");
  		document.getElementById("filterRelease").setAttribute("disabled","disabled");
  		document.getElementById("lookForMovie").setAttribute("value",document.getElementById("filterMovie").value);
  	}
  	function disableRest2() {
  		document.getElementById("filterMovie").setAttribute("disabled","disabled");
  		document.getElementById("filterRelease").setAttribute("disabled","disabled");
  	}
  	function disableRest3() {
  		document.getElementById("filterGenre").setAttribute("disabled","disabled");
  		document.getElementById("filterMovie").setAttribute("disabled","disabled");
  	}
  
 	function browseNext(){
 		var x = document.getElementById("next");
 		var y = document.getElementById("prev");
 	    if (x.style.display === "none") {
 	        x.style.display = "inline-grid";
 	       	y.style.display = "none";
 	       document.getElementById("previous").setAttribute("value", "Previous");
 	    } else {
 	        x.style.display = "none";
 	       	y.style.display = "inline-grid";
 	       	document.getElementById("previous").setAttribute("value", "Next");
 	    }
 	}
  </script>
</body>

</html>
