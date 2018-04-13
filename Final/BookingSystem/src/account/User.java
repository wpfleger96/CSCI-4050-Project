package account;

import java.sql.SQLException;
import config.DBConnection;

public class User {
	int id;
	String type;
	String firstName;
	String lastName;
	String password;
	String email;
	String phone;

	public User() {
		
	}
			
	public Integer addUser(String firstName, String lastName, String email, String password) throws SQLException, ClassNotFoundException {
		DBConnection db = new DBConnection();
		Integer userID = null;	
	
		if(searchUser(email) == false){
			db.stmt = db.conn.createStatement();
			String query = "insert into mydb.Users " + "(FirstName, LastName, EmailAddr, Password) " + 
					"values ('"+firstName+"','"+lastName+"','"+email+"', '"+password+"')";
			db.stmt.executeUpdate(query);
			db.pst = db.conn.prepareStatement( "select ID from mydb.Users where EmailAddr='" + email+"'");
			db.rs = db.pst.executeQuery();
		}
		db.rs.next();
		userID = db.rs.getInt(1);
		return userID;
	}// addUser
			
	// Searches for movie. Returns true if it already exists, false if not.
	public boolean searchUser(String userEmail) throws SQLException{
		boolean exists = false;
	
		return exists;
		/*
		DBConnection.pst = DBConnection.conn.prepareStatement("SELECT * FROM mydb.Users");
		DBConnection.rs = DBConnection.pst.executeQuery();
		
		if(DBConnection.rs == null) {
			return exists;
		}
		
		while(DBConnection.rs.next()){
			String dbEmail = DBConnection.rs.getString(1);
			if(dbEmail.equalsIgnoreCase(userEmail)){
				exists = true;
				break;
			}//if
		}//while
		
		return exists; */
	}//searchMovie
	
	boolean login(String email, String password) throws SQLException, ClassNotFoundException {
		DBConnection db = new DBConnection();
		db.pst = db.conn.prepareStatement("SELECT * FROM users WHERE EmailAddr=? AND Password=?");
		
		try {
			db.pst.setString(1, email);
			db.pst.setString(2, password);
			
			db.rs = db.pst.executeQuery();
			
			while (db.rs.next()) {
				this.id = db.rs.getInt("ID");
				this.firstName = db.rs.getString("FirstName");
				this.email = email;
				this.password = password;
				
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
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

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}// Users
