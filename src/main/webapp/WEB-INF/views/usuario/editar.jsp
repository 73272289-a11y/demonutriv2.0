<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar motorizado - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Modificar motorizado</h1>
<form action="${pageContext.request.contextPath}/usuario/actualizar" method="post">
    <input type="hidden" name="id" value="${usuario.id}">
    <label>Nombre</label>
    <input type="text" name="nombre" value="${usuario.nombre}" required>
    <label>Apellido</label>
    <input type="text" name="apellido" value="${usuario.apellido}" required>
    <label>Clave</label>
    <input type="password" name="clave" value="${usuario.clave}" required>
    <button type="submit">Guardar cambios</button>
</form>
</div>
</body>
</html>
