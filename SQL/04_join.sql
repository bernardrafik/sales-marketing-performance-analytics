/*
Purpose: Combine aggregated sales and marketing spend data at country level.
Description:
- Join total sales per country with marketing spend per country
- Prepare  dataset for KPI calculations and BI visualization

Output:
- sale_vs_marketing
*/


CREATE TABLE sale_vs_marketing AS (
SELECT 

-- Country identifier from marketing table
	ms.code as country_code,
	
-- Full country name
	ms.country as country_name,
	
-- Aggregated total sales per country
	cs.sale_sum,

-- Aggregated marketing spend per country
	ms.total_marketing_cost
	
FROM 
	country_sale cs

-- LEFT JOIN used to join full sales context before filtering	
LEFT JOIN
	marketing_spend ms

 -- Join based on matching country code	
ON 
	cs.country = ms.code

-- Only countries with marketing spends, Europer Region
WHERE 
	ms.country IS NOT NULL

-- Sort by highest sales for analytical use	
ORDER BY cs.sale_sum DESC
);

---------------------------------------------

-- Checking results
SELECT *
FROM sale_vs_marketing
;

	