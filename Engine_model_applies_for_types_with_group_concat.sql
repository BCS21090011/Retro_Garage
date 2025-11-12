USE Retro_Garage;

SELECT Engine_Model.ModelName, GROUP_CONCAT(DISTINCT Vehicle_Type.TypeName ORDER BY Vehicle_Type.TypeName SEPARATOR ', ') AS "Types"
FROM Engine_Model
JOIN Vehicle_Engine ON Vehicle_Engine.EngineModelID = Engine_Model.ID
JOIN Vehicle_Model ON Vehicle_Model.ID = Vehicle_Engine.VehicleModelID
JOIN Vehicle_Variant ON Vehicle_Variant.VehicleModelID = Vehicle_Model.ID
JOIN Vehicle_Type ON Vehicle_Type.ID = Vehicle_Variant.VariantTypeID
GROUP BY Engine_Model.ModelName
ORDER BY Engine_Model.ModelName;
