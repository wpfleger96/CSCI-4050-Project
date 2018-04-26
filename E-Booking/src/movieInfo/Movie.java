package movieInfo;

import java.sql.SQLException;
import config.DBConnection;

public class Movie {
	String title = "", genre = "", director = "", producer = "", rating = "", poster = "", trailer = "", time = "", date = "";
	DBConnection db;
	
	public Movie() throws ClassNotFoundException, SQLException {
		db = new DBConnection();
	}
	
	public void getShowTimes(String movie) throws ClassNotFoundException, SQLException {
		db.pst = db.conn.prepareStatement("Select Time, Date from mydb.Showtime WHERE MovieID=(Select ID from mydb.Movie where Title='"+ movie +"')");
		db.rs = db.pst.executeQuery();
		db.rs.next();
		time = db.rs.getString(1);
		date = db.rs.getString(2);
	}
	
	public void getMovieInfo(String movie) throws ClassNotFoundException, SQLException
	{
		db.pst = db.conn.prepareStatement("Select Title, Poster, Genre, Director, Producer, Rating, Trailer from mydb.Movie WHERE Title='"+ movie +"'");
		db.rs = db.pst.executeQuery();
		db.rs.next();
		title = db.rs.getString(1);
		poster = db.rs.getString(2);
		genre = db.rs.getString(3);
		director = db.rs.getString(4);
		producer = db.rs.getString(5);
		rating = db.rs.getString(6);
		trailer = db.rs.getString(7);
	}
	
	public void addMovie(String movieName) throws SQLException, ClassNotFoundException {
		if(searchMovie(movieName) == false){
			db.stmt = db.conn.createStatement();
			String query = "insert into movieChart " + "(movieName, numRating, avgRating) " + "values ('"+movieName+"',0,0)";
			db.stmt.executeUpdate(query);
		} 
	}// addMovie
	
	public void removeMovie(String movieName) throws SQLException, ClassNotFoundException {
		if(searchMovie(movieName) == true){
			db.pst = db.conn.prepareStatement("DELETE FROM movieChart where movieName='" + movieName +"'");
			db.rs = db.pst.executeQuery();
		}//if
	}// addMovie
 
	// Searches for movie. Returns true if it already exists, false if not.
	public boolean searchMovie(String movieName) throws SQLException, ClassNotFoundException{
		boolean exists = false;
	
		db.pst = db.conn.prepareStatement("SELECT * FROM movieChart");
		db.rs = db.pst.executeQuery();
	
		while(db.rs.next()){
			String movie = db.rs.getString(1);
			if(movieName.equalsIgnoreCase(movie)){
				exists = true;
				break;
			}//if
		}//while
		return exists;
	}//searchMovie
			
		public int getSize() throws SQLException, ClassNotFoundException{
			db.pst = db.conn.prepareStatement("SELECT COUNT(Title) FROM mydb.Movie");
			db.rs = db.pst.executeQuery();
			db.rs.next();
			return db.rs.getInt(1);
		}//getSize  
		
		// Retrieves a given row of information from table
		public void retrieveRateRow(int row) throws SQLException, ClassNotFoundException{
			db.pst = db.conn.prepareStatement("Select Title, Poster from mydb.Movie order by Title asc");
			db.rs = db.pst.executeQuery();
			db.rs.absolute(row);
			title = db.rs.getString(1);
			poster = db.rs.getString(2);
		}//retrieveRow
		
		public String getTitle() {
			return title;
		}
		
		public String getGenre() {
			return genre;
		}

		public String getDirector() {
			return director;
		}

		public String getProducer() {
			return producer;
		}

		public String getRating() {
			return rating;
		}

		public String getPoster() {
			return poster;
		}

		public String getTrailer() {
			return trailer;
		}

		public String getTime() {
			return time;
		}

		public String getDate() {
			return date;
		}
}
