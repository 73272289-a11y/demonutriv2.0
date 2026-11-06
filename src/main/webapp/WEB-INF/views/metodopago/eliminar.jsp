<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eliminar método de pago - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Eliminar método de pago</h1>
<p>¿Eliminar definitivamente el método de pago <b>${metodoPago.nombre}</b>?</p>
<p>Esta acción no se puede deshacer.</p>
<form action="${pageContext.request.contextPath}/metodopago/eliminar" method="post">
    <input type="hidden" name="id" value="${metodoPago.id}">
    <button type="submit">Eliminar</button>
</form>
</div>
</body>
</html>
