/*
Purpose: Validate data quality and check for missing or useless values.
*/

--Checking missing value after data cleaning in excel before
SELECT * 
FROM sales
WHERE
	country IS NULL 
	OR value IS NULL
	OR currency IS NULL
	OR date IS NULL	
;
-- No NULL results

---------------------------------------------

--Checking missing value after data cleaning in excel before
SELECT * 
FROM marketing
WHERE 
	code IS NULL
	OR country IS NULL
	OR region IS NULL
	OR type IS NULL
	OR cost IS NULL
;
-- No NULL 

---------------------------------------------

-- Checking for negative sales value (returns) 
SELECT *
FROM sales
WHERE value < 0
;
-- Returns must be filter in next, aggregations steps

---------------------------------------------

-- Verify date range 
SELECT 
	MIN (date) as min_date,
	MAX (date) as max_date
FROM sales;
-- The date range is H2_2025 

---------------------------------------------

--Verify other currency than PLN 
SELECT *
FROM sales
WHERE
	currency <> 'PLN'
;
-- No other currencies than PLN 

