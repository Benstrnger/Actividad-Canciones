<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artistas</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<header>
			<h1>Bienvenid@ a La lista de Artistas</h1>
		</header>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Info</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="artista" items="${artistas}">
					<tr>
						<td>${artista.nombre}</td>
						<td>${artista.apellido}</td>
						<td><a href="/artistas/detalle/${artista.id}" class="btn btn-info m-1">Info</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/canciones" class="btn btn-success m-1">Ir a canciones</a>
	</div>
</body>
</html>