<%@page import="org.hibernate.query.criteria.internal.expression.function.LengthFunction"%>
<%@page import="java.util.Arrays"%>
<%@page import="dto.Train"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% List<Train> list=(List<Train>)request.getAttribute("list"); %>
<table border="1">
<tr>
<th>Train Number</th>
<th>Train Name</th>
<th>From Station</th>
<th>To Station</th>
<th>Stations</th>
<th>Time of Departure</th>
<th>Time of Arrival</th>
<th>Ticket Pricer</th>
<th>Available Days</th>
<th>Delete</th>
<th>Edit</th>
</tr>


<%for(Train train:list){%>
<tr>
<th><%=train.getNumber() %></th>
<th><%=train.getName() %></th>
<th><%=train.getStations()[0] %></th>
<th><%=train.getStations()[train.getStations().length-1] %></th>
<th><%=Arrays.toString(train.getStations()) %></th>
<th><%=train.getTime()[0] %></th>
<th><%=train.getTime()[train.getTime().length-1] %></th>
<th><%=Arrays.toString(train.getPrice()) %></th>
<th><%=Arrays.toString(train.getDays()) %></th>
<th><a href="deletetrain?tnumber=<%=train.getNumber()%>"><button>Delete</button></a></th>
<th><a href="EditTrain.jsp?tnumber=<%=train.getNumber()%>"><button>Edit</button></a></th>
</tr>
<% }%>

</table>
</body>
</html>