<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Catálogo - Nutribubble</title>
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
<h1>Catálogo de productos</h1>
<table>
    <tr><th>Producto</th><th>Categoría</th><th>Descripción</th><th>Precio</th></tr>
    <c:forEach items="${productos}" var="p">
        <tr>
            <td>${p.nombre}</td>
            <td>${p.categoriaNombre}</td>
            <td>${p.descripcion}</td>
            <td>S/ ${p.precio}</td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
