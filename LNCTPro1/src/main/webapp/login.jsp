<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
  body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
  }

  form {
    width: 400px; 
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  input[type="email"],
  input[type="password"],
  input[type="text"],
  select {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
  }

  input[type="submit"] {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #0056b3;
  }
</style>

</head>
<body>
  <form action="loginAction.jsp">  
  <h1>Management Application</h1>
   <input type="email" placeholder="Enter your email" name="email" required><br>
   <input type="password" placeholder="Enter your Password" name="password" required><br>
   <select  name="role" required>
   <option value="" disabled selected>Please select a Department</option>
    <option value="legal">Legal</option>
    <option value="management">Management</option>
    <option value="finance">Finance</option>
  </select> <br><br>
    <input type="submit" value="Login">
  </form>
  <%
  String msg=request.getParameter("msg");
  if("notexits".equals(msg)){
	  %>
	  <h1>Incorrect Username or Password</h1>
<%} %>
<%
if("invalid".equals(msg)){
	  %>
	  <h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
</body>
</html>
