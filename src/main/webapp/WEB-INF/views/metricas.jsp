<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Métricas - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
    <style>
        .caja { max-width: 960px; }

        .indicadores { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; margin: 10px 0 26px; }
        .indicador { background: #f4f7f2; border-top: 4px solid #2e7d32; border-radius: 6px; padding: 14px 18px; }
        .indicador span { display: block; color: #5f6e63; font-size: 14px; font-weight: bold; }
        .indicador strong { font-size: 26px; color: #1e4a2b; }

        .graficos { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .grafico { background: white; border: 1px solid #333; border-radius: 10px; padding: 14px 18px 18px; }
        .grafico h3 { text-align: center; margin: 0 0 6px; font-size: 17px; color: #222; }
        .grafico.centro { grid-column: 1 / -1; width: calc(50% - 10px); margin: 0 auto; box-sizing: border-box; }
        .lienzo { position: relative; height: 220px; }

        .vacio { color: #5f6e63; }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/menu-admin.jsp"/>
<div class="caja">

<h1>Métricas</h1>

<section class="indicadores">
    <div class="indicador">
        <span>Ventas entregadas</span>
        <strong>S/ ${resumen.ventas}</strong>
    </div>
    <div class="indicador">
        <span>Pedidos registrados</span>
        <strong>${resumen.pedidos}</strong>
    </div>
    <div class="indicador">
        <span>Pedidos entregados</span>
        <strong>${resumen.entregados}</strong>
    </div>
    <div class="indicador">
        <span>Ticket promedio</span>
        <strong>S/ ${resumen.ticketPromedio}</strong>
    </div>
</section>

<c:if test="${empty serie}">
    <p class="vacio">Todavía no hay pedidos registrados.</p>
</c:if>

<c:if test="${not empty serie}">
<div class="graficos">
    <div class="grafico">
        <h3>Pedidos por Día</h3>
        <div class="lienzo"><canvas id="graficoPedidos"></canvas></div>
    </div>
    <div class="grafico">
        <h3>Ventas por Día (S/)</h3>
        <div class="lienzo"><canvas id="graficoVentas"></canvas></div>
    </div>
    <div class="grafico">
        <h3>Platos Vendidos por Día</h3>
        <div class="lienzo"><canvas id="graficoPlatos"></canvas></div>
    </div>
    <div class="grafico">
        <h3>Entregas por Día</h3>
        <div class="lienzo"><canvas id="graficoEntregas"></canvas></div>
    </div>
    <div class="grafico centro">
        <h3>Bowls vs Bebidas vs Acompañamientos por Mes</h3>
        <div class="lienzo"><canvas id="graficoCategorias"></canvas></div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.js"></script>
<script>
    const fechas     = [<c:forEach items="${serie}" var="d" varStatus="s">'${d.fechaTexto}'${s.last ? '' : ','}</c:forEach>];
    const pedidos    = [<c:forEach items="${serie}" var="d" varStatus="s">${d.pedidos}${s.last ? '' : ','}</c:forEach>];
    const entregados = [<c:forEach items="${serie}" var="d" varStatus="s">${d.entregados}${s.last ? '' : ','}</c:forEach>];
    const ventas     = [<c:forEach items="${serie}" var="d" varStatus="s">${d.ventas}${s.last ? '' : ','}</c:forEach>];
    const platos     = [<c:forEach items="${serie}" var="d" varStatus="s">${d.platos}${s.last ? '' : ','}</c:forEach>];

    const meses           = [<c:forEach items="${categorias}" var="m" varStatus="s">'${m.mesTexto}'${s.last ? '' : ','}</c:forEach>];
    const bowls           = [<c:forEach items="${categorias}" var="m" varStatus="s">${m.bowls}${s.last ? '' : ','}</c:forEach>];
    const bebidas         = [<c:forEach items="${categorias}" var="m" varStatus="s">${m.bebidas}${s.last ? '' : ','}</c:forEach>];
    const acompanamientos = [<c:forEach items="${categorias}" var="m" varStatus="s">${m.acompanamientos}${s.last ? '' : ','}</c:forEach>];

    const opciones = {
        responsive: true,
        maintainAspectRatio: false,
        plugins: { legend: { labels: { usePointStyle: true } } },
        scales: { y: { beginAtZero: true, ticks: { precision: 0 } } }
    };

    function serie(etiqueta, datos, color, relleno) {
        return {
            label: etiqueta,
            data: datos,
            borderColor: color,
            backgroundColor: relleno,
            fill: true,
            tension: 0.4,
            pointRadius: 5,
            borderWidth: 3
        };
    }

    function graficoLinea(idCanvas, etiquetas, series) {
        new Chart(document.getElementById(idCanvas), {
            type: 'line',
            data: { labels: etiquetas, datasets: series },
            options: opciones
        });
    }

    graficoLinea('graficoPedidos',  fechas, [serie('Total Pedidos',   pedidos,    '#5470c6', 'rgba(84, 112, 198, 0.15)')]);
    graficoLinea('graficoVentas',   fechas, [serie('Ventas (S/)',     ventas,     '#2e7d32', 'rgba(46, 125, 50, 0.15)')]);
    graficoLinea('graficoPlatos',   fechas, [serie('Platos vendidos', platos,     '#fac858', 'rgba(250, 200, 88, 0.2)')]);
    graficoLinea('graficoEntregas', fechas, [serie('Entregas',        entregados, '#73c0de', 'rgba(115, 192, 222, 0.18)')]);

    graficoLinea('graficoCategorias', meses, [
        serie('Bowls',           bowls,           '#2e7d32', 'rgba(46, 125, 50, 0.12)'),
        serie('Bebidas',         bebidas,         '#73c0de', 'rgba(115, 192, 222, 0.15)'),
        serie('Acompañamientos', acompanamientos, '#ee6666', 'rgba(238, 102, 102, 0.12)')
    ]);
</script>
</c:if>

</div>
</body>
</html>
