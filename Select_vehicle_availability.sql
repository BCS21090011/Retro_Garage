USE Retro_Garage;

SELECT
    seller.SellerName,
    model.ModelName,
    vehicleType.TypeName
FROM Vehicle_AvailableVia via
JOIN Vehicle_Seller seller
ON via.SellerID = seller.ID
JOIN Vehicle_Variant variant
ON via.VehicleVariantID = variant.ID
JOIN Vehicle_Model model
ON variant.VehicleModelID = model.ID
JOIN Vehicle_Type vehicleType
ON variant.VariantTypeID = vehicleType.ID
ORDER BY seller.SellerName, model.ModelName, vehicleType.TypeName;
