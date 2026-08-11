SELECT
    d.DrugName,
    s.DosageForm,
    s.Strength,
    c.Name AS Country,
    SUM(s.QuantitySold) AS TotalUnitsSold,
    SUM(s.QuantitySold * s.SalePricePerUnit) AS TotalRevenue,
    SUM(
        s.QuantitySold *
        (co.ManufacturingCostPerUnit + co.ShippingCostPerUnit)
    ) AS TotalCost,
    SUM(
        s.QuantitySold *
        (
            s.SalePricePerUnit
            - co.ManufacturingCostPerUnit
            - co.ShippingCostPerUnit
        )
    ) AS NetProfit
FROM Sales s
JOIN Drug d
    ON s.DrugID = d.DrugID
JOIN Costs co
    ON s.DrugID = co.DrugID
    AND s.DosageForm = co.DosageForm
    AND s.Strength = co.Strength
    AND s.CountryID = co.CountryID
JOIN Countries c
    ON s.CountryID = c.CountryID
GROUP BY
    d.DrugName,
    s.DosageForm,
    s.Strength,
    c.Name
ORDER BY NetProfit DESC;




SELECT
    d.DrugID,
    d.DrugName,
    SUM(s.QuantitySold) AS TotalUnitsSold,
    SUM(s.QuantitySold * s.SalePricePerUnit) AS TotalRevenue,
    SUM(
        s.QuantitySold *
        (co.ManufacturingCostPerUnit + co.ShippingCostPerUnit)
    ) AS TotalCost,
    SUM(
        s.QuantitySold *
        (
            s.SalePricePerUnit
            - co.ManufacturingCostPerUnit
            - co.ShippingCostPerUnit
        )
    ) AS NetProfit
FROM Sales s
JOIN Drug d
    ON s.DrugID = d.DrugID
JOIN Costs co
    ON s.DrugID = co.DrugID
    AND s.DosageForm = co.DosageForm
    AND s.Strength = co.Strength
    AND s.CountryID = co.CountryID
GROUP BY
    d.DrugID,
    d.DrugName
ORDER BY NetProfit DESC;




 SELECT
    d.DrugName,
    s.DosageForm,
    s.Strength,
    SUM(s.QuantitySold) AS TotalUnitsSold
FROM Sales s
JOIN Drug d
    ON s.DrugID = d.DrugID
GROUP BY
    d.DrugName,
    s.DosageForm,
    s.Strength
ORDER BY TotalUnitsSold DESC;




SELECT
    c.Name AS Country,
    SUM(s.QuantitySold) AS TotalUnitsSold,
    SUM(s.QuantitySold * s.SalePricePerUnit) AS TotalRevenue
FROM Sales s
JOIN Countries c
    ON s.CountryID = c.CountryID
GROUP BY
    c.CountryID,
    c.Name
ORDER BY TotalRevenue DESC;





SELECT
    c.Name AS Country,
    d.DrugName,
    s.DosageForm,
    s.Strength,
    SUM(s.QuantitySold) AS TotalUnitsSold,
    SUM(s.QuantitySold * s.SalePricePerUnit) AS TotalRevenue
FROM Sales s
JOIN Drug d
    ON s.DrugID = d.DrugID
JOIN Countries c
    ON s.CountryID = c.CountryID
GROUP BY
    c.CountryID,
    c.Name,
    d.DrugID,
    d.DrugName,
    s.DosageForm,
    s.Strength
ORDER BY
    c.Name,
    TotalUnitsSold DESC;






    SELECT
    c.Name AS Country,
    d.DrugName,
    s.DosageForm,
    s.Strength,
    SUM(s.QuantitySold) AS TotalUnitsSold
FROM Sales s
JOIN Drug d
    ON s.DrugID = d.DrugID
JOIN Countries c
    ON s.CountryID = c.CountryID
GROUP BY
    c.CountryID,
    c.Name,
    d.DrugID,
    d.DrugName,
    s.DosageForm,
    s.Strength
ORDER BY
    c.Name,
    TotalUnitsSold ASC;




    SELECT
    d.Branded,
    COUNT(DISTINCT d.DrugID) AS NumberOfDrugs,
    SUM(s.QuantitySold) AS TotalUnitsSold,
    SUM(s.QuantitySold * s.SalePricePerUnit) AS TotalRevenue,
    SUM(
        s.QuantitySold *
        (
            s.SalePricePerUnit
            - co.ManufacturingCostPerUnit
            - co.ShippingCostPerUnit
        )
    ) AS NetProfit
FROM Drug d
JOIN Sales s
    ON d.DrugID = s.DrugID
JOIN Costs co
    ON s.DrugID = co.DrugID
    AND s.DosageForm = co.DosageForm
    AND s.Strength = co.Strength
    AND s.CountryID = co.CountryID
GROUP BY d.Branded
ORDER BY d.Branded DESC;