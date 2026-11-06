<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmar entrega - Nutribubble</title>
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
<h1>Confirmar entrega</h1>
<p>Pedido ${pedido.id} - ${pedido.clienteNombre} - ${pedido.clienteDireccion}</p>
<p>Total: <b>S/ ${pedido.total}</b></p>
<form action="${pageContext.request.contextPath}/motorizado/entregar" method="post">
    <input type="hidden" name="id" value="${pedido.id}">
    <input type="hidden" name="idMotorizado" value="${idMotorizado}">
    <button type="submit">Confirmar entrega</button>
</form>
</div>
</body>
</html>
