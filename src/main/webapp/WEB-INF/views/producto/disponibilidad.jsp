<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Disponibilidad - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Cambiar disponibilidad</h1>
<p>Producto: <b>${producto.nombre}</b></p>
<p>Ahora está: <b>${producto.disponible ? 'Disponible' : 'No disponible'}</b></p>
<form action="${pageContext.request.contextPath}/producto/disponibilidad" method="post">
    <input type="hidden" name="id" value="${producto.id}">
    <button type="submit">Cambiar disponibilidad</button>
</form>
</div>
</body>
</html>
