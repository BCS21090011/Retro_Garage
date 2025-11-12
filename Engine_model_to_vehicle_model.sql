USE Retro_Garage;

SELECT Engine_Model.ModelName AS "Engine Model", Vehicle_Model.ModelName AS "Vehicle Model"
FROM Engine_Model
JOIN Vehicle_Engine
	ON Vehicle_Engine.EngineModelID = Engine_Model.ID
JOIN Vehicle_Model
	ON Vehicle_Model.ID = Vehicle_Engine.VehicleModelID
ORDER BY Engine_Model.ID, Vehicle_Model.ID;