<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nuevo motorizado - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Registrar motorizado</h1>
<form action="${pageContext.request.contextPath}/usuario/guardar" method="post">
    <label>Nombre</label>
    <input type="text" name="nombre" required>
    <label>Apellido</label>
    <input type="text" name="apellido" required>
    <label>Usuario</label>
    <input type="text" name="username" required>
    <label>Clave</label>
    <input type="password" name="clave" required>
    <button type="submit">Guardar</button>
</form>
</div>
</body>
</html>
