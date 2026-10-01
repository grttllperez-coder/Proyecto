-- Base de datos de demostración para Plaza Tezontle
-- PostgreSQL / pgAdmin 4
-- Total exacto: 100 registros distribuidos en 5 tablas.
-- Distribución: 25 tiendas + 20 promociones + 20 locales + 15 restaurantes + 20 servicios = 100.

CREATE SCHEMA IF NOT EXISTS plaza_tezontle;
SET search_path TO plaza_tezontle;

DROP VIEW IF EXISTS resumen_registros;
DROP TABLE IF EXISTS promociones CASCADE;
DROP TABLE IF EXISTS servicios CASCADE;
DROP TABLE IF EXISTS restaurantes CASCADE;
DROP TABLE IF EXISTS locales CASCADE;
DROP TABLE IF EXISTS tiendas CASCADE;

CREATE TABLE tiendas (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  local VARCHAR(30) NOT NULL,
  piso VARCHAR(30) NOT NULL,
  telefono VARCHAR(20),
  horario VARCHAR(60) NOT NULL,
  activa BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE promociones (
  id SERIAL PRIMARY KEY,
  tienda_id INTEGER NOT NULL REFERENCES tiendas(id) ON DELETE CASCADE,
  titulo VARCHAR(150) NOT NULL,
  descuento VARCHAR(40) NOT NULL,
  descripcion VARCHAR(255) NOT NULL,
  vigencia DATE NOT NULL,
  activa BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE locales (
  id SERIAL PRIMARY KEY,
  codigo VARCHAR(30) UNIQUE NOT NULL,
  area_m2 NUMERIC(8,2) NOT NULL,
  piso VARCHAR(30) NOT NULL,
  zona VARCHAR(80) NOT NULL,
  estado VARCHAR(30) NOT NULL,
  precio_mensual NUMERIC(12,2) NOT NULL
);

CREATE TABLE restaurantes (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  local VARCHAR(30) NOT NULL,
  piso VARCHAR(30) NOT NULL,
  rango_precio VARCHAR(10) NOT NULL,
  horario VARCHAR(60) NOT NULL,
  activo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE servicios (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  local VARCHAR(30) NOT NULL,
  piso VARCHAR(30) NOT NULL,
  telefono VARCHAR(20),
  horario VARCHAR(60) NOT NULL,
  activo BOOLEAN NOT NULL DEFAULT TRUE
);

-- 25 TIENDAS
INSERT INTO tiendas (nombre,categoria,local,piso,telefono,horario) VALUES
('Zara','Moda','Local A-01','Planta Alta','55 5001 1001','Lun-Dom 10:00-21:00'),
('H&M','Moda','Local B-02','Planta Baja','55 5002 1002','Lun-Dom 10:00-21:00'),
('Nike','Moda','Local C-03','Planta Alta','55 5003 1003','Lun-Dom 10:00-21:00'),
('Samsung Store','Tecnología','Local D-04','Planta Baja','55 5004 1004','Lun-Dom 10:00-21:00'),
('Liverpool','Departamental','Local E-05','Planta Alta','55 5005 1005','Lun-Dom 10:00-21:00'),
('Cinépolis','Entretenimiento','Local A-06','Planta Baja','55 5006 1006','Lun-Dom 10:00-21:00'),
('MAC Cosmetics','Belleza','Local B-07','Planta Alta','55 5007 1007','Lun-Dom 10:00-21:00'),
('Sears','Hogar','Local C-08','Planta Baja','55 5008 1008','Lun-Dom 10:00-21:00'),
('Pull&Bear','Moda','Local D-09','Planta Alta','55 5009 1009','Lun-Dom 10:00-21:00'),
('Walmart','Supermercado','Local E-10','Planta Baja','55 5010 1010','Lun-Dom 10:00-21:00'),
('Adidas','Moda','Local A-11','Planta Alta','55 5011 1011','Lun-Dom 10:00-21:00'),
('Miniso','Hogar','Local B-12','Planta Baja','55 5012 1012','Lun-Dom 10:00-21:00'),
('C&A','Moda','Local C-13','Planta Alta','55 5013 1013','Lun-Dom 10:00-21:00'),
('Levi's','Moda','Local D-14','Planta Baja','55 5014 1014','Lun-Dom 10:00-21:00'),
('iShop','Tecnología','Local E-15','Planta Alta','55 5015 1015','Lun-Dom 10:00-21:00'),
('Sephora','Belleza','Local A-16','Planta Baja','55 5016 1016','Lun-Dom 10:00-21:00'),
('Pandora','Belleza','Local B-17','Planta Alta','55 5017 1017','Lun-Dom 10:00-21:00'),
('GamePlanet','Entretenimiento','Local C-18','Planta Baja','55 5018 1018','Lun-Dom 10:00-21:00'),
('Sunglass Hut','Moda','Local D-19','Planta Alta','55 5019 1019','Lun-Dom 10:00-21:00'),
('Swarovski','Belleza','Local E-20','Planta Baja','55 5020 1020','Lun-Dom 10:00-21:00'),
('Office Depot','Servicios','Local A-21','Planta Alta','55 5021 1021','Lun-Dom 10:00-21:00'),
('Petco','Servicios','Local B-22','Planta Baja','55 5022 1022','Lun-Dom 10:00-21:00'),
('Mobo','Tecnología','Local C-23','Planta Alta','55 5023 1023','Lun-Dom 10:00-21:00'),
('Martí','Servicios','Local D-24','Planta Baja','55 5024 1024','Lun-Dom 10:00-21:00'),
('The Home Depot','Hogar','Local E-25','Planta Alta','55 5025 1025','Lun-Dom 10:00-21:00');

-- 20 PROMOCIONES
INSERT INTO promociones (tienda_id,titulo,descuento,descripcion,vigencia) VALUES
(1,'Descuento de temporada','15%','Promoción de demostración para clientes de Zara.','2026-11-11'),
(2,'2x1 en seleccionados','20%','Promoción de demostración para clientes de H&M.','2026-12-12'),
(3,'Hasta 30% de descuento','25%','Promoción de demostración para clientes de Nike.','2026-10-13'),
(4,'Precio especial','30%','Promoción de demostración para clientes de Samsung Store.','2026-11-14'),
(5,'Oferta exclusiva','35%','Promoción de demostración para clientes de Liverpool.','2026-12-15'),
(6,'Regreso a clases','10%','Promoción de demostración para clientes de Cinépolis.','2026-10-16'),
(7,'Semana de belleza','15%','Promoción de demostración para clientes de MAC Cosmetics.','2026-11-17'),
(8,'Promoción del mes','20%','Promoción de demostración para clientes de Sears.','2026-12-18'),
(9,'Descuento en línea','25%','Promoción de demostración para clientes de Pull&Bear.','2026-10-19'),
(10,'Liquidación especial','30%','Promoción de demostración para clientes de Walmart.','2026-11-20'),
(11,'Compra y ahorra','35%','Promoción de demostración para clientes de Adidas.','2026-12-21'),
(12,'Beneficio para clientes','10%','Promoción de demostración para clientes de Miniso.','2026-10-22'),
(13,'Fin de temporada','15%','Promoción de demostración para clientes de C&A.','2026-11-23'),
(14,'Oferta familiar','20%','Promoción de demostración para clientes de Levi's.','2026-12-24'),
(15,'Descuento adicional','25%','Promoción de demostración para clientes de iShop.','2026-10-25'),
(16,'Combo especial','30%','Promoción de demostración para clientes de Sephora.','2026-11-26'),
(17,'Precio preferencial','35%','Promoción de demostración para clientes de Pandora.','2026-12-27'),
(18,'Promoción de fin de semana','10%','Promoción de demostración para clientes de GamePlanet.','2026-10-10'),
(19,'Edición limitada','15%','Promoción de demostración para clientes de Sunglass Hut.','2026-11-11'),
(20,'Oferta por aniversario','20%','Promoción de demostración para clientes de Swarovski.','2026-12-12');

-- 20 LOCALES
INSERT INTO locales (codigo,area_m2,piso,zona,estado,precio_mensual) VALUES
('L-001',42.50,'Planta Alta','Zona Norte','disponible',19250.00),
('L-002',50.00,'Planta Baja','Zona Centro','disponible',20500.00),
('L-003',57.50,'Planta Alta','Zona Sur','en-negociacion',21750.00),
('L-004',65.00,'Planta Baja','Pasillo Principal','ocupado',23000.00),
('L-005',72.50,'Planta Alta','Acceso Oriente','disponible',24250.00),
('L-006',80.00,'Planta Baja','Zona Norte','disponible',25500.00),
('L-007',87.50,'Planta Alta','Zona Centro','en-negociacion',26750.00),
('L-008',95.00,'Planta Baja','Zona Sur','ocupado',28000.00),
('L-009',102.50,'Planta Alta','Pasillo Principal','disponible',29250.00),
('L-010',110.00,'Planta Baja','Acceso Oriente','disponible',30500.00),
('L-011',117.50,'Planta Alta','Zona Norte','en-negociacion',31750.00),
('L-012',125.00,'Planta Baja','Zona Centro','ocupado',33000.00),
('L-013',132.50,'Planta Alta','Zona Sur','disponible',34250.00),
('L-014',140.00,'Planta Baja','Pasillo Principal','disponible',35500.00),
('L-015',147.50,'Planta Alta','Acceso Oriente','en-negociacion',36750.00),
('L-016',155.00,'Planta Baja','Zona Norte','ocupado',38000.00),
('L-017',162.50,'Planta Alta','Zona Centro','disponible',39250.00),
('L-018',170.00,'Planta Baja','Zona Sur','disponible',40500.00),
('L-019',177.50,'Planta Alta','Pasillo Principal','en-negociacion',41750.00),
('L-020',185.00,'Planta Baja','Acceso Oriente','ocupado',43000.00);

-- 15 RESTAURANTES
INSERT INTO restaurantes (nombre,tipo,local,piso,rango_precio,horario) VALUES
('Vips','Mexicana','Comida-01','Planta Baja','$','Lun-Dom 10:00-22:00'),
('Chili's','Americana','Comida-02','Planta Alta','$$','Lun-Dom 10:00-22:00'),
('Starbucks','Cafetería','Comida-03','Planta Baja','$$$','Lun-Dom 10:00-22:00'),
('Sushi Roll','Japonesa','Comida-04','Planta Alta','$','Lun-Dom 10:00-22:00'),
('La Casa de Toño','Mexicana','Comida-05','Planta Baja','$$','Lun-Dom 10:00-22:00'),
('Burger King','Hamburguesas','Comida-06','Planta Alta','$$$','Lun-Dom 10:00-22:00'),
('Domino's Pizza','Pizza','Comida-07','Planta Baja','$','Lun-Dom 10:00-22:00'),
('P.F. Chang's','Asiática','Comida-08','Planta Alta','$$','Lun-Dom 10:00-22:00'),
('Italianni's','Italiana','Comida-09','Planta Baja','$$$','Lun-Dom 10:00-22:00'),
('Café Punta del Cielo','Cafetería','Comida-10','Planta Alta','$','Lun-Dom 10:00-22:00'),
('El Globo','Panadería','Comida-11','Planta Baja','$$','Lun-Dom 10:00-22:00'),
('Toks','Mexicana','Comida-12','Planta Alta','$$$','Lun-Dom 10:00-22:00'),
('Subway','Rápida','Comida-13','Planta Baja','$','Lun-Dom 10:00-22:00'),
('KFC','Pollo','Comida-14','Planta Alta','$$','Lun-Dom 10:00-22:00'),
('Nutrisa','Postres','Comida-15','Planta Baja','$$$','Lun-Dom 10:00-22:00');

-- 20 SERVICIOS
INSERT INTO servicios (nombre,tipo,local,piso,telefono,horario) VALUES
('Telcel','Telefonía','Servicio-01','Planta Alta','55 6001 2001','Lun-Sáb 09:00-20:00'),
('AT&T','Telefonía','Servicio-02','Planta Baja','55 6002 2002','Lun-Sáb 09:00-20:00'),
('Estafeta','Paquetería','Servicio-03','Planta Alta','55 6003 2003','Lun-Sáb 09:00-20:00'),
('FedEx','Paquetería','Servicio-04','Planta Baja','55 6004 2004','Lun-Sáb 09:00-20:00'),
('Banorte','Banca','Servicio-05','Planta Alta','55 6005 2005','Lun-Sáb 09:00-20:00'),
('BBVA','Banca','Servicio-06','Planta Baja','55 6006 2006','Lun-Sáb 09:00-20:00'),
('Santander','Banca','Servicio-07','Planta Alta','55 6007 2007','Lun-Sáb 09:00-20:00'),
('HSBC','Banca','Servicio-08','Planta Baja','55 6008 2008','Lun-Sáb 09:00-20:00'),
('Smart Fit','Gimnasio','Servicio-09','Planta Alta','55 6009 2009','Lun-Sáb 09:00-20:00'),
('Dental Care','Salud dental','Servicio-10','Planta Baja','55 6010 2010','Lun-Sáb 09:00-20:00'),
('Ópticas Devlyn','Óptica','Servicio-11','Planta Alta','55 6011 2011','Lun-Sáb 09:00-20:00'),
('Farmacias del Ahorro','Farmacia','Servicio-12','Planta Baja','55 6012 2012','Lun-Sáb 09:00-20:00'),
('Tintorería Express','Tintorería','Servicio-13','Planta Alta','55 6013 2013','Lun-Sáb 09:00-20:00'),
('LavaPlus','Lavandería','Servicio-14','Planta Baja','55 6014 2014','Lun-Sáb 09:00-20:00'),
('Peluquería Central','Belleza','Servicio-15','Planta Alta','55 6015 2015','Lun-Sáb 09:00-20:00'),
('Barber Shop','Belleza','Servicio-16','Planta Baja','55 6016 2016','Lun-Sáb 09:00-20:00'),
('Reparaciones MX','Reparación','Servicio-17','Planta Alta','55 6017 2017','Lun-Sáb 09:00-20:00'),
('Centro de Copiado','Papelería','Servicio-18','Planta Baja','55 6018 2018','Lun-Sáb 09:00-20:00'),
('Viajes Tezontle','Viajes','Servicio-19','Planta Alta','55 6019 2019','Lun-Sáb 09:00-20:00'),
('Escuela de Idiomas','Educación','Servicio-20','Planta Baja','55 6020 2020','Lun-Sáb 09:00-20:00');

-- Vista de comprobación: debe mostrar 100 registros en total.
CREATE VIEW resumen_registros AS
SELECT 'Tiendas' AS tipo, COUNT(*) AS cantidad FROM tiendas
UNION ALL SELECT 'Promociones', COUNT(*) FROM promociones
UNION ALL SELECT 'Locales', COUNT(*) FROM locales
UNION ALL SELECT 'Restaurantes', COUNT(*) FROM restaurantes
UNION ALL SELECT 'Servicios', COUNT(*) FROM servicios
UNION ALL SELECT 'TOTAL', (
  (SELECT COUNT(*) FROM tiendas) +
  (SELECT COUNT(*) FROM promociones) +
  (SELECT COUNT(*) FROM locales) +
  (SELECT COUNT(*) FROM restaurantes) +
  (SELECT COUNT(*) FROM servicios)
);

SELECT * FROM resumen_registros;
