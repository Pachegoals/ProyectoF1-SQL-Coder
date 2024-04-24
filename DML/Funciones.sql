DELIMITER $$
CREATE FUNCTION VictoriasDePiloto (vehiculo INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE VictoriasPiloto INT;
    SELECT COUNT(IdCarrera) INTO VictoriasPiloto FROM CARRERA
    WHERE IdVehiculo = vehiculo AND PosCarrera = 1;
    RETURN VictoriasPiloto;
END$$
DELIMITER ;

/*SELECT VictoriasDePiloto(16);*/

DELIMITER $$
CREATE FUNCTION `VictoriasDeEquipo`(equipo INT)
RETURNS INTEGER
DETERMINISTIC
BEGIN
    DECLARE VictoriasEquipo INT;
    SELECT COUNT(IdCarrera) INTO VictoriasEquipo FROM CARRERA C
    JOIN VEHICULOS V
    ON C.IdVehiculo = V.IdVehiculo WHERE IdEquipo = equipo AND PosCarrera = 1;
    RETURN VictoriasEquipo;
END$$
DELIMITER ;

/*SELECT VictoriasDeEquipo(2);*/