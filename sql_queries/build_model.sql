-- ───────── START of SQL queries by Kunal Ghosh (ghosh178@purdue.edu) ───────── -->

-- Create aggregated training data
CREATE OR REPLACE TABLE `mgmt599-kunalghosh.assignment2.daily_sales` AS
SELECT 
  date,
  SUM(sales) as total_sales,
  COUNT(DISTINCT store_nbr) as stores_active,
  AVG(onpromotion) as avg_promo_items
FROM   `mgmt599-kunalghosh.assignment2.sales_data`
WHERE date < '2017-08-01'  -- Keep last 2 weeks for testing
GROUP BY date;

-- Build time series model
CREATE OR REPLACE MODEL `mgmt599-kunalghosh.assignment2.sales_forecast_model`
OPTIONS(
  model_type='ARIMA_PLUS',
  time_series_timestamp_col='date',
  time_series_data_col='total_sales'
) AS
SELECT date, total_sales
FROM `mgmt599-kunalghosh.assignment2.daily_sales`;


-- Check model performance
SELECT * FROM ML.EVALUATE(MODEL `mgmt599-kunalghosh.assignment2.sales_forecast_model`);


-- ───────── END of SQL queries by Kunal Ghosh (ghosh178@purdue.edu) ───────── -->
-- ───────── START of SQL queries by Rakesh Prusty (prustyr@purdue.edu) ───────── -->
-- Create aggregated training data
CREATE OR REPLACE TABLE `mgmt599-rakesh-assignment-1.store_sales_team_data_ninja.daily_sales` AS
SELECT 
  date,
  SUM(sales) as total_sales,
  COUNT(DISTINCT store_nbr) as stores_active,
  AVG(onpromotion) as avg_promo_items
FROM   `mgmt599-rakesh-assignment-1.store_sales_team_data_ninja.sales_data`
WHERE date < '2017-08-01'  -- Keep last 2 weeks for testing
GROUP BY date;

-- Build time series model
CREATE OR REPLACE MODEL `mgmt599-rakesh-assignment-1.store_sales_team_data_ninja.sales_forecast_model`
OPTIONS(
  model_type='ARIMA_PLUS',
  time_series_timestamp_col='date',
  time_series_data_col='total_sales'
) AS
SELECT date, total_sales
FROM `mgmt599-rakesh-assignment-1.store_sales_team_data_ninja.daily_sales`;


-- Check model performance
SELECT * FROM ML.EVALUATE(MODEL `mgmt599-rakesh-assignment-1.store_sales_team_data_ninja.sales_forecast_model`);


-- ───────── END of SQL queries by Rakesh Prusty (prustyr@purdue.edu) ───────── -->

-- ───────── START of SQL queries by Pavan Meka (pmeka@purdue.edu) ───────── -->

-- Create aggregated training data
CREATE OR REPLACE TABLE `mgmt599-pavanmeka-lab1.store_sales_team_DN9.sales_data.daily_sales` AS
SELECT 
  date,
  SUM(sales) as total_sales,
  COUNT(DISTINCT store_nbr) as stores_active,
  AVG(onpromotion) as avg_promo_items
FROM `mgmt599-pavanmeka-lab1.store_sales_team_DN9.sales_data`
WHERE date < '2017-08-01'  -- Keep last 2 weeks for testing
GROUP BY date;

-- Build time series model
CREATE OR REPLACE MODEL `mgmt599-pavanmeka-lab1.store_sales_team_DN9.sales_data.sales_forecast_model`
OPTIONS(
  model_type='ARIMA_PLUS',
  time_series_timestamp_col='date',
  time_series_data_col='total_sales'
) AS
SELECT date, total_sales
FROM `mgmt599-pavanmeka-lab1.store_sales_team_DN9..daily_sales`;

-- ───────── END of SQL queries by Pavan Meka (pmeka@purdue.edu) ───────── -->
