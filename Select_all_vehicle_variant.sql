USE Retro_Garage;

SELECT
    vehicleModel.ModelName,
    vehicleType.TypeName,
    vehicleModel.ModelYear,
    rarity.RarityName,
    engineModel.ModelName,
    engineVariant.Power_HP
FROM Vehicle_Model vehicleModel
JOIN Vehicle_Variant variant
ON vehicleModel.ID = variant.VehicleModelID
JOIN Vehicle_Type vehicleType
ON variant.VariantTypeID = vehicleType.ID
JOIN Vehicle_Rarity rarity
ON variant.RarityID = rarity.ID
JOIN Engine_Variant engineVariant
ON variant.DefaultEngineID = engineVariant.ID
JOIN Engine_Model engineModel
ON engineVariant.EngineModelID = engineModel.ID
ORDER BY vehicleModel.ModelName, vehicleType.TypeName, engineModel.ModelName, engineVariant.Power_HP;