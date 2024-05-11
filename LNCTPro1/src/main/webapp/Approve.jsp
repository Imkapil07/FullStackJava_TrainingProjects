<%@page import="LNCTProject.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%

String id = request.getParameter("request_id");
String person=session.getAttribute("email").toString();
String sql = "UPDATE approval SET status = ?, approval_date = ?, approval_person = ? WHERE request_id = ?";
Date currentDate = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String dateTime = dateFormat.format(currentDate);



	try{
		Connection con = ConnectionProvider.getCon();
		PreparedStatement preparedStatement = con.prepareStatement(sql);
		preparedStatement.setString(1, "Approve");
        preparedStatement.setString(2, dateTime);
        preparedStatement.setString(3, person);
        preparedStatement.setString(4, id);
        int rowsUpdated = preparedStatement.executeUpdate();
        response.sendRedirect("Legal.jsp");
	}catch(Exception e){
		System.out.println(e);
		response.sendRedirect("Legal.jsp");
	}
%>
