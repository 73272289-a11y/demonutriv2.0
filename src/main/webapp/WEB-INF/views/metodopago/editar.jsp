<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar método de pago - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Actualizar método de pago</h1>
<form action="${pageContext.request.contextPath}/metodopago/actualizar" method="post">
    <input type="hidden" name="id" value="${metodoPago.id}">
    <label>Nombre</label>
    <input type="text" name="nombre" value="${metodoPago.nombre}" required>
    <label>Número (9 dígitos)</label>
    <input type="text" name="numero" value="${metodoPago.numero}" pattern="[0-9]{9}" required>
    <button type="submit">Guardar cambios</button>
</form>
</div>
</body>
</html>
