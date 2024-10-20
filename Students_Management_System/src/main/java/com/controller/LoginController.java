package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.UsersDAO;

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out= response.getWriter();
		
		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		
		UsersDAO dao = new UsersDAO();
		
		if(dao.login(username, pass)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			
			response.sendRedirect("welcome.jsp");
		}
		else if(dao.usernameExists(username)) {
			out.print("Password Incorrect");
		}
		else {
			out.print("Incorrect details");
		}
	}
}
