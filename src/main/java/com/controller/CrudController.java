package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.CrudDAO;
import com.model.Students;

public class CrudController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action= request.getParameter("action");
		int id= Integer.parseInt(request.getParameter("id"));
		
		HttpSession session = request.getSession();
		Students std = new Students();
		
		CrudDAO dao = new CrudDAO();
		
		if(action!=null) {
			
			switch (action){
			case "delete":
				dao.deleteStudent(id);
				response.sendRedirect("showStudents");
				break;
				
			case "read":
				dao.readStudent(id,std);
				session.setAttribute("id", std.getId());
				session.setAttribute("name", std.getName());
				session.setAttribute("age", std.getAge());
				session.setAttribute("marks", std.getMarks());
				response.sendRedirect("view.jsp");
				break;
				
			case "update":
				dao.readStudent(id,std);
				session.setAttribute("id", std.getId());
				session.setAttribute("name", std.getName());
				session.setAttribute("age", std.getAge());
				session.setAttribute("marks", std.getMarks());
				response.sendRedirect("update.jsp");
				break;
			}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String action = request.getParameter("action");
		String name= request.getParameter("name");
		int age= Integer.parseInt(request.getParameter("age"));
		double marks = Double.parseDouble(request.getParameter("marks")); 
		
		CrudDAO dao = new CrudDAO();
		
		if(action!=null) {
			
			switch (action) {
			case "create":
				dao.createStudent(name, age, marks);
				response.sendRedirect("showStudents");
				break;	
				
			case "updatecommit":
				int id = Integer.parseInt(request.getParameter("id"));
				
				dao.updateStudent(id, name, age, marks);
				response.sendRedirect("showStudents");
			}
		}
	}
}
