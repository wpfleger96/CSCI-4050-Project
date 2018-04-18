package booking;

public class Auditorium
{
	public int audId;
	public int seatNum;
	public Seat seats[][];
	
	public Auditorium(int audId)
	{
		//load Aud from database
	}
	
	public boolean bookSeat(String seat, int userId)
	{
		String[] tokens = seat.split(":");
		int row = Integer.parseInt(tokens[0]);
		int col = Integer.parseInt(tokens[1]);
		
		if (seats[row][col].reservedUserId != -1)
			return false;
		
		seats[row][col].reservedUserId = userId;
		updateSeatsDB();
		return true;
	}
	
	public void unbookSeat(String seat, int userId)
	{
		String[] tokens = seat.split(":");
		int row = Integer.parseInt(tokens[0]);
		int col = Integer.parseInt(tokens[1]);
		
		if (seats[row][col].reservedUserId == -1)
			return;
		
		seats[row][col].reservedUserId = -1;
		updateSeatsDB();
	}
	
	private void updateSeatsDB()
	{
		//write seats[][] to DB
	}
}
