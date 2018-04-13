package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	public  Connection conn;
	public  Statement stmt;
	public  PreparedStatement pst;
	public  ResultSet rs;
	
	public DBConnection() throws SQLException, ClassNotFoundException {
		Class.forName("org.mariadb.jdbc.Driver");
		openConnection();
	}// constructor
	
	public void openConnection() throws SQLException {
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mydb?user=root&password=root");
	}	
}// DBConnection