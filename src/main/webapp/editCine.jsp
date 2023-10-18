<%@page import="com.jacaranda.model.Cinema"%>
<%@page import="com.jacaranda.repositorio.CineRepository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>


<%
		
		Cinema pk = null;
		String nameCinema = null;
		String adressCinema = null;
		String cityCinema = null;
		try{
		if(request.getParameter("edit") != null){
		 pk = CineRepository.resqueCinema(request.getParameter("edit"));
			 nameCinema = pk.getCinema();
			 adressCinema = pk.getAdress_cinema();
			 cityCinema = pk.getCity_cinema();
		 
		}
		}catch(Exception e){
			out.println("Los parámetros son nulos");
		}
		
%>

<body>

		<form>
		  <div class="form-group row">
		    <label for="nombreCine" class="col-4 col-form-label">Cine</label> 
		    <div class="col-8">
		      <input id="nombreCine" name="nombreCine" type="text" class="form-control" value="<%= nameCinema %>" readonly>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="direcCine" class="col-4 col-form-label">Dirección</label> 
		    <div class="col-8">
		      <input id="direcCine" name="direcCine" type="text" class="form-control" value="<%= adressCinema %>" >
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="cityCine" class="col-4 col-form-label">Ciudad Cine</label> 
		    <div class="col-8">
		      <input id="cityCine" name="cityCine" type="text" class="form-control" value="<%= cityCinema %>" >
		    </div>
		  </div> 
		  <div class="form-group row">
		    <div class="offset-4 col-8">
		      <button name="submit" type="submit" class="btn btn-primary">Editar</button>
		    	<a href="listaCines.jsp" class="btn btn-primary">Volver</a>
		    </div>
		  </div>
</form>
	<%
			String edit = request.getParameter("submit");
		    		
		    		String name = request.getParameter("nombreCine");
		    		String address = request.getParameter("direcCine");
		    		String city = request.getParameter("cityCine");
		    		Cinema cinemaEdit = null;
		    		
		    		if(name != null){
		    			cinemaEdit = new Cinema(name,address,city);
		    		}
		 
		    		if(edit != null){
		    			CineRepository.addCine(cinemaEdit);
		    			response.sendRedirect("listaCines.jsp");
		    		}

	
	%>
</body>
</html>