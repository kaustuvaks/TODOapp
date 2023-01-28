package com.app.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import com.app.dao.UserDao;
import com.app.entities.Message;
import com.app.entities.User;
import com.app.helper.ConnectionProvider;

import java.text.SimpleDateFormat;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public void RegisterServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated constructor stub
    	
    	JspWriter out;
    	
    	long time = System.currentTimeMillis();
    	SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    	System.out.println(df);
    	String timeStamp = df.format(time);
    	String firstName = request.getParameter("userFirstName");
    	String lastName = request.getParameter("userLastName");
    	String password = request.getParameter("userPassword");
    	String email = request.getParameter("userEmail");
    	
    	
    	User user = new User(firstName,lastName,email, password,timeStamp);
    	UserDao dao = new UserDao(ConnectionProvider.getConnection());
    	
    	if(dao.saveUser(user)) {
    		System.out.println("done");
    		Message msg = new Message("Registered Successfully Welcome Onbord.", "error", "alert-success");
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
		RegisterServlet(request, response);
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
