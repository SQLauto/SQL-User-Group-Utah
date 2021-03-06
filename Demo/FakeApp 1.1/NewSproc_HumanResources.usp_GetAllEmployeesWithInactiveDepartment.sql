USE AdventureWorks_staging
GO

CREATE PROCEDURE HumanResources.usp_GetAllEmployeesWithInactiveDepartment
AS
BEGIN
	SET NOCOUNT, XACT_ABORT ON;

	SELECT *
	FROM HumanResources.Department AS D
	JOIN HumanResources.EmployeeDepartmentHistory AS EDH ON EDH.DepartmentID = D.DepartmentID
	JOIN HumanResources.Employee AS E ON E.BusinessEntityID = EDH.BusinessEntityID
	WHERE D.IsActive = 0
		AND EDH.EndDate IS NULL 

END 