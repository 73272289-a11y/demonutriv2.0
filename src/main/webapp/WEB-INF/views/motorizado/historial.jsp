<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Historial - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<div class="menu">
    <b>Nutribubble</b>
    <a href="${pageContext.request.contextPath}/motorizado/pedidos?idMotorizado=${idMotorizado}">Mis pedidos</a>
    <a href="${pageContext.request.contextPath}/motorizado/historial?idMotorizado=${idMotorizado}">Historial</a>
    <a href="${pageContext.request.contextPath}/login">Salir</a>
</div>
<div class="caja">
<h1>Historial de entregas</h1>
<table>
    <tr><th>Código</th><th>Fecha</th><th>Cliente</th><th>Dirección</th><th>Total</th></tr>
    <c:forEach items="${pedidos}" var="p">
        <tr>
            <td>${p.id}</td>
            <td>${p.fecha}</td>
            <td>${p.clienteNombre}</td>
            <td>${p.clienteDireccion}</td>
            <td>S/ ${p.total}</td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
