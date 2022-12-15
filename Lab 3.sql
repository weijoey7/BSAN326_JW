--- Display the number of product subcategories in each product category.

SELECT PROD_CATEGORY, COUNT (DISTINCT PROD_SUBCATEGORY) AS "NUMBER OF subcategories"
FROM SH.PRODUCTS
GROUP BY PROD_CATEGORY;


--- (a) Display the number of products in each product category which have a list price greater than $500.

SELECT PROD_CATEGORY, COUNT (DISTINCT PROD_ID) AS "NO OF PRODUCTS"
FROM SH.PRODUCTS
WHERE PROD_LIST_PRICE > 500
GROUP BY PROD_CATEGORY;


--- (b) Display the number of products in each product category which have a list price greater than $500. Display only those product categories which have at least 2 products.

SELECT PROD_CATEGORY, COUNT (DISTINCT PROD_ID) AS "NO OF PRODUCTS"
FROM SH.PRODUCTS
WHERE PROD_LIST_PRICE > 500
GROUP BY PROD_CATEGORY
HAVING COUNT(DISTINCT PROD_ID) >= 2;


--- Print the total amount of sales in dollars and total quantity sold per customer. Round the results into 2 decimals.

SELECT CUST_ID, ROUND(SUM(AMOUNT_SOLD),2) AS "TOTAL AMOUNT SOLD IN DOLLARS", ROUND(SUM(QUANTITY_SOLD),2) AS "TOTAL QUANTITY_SOLD"
FROM SH.SALES
GROUP BY CUST_ID;

SELECT CUST_ID, ROUND(SUM(AMOUNT_SOLD),2) AS "TOTAL AMOUNT SOLD IN DOLLARS", ROUND(SUM(QUANTITY_SOLD),2) AS "TOTAL QUANTITY_SOLD"
FROM SH.SALES
GROUP BY CUST_ID
ORDER BY ROUND(SUM(AMOUNT_SOLD),2) DESC;


--- Print the range of total amount of sales in dollars and range of total quantity sold per customer. Round all numbers to 2 decimals.

