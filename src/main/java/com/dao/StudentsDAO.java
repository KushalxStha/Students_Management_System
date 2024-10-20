package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Students;

public class StudentsDAO {
	private static final String url="jdbc:mysql://localhost:3306/mydb";
	private static final String user="root";
	private static final String pass="Mysql@24";
	
	String query = "SELECT * FROM STUDENTS";
	
	public List<Students> getAllData(){
		List<Students> stdList = new ArrayList<Students>();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection connection = DriverManager.getConnection(url,user,pass);
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			
			ResultSet rSet= preparedStatement.executeQuery();
			while(rSet.next()) {
				Students std = new Students();
				std.setId(rSet.getInt("id"));
				std.setName(rSet.getString("name"));
				std.setAge(rSet.getInt("age"));
				std.setMarks(rSet.getDouble("marks"));
				
				stdList.add(std);
			}
		} 
		catch (ClassNotFoundException |SQLException  e) {
			e.printStackTrace();
		}
		
		return stdList;
	}
}
