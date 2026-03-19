-- Retail Sales Analysis Project
-- Step 1 : Data Understanding

select *
from clean_superstore
limit 20;

-- Total Records 
select count(*) as Total_Rows
from clean_superstore;


-- Unique Customers
select count(distinct "Order ID") as Total_Orders
from clean_superstore;

-- Date Range
select 
min("Order Date") as First_Order,
max("Order Date") as Last_Order
from clean_superstore;


-- Distinct Regions 
select DISTINCT Region
from clean_superstore;


-- Distinct Categories
select DISTINCT Category
from clean_superstore;

-- Step 2 : Data Exploration
-- Analysing core business metrics

-- Total Sales
select sum(sales) as Total_Sales
from clean_superstore;


-- Sales by Category
select 
Category,
sum(sales) as total_sales
from clean_superstore
group by Category
order by total_sales desc;


-- Sales by Region
select 
Region,
Sum(Sales) as Total_Sales
from clean_superstore
group by Region
order by Total_Sales desc;


-- Step 3 : Business Insights

-- Sales by Segment
SELECT
Segment,
sum(sales) as Total_Sales
from clean_superstore
group by Segment
order by  Total_Sales desc;


-- Top 10 Customers
select 
"Customer Name",
sum(sales) as Total_Sales
from clean_superstore
group by "Customer Name"
Order by Total_Sales desc
limit 10;


-- Top Cities by Sales
select 
City,
sum(sales) as Total_Sales
from clean_superstore
group by City
order by Total_Sales DESC
limit 10;


-- Most Profitable States
select 
State,
sum(sales) as Total_Profit
from clean_superstore
group by State
order by Total_Profit desc
limit 10;


-- Shipping Mode Usage
select 
"Ship Mode",
count(*) as order_count
from clean_superstore
group by "Ship Mode"
order by order_count desc;

-- Step 4 : Advanced Analysis

-- Monthly Sales Trend
SELECT
strftime('%Y-%m', date("Order Date")) AS Month,
SUM(Sales) AS Total_Sales
FROM clean_superstore
WHERE date("Order Date") IS NOT NULL
GROUP BY Month
ORDER BY Month;


-- Sub-Category Performance
select
"Sub-Category",
sum(sales) as Total_Profit
from clean_superstore
group by "Sub-Category"
order by Total_Profit;


-- Category Contribuution %

SELECT
Category,
SUM(Sales) AS Total_Sales,
ROUND(
SUM(Sales) * 100.0 /
(SELECT SUM(Sales) FROM clean_superstore),2
) AS Sales_Percentage
FROM clean_superstore
GROUP BY Category
ORDER BY Total_Sales DESC;


-- Average Order VALUES
SELECT
SUM(Sales) / COUNT(DISTINCT "Order ID") AS Avg_Order_Value
FROM clean_superstore;