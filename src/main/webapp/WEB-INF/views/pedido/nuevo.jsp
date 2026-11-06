<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hacer pedido - Nutribubble</title>
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
<h1>Realizar pedido</h1>
<form action="${pageContext.request.contextPath}/pedido/registrar" method="post">
    <table>
        <tr><th>Producto</th><th>Precio</th><th>Cantidad</th></tr>
        <c:forEach items="${productos}" var="p">
            <tr>
                <td>${p.nombre}</td>
                <td>S/ ${p.precio}</td>
                <td>
                    <input type="hidden" name="idProducto" value="${p.id}">
                    <input type="number" name="cantidad" value="0" min="0" max="20" required
                           data-precio="${p.precio}" oninput="calcularTotal()">
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="2"><b>Total a pagar</b></td>
            <td><b>S/ <span id="total">0.00</span></b></td>
        </tr>
    </table>

    <label>Nombre</label>
    <input type="text" name="clienteNombre" required>
    <label>Celular (9 dígitos)</label>
    <input type="text" name="clienteTelefono" pattern="[0-9]{9}" required>
    <label>Dirección de entrega</label>
    <input type="text" name="clienteDireccion" required>
    <label>Método de pago</label>
    <select name="idMetodoPago" required>
        <c:forEach items="${metodos}" var="m">
            <option value="${m.id}">${m.nombre} - ${m.numero}</option>
        </c:forEach>
    </select>
    <label>N.° de operación</label>
    <input type="text" name="comprobante" required>

    <button type="submit">Enviar pedido</button>
</form>
</div>
<script>
    function calcularTotal() {
        var total = 0;
        var campos = document.querySelectorAll('input[name="cantidad"]');
        for (var i = 0; i < campos.length; i++) {
            total += (parseInt(campos[i].value) || 0) * parseFloat(campos[i].dataset.precio);
        }
        document.getElementById('total').textContent = total.toFixed(2);
    }
</script>
</body>
</html>
