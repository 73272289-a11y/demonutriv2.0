<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Usuarios - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Usuarios</h1>
<c:if test="${param.error == 'asociados'}"><p class="error">No se pudo eliminar: el motorizado tiene pedidos asignados o entregados. Puede deshabilitarlo.</p></c:if>
<a class="boton" href="${pageContext.request.contextPath}/usuario/nuevo">Nuevo motorizado</a>
<table>
    <tr><th>ID</th><th>Nombre</th><th>Usuario</th><th>Rol</th><th>Estado</th><th>Acciones</th></tr>
    <c:forEach items="${usuarios}" var="u">
        <tr>
            <td>${u.id}</td>
            <td>${u.nombre} ${u.apellido}</td>
            <td>${u.username}</td>
            <td>${u.rol}</td>
            <td>${u.activo ? 'Activo' : 'Deshabilitado'}</td>
            <td>
                <c:if test="${u.rol == 'MOTORIZADO'}">
                    <a href="${pageContext.request.contextPath}/usuario/editar?id=${u.id}">Editar</a>
                    <c:if test="${u.activo}"><a href="${pageContext.request.contextPath}/usuario/deshabilitar?id=${u.id}">Deshabilitar</a></c:if>
                    <c:if test="${!u.activo}"><a href="${pageContext.request.contextPath}/usuario/habilitar?id=${u.id}">Habilitar</a></c:if>
                    <a href="${pageContext.request.contextPath}/usuario/eliminar?id=${u.id}">Eliminar</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
