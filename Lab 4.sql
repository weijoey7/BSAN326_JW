--- What is the total_sales in dollars in each country. Order the results by the descending order of sales. 

SELECT co.COUNTRY_NAME, ROUND(SUM(s.AMOUNT_SOLD)) as "Total SALES $"
FROM sh.SALES s 
JOIN sh.CUSTOMERS cu ON(s.CUST_ID = cu.CUST_ID)
JOIN sh.COUNTRIES co ON(cu.COUNTRY_ID = co.COUNTRY_ID)
GROUP BY co.COUNTRY_NAME
ORDER BY SUM(s.AMOUNT_SOLD) DESC;

--- Display  the  no.  of  distinct  promotions  (use  promo_id  to  count  the  distinct promotions) per country. 
--- Sort the results by the descending order of no. of distinct promotions.

SELECT co.COUNTRY_NAME, count(distinct p.PROMO_ID) as "No. of distinct promotions"
FROM sh.PROMOTIONS p 
JOIN sh.SALES s ON(p.PROMO_ID = s.PROMO_ID)
JOIN sh.CUSTOMERS cu ON(cu.CUST_ID = s.CUST_ID)
JOIN sh.COUNTRIES co ON(cu.COUNTRY_ID = co.COUNTRY_ID)
GROUP BY co.COUNTRY_NAME
ORDER BY count(distinct p.PROMO_ID) DESC;

--- Display the products sold in Brazil in the fiscal year 1999. Print the product 
--- name only. Sort the results by product name.  

SELECT *
FROM sh.PRODUCTS;