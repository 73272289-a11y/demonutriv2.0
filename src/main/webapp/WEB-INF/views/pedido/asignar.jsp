<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Asignar pedido - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Asignar pedido ${pedido.id}</h1>
<p>Cliente: ${pedido.clienteNombre} - ${pedido.clienteDireccion}</p>
<form action="${pageContext.request.contextPath}/pedido/asignar" method="post">
    <input type="hidden" name="id" value="${pedido.id}">
    <label>Motorizado</label>
    <select name="idMotorizado">
        <c:forEach items="${motorizados}" var="m">
            <option value="${m.id}">${m.nombre} ${m.apellido}</option>
        </c:forEach>
    </select>
    <button type="submit">Asignar</button>
</form>
</div>
</body>
</html>
