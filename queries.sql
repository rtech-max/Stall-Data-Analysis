SELECT * FROM Stall_Data;
SELECT COUNT(*) AS Total_Stalls
FROM Stall_Data;
SELECT * FROM Stall_Data
ORDER BY Stall_Name;
SELECT *
FROM Stall_Data
WHERE Stall_Name LIKE 'A%';
SELECT Stall_Name, COUNT(*) AS Total
FROM Stall_Data
GROUP BY Stall_Name;
SELECT *
FROM Stall_Data
ORDER BY Stall_Name ASC;
SELECT *
FROM Stall_Data
ORDER BY Stall_Name DESC;
SELECT COUNT(*) AS Total_Records
FROM Stall_Data;
SELECT DISTINCT Stall_Name
FROM Stall_Data;
SELECT *
FROM Stall_Data
WHERE Stall_Name LIKE 'A%'
AND Stall_Name IS NOT NULL;
SELECT *
FROM Stall_Data
WHERE Stall_Name LIKE 'A%'
OR Stall_Name LIKE 'B%';
SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Stall_Name) AS Unique_Stalls
FROM Stall_Data;
SELECT
    Stall_Name,
    COUNT(*) AS Total_Entries
FROM Stall_Data
GROUP BY Stall_Name
ORDER BY Total_Entries DESC;

-- 1. Overall Business Summary
SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Stall_Name) AS Unique_Stalls,
    SUM(Visitors) AS Total_Visitors,
    SUM(Units_Sold) AS Total_Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    SUM(Expenses) AS Total_Expenses,
    SUM(Profit) AS Total_Profit
FROM Stall_Data;


-- 2. Stall-wise Performance Analysis
SELECT
    Stall_Name,
    SUM(Visitors) AS Total_Visitors,
    SUM(Units_Sold) AS Total_Units_Sold,
    SUM(Revenue) AS Total_Revenue,
    SUM(Expenses) AS Total_Expenses,
    SUM(Profit) AS Total_Profit
FROM Stall_Data
GROUP BY Stall_Name
ORDER BY Total_Revenue DESC;


-- 3. Highest Revenue Stall
SELECT
    Stall_Name,
    SUM(Revenue) AS Total_Revenue
FROM Stall_Data
GROUP BY Stall_Name
ORDER BY Total_Revenue DESC
LIMIT 1;


-- 4. Highest Profit Stall
SELECT
    Stall_Name,
    SUM(Profit) AS Total_Profit
FROM Stall_Data
GROUP BY Stall_Name
ORDER BY Total_Profit DESC
LIMIT 1;


-- 5. Most Visited Stall
SELECT
    Stall_Name,
    SUM(Visitors) AS Total_Visitors
FROM Stall_Data
GROUP BY Stall_Name
ORDER BY Total_Visitors DESC
LIMIT 1;


-- 6. Average Revenue and Profit
SELECT
    ROUND(AVG(Revenue), 2) AS Average_Revenue,
    ROUND(AVG(Profit), 2) AS Average_Profit
FROM Stall_Data;


-- 7. Profit Margin Analysis
SELECT
    Stall_Name,
    ROUND(
        SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0),
        2
    ) AS Profit_Margin_Percentage
FROM Stall_Data
GROUP BY Stall_Name
ORDER BY Profit_Margin_Percentage DESC;


-- 8. Stall Performance Category
SELECT
    Stall_Name,
    SUM(Profit) AS Total_Profit,
    CASE
        WHEN SUM(Profit) >= 10000 THEN 'High Profit'
        WHEN SUM(Profit) >= 5000 THEN 'Medium Profit'
        ELSE 'Low Profit'
    END AS Performance
FROM Stall_Data
GROUP BY Stall_Name
ORDER BY Total_Profit DESC;


-- 9. Revenue Contribution Percentage
SELECT
    Stall_Name,
    SUM(Revenue) AS Stall_Revenue,
    ROUND(
        SUM(Revenue) * 100.0 /
        NULLIF((SELECT SUM(Revenue) FROM Stall_Data), 0),
        2
    ) AS Revenue_Contribution_Percentage
FROM Stall_Data
GROUP BY Stall_Name
ORDER BY Stall_Revenue DESC;


-- 10. Visitors and Sales Analysis
SELECT
    Stall_Name,
    SUM(Visitors) AS Total_Visitors,
    SUM(Units_Sold) AS Total_Units_Sold,
    ROUND(
        SUM(Units_Sold) * 100.0 /
        NULLIF(SUM(Visitors), 0),
        2
    ) AS Sales_Per_100_Visitors
FROM Stall_Data
GROUP BY Stall_Name
ORDER BY Sales_Per_100_Visitors DESC;

