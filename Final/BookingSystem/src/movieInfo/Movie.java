package movieInfo;

import java.sql.SQLException;
import config.DBConnection;

public class Movie
{
	String title;
	String category;
	String cast;
	String director;
	String producer;
	String synopsis;
	int rating;
	String poster;
	String trailer;
	int minimumAge;
	Showtime showtimes[];
			
	public Movie(int id) {
		
	}
	
	String getMovieInfo()
	{
		return this.synopsis;
	}
	
	public void addMovie(String movieName) throws SQLException {
		if(searchMovie(movieName) == false){
			DBConnection.stmt = DBConnection.conn.createStatement();
			String query = "insert into movieChart " + "(movieName, numRating, avgRating) " + "values ('"+movieName+"',0,0)";
			DBConnection.stmt.executeUpdate(query);
		} 
	}// addMovie
	
	public void removeMovie(String movieName) throws SQLException {
		if(searchMovie(movieName) == true){
			DBConnection.pst = DBConnection.conn.prepareStatement("DELETE FROM movieChart where movieName='" + movieName +"'");
			DBConnection.rs = DBConnection.pst.executeQuery();
		}//if
	}// addMovie
 
	// Searches for movie. Returns true if it already exists, false if not.
	public boolean searchMovie(String movieName) throws SQLException{
		boolean exists = false;
	
		DBConnection.pst = DBConnection.conn.prepareStatement("SELECT * FROM movieChart");
		DBConnection.rs = DBConnection.pst.executeQuery();
	
		while(DBConnection.rs.next()){
			String movie = DBConnection.rs.getString(1);
			if(movieName.equalsIgnoreCase(movie)){
				exists = true;
				break;
			}//if
		}//while
		return exists;
	}//searchMovie
}
