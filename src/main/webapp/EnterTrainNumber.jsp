<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="EnterTrainNumber.css">
</head>
<body>
<div class="banner">
<div class="nav">
<h1>Book Train Ticket</h1>
</div>
<div class="content">
<form action="BookTicket.jsp">
<div class="input-box">
<p>Enter Train Number: </p>
<input type="number" name="tnumber" placeholder="Enter Train Number">
</div>
<button>Book</button>
</form>
<a href="UserHome.html"><button>Back</button></a>
</div>
</div>
</body>
</html>