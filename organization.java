package CURDoperation.portlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class organization {

			public static void insertorganization(long orgId, String orgname, int countryId) {
				try
				{
					Connection con=null;
					con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/axx_custom","postgres","axxonet");
					System.out.println("data base connection is estabilshed");
					
					String sql="insert into organization values (?,?,?); ";
					PreparedStatement stmt=con.prepareStatement(sql);
					System.out.println("inserted data succesfully");
					stmt.setLong(1, orgId);
					stmt.setString(2, orgname);
					stmt.setInt(3, countryId);
					stmt.execute();
					stmt.close();
					con.close();
					
				}catch(SQLException e) {
					System.out.println(e.getMessage());
				}
				
			}

			public static void deleteorganization(long organizationId) {

				try {				
					Connection con=null;
					con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/axx_custom","postgres","axxonet");
					System.out.println("data base connection is succesfully");
					System.out.println(" "+organizationId);
					String query="delete from organization where orgid=?";							
					PreparedStatement stmt=con.prepareStatement(query);
					stmt.setLong(1, organizationId);
					stmt.executeUpdate();
					System.out.println("Deleted succesfully");
					stmt.close();
					con.close();
					
				}catch(SQLException e) {
					System.out.println(e.getMessage());
				}
			}
			
			public static void updateorganization(long uporganizationId, String name, int countryId) {				
				
				try {					
					Connection con=null;
					con =DriverManager.getConnection("jdbc:postgresql://localhost:5432/axx_custom","postgres","axxonet");
					System.out.println("data base connection is estabilshed");
		
					String query="update organization set name=?, countryid=? where orgid="+uporganizationId;
					PreparedStatement stmt=con.prepareStatement(query);
					stmt.setString(1, name);
					stmt.setInt(2, countryId);
					stmt.executeUpdate();
					stmt.close();
					con.close();
					System.out.println("updated succesfuly");
					
				}catch(SQLException e) {
					System.out.println(e.getMessage());
				}			
			}

}
