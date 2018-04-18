package booking;

import account.User;

public class Checkout
{
	private User user;
	public int chargeAmt;
	
	public Checkout()
	{
		this.user = null;
	}
	
	public void setUser(User user)
	{
		this.user = user;
	}
	
	public User getUser()
	{
		return this.user;
	}
	
	public boolean validatePayment(CardInfo card)
	{
		return true;
	}
	
	public void applyPromo(Promotion promo)
	{
		if (promo.promoID == -1)
			return;
		
		this.chargeAmt -= promo.discount;
	}
}
