<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Conoce lo que comes - Nutribubble</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">
    <style>
        .caja { max-width: 1000px; }
        .intro { text-align: center; margin-bottom: 24px; }
        .intro h1 { margin-bottom: 6px; }
        .intro p { color: #5f6e63; margin: 0; }

        .platos { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }
        .plato { border: 1px solid #d8e3d3; border-radius: 10px; overflow: hidden; background: white; }
        .plato img { width: 100%; height: 170px; object-fit: cover; display: block; }
        .plato .texto { padding: 14px 16px 16px; }
        .plato h3 { margin: 0; color: #1f2a22; }
        .plato .categoria { color: #5f6e63; font-size: 13px; }

        .dato { display: flex; justify-content: space-between; padding: 6px 0; border-bottom: 1px dashed #d8e3d3; }
        .dato b { color: #2e7d32; }
        .datos { margin: 10px 0 12px; }

        .etiqueta { display: inline-block; padding: 4px 12px; border-radius: 999px; font-size: 13px; font-weight: bold;
                    background: #e8f5e9; color: #2e7d32; }
        .etiqueta.gris { background: #eeeeee; color: #616161; }

        .frase { text-align: center; margin: 30px 0 4px; font-size: 22px; font-style: italic; color: #2e7d32; }
        .nota { text-align: center; color: #888; font-size: 12px; margin: 0; }
    </style>
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

<div class="intro">
    <h1>Conoce lo que comes</h1>
    <p>Cada plato de Nutribubble está pensado para darte energía sin descuidar tu salud.</p>
</div>

<div class="platos">

    <div class="plato">
        <img src="${pageContext.request.contextPath}/img/bowl-pollo.svg" alt="Bowl de pollo">
        <div class="texto">
            <h3>Bowl de pollo</h3>
            <div class="categoria">Bowls</div>
            <div class="datos">
                <div class="dato"><span>Calorías</span><b>450 kcal</b></div>
                <div class="dato"><span>Proteína</span><b>35 g</b></div>
            </div>
            <span class="etiqueta">Alto en proteína</span>
        </div>
    </div>

    <div class="plato">
        <img src="${pageContext.request.contextPath}/img/bowl-quinua.svg" alt="Bowl de quinua">
        <div class="texto">
            <h3>Bowl de quinua</h3>
            <div class="categoria">Bowls</div>
            <div class="datos">
                <div class="dato"><span>Calorías</span><b>420 kcal</b></div>
                <div class="dato"><span>Fibra</span><b>9 g</b></div>
            </div>
            <span class="etiqueta">100% vegetariano</span>
        </div>
    </div>

    <div class="plato">
        <img src="${pageContext.request.contextPath}/img/jugo-verde.svg" alt="Jugo verde">
        <div class="texto">
            <h3>Jugo verde</h3>
            <div class="categoria">Bebidas</div>
            <div class="datos">
                <div class="dato"><span>Calorías</span><b>120 kcal</b></div>
                <div class="dato"><span>Azúcar añadida</span><b>0 g</b></div>
            </div>
            <span class="etiqueta">Sin azúcar añadida</span>
        </div>
    </div>

    <div class="plato">
        <img src="${pageContext.request.contextPath}/img/limonada-chia.svg" alt="Limonada de chía">
        <div class="texto">
            <h3>Limonada de chía</h3>
            <div class="categoria">Bebidas</div>
            <div class="datos">
                <div class="dato"><span>Calorías</span><b>90 kcal</b></div>
                <div class="dato"><span>Omega 3</span><b>Sí</b></div>
            </div>
            <span class="etiqueta">Refrescante</span>
        </div>
    </div>

    <div class="plato">
        <img src="${pageContext.request.contextPath}/img/ensalada-fresca.svg" alt="Ensalada fresca">
        <div class="texto">
            <h3>Ensalada fresca</h3>
            <div class="categoria">Acompañamientos</div>
            <div class="datos">
                <div class="dato"><span>Calorías</span><b>180 kcal</b></div>
                <div class="dato"><span>Fibra</span><b>6 g</b></div>
            </div>
            <span class="etiqueta">Bajo en calorías</span>
        </div>
    </div>

    <div class="plato">
        <img src="${pageContext.request.contextPath}/img/wrap-integral.svg" alt="Wrap integral">
        <div class="texto">
            <h3>Wrap integral</h3>
            <div class="categoria">Acompañamientos</div>
            <div class="datos">
                <div class="dato"><span>Calorías</span><b>380 kcal</b></div>
                <div class="dato"><span>Proteína</span><b>25 g</b></div>
            </div>
            <span class="etiqueta gris">Próximamente</span>
        </div>
    </div>

</div>

<p class="frase">"Comer sano también puede ser delicioso."</p>
<p class="nota">* Valores aproximados por porción.</p>

</div>
</body>
</html>
