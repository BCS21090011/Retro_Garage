USE Retro_Garage;

SELECT
	Vehicle_Type.TypeName AS "Vehicle Type",
    COUNT(DISTINCT Engine_Model.ID) AS "Number of Engine Model Applicable",
    GROUP_CONCAT(DISTINCT Engine_Model.ModelName ORDER BY Engine_Model.ID) AS "Engine Models Applicable"
FROM Vehicle_Type
JOIN Vehicle_Variant
	ON Vehicle_Variant.VariantTypeID = Vehicle_Type.ID
JOIN Vehicle_Model
	ON Vehicle_Model.ID = Vehicle_Variant.VehicleModelID
JOIN Vehicle_Engine
	ON Vehicle_Engine.VehicleModelID = Vehicle_Model.ID
JOIN Engine_Model
	ON Engine_Model.ID = Vehicle_Engine.EngineModelID
GROUP BY Vehicle_Type.ID
ORDER BY COUNT(DISTINCT Engine_Model.ModelName) DESC, Vehicle_Type.ID;