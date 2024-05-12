<%@page import="LNCTProject.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LEGAL</title>
<style>
  .centr {
    text-align: center;
  } 
  .logout {
    display: block;
    text-align: center;
    margin-top: 20px; 
    color: #007bff;
    text-decoration: none;
  }
  .parent-container {
    margin-top: 20px;
    display: flex;
    justify-content: space-between;
  }
  .table-container {
     margin-top: 20px;
    width: 190%; 
    height: 1000px; 
    overflow-y: auto;
    
  }
  .form1-container {
    max-width: 400px; 
    margin: 50px 20px; 
    padding: 40px;
    width: 30%;
}
.blue-text {
    color: blue;
}
.red-text {
    color: red;
}
.green-text {
    color: green;
} 
table {
    width: 100%;
    border-collapse: collapse;
    border: 1px solid #ddd; 
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
} 
</style> 
</head>  
<body>  
<%String email=session.getAttribute("email").toString(); %> 
<h1 class="centr">Welcome to Legal Department</h1>

<div class="parent-container">
    <div class="form1-container"> 
<%  
int legalPen = 0; 
int legalDeny = 0; 
int legalApro = 0; 

try {
    Connection con1 = ConnectionProvider.getCon();
    Statement st = con1.createStatement();

    ResultSet rs1 = st.executeQuery("SELECT COUNT(request_dept) FROM approval WHERE status = 'Pending' AND request_dept='legal'");
    if (rs1.next()) {
        legalPen = rs1.getInt(1); 
    }

    ResultSet rs2 = st.executeQuery("SELECT COUNT(request_dept) FROM approval WHERE status = 'Approve' AND request_dept='legal'");
    if (rs2.next()) {
        legalApro = rs2.getInt(1); 
    }

    ResultSet rs3 = st.executeQuery("SELECT COUNT(request_dept) FROM approval WHERE status = 'Deny' AND request_dept='legal'");
    if (rs3.next()) {
        legalDeny = rs3.getInt(1); 
    }
    con1.close(); 
} catch (Exception e) {
    e.printStackTrace(); 
}
    %>
               <h3> Summary Section </h3> 
               <h6>Legal Department</h6> 
               
               <p class="blue-text">Approved Request : <%out.print(legalApro);%></p>
               <p class="red-text">Deny Request : <%out.print(legalDeny);%></p>
               <p class="green-text">Pending Request : <%out.print(legalPen);%></p>
        </div>
    
    <div class="table-container"> 
    <h3> Request Form </h3>
        <table> 
        <%
        try {
            Connection con = ConnectionProvider.getCon();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT request_id, title, description, request_date, request_by,  approval_person,approval_date, status FROM approval");
            %>
            <thead>
                <tr>
                    <th scope="col">Request ID</th>
                    <th scope="col">Request Title</th>
                    <th scope="col">Description</th>
                    <th scope="col">Request Date</th>
                    <th scope="col">Request By</th>
                    <th scope="col">Approval Person</th>
                    <th scope="col">Approval Date</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString(1) %></td>
                    <td><%=rs.getString(2) %></td>
                    <td><%=rs.getString(3) %></td>
                    <td><%=rs.getString(4) %></td>
                    <td><%=rs.getString(5) %></td>
                    <td><%=rs.getString(6) %></td>
                    <td><%=rs.getString(7) %></td>
                     <%String status = rs.getString(8);%>
                    <% 
                    if((status).equals("Pending")){%>
                    <td><a href="Approve.jsp?request_id=<%=rs.getString(1) %>">Approve</a> <a href="Decline.jsp?request_id=<%=rs.getString(1) %>">Decline</a></td> 
                    <%}else{%>
                    	<td><%=rs.getString(8) %></td>
                    <%}%>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <%
        } catch (Exception e) {
            System.out.println(e);
        }
        %>
        <a href="logout.jsp" class="logout">Logout</a>
    </div>  
</div>
</body>
</html>
