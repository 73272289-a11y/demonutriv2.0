<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contacto - Nutribubble</title>
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

<h1>Contáctanos</h1>

<p>Zona de reparto: Huancayo, El Tambo y Chilca</p>
<p>WhatsApp / Yape: 987 654 321</p>
<p>Correo: contacto@nutribubble.com</p>
<p>Horario: lunes a sábado, 11:00 a.m. – 9:00 p.m.</p>

<h2>Envíanos un mensaje</h2>

<c:if test="${not empty enviado}">
    <p>¡Gracias, <c:out value="${enviado}"/>! Recibimos tu mensaje y te responderemos pronto.</p>
</c:if>

<form action="${pageContext.request.contextPath}/contacto" method="post">
    <label>Nombre</label>
    <input type="text" name="nombre" required>

    <label>Celular</label>
    <input type="text" name="celular" pattern="[0-9]{9}" placeholder="9 dígitos">

    <label>Correo</label>
    <input type="email" name="correo" required>

    <label>Asunto</label>
    <select name="asunto">
        <option>Consulta</option>
        <option>Sugerencia</option>
        <option>Reclamo</option>
        <option>Pedido para eventos</option>
    </select>

    <label>Mensaje</label>
    <textarea name="mensaje" rows="5" cols="40" required></textarea>

    <button type="submit">Enviar mensaje</button>
</form>

</div>
</body>
</html>
