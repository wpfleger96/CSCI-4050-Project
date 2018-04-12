package user;

import java.sql.SQLException;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import config.DBConnection;
import config.hibernateUtil;

public class User {
	int id;
	String type;
	String firstName;
	String lastName;
	String password;
	String email;
	String phone;
	
	private static SessionFactory factory = hibernateUtil.getSessionFactory();
	
	public User(int ID, String firstName, String lastName) {
		this.type = "New";
	}
			
	public Integer addUser(int id, String firstName, String lastName) {
		Session session = factory.openSession();
		Transaction tx = null;
		Integer userID = null;	
	
		try {
			tx = session.beginTransaction();
			User newUser = new User(id, firstName, lastName);
			userID = (Integer)session.save(newUser);
			tx.commit();
		} catch(HibernateException e) {
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}	
		return userID;
	}// addUser

	public User getUser(Integer userID) {
		Session session = factory.openSession();
		User user = null;
		
		try {
			user = (User)session.get(User.class, userID);
		} catch(HibernateException e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return user;
	}// getStudent

	public void deleteUser(Integer userID) {
		Session session = factory.openSession();
		Transaction tx = null;
		
		try {
			tx = session.beginTransaction();
			User user = (User)session.get(User.class, userID);
			session.delete(user);
			tx.commit();
		} catch(HibernateException e) {
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
	}// deleteUser

	public void updateFirstName(Integer userID, String firstName) {
		Session session = factory.openSession();
		Transaction tx = null;
		
		try { 
			tx = session.beginTransaction();
			User user = (User)session.get(User.class, userID);
			
			user.setFirstName(firstName);
			session.update(user);
			
			tx.commit();
		} catch(HibernateException e) {
			if(tx != null) tx.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
	}// updateFirstName
			
	// Searches for movie. Returns true if it already exists, false if not.
	public boolean searchUser(String email) throws SQLException{
		boolean exists = false;
	
		DBConnection.pst = DBConnection.conn.prepareStatement("SELECT * FROM movieChart");
		DBConnection.rs = DBConnection.pst.executeQuery();
	
		while(DBConnection.rs.next()){
			String userName = DBConnection.rs.getString(1);
			if(userName.equalsIgnoreCase(email)){
				exists = true;
				break;
			}//if
		}//while
		return exists;
	}//searchMovie
	
	boolean login(String email, String password) throws SQLException {
		DBConnection.pst = DBConnection.conn.prepareStatement("SELECT * FROM users WHERE EmailAddr=? AND Password=?");
		
		try {
			DBConnection.pst.setString(1, email);
			DBConnection.pst.setString(2, password);
			
			DBConnection.rs = DBConnection.pst.executeQuery();
			
			while (DBConnection.rs.next()) {
				this.id = DBConnection.rs.getInt("ID");
				this.firstName = DBConnection.rs.getString("FirstName");
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
