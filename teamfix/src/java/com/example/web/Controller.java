/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, String> actionMap = new HashMap<String, String>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() { //whatever ?action=something we give map it to a jsp
		// Build a Map of action parameters to pages

            
            
		actionMap.put("sign_up", "/sign_up.jsp");
                actionMap.put("sign_up1", "/sign_up.jsp");
		actionMap.put("home", "/index.jsp");
                actionMap.put("how_to_use", "/how_to.jsp");
                actionMap.put("About", "/about.jsp");
                actionMap.put("student_home", "/student_home.jsp");
                actionMap.put("result", "/result.jsp");
                
                 
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	private void doForward(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// Get the action parameter
		String action = request.getParameter("action");

		// If the action parameter is null or the map doesn't contain
		// a page for this action, set the action to the home page
		if (action == null || !actionMap.containsKey(action))
			action = "home";

		// Forward to the requested page.
		request.getRequestDispatcher(actionMap.get(action)).forward(request,
				response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		doForward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		doForward(request, response);
	}

}
