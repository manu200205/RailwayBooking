<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Money</title>
<link rel="stylesheet" href="AddMoney.css">
</head>
<body>
<%User user=(User)session.getAttribute("user"); %>
<%if(user==null){
	response.getWriter().print("<h1>Session Expired Login Again</h1>");
	request.getRequestDispatcher("Login.html").include(request, response);
	}
else{
	%>
<div class="banner">
<h1>Add Money to Wallet</h1>
<br>
<div class="add-form">
<form action="addmoney"> 
<div class="input-box">
<p>Enter Amount to add:</p>
<input type="number" name="amount" placeholder="Enter Amount To Be Added">
</div>
<button>Add</button>
</form>
<a href="UserHome.html"><button>Back</button></a>
</div>
</div>
<%} %>
</body>
</html>