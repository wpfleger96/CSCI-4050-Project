package account;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import config.DBConnection;

public class User {
	int id;
	public String firstName, lastName, password, email, phone, type, verified, promo, login;
	DBConnection db;
	
	public User() throws ClassNotFoundException, SQLException {
		db = new DBConnection();
	}
			
	public Integer addUser(String firstName, String lastName, String email, String password, String promo, String street, String city, String state) throws SQLException, ClassNotFoundException {
		Integer userID = null;	
	
		if(searchUser(email) == false){
			db.stmt = db.conn.createStatement();
			String query = "insert into mydb.Users " + "(FirstName, LastName, EmailAddr, Type, Password, Verified, SendPromo) " + 
					"values ('"+firstName+"','"+lastName+"','"+email+"','2', '"+password+"','No', '"+ promo +"')";
			db.stmt.executeUpdate(query);
			db.pst = db.conn.prepareStatement( "select ID from mydb.Users where EmailAddr='" + email+"'");
			db.rs = db.pst.executeQuery();
			db.rs.next();
			userID = db.rs.getInt(1);
			query = "insert into mydb.Address " + "(UserID, Street, City, State) " + 
					"values ('"+userID+"','"+street+"','"+city+"','"+state+"')";
			db.stmt.executeUpdate(query);
		}

		return userID;
	}// addUser
			
	// Searches for movie. Returns true if it already exists, false if not.
	public boolean searchUser(String userEmail) throws SQLException, ClassNotFoundException{
		boolean exists = false;
				
		db.pst = db.conn.prepareStatement("SELECT * FROM mydb.Users");
		db.rs = db.pst.executeQuery();
		
		if(db.rs == null) {
			return exists;
		}
		
		while(db.rs.next()){
			String dbEmail = db.rs.getString(1);
			if(dbEmail.equalsIgnoreCase(userEmail)){
				exists = true;
				break;
			}//if
		}//while
		
		return exists;
	}//searchMovie
	
	public boolean login(String email, String password, HttpSession session) throws SQLException, ClassNotFoundException {
		db.pst = db.conn.prepareStatement("SELECT * FROM mydb.Users WHERE EmailAddr='"+email+"' AND Password='"+ password +"'");
		db.rs = db.pst.executeQuery();
		db.rs.next();
		if(!db.rs.isLast()) {
			return false;
		} else {
			
			this.id = db.rs.getInt("ID");
			session.setAttribute("userId", this.id);
			this.firstName = db.rs.getString("FirstName");
			this.lastName = db.rs.getString("LastName");
			this.phone = db.rs.getString("Phone");
			this.type = db.rs.getString("Type");
			return true;
		} 	
	}// login
	

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() throws SQLException {
		try {
			db.pst = db.conn.prepareStatement("SELECT Description FROM mydb.UserTypes  WHERE TypeID="+ type +" ");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.rs = db.pst.executeQuery();
		db.rs.next();
		type = db.rs.getString(1);
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}
	
	public String getPassword(String email) throws ClassNotFoundException, SQLException {
		db.pst = db.conn.prepareStatement("SELECT Password FROM mydb.Users where EmailAddr='"+ email +"'");
		db.rs = db.pst.executeQuery();
		db.rs.next();
		if(!db.rs.isLast()) {
			return db.rs.getString("Password");
		} else {
			return db.rs.getString("Password");
		} 	
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getVerified() {
		return verified;
	}

	public void setVerified(String verified) {
		this.verified = verified;
	}

	public String getPromo() {
		return promo;
	}

	public void setPromo(String promo) {
		this.promo = promo;
	}
}// Users
