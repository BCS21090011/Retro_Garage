USE Retro_Garage;

SELECT
    vehicle.ModelName,
    engineModel.ModelName,
    engineVariant.Power_KW,
    engineVariant.Power_HP,
    engineVariant.Power_RPM,
    engineVariant.Torque_NM,
    engineVariant.Torque_RPM,
    layout.Layout,
    engineModel.CylinderCount,
    engineModel.Displacement_CC,
    engineModel.CompressionRatio_ToOne,
    valve.ValveMechanism,
    engineModel.ValveCount
FROM Vehicle_Engine v_e
JOIN Vehicle_Model vehicle
ON v_e.VehicleModelID = vehicle.ID
JOIN Engine_Model engineModel
ON v_e.EngineModelID = engineModel.ID
JOIN Engine_Variant engineVariant
ON engineModel.ID = engineVariant.EngineModelID
JOIN Engine_Layout layout
ON engineModel.EngineLayoutID = layout.ID
JOIN Engine_ValveMechanism valve
ON engineModel.ValveMechanismID = valve.ID
ORDER BY
    vehicle.ModelName,
    engineVariant.Power_HP,
    engineVariant.Torque_NM,
    engineVariant.Power_RPM DESC,
    engineVariant.Torque_RPM DESC;