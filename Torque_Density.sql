USE Retro_Garage;

SELECT 
    model.ModelName,
    ROUND(variant.Torque_NM / model.Displacement_CC, 4) AS TorqueDensity,
    variant.Torque_NM,
    model.Displacement_CC,
    variant.Torque_RPM
FROM Engine_Model model
JOIN Engine_Variant variant ON model.ID = variant.EngineModelID
ORDER BY TorqueDensity DESC;
