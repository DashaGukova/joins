USE AdventureWorks2019
GO
SELECT FirstName, LastName, JobTitle, BirthDate
FROM Person.Person
INNER JOIN HumanResources.Employee
ON Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID

-----------------------------

SELECT FirstName, LastName, 
	(SELECT JobTitle
	FROM HumanResources.Employee AS e
	WHERE p.BusinessEntityID = e.BusinessEntityID) AS Job
FROM Person.Person AS p

------------------------------ 1.3 first version

SELECT DISTINCT p.FirstName, p.LastName, Job.JobTitle 
FROM Person.Person AS p, 
	(SELECT JobTitle
	FROM HumanResources.Employee AS e, Person.Person AS p
	WHERE p.BusinessEntityID = e.BusinessEntityID) AS Job
WHERE Job.JobTitle IS NOT NULL

------------------------------ 1.3 second version

SELECT FirstName, LastName, 
	(SELECT JobTitle
	FROM HumanResources.Employee AS e
	WHERE p.BusinessEntityID = e.BusinessEntityID) AS Job
FROM Person.Person AS p
LEFT JOIN HumanResources.Employee AS e
ON p.BusinessEntityID = e.BusinessEntityID
WHERE e.JobTitle IS NOT NULL

----------------------------------

SELECT FirstName, LastName,JobTitle
FROM Person.Person 
CROSS JOIN HumanResources.Employee

-----------------------------------

SELECT COUNT(*) AS Quantity
FROM Person.Person 
CROSS JOIN HumanResources.Employee


SELECT p.FirstName, p.LastName, e.JobTitle 
FROM Person.Person AS p, HumanResources.Employee AS e
WHERE p.BusinessEntityID = e.BusinessEntityID AND e.JobTitle IS NOT NULL