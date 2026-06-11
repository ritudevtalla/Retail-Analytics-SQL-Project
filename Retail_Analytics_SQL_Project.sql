-- =====================================================
-- RETAIL ANALYTICS SQL PROJECT
-- =====================================================

-- =====================================================
-- 1. IDENTIFY DUPLICATE RECORDS
-- =====================================================

SELECT
TransactionID,
COUNT(*) AS Duplicate_Count
FROM Sales_transaction
GROUP BY TransactionID
HAVING COUNT(*) > 1;

CREATE TABLE Sales_transaction_unique AS
SELECT DISTINCT *
FROM Sales_transaction;

SELECT *
FROM Sales_transaction_unique;

DROP TABLE Sales_transaction;

ALTER TABLE Sales_transaction_unique
RENAME TO Sales_transaction;

-- =====================================================
-- 2. IDENTIFY PRICE MISMATCHES
-- =====================================================

WITH price_mismatch AS (
SELECT
st.TransactionID,
st.Price AS TransactionPrice,
pi.Price AS InventoryPrice
FROM sales_transaction st
JOIN product_inventory pi
ON st.ProductID = pi.ProductID
WHERE st.Price <> pi.Price
)
SELECT *
FROM price_mismatch;

UPDATE sales_transaction st
JOIN product_inventory pi
ON st.ProductID = pi.ProductID
SET st.Price = pi.Price
WHERE st.Price <> pi.Price;

SELECT *
FROM sales_transaction;

-- =====================================================
-- 3. IDENTIFY AND REPLACE NULL VALUES
-- =====================================================

SELECT COUNT(*)
FROM customer_profiles
WHERE CustomerID IS NULL
OR Age IS NULL
OR Gender IS NULL
OR Location IS NULL
OR JoinDate IS NULL;

UPDATE customer_profiles
SET
CustomerID = COALESCE(CustomerID, 'Unknown'),
Age = COALESCE(Age, 0),
Gender = COALESCE(Gender, 'Unknown'),
Location = COALESCE(Location, 'Unknown'),
JoinDate = COALESCE(JoinDate, '1900-01-01');

SELECT *
FROM customer_profiles;

-- =====================================================
-- 4. CLEAN DATE COLUMN
-- =====================================================

CREATE TABLE Sales_transaction_new AS
SELECT
*,
CAST(TransactionDate AS DATE) AS TransactionDate_updated
FROM Sales_transaction;

SELECT *
FROM Sales_transaction_new;

DROP TABLE Sales_transaction;

ALTER TABLE Sales_transaction_new
RENAME TO Sales_transaction;

-- =====================================================
-- 5. TOTAL SALES AND QUANTITY SOLD PER PRODUCT
-- =====================================================

SELECT
ProductID,
SUM(QuantityPurchased) AS TotalUnitsSold,
SUM(QuantityPurchased * Price) AS TotalSales
FROM Sales_transaction
GROUP BY ProductID
ORDER BY TotalSales DESC;

-- =====================================================
-- 6. TRANSACTIONS PER CUSTOMER
-- =====================================================

SELECT
CustomerID,
COUNT(TransactionID) AS NumberOfTransactions
FROM Sales_transaction
GROUP BY CustomerID
ORDER BY NumberOfTransactions DESC;

-- =====================================================
-- 7. CATEGORY PERFORMANCE ANALYSIS
-- =====================================================

SELECT
p.Category AS Category,
SUM(s.QuantityPurchased) AS TotalUnitsSold,
SUM(s.QuantityPurchased * s.Price) AS TotalSales
FROM Sales_transaction s
JOIN product_inventory p
ON s.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalSales DESC;

-- =====================================================
-- 8. TOP 10 PRODUCTS BY REVENUE
-- =====================================================

SELECT
ProductID,
SUM(QuantityPurchased * Price) AS TotalRevenue
FROM Sales_transaction
GROUP BY ProductID
ORDER BY TotalRevenue DESC
LIMIT 10;

-- =====================================================
-- 9. BOTTOM 10 PRODUCTS BY UNITS SOLD
-- =====================================================

