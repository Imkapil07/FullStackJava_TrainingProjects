<%@page import="LNCTProject.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%

String email = request.getParameter("email");
String password = request.getParameter("password");
String role = request.getParameter("role");


	int z=0;
	try{
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from info where email='"+email+"' and password='"+password+"' and role='"+role+"'");
	    while(rs.next()){ 
	    	z=1; 
	    	if(email.equals("management@gmail.com") && password.equals("man")){
	    		session.setAttribute("email", email);
		    	response.sendRedirect("Management.jsp");
	    	}else if(email.equals("legal@gmail.com") && password.equals("legal")){
	    		session.setAttribute("email", email);
		    	response.sendRedirect("Legal.jsp");
	    		
	    	}else if(email.equals("finance@gmail.com") && password.equals("finance")){
	    		session.setAttribute("email", email);
		    	response.sendRedirect("Finance.jsp");{	
	    	}
	    } 
	    if(z==0){
	    	response.sendRedirect("login.jsp?msg=notexits");
	    }}
	}catch(Exception e){
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=notexits");
	}

%>