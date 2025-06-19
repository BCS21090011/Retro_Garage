USE Retro_Garage;

SELECT
    model.ModelName,
    layout.Layout,
    model.CylinderCount,
    model.Displacement_CC,
    model.CompressionRatio_ToOne,
    variant.Power_KW,
    variant.Power_HP,
    variant.Power_RPM,
    variant.Torque_NM,
    variant.Torque_RPM,
    model.ValveCount,
    valve.ValveMechanism,
    airSupply.AirSupply,
    fuelSupply.FuelSupply
FROM Engine_Variant variant
JOIN Engine_Model model
ON variant.EngineModelID = model.ID
JOIN Engine_Layout layout
ON model.EngineLayoutID = layout.ID
JOIN Engine_ValveMechanism valve
ON model.ValveMechanismID = valve.ID
JOIN Engine_AirSupply airSupply
ON variant.AirSupplyID = airSupply.ID
JOIN Engine_FuelSupply fuelSupply
ON variant.FuelSupplyID = fuelSupply.ID
ORDER BY model.ModelName, airSupply.AirSupply, fuelSupply.FuelSupply;