SELECT
ProductID,
SUM(QuantityPurchased) AS TotalUnitsSold
FROM Sales_transaction
GROUP BY ProductID
HAVING SUM(QuantityPurchased) > 1
ORDER BY TotalUnitsSold ASC
LIMIT 10;

-- =====================================================
-- 10. SALES TREND ANALYSIS
-- =====================================================

SELECT
CAST(TransactionDate AS DATE) AS DATETRANS,
COUNT(TransactionID) AS Transaction_Count,
SUM(QuantityPurchased) AS TotalUnitsSold,
ROUND(SUM(QuantityPurchased * Price),2) AS TotalSales
FROM Sales_transaction
GROUP BY DATETRANS
ORDER BY DATETRANS DESC;

-- =====================================================
-- 11. MONTH-ON-MONTH SALES GROWTH
-- =====================================================

WITH monthly_sales AS (
SELECT
MONTH(TransactionDate) AS Month,
SUM(QuantityPurchased * Price) AS TotalSales
FROM Sales_transaction
GROUP BY MONTH(TransactionDate)
)

SELECT
Month,
ROUND(TotalSales,2) AS TotalSales,
ROUND(
LAG(TotalSales) OVER (ORDER BY Month),2
) AS PreviousMonthSales,
ROUND(
(
(TotalSales -
LAG(TotalSales) OVER (ORDER BY Month))
/
LAG(TotalSales) OVER (ORDER BY Month)
) * 100,
2
) AS MoM_Growth_Percentage
FROM monthly_sales
ORDER BY Month;

-- =====================================================
-- 12. HIGH-FREQUENCY CUSTOMERS
-- =====================================================

SELECT
CustomerID,
COUNT(TransactionID) AS NumberOfTransactions,
SUM(QuantityPurchased * Price) AS TotalSpent
FROM Sales_transaction
GROUP BY CustomerID
HAVING NumberOfTransactions > 10
AND TotalSpent > 1000
ORDER BY TotalSpent DESC;

-- =====================================================
-- 13. LOW-FREQUENCY CUSTOMERS
-- =====================================================

SELECT
CustomerID,
COUNT(TransactionID) AS NumberOfTransactions,
SUM(QuantityPurchased * Price) AS TotalSpent
FROM Sales_transaction
GROUP BY CustomerID
HAVING NumberOfTransactions <= 2
ORDER BY NumberOfTransactions ASC,
TotalSpent DESC;

-- =====================================================
-- 14. REPEAT PURCHASE ANALYSIS
-- =====================================================

SELECT
CustomerID,
ProductID,
COUNT(TransactionID) AS TimesPurchased
FROM Sales_transaction
GROUP BY CustomerID,
ProductID
HAVING TimesPurchased > 1
ORDER BY TimesPurchased DESC;

-- =====================================================
-- 15. CUSTOMER LOYALTY ANALYSIS
-- =====================================================

SELECT
CustomerID,
MIN(STR_TO_DATE(TransactionDate,'%Y-%m-%d')) AS FirstPurchase,
MAX(STR_TO_DATE(TransactionDate,'%Y-%m-%d')) AS LastPurchase,
DATEDIFF(
MAX(STR_TO_DATE(TransactionDate,'%Y-%m-%d')),
MIN(STR_TO_DATE(TransactionDate,'%Y-%m-%d'))
) AS DaysBetweenPurchases
FROM Sales_transaction
GROUP BY CustomerID
HAVING DaysBetweenPurchases > 0
ORDER BY DaysBetweenPurchases DESC;

-- =====================================================
-- 16. CUSTOMER SEGMENTATION
-- =====================================================

CREATE TABLE customer_segment AS
SELECT
c.CustomerID,
SUM(s.QuantityPurchased) AS TotalQuantity,
CASE
WHEN SUM(s.QuantityPurchased) BETWEEN 1 AND 10
THEN 'Low'
WHEN SUM(s.QuantityPurchased) BETWEEN 11 AND 30
THEN 'Medium'
ELSE 'High'
END AS CustomerSegment
FROM sales_transaction s
JOIN customer_profiles c
ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerID;

SELECT
CustomerSegment,
COUNT(*) AS CustomerCount
FROM customer_segment
GROUP BY CustomerSegment;
