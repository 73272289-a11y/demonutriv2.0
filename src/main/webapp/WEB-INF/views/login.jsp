<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar sesión - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<div class="menu">
    <b>Nutribubble</b>
    <a href="${pageContext.request.contextPath}/catalogo">Catálogo</a>
    <a href="${pageContext.request.contextPath}/pedido/nuevo">Hacer pedido</a>
    <a href="${pageContext.request.contextPath}/pedido/seguimiento">Seguir mi pedido</a>
    <a href="${pageContext.request.contextPath}/publicidad">Conoce lo que comes</a>
    <a href="${pageContext.request.contextPath}/contacto">Contacto</a>
    <a href="${pageContext.request.contextPath}/login">Ingresar</a>
</div>
<div class="caja">
<h1>Iniciar sesión</h1>
<c:if test="${not empty error}"><p class="error">${error}</p></c:if>
<form action="${pageContext.request.contextPath}/login" method="post">
    <label>Usuario</label>
    <input type="text" name="username" required>
    <label>Clave</label>
    <input type="password" name="clave" required>
    <button type="submit">Ingresar</button>
</form>
<p>Prueba: admin / admin123 &nbsp;|&nbsp; lgomez / 123456</p>
</div>
</body>
</html>
