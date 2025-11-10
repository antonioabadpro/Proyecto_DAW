-- ===========================
-- MARCAS
-- ===========================
INSERT INTO MARCA (id, nombre, logo) VALUES (1, 'Toyota', 'url/logo/toyota.png');
INSERT INTO MARCA (id, nombre, logo) VALUES (2, 'Ford', 'url/logo/ford.png');
INSERT INTO MARCA (id, nombre, logo) VALUES (3, 'Volkswagen', 'url/logo/vw.png');
INSERT INTO MARCA (id, nombre, logo) VALUES (4, 'BMW', 'url/logo/bmw.png');

-- ===========================
-- COCHES
-- ===========================
INSERT INTO COCHE (id, descripcion, color, precio, combustible, cajaCambios, estado, km, cv, marca_id) 
VALUES (10, 'Corolla', 'Blanco', 22000.0, 'Hibrido', 'Automatico', 'Nuevo', 50.0, 122.0, 1);

INSERT INTO COCHE (id, descripcion, color, precio, combustible, cajaCambios, estado, km, cv, marca_id) 
VALUES (11, 'Yaris', 'Negro', 19000.0, 'Gasolina', 'Manual', 'ComoNuevo', 8000.0, 110.0, 1);

INSERT INTO COCHE (id, descripcion, color, precio, combustible, cajaCambios, estado, km, cv, marca_id) 
VALUES (12, 'Focus', 'Rojo', 25000.0, 'Diesel', 'Manual', 'Usado', 50000.0, 120.0, 2);

INSERT INTO COCHE (id, descripcion, color, precio, combustible, cajaCambios, estado, km, cv, marca_id) 
VALUES (13, 'Serie 3', 'Negro', 45000.0, 'Gasolina', 'Automatico', 'ComoNuevo', 4000.0, 184.0, 4);