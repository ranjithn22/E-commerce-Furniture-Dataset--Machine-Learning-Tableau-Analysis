-- =============================================================
-- E-COMMERCE FURNITURE DATA ANALYSIS USING SQL
-- =============================================================
-- total records and unique products
SELECT COUNT(*) AS total_records, COUNT(DISTINCT productTitle) AS unique_products FROM furniture_sales;

-- average, minimum and maximum price
SELECT ROUND(AVG(price), 2) AS avg_price, ROUND(MIN(price), 2) AS min_price, ROUND(MAX(price), 2) AS max_price FROM furniture_sales;

-- top 10 best selling products
SELECT productTitle, sold, price, tagText FROM furniture_sales ORDER BY sold DESC LIMIT 10;

-- average sales by shipping type
SELECT tagText AS shipping_type, ROUND(AVG(sold), 2) AS avg_units_sold FROM furniture_sales GROUP BY tagText ORDER BY avg_units_sold DESC;

-- average sales by discount range
SELECT 
    CASE 
        WHEN ((originalPrice - price) / originalPrice * 100) BETWEEN 0 AND 10 THEN '0–10%'
        WHEN ((originalPrice - price) / originalPrice * 100) BETWEEN 10 AND 30 THEN '10–30%'
        WHEN ((originalPrice - price) / originalPrice * 100) BETWEEN 30 AND 50 THEN '30–50%'
        WHEN ((originalPrice - price) / originalPrice * 100) > 50 THEN '50%+'
        ELSE 'No Discount'
    END AS discount_range,
    ROUND(AVG(sold), 2) AS avg_sold
FROM furniture_sales
WHERE originalPrice IS NOT NULL AND originalPrice > 0
GROUP BY discount_range
ORDER BY avg_sold DESC;

-- top 10 most expensive products
SELECT productTitle, price, sold, tagText FROM furniture_sales ORDER BY price DESC LIMIT 10;

-- count of products by shipping category
SELECT tagText, COUNT(*) AS product_count FROM furniture_sales GROUP BY tagText ORDER BY product_count DESC;

-- products with high discount but low sales
SELECT 
    productTitle,
    ROUND(((originalPrice - price) / originalPrice * 100), 2) AS discount,
    sold,
    price
FROM furniture_sales
WHERE originalPrice IS NOT NULL AND ((originalPrice - price) / originalPrice * 100) > 30 AND sold < 5
ORDER BY discount DESC
LIMIT 10;

-- average price by sales segment
SELECT 
    CASE 
        WHEN sold BETWEEN 0 AND 5 THEN 'Low Sales (0–5)'
        WHEN sold BETWEEN 6 AND 20 THEN 'Medium Sales (6–20)'
        WHEN sold > 20 THEN 'High Sales (20+)'
    END AS sales_category,
    ROUND(AVG(price), 2) AS avg_price
FROM furniture_sales
GROUP BY sales_category
ORDER BY avg_price ASC;

-- top 10 highest discount items
SELECT 
    productTitle,
    ROUND(((originalPrice - price) / originalPrice * 100), 2) AS discount,
    price,
    sold
FROM furniture_sales
WHERE originalPrice IS NOT NULL AND originalPrice > 0
ORDER BY discount DESC
LIMIT 10;
