INSERT INTO categoria (nombre, descripcion) VALUES ('Bowls', 'Bowls con proteína, granos y verduras');
INSERT INTO categoria (nombre, descripcion) VALUES ('Bebidas', 'Jugos y bebidas naturales');
INSERT INTO categoria (nombre, descripcion) VALUES ('Acompañamientos', 'Complementos saludables');

INSERT INTO producto (nombre, descripcion, precio, disponible, id_categoria) VALUES ('Bowl de pollo', 'Pollo a la plancha con arroz integral y verduras', 18.00, TRUE, 1);
INSERT INTO producto (nombre, descripcion, precio, disponible, id_categoria) VALUES ('Bowl de quinua', 'Quinua, palta, garbanzos y vegetales frescos', 16.50, TRUE, 1);
INSERT INTO producto (nombre, descripcion, precio, disponible, id_categoria) VALUES ('Jugo verde', 'Espinaca, piña, pepino y kion', 8.00, TRUE, 2);
INSERT INTO producto (nombre, descripcion, precio, disponible, id_categoria) VALUES ('Limonada de chía', 'Limonada natural con semillas de chía', 6.00, TRUE, 2);
INSERT INTO producto (nombre, descripcion, precio, disponible, id_categoria) VALUES ('Ensalada fresca', 'Lechuga, tomate, zanahoria y vinagreta', 12.00, TRUE, 3);
INSERT INTO producto (nombre, descripcion, precio, disponible, id_categoria) VALUES ('Wrap integral', 'Tortilla integral con pollo y vegetales', 10.00, FALSE, 3);


INSERT INTO usuario (nombre, apellido, username, clave, rol) VALUES ('Carlos', 'Pérez', 'admin', 'admin123', 'ADMINISTRADOR');
INSERT INTO usuario (nombre, apellido, username, clave, rol) VALUES ('Luis', 'Gómez', 'lgomez', '123456', 'MOTORIZADO');
INSERT INTO usuario (nombre, apellido, username, clave, rol) VALUES ('Pedro', 'Díaz', 'pdiaz', '123456', 'MOTORIZADO');
INSERT INTO usuario (nombre, apellido, username, clave, rol) VALUES ('José', 'Rojas', 'jrojas', '123456', 'MOTORIZADO');



INSERT INTO metodo_pago (nombre, numero) VALUES ('Yape', '987654321');
INSERT INTO metodo_pago (nombre, numero) VALUES ('Plin', '912345678');

INSERT INTO pedido (fecha, cliente_nombre, cliente_telefono, cliente_direccion, total, comprobante, id_metodo_pago, estado, id_motorizado)
VALUES (CURRENT_TIMESTAMP, 'María Quispe', '987111222', 'Jr. Ancash 450, El Tambo', 34.00, '12345678', 1, 'PENDIENTE', NULL);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (1, 1, 1, 18.00);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (1, 3, 2, 8.00);

INSERT INTO pedido (fecha, cliente_nombre, cliente_telefono, cliente_direccion, total, comprobante, id_metodo_pago, estado, id_motorizado)
VALUES (CURRENT_TIMESTAMP, 'Jorge Huamán', '956333444', 'Av. Huancavelica 1020, Huancayo', 28.50, '87654321', 1, 'ASIGNADO', 2);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (2, 2, 1, 16.50);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (2, 5, 1, 12.00);

INSERT INTO pedido (fecha, cliente_nombre, cliente_telefono, cliente_direccion, total, comprobante, id_metodo_pago, estado, id_motorizado)
VALUES (DATEADD(DAY, -2, CURRENT_TIMESTAMP), 'Ana Torres', '945999000', 'Jr. Puno 300, Huancayo', 24.00, '99887766', 2, 'ENTREGADO', 2);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (3, 5, 2, 12.00);
INSERT INTO pedido (fecha, cliente_nombre, cliente_telefono, cliente_direccion, total, comprobante, id_metodo_pago, estado, id_motorizado)
VALUES (DATEADD(DAY, -3, CURRENT_TIMESTAMP), 'Luis Cárdenas', '934777888', 'Av. Mariscal Castilla 2100, El Tambo', 54.00, '55667788', 1, 'ENTREGADO', 2);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (4, 1, 3, 18.00);
INSERT INTO pedido (fecha, cliente_nombre, cliente_telefono, cliente_direccion, total, comprobante, id_metodo_pago, estado, id_motorizado)
VALUES (DATEADD(DAY, -5, CURRENT_TIMESTAMP), 'Sofía Inga', '945500600', 'Calle Los Pinos 95, Chilca', 30.50, '33445566', 1, 'ENTREGADO', 3);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (5, 2, 1, 16.50);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (5, 3, 1, 8.00);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (5, 4, 1, 6.00);
INSERT INTO pedido (fecha, cliente_nombre, cliente_telefono, cliente_direccion, total, comprobante, id_metodo_pago, estado, id_motorizado)
VALUES (DATEADD(DAY, -29, CURRENT_TIMESTAMP), 'Carmen Ríos', '987200301', 'Jr. Lima 210, Huancayo', 26.00, '40010001', 2, 'ENTREGADO', 2);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (6, 1, 1, 18.00);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (6, 3, 1, 8.00);
INSERT INTO pedido (fecha, cliente_nombre, cliente_telefono, cliente_direccion, total, comprobante, id_metodo_pago, estado, id_motorizado)
VALUES (DATEADD(DAY, -27, CURRENT_TIMESTAMP), 'Raúl Vega', '956200302', 'Av. Ferrocarril 560, Huancayo', 33.00, '40010002', 1, 'ENTREGADO', 3);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (7, 2, 2, 16.50);
INSERT INTO pedido (fecha, cliente_nombre, cliente_telefono, cliente_direccion, total, comprobante, id_metodo_pago, estado, id_motorizado)
VALUES (DATEADD(DAY, -25, CURRENT_TIMESTAMP), 'Patricia Soto', '912200303', 'Jr. Cusco 780, Huancayo', 24.00, '40010003', 1, 'ENTREGADO', 4);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (8, 5, 1, 12.00);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (8, 4, 2, 6.00);
INSERT INTO pedido (fecha, cliente_nombre, cliente_telefono, cliente_direccion, total, comprobante, id_metodo_pago, estado, id_motorizado)
VALUES (DATEADD(DAY, -23, CURRENT_TIMESTAMP), 'Miguel Ccanto', '934200304', 'Av. Giráldez 340, Huancayo', 36.00, '40010004', 2, 'ENTREGADO', 2);
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES (9, 1, 2, 18.00);