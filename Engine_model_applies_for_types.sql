USE Retro_Garage;

SELECT DISTINCT Engine_Model.ModelName, Vehicle_Type.TypeName
FROM Engine_Model
JOIN Vehicle_Engine
ON Vehicle_Engine.EngineModelID = Engine_Model.ID
JOIN Vehicle_Model
ON Vehicle_Model.ID = Vehicle_Engine.VehicleModelID
JOIN Vehicle_Variant
ON Vehicle_Variant.VehicleModelID = Vehicle_Model.ID
JOIN Vehicle_Type
ON Vehicle_Type.ID = Vehicle_Variant.VariantTypeID
ORDER BY Engine_Model.ModelName, Vehicle_Type.TypeName;
