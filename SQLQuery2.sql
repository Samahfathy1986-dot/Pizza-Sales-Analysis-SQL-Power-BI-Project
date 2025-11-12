use [Pizza]
Go
create or Alter view All_pizza_sales as
select sum (total_price) as [total_revenue]
from pizza_sales
Go
create or Alter view  Total_revenue as
select sum (total_price)/count(Distinct order_id) as [avg order value]
from pizza_sales
Go
create or Alter view Total_Pizza_sold as
select sum (quantity) as[total pizza sold]
from pizza_sales
Go
create or Alter view  Total_orders as
select count (distinct order_id) as[total orders]
from pizza_sales
Go
create or Alter view Avg_Pizzas_per_order as
select casT(sum(quantity)as FloaT)/count(Distinct order_id) as [average pizza per order]
from pizza_sales
GO
CREATE OR ALTER VIEW vw_Orders_By_Weekday AS
SELECT 
  DATENAME(WEEKDAY, order_date) AS weekday_name,
  COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(WEEKDAY, order_date);

GO
CREATE OR ALTER VIEW vw_Orders_By_Month AS
SELECT 
  DATENAME(MONTH, order_date) AS month_name,
  MONTH(order_date) AS month_number,
  COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date), MONTH(order_date);

GO
CREATE OR ALTER VIEW vw_Total_Pizzas_By_Category AS
SELECT 
  pizza_category,
  SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY pizza_category;
GO
CREATE OR ALTER VIEW vw_Percent_Sales_By_Size AS
SELECT 
  pizza_size,
  ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS sales_percentage
FROM pizza_sales
GROUP BY pizza_size;

GO
CREATE OR ALTER VIEW vw_Percent_Sales_By_Category AS
SELECT 
  pizza_category,
  ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS sales_percentage
FROM pizza_sales
GROUP BY pizza_category;
