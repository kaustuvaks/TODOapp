package com.app.entities;

//import java.sql.Timestamp;
public class User {
	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String timestamp;
	private String profile;
	
	
	public User(String firstName, String lastName, String email, String password, String timestamp,String profile) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.timestamp = timestamp;
		this.profile = profile;
	}
	public User(String firstName, String lastName, String email, String password, String timestamp) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.timestamp = timestamp;
	}
	
	public User() {}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setId(int id) {
		this.id =  id;
	}
	public int getId() {
		return id;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp=timestamp;
	}
	public void String(String timestamp) {
		this.timestamp = timestamp;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	@Override
	public String toString() {
		return "["+this.id+" "+this.firstName+" "+this.email+" "+this.timestamp+"]";
	}
}
