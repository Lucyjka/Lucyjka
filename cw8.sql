/*

--zad.1--
CREATE TABLE ##TempEmployeeInfo
(
	BusinessEntityID int,
	Rate money,
	Title varchar(8),
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	PRIMARY KEY (BusinessEntityID)
)

INSERT INTO ##TempEmployeeInfo
SELECT PP.BusinessEntityID, SUM(HEPH.Rate) AS Rate, PP.Title, PP.FirstName, PP.LastName
FROM AdventureWorks2022.Person.Person PP
INNER JOIN AdventureWorks2022.HumanResources.EmployeePayHistory HEPH ON HEPH.BusinessEntityID = PP.BusinessEntityID
GROUP BY PP.BusinessEntityID, PP.Title, PP.FirstName, PP.LastName
ORDER BY PP.BusinessEntityID


SELECT * FROM ##TempEmployeeInfo


--zad.2--

WITH SelectCTE (CompanyContact, Renevue) AS (
	SELECT	   
	cust.CompanyName +' (' + cust.FirstName + ' ' + cust.LastName + ')',
	det.UnitPrice * det.OrderQty
	FROM
	SalesLT.Customer cust
	INNER JOIN SalesLT.SalesOrderHeader head ON cust.CustomerID = head.CustomerID
	INNER JOIN SalesLT.SalesOrderDetail det ON head.SalesOrderID = det.SalesOrderID
)
select CompanyContact, sum(Renevue) from SelectCTE group by CompanyContact order by CompanyContact;

*/

--zad.3--
WITH SalesCTE AS (
    SELECT
        p.ProductCategoryID,
        pc.Name AS CategoryName,
        SUM(sod.UnitPrice * sod.OrderQty) AS SalesAmount
    FROM
        SalesLT.SalesOrderDetail sod
    INNER JOIN
        SalesLT.Product p ON sod.ProductID = p.ProductID
    INNER JOIN
        SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
    GROUP BY
        p.ProductCategoryID, pc.Name
)
SELECT
    CategoryName,
	SalesAmount
FROM
    SalesCTE
ORDER BY
    CategoryName;

