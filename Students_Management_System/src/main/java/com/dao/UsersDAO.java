package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsersDAO {
	private static final String url = "jdbc:mysql://localhost:3306/login";
	private static final String user = "root";
	private static final String password = "Mysql@24";
	
	static String insertQuery = "insert into users(first_name, last_name, email, username, pass) values(?,?,?,?,?)";
	static String userExistsQuery = "select * from users where username=? or email=?";
	static String loginQuery = "select * from users where username=? and pass=?";

	// Utility method to load the JDBC driver and get a connection
	private Connection getConnection() {
	    Connection conn = null;
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        conn = DriverManager.getConnection(url, user, password);
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }
	    return conn;
	}
	
	// Method to check if the user exists (by username or email)
	public boolean userExists(String username, String email) {
		try (Connection connection = getConnection();
		     PreparedStatement preparedStatement = connection.prepareStatement(userExistsQuery)) {
			
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, email);
			
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				return resultSet.next();  // If a record is found, the user exists
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Method to register a new user
	public boolean register(String first_name, String last_name, String email, String username, String pass) {
		try (Connection connection = getConnection();
		     PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
			
			preparedStatement.setString(1, first_name);
			preparedStatement.setString(2, last_name);
			preparedStatement.setString(3, email);
			preparedStatement.setString(4, username);
			preparedStatement.setString(5, pass);
			
			int rowsAffected = preparedStatement.executeUpdate();
			return rowsAffected > 0;  // Return true if at least one row was affected
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Method for login (verifying username and password)
	public boolean login(String username, String pass) {
		try (Connection connection = getConnection();
		     PreparedStatement preparedStatement = connection.prepareStatement(loginQuery)) {
			
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, pass);
			
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				return resultSet.next();  // Return true if a record is found
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean usernameExists(String username) {
		String usernameQuery = "select * from users where username=?";
		try (Connection connection = getConnection();
		     PreparedStatement preparedStatement = connection.prepareStatement(usernameQuery)) {
			
			preparedStatement.setString(1, username);
			
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				return resultSet.next();  // If a record is found, the user exists
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}