USE Retro_Garage;

SELECT
	Engine_Model.ModelName AS "Engine Model",
    COUNT(DISTINCT Vehicle_Model.ID) AS "Number of Vehicle Model Applicable",
    GROUP_CONCAT(DISTINCT Vehicle_Model.ModelName ORDER BY Vehicle_Model.ID) "Vehicle Models Applicable"
FROM Engine_Model
JOIN Vehicle_Engine
	ON Vehicle_Engine.EngineModelID = Engine_Model.ID
JOIN Vehicle_Model
	ON Vehicle_Model.ID = Vehicle_Engine.VehicleModelID
GROUP BY Engine_Model.ID
ORDER BY COUNT(DISTINCT Vehicle_Model.ModelName) DESC, Engine_Model.ID;