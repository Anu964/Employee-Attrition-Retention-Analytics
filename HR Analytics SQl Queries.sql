CREATE DATABASE hr_analytics;
USE hr_analytics;
SELECT COUNT(*) FROM employees;
SELECT * FROM employees LIMIT 5;

SELECT 
    EmployeeStatus,
    COUNT(*) AS EmployeeCount
FROM employees
GROUP BY EmployeeStatus;

SELECT 
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees;

SELECT 
    ROUND(
        SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS RetentionRate
FROM employees;

SELECT 
    EmployeeStatus,
    COUNT(*) AS EmployeeCount
FROM employees
GROUP BY EmployeeStatus;

SELECT
    Department,
    COUNT(*) AS EmployeesLeft
FROM employees
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY EmployeesLeft DESC;

SELECT 
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees;
	
SELECT 
    ROUND(
        SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS RetentionRate
FROM employees;

SELECT 
    ROUND(
        COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees;

SELECT 
    ROUND(
        COUNT(CASE WHEN Attrition = 'No' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS RetentionRate
FROM employees;

SELECT
    EmployeeStatus,
    COUNT(*) AS EmployeeCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employees), 2) AS Percentage
FROM employees
GROUP BY EmployeeStatus;

SELECT
    Department,
    COUNT(*) AS EmployeesLeft
FROM employees
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY EmployeesLeft DESC;

SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY Department
ORDER BY AttritionRate DESC;

SELECT
    JobRole,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY JobRole
ORDER BY AttritionRate DESC;

SELECT
    OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY OverTime
ORDER BY AttritionRate DESC;

SELECT
    JobSatisfaction,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

SELECT
    WorkLifeBalance,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Below 3000'
        WHEN MonthlyIncome < 6000 THEN '3000-5999'
        WHEN MonthlyIncome < 10000 THEN '6000-9999'
        ELSE '10000+'
    END AS SalaryRange,
    COUNT(*) AS TotalEmployees,
    SUM(CASE 
        WHEN Attrition = 'Yes' THEN 1 
        ELSE 0 
    END) AS EmployeesLeft,
    ROUND(
        SUM(CASE 
            WHEN Attrition = 'Yes' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate

FROM employees
GROUP BY SalaryRange
ORDER BY AttritionRate DESC;

SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Below 3000'
        WHEN MonthlyIncome < 6000 THEN '3000-5999'
        WHEN MonthlyIncome < 10000 THEN '6000-9999'
        ELSE '10000+'
    END AS SalaryRange,
    COUNT(*) AS TotalEmployees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS EmployeesLeft,
	ROUND(
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY SalaryRange
ORDER BY AttritionRate DESC;

SELECT
    CASE
        WHEN YearsAtCompany < 2 THEN 'Less than 2 Years'
        WHEN YearsAtCompany < 5 THEN '2-4 Years'
        WHEN YearsAtCompany < 10 THEN '5-9 Years'
        ELSE '10+ Years'
    END AS TenureGroup,
    COUNT(*) AS TotalEmployees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS EmployeesLeft,
    ROUND(
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY TenureGroup
ORDER BY AttritionRate DESC;

SELECT
    CASE
        WHEN YearsSinceLastPromotion = 0 THEN 'No Promotion Yet'
        WHEN YearsSinceLastPromotion <= 2 THEN '1-2 Years'
        WHEN YearsSinceLastPromotion <= 5 THEN '3-5 Years'
        ELSE '6+ Years'
    END AS PromotionGap,
    COUNT(*) AS TotalEmployees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS EmployeesLeft,
    ROUND(
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY PromotionGap
ORDER BY AttritionRate DESC;

SELECT
    AgeGroup,
    COUNT(*) AS TotalEmployees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS EmployeesLeft,
    ROUND(
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY AgeGroup
ORDER BY AttritionRate DESC;

SELECT
    BusinessTravel,
    COUNT(*) AS TotalEmployees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS EmployeesLeft,
    ROUND(
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY BusinessTravel
ORDER BY AttritionRate DESC;

SELECT
    JobLevel,
    COUNT(*) AS TotalEmployees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS EmployeesLeft,

    ROUND(
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY JobLevel
ORDER BY JobLevel;

SELECT
    Gender,
    COUNT(*) AS TotalEmployees,

    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS EmployeesLeft,

    ROUND(
        SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM employees
GROUP BY Gender
ORDER BY AttritionRate DESC;

SELECT
    COUNT(*) AS PotentialRiskEmployees
FROM employees
WHERE
    OverTime = 'Yes'
    AND JobSatisfaction = 1
    AND WorkLifeBalance = 1
    AND YearsAtCompany < 2;