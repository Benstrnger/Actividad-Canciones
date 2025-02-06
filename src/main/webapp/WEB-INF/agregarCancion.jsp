<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>Nuevo Usuario</h1>
		<form:form action="/canciones/procesa/agregar" method="POST" modelAttribute="cancion">
			<div>
				<form:label path="titulo">Titulo:</form:label>
				<form:input class="form-control" path="titulo"
					placeholder="Ingresa el titulo de la Cancion..." />
				<form:errors path="titulo" class="text-danger" />
			</div>
			<div>
				<form:label path="artista">Artista:</form:label>
				<form:select class="form-select" path="artista">
					<c:forEach items="${artistas}" var="artista">
						<form:option value="${artista.id}">${artista.nombre}</form:option>	
					</c:forEach>
				</form:select>
				<form:errors path="artista" class="text-danger" />
			</div>
			<div>
				<form:label path="album">Album:</form:label>
				<form:input class="form-control" path="album"
					placeholder="Ingresa el Album..." />
				<form:errors path="album" class="text-danger" />
			</div>
			<div>
				<form:label path="genero">Genero:</form:label>
				<form:input class="form-control" path="genero"
					placeholder="Ingresa el genero de la cancion..." />
				<form:errors path="genero" class="text-danger" />
			</div>
			<div>
				<form:label path="idioma">Idioma:</form:label>
				<form:input class="form-control" path="idioma"
					placeholder="Ingresa el idioma de la cancion..." />
				<form:errors path="idioma" class="text-danger" />
			</div>
			<input type="submit" class="btn btn-info mt-3 m-1"
				value="Guardar Cancion">
		</form:form>
		<a href="/canciones" class="btn btn-danger m-1">Volver a lista de canciones</a>
	</div>
</body>
</html>