/*
SELECT * FROM GRANDES_PREMIOS;
SELECT * FROM CIRCUITOS;
SELECT * FROM CARRERA;
SELECT * FROM VEHICULOS;
SELECT * FROM EQUIPOS;
SELECT * FROM PILOTOS;
*/

CREATE OR REPLACE VIEW ResultadosCarrera AS 
(SELECT GP.IdGp, CI.NombreCircuito, CA.PosCarrera, V.IdVehiculo, CA.PosSalida, P.NombrePiloto, E.NombreEquipo, CA.VueltasCompletadasCarrera, CA.PuntosCarrera
	FROM GRANDES_PREMIOS GP
	JOIN CIRCUITOS CI
	ON GP.IdCircuito = CI.IdCircuito
	JOIN CARRERA CA
	ON GP.IdGP = CA.IdCarrera
	JOIN VEHICULOS V
	ON CA.IdVehiculo = V.IdVehiculo
	JOIN PILOTOS P
	ON CA.IdVehiculo = P.IdVehiculo
	JOIN EQUIPOS E
	ON V.IdEquipo = E.IdEquipo
    WHERE GP.IdGp =  1
);

/*
*/
CREATE OR REPLACE VIEW VueltaRapidaCarrera AS
(SELECT CA.IdCarrera, VRC.IdVehiculo, P.NombrePiloto, E.NombreEquipo, VRC.VueltaRapidaCarrera, VRC.VueltaNro, VRC.PuntoVueltaRapidaCarrera
    FROM CARRERA CA
    JOIN VUELTA_RAPIDA_CARRERA VRC
    ON CA.IdCarrera = VRC.IdCarrera
    JOIN VEHICULOS V
    ON VRC.IdVehiculo = V.IdVehiculo
    JOIN PILOTOS P
    ON V.IdVehiculo = P.IdVehiculo
    JOIN EQUIPOS E
    ON V.IdEquipo = E.IdEquipo
    WHERE VRC.IdCarrera = 1
);

CREATE OR REPLACE VIEW ResultadosClasificacion AS
(SELECT CLA.IdClasificacion, CLA.PosClasificacion, CLA.IdVehiculo, P.NombrePiloto, E.NombreEquipo, CLA.VueltaRapidaClasificacion, CLA.VueltasCompletadasClasificacion
	FROM CLASIFICACION CLA
    JOIN VEHICULOS V
    ON CLA.IdVehiculo = V.IdVehiculo
    JOIN PILOTOS P
    ON CLA.IdVehiculo = P.IdVehiculo
    JOIN EQUIPOS E
    ON V.IdEquipo = E.IdEquipo
    WHERE CLA.IdClasificacion = 1
);

CREATE OR REPLACE VIEW ResultadosSprint AS
(SELECT SP.IdSprint, SP.PosSprint, SP.IdVehiculo, P.NombrePiloto, E.NombreEquipo, SP.PosSalida, SP.VueltasCompletadasSprint, SP.PuntosSprint
	FROM SPRINT SP
    JOIN VEHICULOS V
    ON SP.IdVehiculo = V.IdVehiculo
    JOIN PILOTOS P
    ON SP.IdVehiculo = P.IdVehiculo
    JOIN EQUIPOS E
    ON V.IdEquipo = E.IdEquipo
    WHERE SP.GpSprint = TRUE AND SP.IdSprint = 1
);

CREATE OR REPLACE VIEW TablaPuntosCampeonatoPilotos AS
(SELECT P.IdVehiculo, P.NombrePiloto, P.PuntosPiloto
    FROM PILOTOS P
    ORDER BY P.PuntosPiloto DESC
);

CREATE OR REPLACE VIEW TablaPuntosCampeonatoEquipos AS
(SELECT E.IdEquipo, E.NombreEquipo, E.PuntosEquipo
    FROM EQUIPOS E
    ORDER BY E.PuntosEquipo DESC
);
