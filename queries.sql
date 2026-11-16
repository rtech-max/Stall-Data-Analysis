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
