package CURDoperation.portlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class user {

			public static void insertUser(String screenName, String emailAddress, String firstName, String middleName,
					String lastName, String jobTitle, String comments, boolean gen, long userid) {	
				
				System.out.println(" "+screenName);
				System.out.println(" "+userid);
				try {
					Connection con=null;
					con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/axx_custom","postgres","axxonet");
					System.out.println("data base connection is estabilshed");					
					
					String sql="insert into users values (?,?,?,?,?,?,?,?,?); ";
			
					PreparedStatement stmt=con.prepareStatement(sql);	
					stmt.setLong(1, userid);
					stmt.setString(2, screenName);
					stmt.setString(3, emailAddress);
					stmt.setString(4, firstName);
					stmt.setString(5, middleName);
					stmt.setString(6, lastName);
					stmt.setString(7, jobTitle);
					stmt.setString(8, comments);
					stmt.setBoolean(9, gen);				
					stmt.execute();
					System.out.println("value inserted succesfuly");
					stmt.close();
					con.close();
									
				}catch(SQLException e) {
					System.out.println(e.getMessage());
				}
			}

			public static void deleteUser(long userid) {				

				try {		
					Connection con=null;
					con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/axx_custom","postgres","axxonet");
					System.out.println("data base connection is estabilshed");
					
					String query="delete from users where userid='"+userid+"'";							
					PreparedStatement stmt=con.prepareStatement(query);			
					stmt.execute();
					System.out.println("Deleted succesfully");
					stmt.close();
					con.close();	
					
				}catch(SQLException e) {
					System.out.println(e.getMessage());
				}				 
			}

			public static void updateUser(String screenname, String email, String firstname, String middlename,
					String lastname, String jobTitle, String comments, boolean gen, long userId) {
				
				try {		
					Connection con=null;
					con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/axx_custom","postgres","axxonet");
					System.out.println("data base connection is succesfuly");
					
					String query="update users set screenname='"+screenname+"',emailaddress='"+email+"',firstname='"+firstname+"',middleName='"+middlename+"',lastName='"+lastname+"',jobtitle='"+jobTitle+"',comments='"+comments+"',gen='"+gen+"' where userid='"+userId+"'";
					PreparedStatement stmt=con.prepareStatement(query);				
					stmt.execute();
					System.out.println("updated succesfuly");
					stmt.close();
					con.close();			
					
				}catch(SQLException e) {
					System.out.println(e.getMessage());
				}			
			}

}
