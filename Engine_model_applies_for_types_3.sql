USE Retro_Garage;

SELECT Vehicle_Type.TypeName AS "Vehicle Type", Vehicle_Model.ModelName AS "Vehicle Model"
FROM Vehicle_Type
JOIN Vehicle_Variant
	ON Vehicle_Variant.VariantTypeID = Vehicle_Type.ID
JOIN Vehicle_Model
	ON Vehicle_Model.ID = Vehicle_Variant.VehicleModelID
ORDER BY Vehicle_Type.ID, Vehicle_Model.ID;