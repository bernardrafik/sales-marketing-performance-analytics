/*

Purpose: 
- Aggregate sales, marketing data at country level and marketing types
- Prepare dataset for further joins with sales data

Output:
- country_sale
- marketing_spend
- marketing_types
*/


CREATE TABLE
	country_sale AS (

-- Agregate country sale
SELECT 
	country, sum (value) as sale_sum
FROM
	sales 

-- Filter sale only without returns 
WHERE
	value > 0

-- Aggragate by country name
GROUP BY
	country

--  Sort by highest sales for analytical use
ORDER BY 2 DESC
); 

---------------------------------------------

CREATE TABLE marketing_spend AS (
SELECT 

 -- Total marketing spend per code and country	
	code, country,	
	SUM (cost) as total_marketing_cost
FROM
	marketing
	
-- Aggregate marketing expenses at country level
GROUP BY
	code, country

--  Sort by highest marketing spends for analytical use
ORDER BY 3 DESC
);	

---------------------------------------------

CREATE TABLE marketing_types AS (
SELECT 
	type,

-- Aggregate total and average spends by marketing type
	SUM (cost) as expense_type_sum, 
	AVG (cost) as expense_type_avg
FROM 
	marketing

-- Aggregate marketing expenses by type
GROUP BY (type)
);

---------------------------------------------

-- Checking results
SELECT * 
FROM country_sale
;

SELECT * 
FROM marketing_spend
;

SELECT * 
FROM marketing_types
;
