USE Retro_Garage;

SELECT 
    model.ModelName,
    model.CompressionRatio_ToOne
FROM Engine_Model model
ORDER BY model.CompressionRatio_ToOne DESC;
