<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pedidos - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Seguimiento de pedidos</h1>
<table>
    <tr><th>Código</th><th>Fecha</th><th>Cliente</th><th>Celular</th><th>Total</th><th>Pago</th><th>N.° operación</th><th>Estado</th><th>Motorizado</th><th>Acción</th></tr>
    <c:forEach items="${pedidos}" var="p">
        <tr>
            <td>${p.id}</td>
            <td>${p.fecha}</td>
            <td>${p.clienteNombre}</td>
            <td>${p.clienteTelefono}</td>
            <td>S/ ${p.total}</td>
            <td>${p.metodoPagoNombre}</td>
            <td>${p.comprobante}</td>
            <td class="${p.estado}">${p.estado}</td>
            <td>${p.motorizadoNombre}</td>
            <td><c:if test="${p.estado == 'PENDIENTE'}"><a href="${pageContext.request.contextPath}/pedido/asignar?id=${p.id}">Asignar</a></c:if></td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
