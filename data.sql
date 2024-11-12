DROP DATABASE IF EXISTS dbGamarraMarket;
CREATE DATABASE dbGamarraMarket DEFAULT CHARACTER SET utf8mb4;
USE dbGamarraMarket;

CREATE TABLE CLIENTE (
    id INT PRIMARY KEY,
    tipo_documento VARCHAR(10),
    numero_documento VARCHAR(20) UNIQUE,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    email VARCHAR(100),
    celular VARCHAR(15),
    fecha_nacimiento DATE,
    activo TINYINT(1) DEFAULT 1
);

CREATE TABLE VENDEDOR (
    id INT PRIMARY KEY,
    tipo_documento VARCHAR(10),
    numero_documento VARCHAR(20) UNIQUE,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    salario DECIMAL(10, 2),
    celular VARCHAR(15),
    email VARCHAR(100),
    activo TINYINT(1) DEFAULT 1
);

CREATE TABLE PRENDA (
    id INT PRIMARY KEY,
    descripcion VARCHAR(100),
    marca VARCHAR(50),
    cantidad INT,
    talla VARCHAR(5),
    precio DECIMAL(10, 2),
    activo TINYINT(1) DEFAULT 1
);

INSERT INTO CLIENTE (id, tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo) VALUES
(1, 'DNI', '77889955', 'Alberto', 'Salorio Pariona', 'alberto.pariona@empresa.com', '998456103', '1970-02-10', 1),
(2, 'DNI', '45781233', 'Alicia', 'García Campos', 'alicia.garcia@gmail.com', '993265471', '1980-03-04', 1),
(3, 'DNI', '31458796', 'Juana', 'Chávez Otilia', 'juana.avila@gmail.com', '974852630', '1965-06-02', 1),
(4, 'DNI', '21567898', 'Ana', 'Enríquez Flores', 'ana.enriquez@example.com', '979456325', '1971-05-10', 1),
(5, 'DNI', '45238541', 'Brunela', 'Paredes Parra', 'brunela.paredes@yahoo.com', '997856471', '1960-10-12', 1),
(6, 'DNI', '41525867', 'Mario', 'Barrios Martínez', 'mario.barrios@outlook.com', '986525871', '1987-10-06', 1),
(7, 'DNI', '33456729', 'Jessica', 'Jimenez Huapaya', 'jessica.jimenez@hotmail.com', '941256734', '1990-11-11', 1),
(8, 'DNI', '15486793', 'Claudia', 'Marquez Lino', 'claudia.marquez@outlook.com', '912654287', '1988-12-21', 1),
(9, 'DNI', '74145285', 'Mario', 'Rodríguez Mayo', 'mario.rodriguez@outlook.com', '922881101', '1987-11-10', 1),
(10, 'DNI', '69851236', 'Luisa', 'Guerra Ibarra', 'luisa.guerra@hotmail.com', '999852147', '1975-03-02', 1),
(11, 'DNI', '25841763', 'Pedro', 'Candela Valenzuela', 'pedro.candela@gmail.com', '941485253', '1995-05-04', 1),
(12, 'DNI', '45896321', 'Amelia', 'Rojas Avila', 'amelia.rojas@outlook.es', '991256348', '1973-07-05', 1),
(13, 'DNI', '74532565', 'Hilario F.', 'Avila Huapaya', NULL, '985114326', '2000-03-06', 1),
(14, 'CNE', '41555267', 'Octavio', 'Marquez Osorio', 'octavio.marquez@yahoo.es', '998745621', '1973-09-12', 1),
(15, 'CNE', '558639219', 'Manolo E.', 'Vasquez Saravia', 'manolo.vasquez@outlook.es', '965874123', '2000-09-22', 1),
(16, 'DNI', '41155267', 'Genoveva', 'Ortiz Quezada', 'genoveva.ortiz@example.com', '956314257', '1987-10-26', 1),
(17, 'DNI', '499832147', 'Oscar C.', 'Quiroz Zavala', NULL, '988223145', '2004-08-21', 1),
(18, 'DNI', '475632589', 'Veronica', 'Romero Vargas', 'veronica.romero@yahoo.com', '982312145', '1987-04-10', 1),
(19, 'DNI', '003256341', 'Eliseo', 'Prada Ortiz', 'eliseo.prada@yahoo.com', NULL, '2004-09-15', 1);

