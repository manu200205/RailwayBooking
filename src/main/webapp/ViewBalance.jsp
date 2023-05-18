<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="ViewBalance.css">
</head>
<body>
<% User user=(User)session.getAttribute("user"); %>
<%if(user==null){
response.getWriter().print("<h1 style='color:red'>Session Expired login again</h1>");	
request.getRequestDispatcher("Login.html").include(request, response);
}
else{
%>
<div class="banner">
<div class="content">
<h1>The amount in Wallet is <%=user.getWallet() %></h1>
<%} %>
<br><br>
<a href="AddMoney.jsp"><button>Add money</button></a>

<a href="UserHome.html"><button>Back</button></a>
</div>
</div>
</body>
</html>