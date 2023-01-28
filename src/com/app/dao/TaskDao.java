package com.app.dao;

import java.sql.*;

import com.app.entities.Task;

public class TaskDao {
	private Connection con;

	public TaskDao(Connection con) {
		this.con = con;
	}
	
	public boolean AddTask(Task task) {
			
		boolean f = false;
		try {
			String query = "INSERT INTO tasks(task_name,task_created,fk_user) VALUES (?,?,?);";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, task.getTaskName());
			pstmt.setString(2, task.getTimeStamp());
			pstmt.setString(3, task.getUid());
			
			pstmt.executeUpdate();
			f = true;
		}catch(Exception e) {
			System.out.println("TASKDAO");
			e.printStackTrace();
		}
		
		return f;
	}
	
}
