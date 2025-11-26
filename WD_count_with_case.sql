USE Retro_Garage;

SELECT
	CASE
		WHEN wd.WheelDrive = "F" THEN "FWD"
        WHEN wd.WheelDrive = "R" THEN "RWD"
        WHEN wd.WheelDrive = "4" THEN "4WD"
        WHEN wd.WheelDrive = "A" THEN "AWD"
        ELSE "Unknown"
	END AS "Wheel drive",
    COUNT(DISTINCT model.ID) AS "Number of vehicle model"
FROM Vehicle_Model model
JOIN Vehicle_WheelDrive wd
ON model.WheelDriveID = wd.ID
GROUP BY wd.ID
ORDER BY COUNT(DISTINCT model.ID) DESC;