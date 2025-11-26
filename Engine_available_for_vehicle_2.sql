USE Retro_Garage;

SELECT
	vehicle.ModelName AS "Vehicle Model",
    vehicle.ModelYear AS "Year",
    placement.EnginePlacement AS "Engine Placement",
    CONCAT(wd.WheelDrive, "WD") AS "Wheel Drive",
    GROUP_CONCAT(DISTINCT typ.TypeName ORDER BY typ.ID ASC) AS "Vehicle Types",
    COUNT(DISTINCT typ.TypeName) AS "Vehicle Type Count",
	GROUP_CONCAT(DISTINCT eng.ModelName ORDER BY eng.ID ASC) AS "Engines Available",
    COUNT(DISTINCT eng.ID) AS "Engine Count",
    GROUP_CONCAT(DISTINCT CONCAT(layout.Layout, eng.CylinderCount) ORDER BY eng.CylinderCount ASC) AS "Layout",
    CONCAT(
		MIN(eng.Displacement_CC),
        " ~ ",
        MAX(eng.Displacement_CC),
        " (",
        ABS(MIN(eng.Displacement_CC) - MAX(eng.Displacement_CC)),
        ")"
	)AS "Displacement Range (cc)",
    CONCAT(
		MIN(eng.CompressionRatio_ToOne),
		" ~ ",
        MAX(eng.CompressionRatio_ToOne),
        " (",
        ABS(MIN(eng.CompressionRatio_ToOne) - MAX(eng.CompressionRatio_ToOne)),
        ")"
	) AS "Compression Ratio Range (to one)",
    GROUP_CONCAT(DISTINCT CONCAT(valve.ValveMechanism, " (", eng.ValveCount, ")") ORDER BY eng.ValveCount) AS "Valve Mechanisms (valve count)"
FROM Vehicle_Model vehicle
JOIN Vehicle_Variant variant
	ON vehicle.ID = variant.VehicleModelID
JOIN Vehicle_Type typ
	ON variant.VariantTypeID = typ.ID
JOIN Vehicle_EnginePlacement placement
	ON vehicle.EnginePlacementID = placement.ID
JOIN Vehicle_WheelDrive wd
	ON vehicle.WheelDriveID = wd.ID
JOIN Vehicle_Engine
	ON vehicle.ID = Vehicle_Engine.VehicleModelID
JOIN Engine_Model eng
	ON Vehicle_Engine.EngineModelID = eng.ID
JOIN Engine_Layout layout
	ON eng.EngineLayoutID = layout.ID
JOIN Engine_ValveMechanism valve
	ON eng.ValveMechanismID = valve.ID
GROUP BY vehicle.ID
ORDER BY
	COUNT(DISTINCT eng.ID) DESC,
    COUNT(DISTINCT CONCAT(layout.Layout, eng.CylinderCount)) DESC,
    ABS(MIN(eng.Displacement_CC) - MAX(eng.Displacement_CC)) DESC,
    ABS(MIN(eng.CompressionRatio_ToOne) - MAX(eng.CompressionRatio_ToOne)) DESC,
    COUNT(DISTINCT CONCAT(valve.ValveMechanism, eng.ValveCount)) DESC,
    COUNT(DISTINCT typ.TypeName) DESC,
    wd.ID DESC,
    placement.ID ASC,
    vehicle.ID ASC;