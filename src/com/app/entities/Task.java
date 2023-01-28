package com.app.entities;

public class Task {
	private String TaskName;
	private String TimeStamp;
	private String uid;
	
	public Task(String taskName, String timeStamp, String id) {
		super();
		TaskName = taskName;
		TimeStamp = timeStamp;
		uid = id;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getTaskName() {
		return TaskName;
	}
	public void setTaskName(String taskName) {
		TaskName = taskName;
	}
	public String getTimeStamp() {
		return TimeStamp;
	}
	public void setTimeStamp(String timeStamp) {
		TimeStamp = timeStamp;
	}
}
