/* 
CREATE PROCEDURE Fibonacci
    @n INT
AS
BEGIN
    DECLARE @Fibonacci TABLE (Value INT);

    INSERT INTO @Fibonacci (Value)
    VALUES (0), (1);

    DECLARE @i INT = 2;
    DECLARE @a INT = 0, @b INT = 1, @c INT;

    WHILE @i <= @n
    BEGIN
        SET @c = @a + @b;
        INSERT INTO @Fibonacci (Value) VALUES (@c);
        SET @a = @b;
        SET @b = @c;
        SET @i = @i + 1;
    END

    SELECT Value FROM @Fibonacci;
END


EXEC Fibonacci @n = 4;


CREATE TRIGGER UpperCase
ON Person.Person
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE p
    SET p.LastName = UPPER(p.LastName)
    FROM Person.Person p
END;




select * from Person.Person

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @OldTaxRate DECIMAL(18,2);
    DECLARE @NewTaxRate DECIMAL(18,2);
    DECLARE @PercentageChange DECIMAL(5,2);

    SELECT @OldTaxRate = TaxRate FROM deleted;
    SELECT @NewTaxRate = TaxRate FROM inserted;

    IF ABS((@OldTaxRate - @NewTaxRate) / @OldTaxRate) > 0.30
    BEGIN
        THROW 50000, 'Zmiana wartoœci w polu TaxRate o wiêcej ni¿ 30% jest niedozwolona.', 1;
        ROLLBACK; 
    END
END;

*/
