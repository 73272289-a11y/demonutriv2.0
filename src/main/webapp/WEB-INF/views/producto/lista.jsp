<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Productos - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Productos</h1>
<c:if test="${param.error == 'asociados'}"><p class="error">No se pudo eliminar: el producto ya figura en pedidos. Puede cambiar su disponibilidad.</p></c:if>
<a class="boton" href="${pageContext.request.contextPath}/producto/nuevo">Nuevo producto</a>
<table>
    <tr><th>ID</th><th>Nombre</th><th>Categoría</th><th>Precio</th><th>Disponible</th><th>Acciones</th></tr>
    <c:forEach items="${productos}" var="p">
        <tr>
            <td>${p.id}</td>
            <td>${p.nombre}</td>
            <td>${p.categoriaNombre}</td>
            <td>S/ ${p.precio}</td>
            <td>${p.disponible ? 'Sí' : 'No'}</td>
            <td>
                <a href="${pageContext.request.contextPath}/producto/editar?id=${p.id}">Editar</a>
                <a href="${pageContext.request.contextPath}/producto/disponibilidad?id=${p.id}">Disponibilidad</a>
                <a href="${pageContext.request.contextPath}/producto/eliminar?id=${p.id}">Eliminar</a>
            </td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
