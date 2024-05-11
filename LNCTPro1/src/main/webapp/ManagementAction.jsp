<%@page import="LNCTProject.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<% 
String person=session.getAttribute("email").toString(); 
String title = request.getParameter("title");
String desc = request.getParameter("description");
String dept = request.getParameter("dept"); 

Date currentDate = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String dateTime = dateFormat.format(currentDate);


 try{
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("INSERT INTO approval (title,description, request_by ,request_dept,request_date) VALUES (?, ?, ?, ?, ?)");	
	ps.setString(1, title);
	ps.setString(2, desc);
	ps.setString(3, person);
	ps.setString(4, dept);
	ps.setString(5, dateTime);
	ps.executeUpdate(); 
	response.sendRedirect("Management.jsp?msg=valid");
	
 }catch(Exception e){
	 System.out.println(e);
	 response.sendRedirect("Management.jsp?msg=invalid");
 }  
 %>
 