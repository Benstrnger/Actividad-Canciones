<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detalles de ${artista.nombre}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<header>
			<h1>Bienvenid@ a La lista de Canciones</h1>
		</header>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>biografia</th>
					<th>Canciones</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${artista.nombre}</td>
					<td>${artista.apellido}</td>
					<td>${artista.biografia}</td>
					<td>
						<ul>
							<c:forEach items="${canciones}" var="cancion">
								<c:if test="${cancion.artista.id == artista.id}">
									<li>${cancion.titulo}</li>
								</c:if>
							</c:forEach>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
		<a href="/artistas" class="btn btn-success m-1">Volver a lista de artistas</a>
	</div>
</body>
</html>