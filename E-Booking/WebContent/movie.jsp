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
      margin-top: 5%;
      color: black;
    }
    #filter {
      display: inline-grid;
      grid-template-columns: auto auto auto auto auto auto;
      grid-gap: 15px;
    }
    .grid-container {
    	display: grid;
    	grid-template-columns: auto auto;
    }
  </style>
</head>

<jsp:useBean id="movie" class="movieInfo.Movie" scope="session"/>
<jsp:useBean id="user" class="config.ECinema" scope="session"/>
<jsp:useBean id="seat" class="booking.Seat" scope="session"/>


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
  <h1><%= request.getParameter("movie") %></h1>

  <!--- Movies Selection --->
  <div class="middle-content">
  	
    <div class="grid-container text-center">
    	<form action="http://localhost:8080/E-Booking/order_summary.jsp">
	    	<div class="grid-item">
	    		<% movie.getMovieInfo(request.getParameter("movie")); %>
	    		<p>
				    Genre: <%= movie.getGenre() %><br>
				    Director: <%= movie.getDirector() %><br>
				    Producer: <%= movie.getProducer() %><br>
				    Trailer Video URL: <a href="<%= movie.getTrailer() %>">Click Here</a><br>
				    MPAA-US Rating Code: <%= movie.getRating() %><br>
	    		
	    		</p>
	    	</div>
      		<img src="<%= movie.getPoster() %>" height="300" width="250">
      
	 	    <select>
	    		<option value="" disabled selected>Dates</option>
	    		<% movie.getShowTimes(request.getParameter("movie")); %>
	    		<option name="date" value="<%= movie.getDate() %>"><%= movie.getDate() %></option>
	    	</select>
		 	<select>
		    		<option value="" disabled selected>Times</option>
		    		<% movie.getShowTimes(request.getParameter("movie")); %>
					<option name="time" value="<%= movie.getTime() %>"><%= movie.getTime() %></option>
		    </select>
    <div id="img">
      <img src="https://i.imgur.com/SQDj2nV.png" height="200" width="200">
    </div>
    
      <div id="option">
        <select name="seat[]" multiple>
	    		<option value="" disabled selected>Show Available Seats</option>
	    	<%  for (int i = 0; i < 35; i++) {
	    			if(seat.isAvailable(seat.getSeat(i), request.getParameter("movie")) == 0){ %>
	    				<option value="<%= seat.getSeat(i) %>"><%= seat.getSeat(i) %></option>
	    		<% 	} %>
			<% 	} 	%>  
	    </select>
        
        <br>
        <input type="number" name="adult" placeholder="# of Adult(s) (18+)">
        <input type="number" name="child" placeholder="# of Children">
        <input type="number" name="senior" placeholder="# of Senior(s) (65+)"><br>
      </div>
	      	<input type="submit" onclick="checkout()" value="Add to Cart">
	     </form>
    </div>
  </div>
</div>
  <script>
</body>

</html>