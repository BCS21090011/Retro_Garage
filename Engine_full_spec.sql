USE Retro_Garage;

SELECT
	model.ID,
    model.ModelName,
    layout.Layout,
    model.CylinderCount,
    model.Displacement_CC,
    model.CompressionRatio_ToOne,
    valve.ValveMechanism,
    model.ValveCount,
    air.AirSupply,
    fuel.FuelSupply,
    variant.Power_KW,
    variant.Power_HP,
    variant.Power_RPM,
    variant.Torque_NM,
    variant.Torque_RPM
FROM Engine_Model model
JOIN Engine_Variant variant
ON variant.EngineModelID = model.ID
JOIN Engine_Layout layout
ON layout.ID = model.EngineLayoutID
JOIN Engine_ValveMechanism valve
ON valve.ID = model.ValveMechanismID
JOIN Engine_AirSupply air
ON air.ID = variant.AirSupplyID
JOIN Engine_FuelSupply fuel
ON fuel.ID = variant.FuelSupplyID
ORDER BY model.ID, variant.ID;
