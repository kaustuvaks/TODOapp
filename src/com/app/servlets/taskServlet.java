package com.app.servlets;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.app.entities.User;
import com.app.helper.ConnectionProvider;
import com.app.dao.TaskDao;
import com.app.dao.UserDao;
import com.app.entities.Message;
import com.app.entities.Task;

/**
 * Servlet implementation class taskServlet
 */
@WebServlet("/taskServlet")
public class taskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public taskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String taskName = request.getParameter("taskName");
		String taskDate = request.getParameter("taskTime");
		taskDate = Timestamp.valueOf(taskDate.replace("T"," ")).toString();
		taskDate = taskDate.substring(0,taskDate.length()-2);
		System.out.println(taskDate+" nova");

		HttpSession sess = request.getSession();
		String id = Integer.toString(((User)(sess.getAttribute("currentUser"))).getId());
		
		Task task = new Task(taskName, taskDate, id);
		TaskDao dao = new TaskDao(ConnectionProvider.getConnection());
		
		if(dao.AddTask(task)) {
			Message msg = new Message("Task Successfully added!!", "error","alert-success");
			sess.setAttribute("global", msg);
		}else {
			Message msg = new Message("Task Addition Failed!!", "error","alert-danger");
			sess.setAttribute("global", msg);
		}
		response.sendRedirect("profile.jsp");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
