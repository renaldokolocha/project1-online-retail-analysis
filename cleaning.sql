-- ================================================
-- Project 1: Online Retail Sales Analysis
-- Data Cleaning Queries
-- ================================================

-- Check 1: Missing Customer IDs
SELECT COUNT(*) 
FROM online_retail
WHERE "Customer ID" IS NULL;

-- Check 2: Negative quantity (returns)
SELECT COUNT(*) 
FROM online_retail
WHERE Quantity < 0;

-- Check 3: Cancellations
SELECT COUNT(*)
FROM online_retail
WHERE Invoice LIKE 'C%';

-- Check 4: Zero or negative price
SELECT COUNT(*)
FROM online_retail
WHERE Price <= 0;

-- Create clean working table
CREATE TABLE online_retail_clean2 AS
SELECT
    Invoice,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    Price,
    "Customer ID",
    Country
FROM online_retail
WHERE
    Quantity > 0
    AND Price > 0
    AND Invoice NOT LIKE 'C%';

-- Verify clean table row count
SELECT COUNT(*) FROM online_retail_clean2;
