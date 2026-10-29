-- Borra las tablas si ya existen, para poder ejecutar el script varias veces.
-- Van en orden inverso: primero las que dependen de otras.
DROP TABLE IF EXISTS movimientos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS proveedores;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
    id     INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE proveedores (
    id       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre   VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    email    VARCHAR(100)
);

CREATE TABLE usuarios (
    id            INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario       VARCHAR(50)  NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    nombre        VARCHAR(100) NOT NULL
);

CREATE TABLE productos (
    id           INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo       VARCHAR(20)  NOT NULL UNIQUE,
    nombre       VARCHAR(150) NOT NULL,
    descripcion  TEXT,
    categoria_id INTEGER NOT NULL REFERENCES categorias(id) ON DELETE RESTRICT,
    proveedor_id INTEGER NOT NULL REFERENCES proveedores(id) ON DELETE RESTRICT,
    precio_coste NUMERIC(10,2) NOT NULL CHECK (precio_coste >= 0),
    precio_venta NUMERIC(10,2) NOT NULL CHECK (precio_venta >= 0),
    stock        INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
    stock_minimo INTEGER NOT NULL DEFAULT 0 CHECK (stock_minimo >= 0)
);

CREATE TABLE movimientos (
    id          INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    producto_id INTEGER NOT NULL REFERENCES productos(id) ON DELETE CASCADE,
    usuario_id  INTEGER NOT NULL REFERENCES usuarios(id) ON DELETE RESTRICT,
    tipo        VARCHAR(10) NOT NULL CHECK (tipo IN ('entrada', 'salida')),
    cantidad    INTEGER NOT NULL CHECK (cantidad > 0),
    fecha       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comentario  TEXT
);
