<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Métodos de pago - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Métodos de pago</h1>
<c:if test="${param.error == 'asociados'}"><p class="error">No se pudo eliminar: el método de pago tiene pedidos registrados. Puede deshabilitarlo.</p></c:if>
<a class="boton" href="${pageContext.request.contextPath}/metodopago/nuevo">Nuevo método de pago</a>
<table>
    <tr><th>ID</th><th>Nombre</th><th>Número</th><th>Estado</th><th>Acciones</th></tr>
    <c:forEach items="${metodos}" var="m">
        <tr>
            <td>${m.id}</td>
            <td>${m.nombre}</td>
            <td>${m.numero}</td>
            <td>${m.activo ? 'Activo' : 'Deshabilitado'}</td>
            <td>
                <a href="${pageContext.request.contextPath}/metodopago/editar?id=${m.id}">Editar</a>
                <c:if test="${m.activo}"><a href="${pageContext.request.contextPath}/metodopago/deshabilitar?id=${m.id}">Deshabilitar</a></c:if>
                <c:if test="${!m.activo}"><a href="${pageContext.request.contextPath}/metodopago/habilitar?id=${m.id}">Habilitar</a></c:if>
                <a href="${pageContext.request.contextPath}/metodopago/eliminar?id=${m.id}">Eliminar</a>
            </td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
