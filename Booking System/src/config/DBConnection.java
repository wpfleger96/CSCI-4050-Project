package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	public static Connection conn;
	public static Statement stmt;
	public static PreparedStatement pst;
	public static ResultSet rs;
	
	public DBConnection() throws SQLException, ClassNotFoundException {
		Class.forName("org.mariadb.jdbc.Driver");
		openConnection();
	}// constructor
	
	public void openConnection() throws SQLException {
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb?user=root&password=root");
		
	}	
}// DBConnection