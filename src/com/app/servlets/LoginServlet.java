package com.app.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.dao.UserDao;
import com.app.entities.User;
import com.app.entities.Message;
import com.app.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     * 
     * 
     */
	
    public void LoginServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	PrintWriter out = response.getWriter();
        String email = request.getParameter("userEmail");
        String password = request.getParameter("userPassword");
        User user = null;
        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        
        user = dao.getUserByEmailAndPassword(email, password);
        if(user != null) {
        	System.out.println(user);
        	HttpSession s = request.getSession();
        	s.setAttribute("currentUser", user);
        	out.println(user);
        	response.sendRedirect("profile.jsp");	
        }else {
        	Message msg = new Message("Username or Password is Invalid!!! Try Again", "error", "alert-danger");
        	HttpSession ems = request.getSession();
        	ems.setAttribute("message", msg);
        	response.sendRedirect("signup.jsp");
        }
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LoginServlet(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LoginServlet(request,response);
	}

}
