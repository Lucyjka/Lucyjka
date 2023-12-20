--1--
BEGIN TRANSACTION;
UPDATE AdventureWorks2022.Production.Product
SET ListPrice = ListPrice * 1.1
WHERE ProductID = 680;
COMMIT TRANSACTION;


--2--
BEGIN TRANSACTION;
INSERT INTO AdventureWorks2022.Production.Product 
VALUES (1000,'Sheyaa Bin Abraham Joseph', 'NPC-123', 1, 1, 'Black', 100, 50, 10, 15, 'XXL', 10, 1, 'R', 'H', 'S', 1, 1, GETDATE(), NULL, NULL, NEWID(), GETDATE());
COMMIT TRANSACTION;

--3--
BEGIN TRANSACTION;
DELETE FROM AdventureWorks2022.Production.Product
WHERE ProductID = 1000;
ROLLBACK TRANSACTION;

--4--
BEGIN TRANSACTION;
DECLARE @sum FLOAT;
SELECT @sum = SUM(StandardCost) FROM AdventureWorks2022.Production.Product;
IF (@sum * 1.1 <= 50000)
BEGIN
    UPDATE AdventureWorks2022.Production.Product
    SET StandardCost = StandardCost * 1.1;
    COMMIT TRANSACTION;
END
ELSE
BEGIN
    ROLLBACK TRANSACTION;
END

--5--

BEGIN TRANSACTION;
DECLARE @ProductNumber VARCHAR(25);

SET @ProductNumber = 'XX-1234';

INSERT INTO AdventureWorks2022.Production.Product 
VALUES ('New Product', @ProductNumber, 100, 200, 1);

IF EXISTS (SELECT * FROM AdventureWorks2022.Production.Product WHERE ProductNumber = @ProductNumber)
BEGIN
  ROLLBACK TRANSACTION;
  PRINT 'The product number already exists. The transaction was rolled back.';
END
ELSE
BEGIN 
  COMMIT TRANSACTION;
  PRINT 'The new product was added successfully. The transaction was committed.';
END

--6--
BEGIN TRANSACTION;

UPDATE AdventureWorks2022.Sales.SalesOrderDetail
SET OrderQty = OrderQty + 1
WHERE OrderQty > 0;

IF @@ERROR <> 0
    ROLLBACK TRANSACTION;
ELSE
    COMMIT TRANSACTION;
--7--
BEGIN TRANSACTION;

WITH avg_cost AS (
    SELECT AVG(StandardCost) AS avg_cost
    FROM AdventureWorks2022.Production.Product
)
DELETE FROM AdventureWorks2022.Production.Product
WHERE StandardCost > (SELECT avg_cost FROM avg_cost)
IF @@ROWCOUNT > 10
    ROLLBACK TRANSACTION;
ELSE
    COMMIT TRANSACTION;