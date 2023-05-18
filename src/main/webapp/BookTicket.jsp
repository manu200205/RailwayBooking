<%@page import="dto.Train"%>
<%@page import="dao.TrainDao"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Ticket</title>
<link rel="stylesheet" href="BookTicket.css">
</head>
<div class="banner">
<body>
	<%
	User user = (User) session.getAttribute("user");
	%>
	<%
	if (user == null) {
		response.getWriter().print("<h1 style='color:red'>Session Expired login again</h1>");
		request.getRequestDispatcher("Login.html").include(request, response);
	} else {
	int trainnumber = Integer.parseInt(request.getParameter("tnumber"));
	TrainDao dao = new TrainDao();
	Train train = dao.fetch(trainnumber);
	if(train==null)
	{
		response.getWriter().print("<h1 style='color:red'>Invalid Train Number</h1>");
		request.getRequestDispatcher("UserHome.html").include(request, response);
	}
	else{
	%>
	<div class="content">
	<h1>
		Hello
		<%=user.getFirstName() + " " + user.getLastName()%></h1>
	<br>
	<form action="bookticket" method="post">
	<div class="input-box">
	User Id: <input type="text" name="uid" value="<%=user.getId()%>" readonly="readonly">
	</div>
	<div class="input-box">
	Train Number: <input type="text" name="tnumber" value="<%=trainnumber%>" readonly="readonly">
	</div>
	
	From: <select name="source">
	
	<%for(int i=0;i<train.getStations().length-1;i++){ %>
	<option><%=train.getStations()[i] %></option>
	<%} %>
	</select>
	
	
	To: <select name="destination">
	<%for(int i=1;i<train.getStations().length;i++){ %>
	<option><%=train.getStations()[i] %></option>
	<%} %>
	</select>
	
	<div class="input-box">
	Date of Journey: <input type="date" name="doj">
	</div>
	<div class="input-box">
	Number of Seats: <input type="number" name="seats">
	</div>
	<button>Book</button><button type="reset">Cancel</button> 
	</form>
	<br>
	<a href="UserHome.html"><button>Back</button></a>
	<%
	}}
	%>
	</div>
	</div>
</body>
</html>