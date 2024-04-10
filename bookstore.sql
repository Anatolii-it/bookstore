create database [bookstore]
go

CREATE PROCEDURE FindBestSalesPerson
AS
BEGIN
    SELECT TOP 1 
        E.Name + ' ' + E.Surname AS BestSalesPerson,
        SUM(S.Price * S.Quantity) AS TotalSalesAmount
    FROM 
        Sales S
    INNER JOIN 
        Employees E ON S.EmployeeId = E.EmployeeId
    GROUP BY 
        E.Name, E.Surname
    ORDER BY 
        TotalSalesAmount DESC;
END;

-- перевірка найкращий продавець
EXEC FindBestSalesPerson;


CREATE PROCEDURE BestSellingBookAndShops
AS
BEGIN
    SELECT TOP 1
        B.Name AS BestSellingBook,
        S.Name AS ShopName,
        C.Name AS CountryName
    FROM
        Sales SA
    INNER JOIN
        Books B ON SA.BookId = B.Id
    INNER JOIN
        Shops S ON SA.ShopId = S.Id
    INNER JOIN
        Countries C ON S.CountryId = C.Id
    GROUP BY
        B.Name, S.Name, C.Name
    ORDER BY
        COUNT(*) DESC;
END;

-- шукає найпопулярнишу книгу та показує в якої країні була придбана
EXEC BestSellingBookAndShops;

