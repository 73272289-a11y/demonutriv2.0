<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seguimiento - Nutribubble</title>
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
<h1>Seguimiento de mi pedido</h1>
<form action="${pageContext.request.contextPath}/pedido/seguimiento" method="get">
    <label>Código del pedido</label>
    <input type="number" name="codigo" value="${param.codigo}" required>
    <label>Celular</label>
    <input type="text" name="telefono" value="${param.telefono}" required>
    <button type="submit">Buscar</button>
</form>

<c:if test="${not empty param.codigo and empty pedido}">
    <p class="error">No encontramos un pedido con ese código y celular.</p>
</c:if>

<c:if test="${not empty pedido}">
    <h2>Pedido ${pedido.id}</h2>
    <p>Fecha: ${pedido.fecha}</p>
    <p>Estado: <b class="${pedido.estado}">${pedido.estado}</b></p>
    <p>Motorizado: ${empty pedido.motorizadoNombre ? 'Aún sin asignar' : pedido.motorizadoNombre}</p>
    <ul>
        <c:forEach items="${detalle}" var="d"><li>${d}</li></c:forEach>
    </ul>
    <p>Total: <b>S/ ${pedido.total}</b></p>
</c:if>
</div>
</body>
</html>
