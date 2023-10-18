<%@page import="com.jacaranda.repositorio.CineRepository"%>
<%@page import="com.jacaranda.model.Cinema"%>
<%@page import="java.util.List"%>
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
	try{
		//Recupero los datos del formulario y si el dato correspondiente a la pk no es nulo, añado los datos a la clase Cinema.
		if(request.getParameter("cine") != null){
			Cinema c = new Cinema(request.getParameter("cine"),request.getParameter("ciudad"),request.getParameter("direccion"));
			//añado el objeto 'c' con los datos del formulario a la bbdd.
			CineRepository.addCine(c);}
	}catch (Exception e){
		e.printStackTrace();
		
		}
		
%>
		<body>
			<form method="get">
		  <div class="form-group row">
		    <label for="cine" class="col-4 col-form-label">Cine</label> 
		    <div class="col-8">
		      <div class="input-group">
		        <div class="input-group-prepend">
		          <div class="input-group-text">
		            <i class="fa fa-address-card"></i>
		          </div>
		        </div> 
		        <input id="cine" name="cine" type="text" class="form-control">
		      </div>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="ciudad" class="col-4 col-form-label">Ciudad</label> 
		    <div class="col-8">
		      <input id="ciudad" name="ciudad" type="text" class="form-control">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="direccion" class="col-4 col-form-label">Direccion</label> 
		    <div class="col-8">
		      <input id="direccion" name="direccion" type="text" class="form-control">
		    </div>
		  </div> 
		  <div class="form-group row">
		    <div class="offset-4 col-8">
		      <button name="submit" type="submit" class="btn btn-primary">Submit</button>
		    </div>
		  </div>
		</form>
		</body>
</html>