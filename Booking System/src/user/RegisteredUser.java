package user;

import java.util.ArrayList;

import booking.CardInfo;
import booking.Checkout;
import booking.Promotion;
import movieInfo.Ticket;

public class RegisteredUser extends User
{
	public RegisteredUser(int ID, String firstName, String lastName) {
		super(ID, firstName, lastName);
		// TODO Auto-generated constructor stub
	}

	String address;
	int phoneNumber;
	int age;
	CardInfo card;
	Checkout checkout;
	ArrayList<Ticket> selectedTickets;
	
	public boolean book(String promoCode)
	{
		if (promoCode != "")
		{
			Promotion promo = new Promotion(Integer.parseInt(promoCode));
			
			if (promo.promoID != -1)	//if promotion exist
			{
				checkout.applyPromo(promo);
			}
			else
			{
				return false;
			}
		}
		
		if (checkout.validatePayment(card))
		{
			//create new booking with selected tickets in database
		}
		else
			return false;
		
		return true;
	}
	
	public void selectTicket(Ticket ticket)
	{
		selectedTickets.add(ticket);
	}
	
	public void subscribe()
	{
		
	}
	
	public void browse()
	{
		//show browse page
	}
	
	public void filter(String movieName, int year)
	{
		//show browse page with filter applied
	}
	
	public void search(String movieName)
	{
		//show search result page
	}
}
