USE Retro_Garage;

SELECT
	Engine_Model.ModelName AS "Engine Model",
    COUNT(DISTINCT Vehicle_Type.ID) AS "Number of Vehicle Type Applicable",
	GROUP_CONCAT(DISTINCT Vehicle_Type.TypeName ORDER BY Vehicle_Type.ID) AS "Vehicle Types Applicable"
FROM Engine_Model
JOIN Vehicle_Engine
	ON Vehicle_Engine.EngineModelID = Engine_Model.ID
JOIN Vehicle_Model
	ON Vehicle_Model.ID = Vehicle_Engine.VehicleModelID
JOIN Vehicle_Variant
	ON Vehicle_Variant.VehicleModelID = Vehicle_Model.ID
JOIN Vehicle_Type
	ON Vehicle_Type.ID = Vehicle_Variant.VariantTypeID
GROUP BY Engine_Model.ID
ORDER BY COUNT(DISTINCT Vehicle_Type.TypeName) DESC, Engine_Model.ID;