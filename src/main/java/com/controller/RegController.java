package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.UsersDAO;

public class RegController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out= response.getWriter();
		
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String username= request.getParameter("username");
		String pass= request.getParameter("pass");
		String cpass= request.getParameter("cpass");
		
		UsersDAO dao = new UsersDAO();
		
		if(!pass.equals(cpass)) {
			out.print("Password did not match!");
			return;
		} 
		else if (dao.userExists(username, email)) {
			out.print("Username or email already used.");
			return;
		}
		else if(dao.register(first_name, last_name, email, username, cpass)){
			out.print("Registration successful.");
		}
		else {
			out.print("Registration failed");
		}
	}
}
