-- ───────── START of SQL queries by Kunal Ghosh (ghosh178@purdue.edu) ───────── -->


-- Check model performance
SELECT * FROM ML.EVALUATE(MODEL `mgmt599-kunalghosh.assignment2.sales_forecast_model`);


-- ───────── END of SQL queries by Kunal Ghosh (ghosh178@purdue.edu) ───────── -->

-- ───────── START of SQL queries by Rakesh Prusty (prustyr@purdue.edu) ───────── -->


-- Check model performance
SELECT * FROM ML.EVALUATE(MODEL `mgmt599-rakesh-assignment-1.store_sales_team_data_ninja.sales_forecast_model`);


-- ───────── END of SQL queries by Rakesh Prusty (prustyr@purdue.edu) ───────── -->

-- ───────── START of SQL queries by Pavan Meka (pmeka@purdue.edu) ───────── -->


-- Check model performance
SELECT * FROM ML.FORECAST(MODEL `mgmt599-pavanmeka-lab1.store_sales_team_DN9.sales_forecast_model`,
                          STRUCT(14 AS horizon));

-- ───────── END of SQL queries by Pavan Meka (pmeka@purdue.edu) ───────── -->

-- ───────── START of SQL queries by Sai Nuka (snuka@purdue.edu) ───────── -->


-- Check model performance
SELECT * FROM ML.EVALUATE(MODEL `mgmt-599-sainuka-lab2.store_sales_team_data_ninja.sales_forecast_model`);

-- ───────── END of SQL queries by Sai Nuka (snuka@purdue.edu) ───────── -->

