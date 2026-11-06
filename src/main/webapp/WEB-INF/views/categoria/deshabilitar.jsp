<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deshabilitar categoría - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Deshabilitar categoría</h1>
<p>¿Deshabilitar la categoría <b>${categoria.nombre}</b>?</p>
<form action="${pageContext.request.contextPath}/categoria/deshabilitar" method="post">
    <input type="hidden" name="id" value="${categoria.id}">
    <button type="submit">Deshabilitar</button>
</form>
</div>
</body>
</html>
