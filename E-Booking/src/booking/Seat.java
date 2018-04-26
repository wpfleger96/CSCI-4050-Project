package booking;

import java.sql.SQLException;

import config.DBConnection;

public class Seat
{
	public int reservedUserId;
	public int seatSize = 35;
	public int available;
	public String[] seats = {"A1", "A2", "A3", "A4", "A5", "A6", "A7", 
			"B1", "B2", "B3", "B4", "B5", "B6", "B7", 
			"C1", "C2", "C3", "C4", "C5", "C6", "C7", 
			"D1", "D2", "D3", "D4", "D5", "D6", "D7", 
			"E1", "E2", "E3", "E4", "E5", "E6", "E7"};
	
	DBConnection db;
	
	public Seat() throws ClassNotFoundException, SQLException {
		db = new DBConnection();
	}
	
	public int isAvailable(String seatNumber, String movie) throws SQLException, ClassNotFoundException{
		db.pst = db.conn.prepareStatement("Select "+ seatNumber +" from mydb.SeatMap where ShowtimeID=(Select ShowtimeID from mydb.Showtime where MovieID=(Select ID from mydb.Movie where Title='"+ movie +"'));");
		db.rs = db.pst.executeQuery();
		db.rs.next();
		return db.rs.getInt(1);
	}//retrieveRow
	
	public String getSeat(int index) {
		return seats[index];
	}
}
