USE Retro_Garage;

SELECT 
    model.ModelName,
    ROUND(variant.Power_HP / (model.Displacement_CC / 1000.0), 2) AS HP_per_Liter,
    model.Displacement_CC,
    variant.Power_HP
FROM Engine_Model model
JOIN Engine_Variant variant ON model.ID = variant.EngineModelID
ORDER BY HP_per_Liter DESC;
