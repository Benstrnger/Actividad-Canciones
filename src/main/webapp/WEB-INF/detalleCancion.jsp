<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detalles de ${cancion.titulo}</title>
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
					<th>Titulo</th>
					<th>Autor</th>
					<th>Album</th>
					<th>Genero</th>
					<th>Idioma</th>
					<th>Editar</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${cancion.titulo}</td>
					<td>${cancion.artista}</td>
					<td>${cancion.album}</td>
					<td>${cancion.genero}</td>
					<td>${cancion.idioma}</td>
					<td><a href="/canciones/formulario/editar/${cancion.id}" class="btn btn-info m-1">Editar Info</a>
						<form action="/canciones/eliminar/${cancion.id}" method="POST">
							<input type="hidden" name="_method" value="DELETE"/>
							<input type="submit" value="Eliminar" class="btn btn-danger m-1"/>
						</form>
						</td>
				</tr>
			</tbody>
		</table>
		<a href="/canciones" class="btn btn-info">Volver a lista de canciones</a>
	</div>
</body>
</html>