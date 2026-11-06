<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar producto - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Actualizar producto</h1>
<form action="${pageContext.request.contextPath}/producto/actualizar" method="post">
    <input type="hidden" name="id" value="${producto.id}">
    <label>Nombre</label>
    <input type="text" name="nombre" value="${producto.nombre}" required>
    <label>Descripción</label>
    <input type="text" name="descripcion" value="${producto.descripcion}">
    <label>Precio (S/)</label>
    <input type="number" name="precio" step="0.01" min="0.01" value="${producto.precio}" required>
    <label>Categoría</label>
    <select name="idCategoria">
        <c:forEach items="${categorias}" var="c">
            <option value="${c.id}" ${c.id == producto.idCategoria ? 'selected' : ''}>${c.nombre}</option>
        </c:forEach>
    </select>
    <button type="submit">Guardar cambios</button>
</form>
</div>
</body>
</html>
