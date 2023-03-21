USE Northwind;



DROP PROC IF EXISTS InsertRegions;
GO 
CREATE PROC InsertRegion
(
	@RegionDescription VARCHAR(50)
)
AS
INSERT INTO Region (RegionID, RegionDescription)
VALUES ((SELECT MAX(RegionID) FROM Region) + 1, @RegionDescription);
GO


DROP PROC IF EXISTS UpdateRegion;
GO 
CREATE PROC UpdateRegion
(
	@RegionID INT,
	@NewRegionDescription VARCHAR(50)
)
AS
UPDATE Region
SET    RegionDescription = @NewRegionDescription
WHERE  RegionID = @RegionID
GO


DROP PROC IF EXISTS DeleteRegion;
GO 
CREATE PROC DeleteRegion
(
	@RegionDescription VARCHAR(50)
)
AS
DECLARE @DelRegionID AS INT;
SELECT @DelRegionID = MIN(RegionID) FROM Region WHERE RegionDescription = @RegionDescription;

DELETE EmployeeTerritories
FROM EmployeeTerritories
INNER JOIN Territories
  ON EmployeeTerritories.TerritoryID=Territories.TerritoryID
WHERE RegionID = @DelRegionID;

DELETE FROM Territories WHERE RegionID = @DelRegionID;

DELETE FROM Region WHERE RegionID = @DelRegionID;
GO


DROP PROC IF EXISTS SelectRegion;
GO 
CREATE PROC SelectRegion 
(
	@RegionDescription VARCHAR(50)
)
AS
SELECT RegionID, RegionDescription FROM Region 
WHERE RegionDescription = @RegionDescription AND RegionID = (SELECT MIN(RegionID) FROM Region WHERE RegionDescription = @RegionDescription)
GO


DROP PROC IF EXISTS SelectAllRegions;
GO 
CREATE PROC SelectAllRegions 
AS
SELECT RegionID, RegionDescription FROM Region 
ORDER BY RegionID;
