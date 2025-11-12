USE Retro_Garage;

SELECT 
    model.ModelName,
    ROUND(variant.Power_KW / model.CylinderCount, 2) AS KW_per_Cylinder,
    model.CylinderCount,
    variant.Power_KW
FROM Engine_Model model
JOIN Engine_Variant variant ON model.ID = variant.EngineModelID
ORDER BY KW_per_Cylinder DESC;
