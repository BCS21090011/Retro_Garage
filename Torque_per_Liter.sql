USE Retro_Garage;

SELECT 
    model.ModelName,
    ROUND(variant.Torque_NM / (model.Displacement_CC / 1000.0), 2) AS Torque_per_Liter,
    model.Displacement_CC,
    variant.Torque_NM
FROM Engine_Model model
JOIN Engine_Variant variant ON model.ID = variant.EngineModelID
ORDER BY Torque_per_Liter DESC;
