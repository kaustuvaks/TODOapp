package com.app.helper;

//import com.mysql.jdbc.Driver;
import java.sql.*;
public class ConnectionProvider {
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			if(con==null) {
				
				System.out.println("Trying connection");
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/javablog","root","12345");
			}
		}catch(Exception sqle){
			sqle.printStackTrace();
		}
		return con;
	}

}
