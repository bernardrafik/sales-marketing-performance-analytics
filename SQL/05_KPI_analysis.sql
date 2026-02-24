/*
Purpose: Calculate business KPIs for sales and marketing performance.

KPIs:
- Sales to marketing ratio
- Country share of sales
- Country share of marketing spend
*/

-----------------------------------------------------------------------
 -- Calculate efficiency of marketing spend, country share of total sale, marketing share of total spends

CREATE TABLE sale_vs_marketing_kpi AS (
SELECT *,  

-- Marketing efficiency ratio
	ROUND((sale_sum / total_marketing_cost),2) AS sales_to_marketing_ratio,

 -- Share of total sales (%)
	ROUND(100 * (sale_sum / SUM (sale_sum) OVER ()),2) AS country_share_sale,

    -- Share of total marketing spend (%)
	ROUND(100 * ( total_marketing_cost/ SUM (total_marketing_cost) OVER ()),2) AS country_share_marketing
FROM sale_vs_marketing
);
---------------------------------------------

-- Checking results
SELECT *
FROM sale_vs_marketing_kpi
;