INSERT INTO VENDEDOR (id, tipo_documento, numero_documento, nombres, apellidos, salario, celular, email, activo) VALUES
(1, 'DNI', '85471236', 'Enrique', 'Pérez Manco', 1500.00, '96521873', 'enrique.perez@outlook.com', 1),
(2, 'DNI', '47259136', 'Sofía', 'Ávila Solis', 1350.00, NULL, NULL, 1),
(3, 'CNE', '61542280', 'Marcela', 'Napaico Cama', 1600.00, '965874357', 'marcela.napaico@gmail.com', 1),
(4, 'CNE', '742536140', 'Carmelo', 'Rodríguez Chauca', 1550.00, NULL, 'carmelo.rodriguez@yahoo.com', 1);

INSERT INTO PRENDA (id, descripcion, marca, cantidad, talla, precio, activo) VALUES
(1, 'Pantalon Jeans', 'Levis', 60, '28', 65.00, 1),
(2, 'Camisa manga corta', 'Adams', 75, '16', 55.00, 1),
(3, 'Polo sport', 'Australia', 100, 'L', 40.00, 1),
(4, 'Camisa manga larga', 'Newport', 150, '16', 79.50, 1),
(5, 'Pijama para caballero', 'Adams', 180, '18', 79.50, 1),
(6, 'Corbata', 'Maxwell', 85, '16', 14.50, 1),
(7, 'Pijama para dama', 'Adams', 75, 'L', 60.00, 1),
(8, 'Pantalon Jeans sport', 'John Holden', 80, '36', 88.50, 1),
(9, 'Shorts Jeans', 'Pepe Jeans', 120, '38', 70.00, 1);


CREATE TABLE VENTA (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    cliente_id INT NOT NULL,
    vendedor_id INT NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES CLIENTE(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (vendedor_id) REFERENCES VENDEDOR(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE VENTA_DETALLE (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cantidad INT NOT NULL,
    venta_id INT NOT NULL,
    prenda_id INT NOT NULL,
    FOREIGN KEY (venta_id) REFERENCES VENTA(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (prenda_id) REFERENCES PRENDA(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO VENTA (fecha_hora, cliente_id, vendedor_id, activo) VALUES
('2023-05-01 19:04:08', 4, 1, 1),
('2023-05-01 19:04:08', 6, 3, 1),
('2023-05-01 19:04:08', 10, 1, 1),
('2023-05-01 19:04:08', 18, 4, 1);

INSERT INTO VENTA_DETALLE (venta_id, prenda_id, cantidad) VALUES
(1, 6, 3),
(1, 3, 5),
(1, 2, 7),
(2, 2, 3),
(3, 7, 4),
(3, 10, 6),
(3, 2, 6),
(3, 5, 7),
(4, 2, 4),
(4, 5, 3);


ALTER TABLE VENTA
ADD CONSTRAINT fk_cliente_venta
FOREIGN KEY (cliente_id) REFERENCES CLIENTE(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE VENTA
ADD CONSTRAINT fk_vendedor_venta
FOREIGN KEY (vendedor_id) REFERENCES VENDEDOR(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT fk_venta_venta_detalle
FOREIGN KEY (venta_id) REFERENCES VENTA(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE VENTA_DETALLE
ADD CONSTRAINT fk_prenda_venta_detalle
FOREIGN KEY (prenda_id) REFERENCES PRENDA(id) ON DELETE CASCADE ON UPDATE CASCADE;


SELECT 
    kcu.CONSTRAINT_NAME AS 'Nombre de Relación',
    kcu.REFERENCED_TABLE_NAME AS 'Tabla Padre',
    kcu.REFERENCED_COLUMN_NAME AS 'Primary Key',
    kcu.TABLE_NAME AS 'Tabla Hija',
    kcu.COLUMN_NAME AS 'Foreign Key'
FROM 
    information_schema.KEY_COLUMN_USAGE AS kcu
WHERE 
    kcu.TABLE_SCHEMA = 'dbGamarraMarket' 
    AND kcu.REFERENCED_TABLE_NAME IS NOT NULL;
    
SHOW TABLES;

DESCRIBE CLIENTE;
DESCRIBE VENDEDOR;
DESCRIBE PRENDA;
DESCRIBE VENTA;