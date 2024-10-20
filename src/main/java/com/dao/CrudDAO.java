package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Students;

public class CrudDAO {
	private static final String url="jdbc:mysql://localhost:3306/mydb";
	private static final String user="root";
	private static final String pass="Mysql@24";
	
	String deleteQuery= "DELETE FROM students WHERE id=?";
	String createQuery= "INSERT INTO students(name, age, marks) VALUES(?,?,?)";
	String readQuery= "SELECT * FROM students WHERE id=?";
	String updateQuery= "UPDATE students SET name=?, age=?, marks=? WHERE id=?";

	private Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url,user,pass);
			
		} catch (ClassNotFoundException|SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	public boolean deleteStudent(int id) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement=connection.prepareStatement(deleteQuery); ) {
			
			preparedStatement.setInt(1, id);
			int rowsAffected = preparedStatement.executeUpdate();
			if(rowsAffected>0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean createStudent(String name, int age, double marks) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement=connection.prepareStatement(createQuery); ) {
			
			preparedStatement.setString(1, name);
			preparedStatement.setInt(2, age);
			preparedStatement.setDouble(3, marks);
			
			int rowsAffected = preparedStatement.executeUpdate();
			if(rowsAffected>0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Students readStudent(int id, Students studs) {
		try(Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(readQuery);){
			
			preparedStatement.setInt(1, id);
			
			ResultSet rs= preparedStatement.executeQuery();
			if(rs.next()) {
				studs.setId(rs.getInt("id"));
				studs.setName(rs.getString("name"));
				studs.setAge(rs.getInt("age"));
				studs.setMarks(rs.getDouble("marks"));
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
		return studs;
	}
	
	public boolean updateStudent(int id, String name, int age, double marks) {
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);) {
			
			preparedStatement.setString(1, name);
			preparedStatement.setInt(2, age);
			preparedStatement.setDouble(3, marks);
			preparedStatement.setInt(4, id);
			
			int rowsAffected=preparedStatement.executeUpdate();
			if(rowsAffected>0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
