package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.dao.StudentsDAO;
import com.model.Students;

public class ShowStudentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudentsDAO studentsDAO = new StudentsDAO();
		List<Students> stdList = studentsDAO.getAllData();
		
		HttpSession session = request.getSession();
		session.setAttribute("stdList", stdList);
		
//		System.out.println(stdList);
		response.sendRedirect("students.jsp");
	}
}
