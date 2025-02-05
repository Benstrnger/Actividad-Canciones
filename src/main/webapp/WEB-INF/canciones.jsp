<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lista de Canciones</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<header>
			<h1>Bienvenid@ a La lista de Canciones</h1>
		</header>
	 	<table class="table table-hover">
	 		<thead>
	 			<tr>
	 				<th>Titulo</th>
	 				<th>Autor</th>
	 				<th>Detalle</th>
	 			</tr>
	 		</thead>
	 		<tbody>
	 			<c:forEach var="cancion" items="${canciones}">
	 				<tr>
	 					<td>${cancion.titulo}</td>
	 					<td>${cancion.artista}</td>
	 					<td><a href="canciones/detalle/${cancion.id}" class="btn btn-danger m-1">Detalle</a></td>
	 				</tr>
	 			</c:forEach>
	 		</tbody>
		</table>
		<a href="/canciones/formulario/agregar" class="btn btn-success m-1">Agregar Cancion</a>
	</div>
</body>
</html>