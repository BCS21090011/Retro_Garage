USE Retro_Garage;

SELECT
    vehicle.ModelName,
    engine.ModelName,
    layout.Layout,
    engine.CylinderCount,
    engine.Displacement_CC,
    engine.CompressionRatio_ToOne,
    valve.ValveMechanism,
    engine.ValveCount
FROM Vehicle_Engine v_e
JOIN Vehicle_Model vehicle
ON v_e.VehicleModelID = vehicle.ID
JOIN Engine_Model engine
ON v_e.EngineModelID = engine.ID
JOIN Engine_Layout layout
ON engine.EngineLayoutID = layout.ID
JOIN Engine_ValveMechanism valve
ON engine.ValveMechanismID = valve.ID
ORDER BY vehicle.ModelName, engine.ModelName;