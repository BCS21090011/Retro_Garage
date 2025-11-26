USE Retro_Garage;

WITH
	VehicleStates AS (
		SELECT
			vehicle.ID AS ID,
            placement.ID AS PlacementID,
            wd.ID AS WDID,
            placement.EnginePlacement AS EnginePlacement,
            wd.WheelDrive AS WD,
            GROUP_CONCAT(DISTINCT typ.TypeName ORDER BY typ.ID ASC) AS TypeNames,
			COUNT(DISTINCT typ.TypeName) AS TypeCount
		FROM Vehicle_Model vehicle
        JOIN Vehicle_Variant variant
			ON vehicle.ID = variant.VehicleModelID
		JOIN Vehicle_Type typ
			ON variant.VariantTypeID = typ.ID
        JOIN Vehicle_EnginePlacement placement
			ON vehicle.EnginePlacementID = placement.ID
		JOIN Vehicle_WheelDrive wd
			ON vehicle.WheelDriveID = wd.ID
		GROUP BY vehicle.ID
    ),
	EngineStates AS (
		SELECT
			vehicle.ID AS ID,
			GROUP_CONCAT(DISTINCT eng.ModelName ORDER BY eng.ID ASC) AS EngAvail,
			COUNT(DISTINCT eng.ID) AS EngAvailCount,
			GROUP_CONCAT(DISTINCT CONCAT(layout.Layout, eng.CylinderCount) ORDER BY eng.CylinderCount ASC) AS LayoutCyl,
			COUNT(DISTINCT CONCAT(layout.Layout, eng.CylinderCount)) AS LayoutCylCount,
			MIN(eng.Displacement_CC) AS MinDisp,
			MAX(eng.Displacement_CC) AS MaxDisp,
			MAX(eng.Displacement_CC) - MIN(eng.Displacement_CC) AS DiffDisp,
			MIN(eng.CompressionRatio_ToOne) AS MinComp,
			MAX(eng.CompressionRatio_ToOne) AS MaxComp,
			MAX(eng.CompressionRatio_ToOne) - MIN(eng.CompressionRatio_ToOne) AS DiffComp,
			GROUP_CONCAT(DISTINCT CONCAT(valve.ValveMechanism, " (", eng.ValveCount, ")") ORDER BY eng.ValveCount) AS ValveMech,
			COUNT(DISTINCT CONCAT(valve.ValveMechanism, eng.ValveCount)) AS ValveMechCount
		FROM Vehicle_Model vehicle
		JOIN Vehicle_Engine ve
			ON vehicle.ID = ve.VehicleModelID
		JOIN Engine_Model eng
			ON ve.EngineModelID = eng.ID
		JOIN Engine_Layout layout
			ON eng.EngineLayoutID = layout.ID
		JOIN Engine_ValveMechanism valve
			ON eng.ValveMechanismID = valve.ID
		GROUP BY vehicle.ID
	)
SELECT
	vehicle.ModelName AS "Vehicle Model",
    vehicle.ModelYear AS "Year",
    vStates.EnginePlacement AS "Engine Placement",
    CONCAT(vStates.WD, "WD") AS "Wheel Drive",
    vStates.TypeNames AS "Vehicle Types",
    vStates.TypeCount AS "Vehicle Type Count",
    engStates.EngAvail AS "Available Engines",
    engStates.EngAvailCount AS "Available Engine Count",
    engStates.LayoutCyl AS "Layout",
    CONCAT(
		engStates.MinDisp,
        " ~ ",
        engStates.MaxDisp,
        " (",
        engStates.DiffDisp,
        ")"
    )AS "Displacement Range (cc)",
    CONCAT(
		engStates.MinComp,
        " ~ ",
        engStates.MaxComp,
        " (",
        engStates.DiffComp,
        ")"
    ) AS "Compression Ratio Range (to one)",
    engStates.ValveMech AS "Valve Mechanisms (valve count)"
FROM Vehicle_Model vehicle
JOIN VehicleStates vStates
	ON vehicle.ID = vStates.ID
JOIN EngineStates engStates
	ON vehicle.ID = engStates.ID
ORDER BY
	engStates.EngAvailCount DESC,
    engStates.LayoutCylCount DESC,
    engStates.DiffDisp DESC,
    engStates.DiffComp DESC,
    engStates.ValveMechCount DESC,
    vStates.TypeCount DESC,
    vStates.WDID DESC,
    vStates.PlacementID ASC,
    vehicle.ID ASC;