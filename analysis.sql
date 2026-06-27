-- ================================================
-- Project 1: Online Retail Sales Analysis
-- Analysis Queries
-- ================================================

-- Revenue summary table (exported to Tableau)
SELECT
    StockCode,                              -- product code
    Description,                            -- product name
    Country,                                -- customer country
    strftime('%Y', InvoiceDate) AS year,    -- extract year
    strftime('%m', InvoiceDate) AS month,   -- extract month
    SUM(Quantity) AS total_units,           -- total units sold
    ROUND(SUM(Quantity * Price), 2)         -- total revenue
        AS total_revenue
FROM online_retail_clean2
GROUP BY StockCode, Description,
         Country, year, month
ORDER BY total_revenue DESC;

-- Top 10 products by total revenue
SELECT
    StockCode,                              -- product code
    Description,                            -- product name
    SUM(Quantity) AS total_units_sold,      -- total units sold
    ROUND(SUM(Quantity * Price), 2)         -- total revenue per product
        AS total_revenue
FROM online_retail_clean2
GROUP BY StockCode, Description
ORDER BY total_revenue DESC
LIMIT 10;

-- Revenue by country
SELECT
    Country,                                -- customer country
    ROUND(SUM(Quantity * Price), 2)         -- total revenue per country
        AS total_revenue
FROM online_retail_clean2
GROUP BY Country
ORDER BY total_revenue DESC;

-- Revenue by month
SELECT
    strftime('%m', InvoiceDate) AS month,   -- extract month
    ROUND(SUM(Quantity * Price), 2)         -- total revenue per month
        AS total_revenue
FROM online_retail_clean2
GROUP BY month
ORDER BY month;

-- Top 10 products in November
SELECT
    StockCode,                                       -- product code
    Description,                                     -- product name
    SUM(Quantity) AS total_units_sold,               -- total units sold in November
    ROUND(AVG(Price), 2) AS avg_price,               -- average price per unit
    ROUND(SUM(Quantity * Price), 2) AS total_revenue -- total revenue in November
FROM online_retail_clean2
WHERE strftime('%m', InvoiceDate) = '11'            -- November only
GROUP BY StockCode, Description
ORDER BY total_revenue DESC
LIMIT 10;
