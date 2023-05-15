CREATE TABLE Articulos (
  idArticulo INT PRIMARY KEY,
  Descripcion VARCHAR(100),
  Existencia INT
);
DELIMITER //
CREATE PROCEDURE InsertarArticulo(
  IN p_idArticulo INT,
  IN p_Descripcion VARCHAR(100),
  IN p_Existencia INT
)
BEGIN
  INSERT INTO Articulos (idArticulo, Descripcion, Existencia)
  VALUES (p_idArticulo, p_Descripcion, p_Existencia);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE BorrarArticulo(
  IN p_idArticulo INT
)
BEGIN
  DELETE FROM Articulos WHERE idArticulo = p_idArticulo;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE CambiarArticulo(
  IN p_idArticulo INT,
  IN p_Descripcion VARCHAR(100),
  IN p_Existencia INT
)
BEGIN
  UPDATE Articulos
  SET Descripcion = p_Descripcion, Existencia = p_Existencia
  WHERE idArticulo = p_idArticulo;
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE MostrarArticulo(
  IN p_idArticulo INT
)
BEGIN
  SELECT * FROM Articulos WHERE idArticulo = p_idArticulo;
END //
DELIMITER ;
