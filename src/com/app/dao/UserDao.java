package com.app.dao;

import java.sql.*;
import java.time.format.DateTimeFormatter;

import com.app.entities.*;

public class UserDao {
	
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		
		boolean f = false;
		try {
			String query = "INSERT INTO users(first_name, last_name, email, password, date) VALUES (?,?,?,?,?) ";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, user.getFirstName());
			pstmt.setString(2, user.getLastName());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPassword());
//			pstmt.setString(5, user.getTimestamp().toLocalDateTime().format(DateTimeFormatter.ofPattern("yyyyMMdd hh:mm:ss")));
//			System.out.println(user.getTimestamp());
			pstmt.setString(5, user.getTimestamp());
			
			pstmt.executeUpdate();
			f = true;
		}catch(Exception e) {
			System.out.println("DAOUSER");
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User getUserByEmailAndPassword(String email, String password) {
		boolean f = false;
		User user = null;
		
		String query = "SELECT * FROM users WHERE email=? and password=?";
		 
		try (PreparedStatement pstmt = con.prepareStatement(query);){
			pstmt.setString(1,email);
			pstmt.setString(2,password);
			
			ResultSet set = pstmt.executeQuery();
			if(set.next() && set!=null) {
				user = new User();
				
				user.setFirstName(set.getString("first_name"));
				user.setLastName(set.getString("last_name"));
				user.setId(Integer.valueOf(set.getString("uid")));
				user.setEmail(set.getString("email"));
				user.setTimestamp(set.getString("date"));
				
				System.out.println(user);	
			}
					
		}catch(Exception e) {
			System.out.println("LoginDAO");
			e.printStackTrace();
		}
		
		return user;
	}
}
