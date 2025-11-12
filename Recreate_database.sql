DROP DATABASE IF EXISTS Retro_Garage;

CREATE DATABASE Retro_Garage;

USE Retro_Garage;

CREATE TABLE Engine_Layout (
    ID INT NOT NULL AUTO_INCREMENT,
    Layout VARCHAR(8) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (Layout)
);

CREATE TABLE Engine_ValveMechanism (
    ID INT NOT NULL AUTO_INCREMENT,
    ValveMechanism VARCHAR(8) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (ValveMechanism)
);

CREATE TABLE Engine_AirSupply (
    ID INT NOT NULL AUTO_INCREMENT,
    AirSupply VARCHAR(16) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (AirSupply)
);

CREATE TABLE Engine_FuelSupply (
    ID INT NOT NULL AUTO_INCREMENT,
    FuelSupply VARCHAR(16) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (FuelSupply)
);

CREATE TABLE Engine_Model (
    ID INT NOT NULL AUTO_INCREMENT,
    ModelName VARCHAR(16) NOT NULL,
    EngineLayoutID INT NOT NULL,
    CylinderCount INT NOT NULL,
    Displacement_CC INT NOT NULL,
    CompressionRatio_ToOne DECIMAL(4, 2) NOT NULL,
    ValveMechanismID INT NOT NULL,
    ValveCount INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (EngineLayoutID) REFERENCES Engine_Layout(ID),
    FOREIGN KEY (ValveMechanismID) REFERENCES Engine_ValveMechanism(ID),
    UNIQUE (ModelName)
);

CREATE TABLE Engine_Variant (
    ID INT NOT NULL AUTO_INCREMENT,
    EngineModelID INT NOT NULL,
    AirSupplyID INT NOT NULL,
    FuelSupplyID INT NOT NULL,
    Power_KW INT NOT NULL,
    Power_HP INT NOT NULL,
    Power_RPM INT NOT NULL,
    Torque_NM INT NOT NULL,
    Torque_RPM INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (EngineModelID) REFERENCES Engine_Model(ID),
    FOREIGN KEY (AirSupplyID) REFERENCES Engine_AirSupply(ID),
    FOREIGN KEY (FuelSupplyID) REFERENCES Engine_FuelSupply(ID)
);

CREATE TABLE Vehicle_EnginePlacement (
    ID INT NOT NULL AUTO_INCREMENT,
    EnginePlacement VARCHAR(8) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (EnginePlacement)
);

CREATE TABLE Vehicle_WheelDrive (
    ID INT NOT NULL AUTO_INCREMENT,
    WheelDrive VARCHAR(8) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (WheelDrive)
);

CREATE TABLE Vehicle_Rarity (
    ID INT NOT NULL AUTO_INCREMENT,
    RarityName VARCHAR(16) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (RarityName)
);

CREATE TABLE Vehicle_Type (
    ID INT NOT NULL AUTO_INCREMENT,
    TypeName VARCHAR(16) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (TypeName)
);

CREATE TABLE Vehicle_Model (
    ID INT NOT NULL AUTO_INCREMENT,
    ModelName VARCHAR(16) NOT NULL,
    ModelYear INT NOT NULL,
    EnginePlacementID INT NOT NULL,
    WheelDriveID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (EnginePlacementID) REFERENCES Vehicle_EnginePlacement(ID),
    FOREIGN KEY (WheelDriveID) REFERENCES Vehicle_WheelDrive(ID),
    UNIQUE (ModelName)
);

CREATE TABLE Vehicle_Variant (
    ID INT NOT NULL AUTO_INCREMENT,
    VariantTypeID INT NOT NULL,
    VehicleModelID INT NOT NULL,
    DefaultEngineID INT NOT NULL,
    RarityID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (VariantTypeID) REFERENCES Vehicle_Type(ID),
    FOREIGN KEY (VehicleModelID) REFERENCES Vehicle_Model(ID),
    FOREIGN KEY (DefaultEngineID) REFERENCES Engine_Variant(ID),
    FOREIGN KEY (RarityID) REFERENCES Vehicle_Rarity(ID)
);

CREATE TABLE Vehicle_Seller (
    ID INT NOT NULL AUTO_INCREMENT,
    SellerName VARCHAR(16) NOT NULL,
    PRIMARY KEY (ID),
    UNIQUE (SellerName)
);

CREATE TABLE Vehicle_AvailableVia (
    VehicleVariantID INT NOT NULL,
    SellerID INT NOT NULL,
    PRIMARY KEY (VehicleVariantID, SellerID),
    FOREIGN KEY (VehicleVariantID) REFERENCES Vehicle_Variant(ID),
    FOREIGN KEY (SellerID) REFERENCES Vehicle_Seller(ID)
);

CREATE TABLE Vehicle_Engine (
    VehicleModelID INT NOT NULL,
    EngineModelID INT NOT NULL,
    PRIMARY KEY (VehicleModelID, EngineModelID),
    FOREIGN KEY (VehicleModelID) REFERENCES Vehicle_Model(ID),
    FOREIGN KEY (EngineModelID) REFERENCES Engine_Model(ID)
);

CREATE TABLE Vehicle_Rank (
    ID INT NOT NULL AUTO_INCREMENT,
    VehicleRank CHAR(1) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Vehicle (
    ID INT NOT NULL AUTO_INCREMENT,
    GarageSlotNum INT DEFAULT NULL,
    RankID INT DEFAULT NULL,
    VehicleVariantID INT NOT NULL,
    EngineVariantID INT NOT NULL,
    ProductionYear INT NOT NULL,
    Mileage_KM INT DEFAULT NULL,
    Cost INT NOT NULL,
    Price INT NOT NULL,
    Color_Shade INT DEFAULT NULL,
    Color_Saturation INT DEFAULT NULL,
    Color_Brightness INT DEFAULT NULL,
    Color_Transparency INT DEFAULT NULL,
    Tuning DECIMAL(3, 1) DEFAULT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (RankID) REFERENCES Vehicle_Rank(ID),
    FOREIGN KEY (VehicleVariantID) REFERENCES Vehicle_Variant(ID),
    FOREIGN KEY (EngineVariantID) REFERENCES Engine_Variant(ID)
);
