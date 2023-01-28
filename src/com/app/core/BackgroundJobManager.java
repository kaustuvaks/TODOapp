package com.app.core;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.app.helper.ConnectionProvider;
import com.app.helper.SendMail;


@WebListener
public class BackgroundJobManager implements ServletContextListener {

    private ScheduledExecutorService scheduler;
	Runnable Mailer = new Runnable() {
		@Override
		public void run() {
			long millis = System.currentTimeMillis();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String timeETA = df.format(millis);
			
			try {
				Statement statement = ConnectionProvider.getConnection().createStatement();
				ResultSet result = statement.executeQuery("SELECT * FROM tasks WHERE status=1;");
				System.out.println("Got results");
				
				while(result.next()) {
				    String resDate = result.getString("task_created");
				    String tid = result.getString("task_id");
				    
				    if(timeETA.compareTo(resDate) > 0) {
				    	int rows = statement.executeUpdate("UPDATE tasks SET status = 2 WHERE task_id="+tid+";");
				    	System.out.println("Committing on "+rows+" rows.");
				    }
				}
				statement.close();                                                 
			} catch (SQLException  e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	};
	
	Runnable job2 = new Runnable() {
		@Override
		public void run() {
			
			try {
				long millis = System.currentTimeMillis();
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date timeETA = df.parse(df.format(millis));
					Statement statement = ConnectionProvider.getConnection().createStatement();
					ResultSet result = statement.executeQuery("SELECT * FROM tasks WHERE status=1;");
					System.out.println("Got results");
					
					while(result.next()) {
					    String resDate = result.getString("task_created");
					    String kk = result.getString("fk_user");
					    String tname = result.getString("task_name");
						
				    	Date startTime = df.parse(resDate);
					    long duration = startTime.getTime() - timeETA.getTime();
					    long hours = TimeUnit.MILLISECONDS.toHours(duration);
					    long minutes = TimeUnit.MILLISECONDS.toMinutes(duration) % 60;
					    
					    if(hours == 0 && minutes>0) {
					    	Statement statement2 = ConnectionProvider.getConnection().createStatement();
					    	ResultSet newResult = statement2.executeQuery("SELECT * FROM users WHERE uid = "+kk+";");
					    	
					    	if(newResult.next()) {
						    	String address = newResult.getString("email");
						    	System.out.println("Sending mail to "+address);
						    	SendMail.sendMail(address, tname);
					    	}
					    }
					}
					
					statement.close();
			} catch (SQLException | ParseException  e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	};
//
    @Override
    public void contextInitialized(ServletContextEvent event) {
    	scheduler = Executors.newScheduledThreadPool(2);
        scheduler.scheduleAtFixedRate(job2, 1, 20, TimeUnit.MINUTES);
        scheduler.scheduleAtFixedRate(Mailer, 0, 5, TimeUnit.SECONDS);
    }
//
    @Override
    public void contextDestroyed(ServletContextEvent event) {
        scheduler.shutdownNow();
    }

}