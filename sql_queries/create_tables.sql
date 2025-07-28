-- ───────── START of SQL queries by Kunal Ghosh (ghosh178@purdue.edu) ───────── -->

-- 1) oil table
CREATE TABLE IF NOT EXISTS `mgmt599-kunalghosh.assignment2.oil` (
  date       DATE,
  dcoilwtico FLOAT64
);

-- 2) stores table
CREATE TABLE IF NOT EXISTS `mgmt599-kunalghosh.assignment2.store_info` (
  store_nbr INT64,
  city      STRING,
  state     STRING,
  type      STRING,
  cluster   INT64
);

-- 3) train table
CREATE TABLE IF NOT EXISTS `mgmt599-kunalghosh.assignment2.sales_data` (
  id           INT64,
  date         DATE,
  store_nbr    INT64,
  family       STRING,
  sales        FLOAT64,
  onpromotion  INT64
);

-- ───────── END of SQL queries by Kunal Ghosh (ghosh178@purdue.edu) ───────── -->
-- ───────── START of SQL queries by Rakesh Prusty (prustyr@purdue.edu) ───────── -->
-- 1) oil table
CREATE TABLE IF NOT EXISTS `mgmt599-rakesh-assignment-1.store_sales_team_data_ninja.oil` (
  date       DATE,
  dcoilwtico FLOAT64
);

-- 2) stores table
CREATE TABLE IF NOT EXISTS `mgmt599-rakesh-assignment-1.store_sales_team_data_ninja.store_info` (
  store_nbr INT64,
  city      STRING,
  state     STRING,
  type      STRING,
  cluster   INT64
);

-- 3) train table
CREATE TABLE IF NOT EXISTS `mgmt599-rakesh-assignment-1.store_sales_team_data_ninja.sales_data` (
  id           INT64,
  date         DATE,
  store_nbr    INT64,
  family       STRING,
  sales        FLOAT64,
  onpromotion  INT64
);

-- ───────── END of SQL queries by Rakesh Prusty (prustyr@purdue.edu) ───────── -->

-- ───────── START of SQL queries by Pavan Meka (pmeka@purdue.edu) ───────── -->
-- 1) oil table
CREATE TABLE IF NOT EXISTS `mgmt599-pavanmeka-lab1.store_sales_team_DN9.sales_data` (
  date       DATE,
  dcoilwtico FLOAT64
);


-- 2) train table
CREATE TABLE IF NOT EXISTS `mgmt599-pavanmeka-lab1.store_sales_team_DN9.oil` (
  id           INT64,
  date         DATE,
  store_nbr    INT64,
  family       STRING,
  sales        FLOAT64,
  onpromotion  INT64
);

-- 3) stores table
CREATE TABLE IF NOT EXISTS `mgmt599-pavanmeka-lab1.store_sales_team_DN9.store_info` (
  store_nbr INT64,
  city      STRING,
  state     STRING,
  type      STRING,
  cluster   INT64
);

-- ───────── END of SQL queries by Pavan Meka (pmeka@purdue.edu) ───────── -->
