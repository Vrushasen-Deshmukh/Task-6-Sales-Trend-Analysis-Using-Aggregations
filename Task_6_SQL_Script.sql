CREATE DATABASE Task_6_SQL_Trend_Analysis;
USE Task_6_SQL_Trend_Analysis;

-- Created table sales_data

SELECT * FROM sales_data;

-- a. Extract month from order_date
SELECT
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month
FROM sales_data;


-- b. Group data by Month and Year
SELECT 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month,
    round(SUM(amount),3) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM sales_data
GROUP BY order_year, order_month;


-- c. Using SUM() for total revenue
SELECT 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month,
    round(SUM(amount),3) AS total_revenue
FROM sales_data
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


-- d. COUNT(DISTINCT order_id) for volume
SELECT 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month,
    COUNT(DISTINCT order_id) AS order_volume
FROM sales_data
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


-- e. Using ORDER BY for sorting results
SELECT 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month,
    round(SUM(amount),3) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM sales_data
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


-- f. Limiting results for a specific time period
SELECT 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month,
    round(SUM(amount),3) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM sales_data
WHERE YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) = 2024
GROUP BY order_year, order_month
ORDER BY order_year, order_month;