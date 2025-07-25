-- ───────── START of SQL queries by Kunal Ghosh (ghosh178@purdue.edu) ───────── -->

-- 1) How many unique stores are in the store_info table?
SELECT
  COUNT(DISTINCT store_nbr) AS store_count
FROM
  `mgmt599-kunalghosh.assignment2.store_info`;


-- 2) What date range does the sales_data table cover?
SELECT
  MIN(date) AS start_date,
  MAX(date) AS   end_date
FROM
  `mgmt599-kunalghosh.assignment2.sales_data`;


-- 3) What distinct product families appear in the sales_data table?
SELECT
  DISTINCT family
FROM
  `mgmt599-kunalghosh.assignment2.sales_data`
ORDER BY
  family;

-- ───────── END of SQL queries by Kunal Ghosh (ghosh178@purdue.edu) ───────── -->