<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar categoría - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Actualizar categoría</h1>
<form action="${pageContext.request.contextPath}/categoria/actualizar" method="post">
    <input type="hidden" name="id" value="${categoria.id}">
    <label>Nombre</label>
    <input type="text" name="nombre" value="${categoria.nombre}" required>
    <label>Descripción</label>
    <input type="text" name="descripcion" value="${categoria.descripcion}">
    <button type="submit">Guardar cambios</button>
</form>
</div>
</body>
</html>
