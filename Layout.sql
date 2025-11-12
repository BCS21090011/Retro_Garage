USE Retro_Garage;

SELECT 
    layout.Layout,
    COUNT(*) AS EngineCount
FROM Engine_Model model
JOIN Engine_Layout layout ON model.EngineLayoutID = layout.ID
GROUP BY layout.Layout;
