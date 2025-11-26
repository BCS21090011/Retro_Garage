USE Retro_Garage;

SELECT
	CONCAT(wd.WheelDrive, "WD") AS "Wheel drive",
    COUNT(DISTINCT model.ID) AS "Number of vehicle model"
FROM Vehicle_Model model
JOIN Vehicle_WheelDrive wd
ON model.WheelDriveID = wd.ID
GROUP BY wd.ID
ORDER BY COUNT(DISTINCT model.ID) DESC;