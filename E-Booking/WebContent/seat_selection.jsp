<%@ page language="java" import="booking.*" import="config.*" %>

<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!-- http://smallenvelop.com/display-loading-icon-page-loads-completely/ -->
  <script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js" integrity="sha384-SlE991lGASHoBfWbelyBPLsUlwY1GwNDJo3jSJO04KZ33K2bwfV9YBauFfnzvynJ" crossorigin="anonymous"></script>

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
    .middle-content {
      display: grid;
      grid-template-columns: auto auto;
      
    }
    #img {
      text-align: right;
    }
    #option {
      margin: 15px;
      width: 100px;
    }
    #option input{
      width: auto;
    }
    .bottom-content {
      text-align: center;
    }
    h1 {
      text-align: center;
      margin-top: 10%;
    }
  </style>

</head>

<jsp:useBean id="seat" class="booking.Seat" scope="session"/>

<body>
  <div id="background"></div>

  <h1>Seat Selection</h1>
  <div class="middle-content">

      <input type="hidden" name="movie" value='<%= request.getParameter("movie") %>'/>
      <input type="submit" id="submit" value="Submit">
    </form>
  </div>

	<div class="bottom-content">
    
    <input type="button" id="close" onclick="self.close()" value="Close">
	</div>
</body>
</html>
