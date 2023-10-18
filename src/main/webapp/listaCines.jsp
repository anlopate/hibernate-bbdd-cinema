<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="com.jacaranda.model.Cinema"%>
  <%@page import="com.jacaranda.repositorio.CineRepository"%>
	<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<%	
	List<Cinema> listCinemas = CineRepository.getCineList();
	
%>
<body>
	<table id="tablaCines">
	<tr>
	<th>CINE</th>
	<th>CIUDAD</th>
	<th>DIRECCION</th>
	</tr>
	<% for(Cinema c: listCinemas){%>
	<tr>
		<td><%=c.getCinema() %></td>
		<td><%=c.getAdress_cinema() %></td>
		<td><%=c.getCity_cinema() %></td>
		<td>
		<form action="editCine.jsp" method="get">
			<input type="text" name="edit" value="<%=c.getCinema() %>" hidden>
			<button id="editar" type="submit" name="editar">Edit</button>
		</form>
		</td>
		<td>
		<form action="deleteCine.jsp" method="get">
			<input type="text" name="del" value="<%=c.getCinema() %>" hidden>
			<button id="borrar" type="submit" name="borrar">Delete</button>
		</form>
		</td>
	</tr>	
	<%}%>
	
	</table>
		<a href="cinema.jsp" class="btn btn-primary" >Ir a añadir</a>
</body>
</html>