<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nuevo producto - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">
<h1>Registrar producto</h1>
<form action="${pageContext.request.contextPath}/producto/guardar" method="post">
    <label>Nombre</label>
    <input type="text" name="nombre" required>
    <label>Descripción</label>
    <input type="text" name="descripcion">
    <label>Precio (S/)</label>
    <input type="number" name="precio" step="0.01" min="0.01" required>
    <label>Categoría</label>
    <select name="idCategoria">
        <c:forEach items="${categorias}" var="c">
            <option value="${c.id}" ${c.id == producto.idCategoria ? 'selected' : ''}>${c.nombre}</option>
        </c:forEach>
    </select>
    <button type="submit">Guardar</button>
</form>
</div>
</body>
</html>
