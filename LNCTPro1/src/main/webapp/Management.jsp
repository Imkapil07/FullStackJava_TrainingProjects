<%@page import="LNCTProject.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MANAGEMENT</title> 
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
  }

  .container {
    display: flex;
    justify-content: center;
    align-items: flex-start; 
  }

  .form-container {
    width: 400px;   
    margin: 50px 20px; 
    padding: 40px;
    background-color: #f9f9f9; 
    border-radius: 8px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  }

   .form1-container {
    max-width: 400px; 
    margin: 50px 20px; 
    padding: 40px;
 
}
   
  .centr {
    text-align: center;
  }

  input[type="text"],
  input[type="password"],
  select {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px; 
    border: 1px solid #ccc;
    border-radius: 6px;
    box-sizing: border-box;
  }

  input[type="password"] {
    font-size: 16px;
  }

  input[type="submit"] {
    width: 100%;
    padding: 12px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 6px;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #0056b3;
  }
  /* Style for textarea */
textarea {
    width: calc(100% - 16px);
    padding: 8px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 6px;
    resize: vertical horizintal;
}
 table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px; 
  }
  
  th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
  }
  
  th {
    background-color: #f2f2f2;
  }
  
  .form-container h6 {
    text-align: center; 
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

.navbar {
    background-color: #333;
    overflow: hidden; 
  }

  
  .navbar a {
    float: left; 
    display: block; 
    color: white;
    text-align: center; 
    padding: 14px 20px; 
    text-decoration: none; 
  } 
 .logout {
    float: right; 
  }
</style>
</head>
<body>
<div class="navbar">
  <a href="Management.jsp">Management Dashboard</a>
  <a href="logout.jsp" class="logout">Logout</a>
</div>
    <div class="container"> 
        <div class="form-container">
       <h3> Request Form </h3> 
          <form action="ManagementAction.jsp" method="post"> <br>
    <input type="text" placeholder="Enter Request Title" name="title" required><br>
    <textarea placeholder="Describe your request" name="description" required></textarea><br>
    <select name="dept" required>
        <option value="" disabled selected>Please select a Department</option>
        <option value="legal">Legal</option>
        <option value="finance">Finance</option>
    </select><br><br>
    <input type="submit" value="Send Request">
</form>

        </div>

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
<% 
    int finPen = 0;
    int finDeny = 0; 
    int finApro = 0; 

    try {
        Connection conn = ConnectionProvider.getCon();
        Statement st1 = conn.createStatement();
        ResultSet rs4 = st1.executeQuery("SELECT COUNT(request_dept) FROM approval WHERE status = 'Pending' AND request_dept='finance'");
        if (rs4.next()) {
            finPen = rs4.getInt(1);
        }

        ResultSet rs5 = st1.executeQuery("SELECT COUNT(request_dept) FROM approval WHERE status = 'Approve' AND request_dept='finance'");
        if (rs5.next()) {
            finApro = rs5.getInt(1); 
        }

        ResultSet rs6 = st1.executeQuery("SELECT COUNT(request_dept) FROM approval WHERE status = 'Deny' AND request_dept='finance'");
        if (rs6.next()) {
            finDeny = rs6.getInt(1); 
        }

        conn.close(); 
    } catch (Exception e) {
        e.printStackTrace(); 
    }
    %>
               <h3> Summary Section </h3> 
               <h6>Finance Department</h6> 
               
               <p class="blue-text">Approved Request : <%out.print(finApro);%></p>
               <p class="red-text">Deny Request : <%out.print(finDeny);%></p>
               <p class="green-text">Pending Request : <%out.print(finPen);%></p>
               
               <h6>Legal Department</h6> 
               
               <p class="blue-text">Approved Request : <%out.print(legalApro);%></p>
               <p class="red-text">Deny Request : <%out.print(legalDeny);%></p>
               <p class="green-text">Pending Request : <%out.print(legalPen);%></p>
        </div>
    </div>
    
    
    
    <table> 
    <%
 try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT request_id, title, description,request_date,request_dept, approval_person, approval_date, status FROM approval");

    %>
    <thead>
        <tr>
            <th scope="col">Request ID</th>
            <th scope="col">Request Title</th>
            <th scope="col">Description </th>
            <th scope="col">Request Date</th>
            <th scope="col">Request Department</th>
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
            <td><%=rs.getString(8) %></td>
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
    
</body>
</html>
