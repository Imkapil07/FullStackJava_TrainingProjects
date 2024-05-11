package LNCTProject;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
   public static Connection getCon() {
	   try { 
		   Class.forName("com.mysql.jdbc.Driver");
		   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lnctpro1","root","7489");
		   return con;
	   }catch(Exception e) {
		   System.out.println(e);
		   return null;
	   }
   }
}

