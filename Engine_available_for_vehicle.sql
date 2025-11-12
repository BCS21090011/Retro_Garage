USE Retro_Garage;

SELECT
	Vehicle_Model.ModelName AS "Vehicle Model",
    COUNT(DISTINCT Engine_Model.ID) AS "Number of Engine Model Available",
    GROUP_CONCAT(DISTINCT Engine_Model.ModelName ORDER BY Engine_Model.ID) AS "Engine Model Available"
FROM Vehicle_Model
JOIN Vehicle_Engine
	ON Vehicle_Engine.VehicleModelID = Vehicle_Model.ID
JOIN Engine_Model
	ON Engine_Model.ID = Vehicle_Engine.EngineModelID
GROUP BY Vehicle_Model.ID
ORDER BY COUNT(DISTINCT Engine_Model.ID) DESC, Vehicle_Model.ID;