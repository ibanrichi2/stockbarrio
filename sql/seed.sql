-- Datos de prueba. Ejecutar siempre DESPUÉS de schema.sql
-- (schema.sql vacía las tablas, así los id empiezan en 1).

INSERT INTO categorias (nombre) VALUES
    ('Herramientas'),   -- id 1
    ('Pintura'),        -- id 2
    ('Fontanería'),     -- id 3
    ('Electricidad');   -- id 4

INSERT INTO proveedores (nombre, telefono, email) VALUES
    ('Suministros Gipuzkoa', '943 123 456', 'pedidos@suministros.example'),  -- id 1
    ('Colores del Norte',    '944 654 321', 'ventas@colores.example'),       -- id 2
    ('Fontanería Urola',     '943 777 888', NULL);                            -- id 3

INSERT INTO usuarios (usuario, password_hash, nombre) VALUES
    ('admin', 'admin123', 'Administrador');  -- id 1

INSERT INTO productos
    (codigo, nombre, descripcion, categoria_id, proveedor_id,
     precio_coste, precio_venta, stock, stock_minimo)
VALUES
    ('HER-0001', 'Martillo de carpintero 500 g', 'Mango de fibra de vidrio', 1, 1,  6.40, 12.95, 18,  5),
    ('HER-0002', 'Destornillador plano 6 mm',    'Punta imantada',           1, 1,  2.10,  4.50, 40, 10),
    ('HER-0003', 'Cinta métrica 5 m',            'Con freno automático',     1, 1,  3.80,  7.95,  4,  6),
    ('PIN-0007', 'Pintura plástica blanca 4 L',  'Mate, interior',           2, 2, 14.10, 24.50,  3,  6),
    ('PIN-0008', 'Rodillo antigota 22 cm',       NULL,                       2, 2,  3.20,  6.90, 25,  8),
    ('PIN-0009', 'Cinta de carrocero 48 mm',     NULL,                       2, 2,  1.50,  3.25, 60, 20),
    ('FON-0001', 'Llave de paso 1/2"',           'Latón cromado',            3, 3,  5.60, 11.90, 12,  4),
    ('FON-0002', 'Cinta de teflón',              NULL,                       3, 3,  0.40,  1.20,  8, 15),
    ('ELE-0001', 'Bombilla LED E27 10 W',        'Luz cálida 2700 K',        4, 1,  1.90,  4.95, 50, 20),
    ('ELE-0002', 'Regleta 4 tomas',              'Con interruptor',          4, 1,  4.30,  9.90, 10,  5);

INSERT INTO movimientos (producto_id, usuario_id, tipo, cantidad, fecha, comentario) VALUES
    (1, 1, 'entrada', 20, '2026-10-20 09:15', 'Pedido inicial'),
    (1, 1, 'salida',   2, '2026-10-22 11:30', 'Venta'),
    (4, 1, 'entrada', 10, '2026-10-21 10:00', 'Pedido a Colores del Norte'),
    (4, 1, 'salida',   7, '2026-10-27 17:45', 'Venta a una comunidad de vecinos'),
    (8, 1, 'salida',   1, '2026-10-28 12:10', 'Rotura');
