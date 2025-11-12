USE Retro_Garage;

WITH MaxPowerPerVehicle AS (
    SELECT Vehicle_Model.ID AS VehicleModelID, MAX(Engine_Variant.Power_HP) AS MaxPower
    FROM Vehicle_Model
    JOIN Vehicle_Engine ON Vehicle_Engine.VehicleModelID = Vehicle_Model.ID
    JOIN Engine_Model ON Engine_Model.ID = Vehicle_Engine.EngineModelID
    JOIN Engine_Variant ON Engine_Variant.EngineModelID = Engine_Model.ID
    GROUP BY Vehicle_Model.ID
)
SELECT 
    Vehicle_Model.ModelName, 
    Engine_Model.ModelName, 
    Engine_Variant.Power_HP
FROM Vehicle_Model
JOIN Vehicle_Engine ON Vehicle_Engine.VehicleModelID = Vehicle_Model.ID
JOIN Engine_Model ON Engine_Model.ID = Vehicle_Engine.EngineModelID
JOIN Engine_Variant ON Engine_Variant.EngineModelID = Engine_Model.ID
JOIN MaxPowerPerVehicle 
ON MaxPowerPerVehicle.VehicleModelID = Vehicle_Model.ID
AND Engine_Variant.Power_HP = MaxPowerPerVehicle.MaxPower
ORDER BY Engine_Variant.Power_HP DESC;
