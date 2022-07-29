package CURDoperation.portlet;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDB {
public static void main(String[] args) {
		
	ConnectionDB obj_ConnectDB=new ConnectionDB();
	
	System.out.println(((ConnectionDB) obj_ConnectDB).get_connection());
}

	public Connection get_connection() {
		
		Connection connection=null;
		
		try {
			
			Class.forName("org.postgresql.Driver");
			connection=(Connection) DriverManager.getConnection("jdbc:postgresql://localhost:5432/axx_custom","postgres","axxonet");
			
			if(connection!=null) {
				System.out.println("connection is ok");
			}else {
				System.out.println("connection is Fail");
			}
					
		} catch (Exception e) {
			System.out.println(e);
		}
	
		return connection;
	}

}
