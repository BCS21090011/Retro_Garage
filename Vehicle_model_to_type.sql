USE Retro_Garage;

SELECT
	Vehicle_Model.ModelName AS "Vehicle Model",
    COUNT(DISTINCT Vehicle_Variant.ID) AS "Number of Vehicle Variant",
    GROUP_CONCAT(DISTINCT Vehicle_Type.TypeName ORDER BY Vehicle_Type.ID) AS "Type of Variants"
FROM Vehicle_Model
JOIN Vehicle_Variant
	ON Vehicle_Variant.VehicleModelID = Vehicle_Model.ID
JOIN Vehicle_Type
	ON Vehicle_Type.ID = Vehicle_Variant.VariantTypeID
GROUP BY Vehicle_Model.ID
ORDER BY COUNT(DISTINCT Vehicle_Variant.ID) DESC, Vehicle_Model.ID;