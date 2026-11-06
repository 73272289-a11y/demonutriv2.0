<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nueva categoría - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Registrar categoría</h1>
<form action="${pageContext.request.contextPath}/categoria/guardar" method="post">
    <label>Nombre</label>
    <input type="text" name="nombre" required>
    <label>Descripción</label>
    <input type="text" name="descripcion">
    <button type="submit">Guardar</button>
</form>
</div>
</body>
</html>
