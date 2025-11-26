USE Retro_Garage;

SELECT model.ModelName, wd.WheelDrive, ep.EnginePlacement
FROM Vehicle_Model model
JOIN Vehicle_WheelDrive wd
ON model.WheelDriveID = wd.ID
JOIN Vehicle_EnginePlacement ep
ON model.EnginePlacementID = ep.ID
ORDER BY wd.ID ASC, ep.ID ASC, model.ID ASC;