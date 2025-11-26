USE Retro_Garage;

SELECT
	CONCAT(wd.WheelDrive, "WD") AS "Wheel drive",
    CONCAT(ep.EnginePlacement, " engine placement") AS "Engine placement",
    COUNT(DISTINCT model.ID) AS "Number of models",
    GROUP_CONCAT(DISTINCT model.ModelName) AS "Models"
FROM Vehicle_Model model
JOIN Vehicle_WheelDrive wd
ON model.WheelDriveID = wd.ID
JOIN Vehicle_EnginePlacement ep
ON model.EnginePlacementID = ep.ID
GROUP BY wd.ID, ep.ID
ORDER BY COUNT(DISTINCT model.ID) DESC;