package movieInfo;

import java.util.Random;

public class Ticket {
	public int ticketNum;
	String date = "";
	String time = "";
	double price = 0;
	String seat = "";
	String movieName = "";
	int seatSize = 0;
	int adult = 0;
	int child = 0;
	int senior = 0;
	
	public Ticket() {
		
	}
	
	
	
	public int getAdult() {
		return adult;
	}



	public void setAdult(String adult) {
		if(adult != null) {
			this.adult = Integer.parseInt(adult);
		}	
	}



	public int getChild() {
		return child;
	}



	public void setChild(String child) {
		if(child != null) {
		this.child = Integer.parseInt(child);
	}
	}



	public int getSenior() {
		return senior;
	}



	public void setSenior(String senior) {
		if(senior != null) {
		this.senior = Integer.parseInt(senior);
		}
	}



	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice() {
		int totalTickets = adult + child + senior;
		price = totalTickets * 9;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public int getSeatSize() {
		return seatSize;
	}

	public void setSeatSize(int seatSize) {
		this.seatSize = seatSize;
	}

	public void setTicketNum(int ticketNum) {
		this.ticketNum = ticketNum;
	}
	public int getTicketNum()
	{
		Random rand = new Random();
		return rand.nextInt(1000000);
	}
}
