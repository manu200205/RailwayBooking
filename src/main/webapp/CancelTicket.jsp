<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="CancelTicket.css">
</head>
<body>
<%
	User user = (User) session.getAttribute("user");
	%>
	<%
	if (user == null) {
		response.getWriter().print("<h1 style='color:red'>Session Expired login again</h1>");
		request.getRequestDispatcher("Login.html").include(request, response);
	} else {
	%>
	<div class="banner">
	<div class="cancel-form">
	<form action="cancelticket">
		
		<div class="input-box">
		<p>Enter PNR Number: </p>
		<input type="number" name="pnr" placeholder="Enter PNR Number"> 
		</div>
		<button>Cancel Ticket</button>
	</form>
	
	<a href="UserHome.html"><button>Back</button></a>
	</div>
	</div>
	<%
	}
	%>
</body>
</html>