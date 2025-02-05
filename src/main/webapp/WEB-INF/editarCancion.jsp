<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Info</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>Actualizar Cancion</h1>
		<form:form action="/canciones/procesa/editar/${cancion.id}" method="POST" modelAttribute="cancion">
			<div>
				<input type="hidden" name="_method" value="PUT" />
				<form:label path="titulo">Titulo:</form:label>
				<form:input class="form-control" path="titulo"
					placeholder="Ingresa el titulo de la Cancion..." value="${cancion.titulo}"/>
				<form:errors path="titulo" class="text-danger" />
			</div>
			<div>
				<form:label path="artista">Artista:</form:label>
				<form:input class="form-control" path="artista"
					placeholder="Ingresa el Nombre del Artista..." value="${cancion.artista}" />
				<form:errors path="artista" class="text-danger" />
			</div>
			<div>
				<form:label path="album">Album:</form:label>
				<form:input class="form-control" path="album"
					placeholder="Ingresa el Album..." value="${cancion.album}" />
				<form:errors path="album" class="text-danger" />
			</div>
			<div>
				<form:label path="genero">Genero:</form:label>
				<form:input class="form-control" path="genero"
					placeholder="Ingresa el genero de la cancion..." value="${cancion.genero}" />
				<form:errors path="genero" class="text-danger" />
			</div>
			<div>
				<form:label path="idioma">Idioma:</form:label>
				<form:input class="form-control" path="idioma"
					placeholder="Ingresa el idioma de la cancion..." value="${cancion.idioma}" />
				<form:errors path="idioma" class="text-danger" />
			</div>
			<input type="submit" class="btn btn-info mt-3 m-1"
				value="Actualizar">
		</form:form>
		<a href="/canciones" class="btn btn-danger m-1">Volver a lista de canciones</a>
	</div>
</body>
</html>