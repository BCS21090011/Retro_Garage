USE Retro_Garage;

SELECT
    model.ModelName,
    vehicleType.TypeName,
    model.ModelYear,
    rarity.RarityName
FROM Vehicle_Model model
JOIN Vehicle_Variant variant
ON model.ID = variant.VehicleModelID
JOIN Vehicle_Type vehicleType
ON variant.VariantTypeID = vehicleType.ID
JOIN Vehicle_Rarity rarity
ON variant.RarityID = rarity.ID
ORDER BY model.ModelName, vehicleType.TypeName;