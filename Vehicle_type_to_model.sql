USE Retro_Garage;

SELECT
	Vehicle_Type.TypeName AS "Vehicle Type",
    COUNT(DISTINCT Vehicle_Model.ID) AS "Number of Vehicle Model",
    GROUP_CONCAT(DISTINCT Vehicle_Model.ModelName ORDER BY Vehicle_Model.ID) AS "Vehicle Models"
FROM Vehicle_Type
JOIN Vehicle_Variant
	ON Vehicle_Variant.VariantTypeID = Vehicle_Type.ID
JOIN Vehicle_Model
	ON Vehicle_Model.ID = Vehicle_Variant.VehicleModelID
GROUP BY Vehicle_Type.ID
ORDER BY COUNT(DISTINCT Vehicle_Model.ID) DESC, Vehicle_Type.ID;