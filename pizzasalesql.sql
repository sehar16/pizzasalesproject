drop database pizza_sales;
create database pizza_sales;

select * from pizza_sales;
select distinct pizza_name from pizza_sales;
select distinct pizza_category from pizza_sales;
select  max(quantity) from pizza_sales
group by 1;
select max(pizza_id) from pizza_sales;

-- 1. revenue
select round(sum(total_price) ,2) from pizza_sales;
-- 2. average order value
select round((sum(total_price)/count(distinct order_id)) ,2) from pizza_sales;
-- 3. total pizza sold
select sum(quantity) from pizza_sales;
-- 4. total orders placed
select count(distinct order_id) from pizza_sales;
-- 5. average pizza per order
select sum(quantity) / count(distinct order_id) from pizza_sales;
-- 6. daily trends for total orders
select dayname(order_date) , count(distinct order_id) from pizza_sales group by 1 
order by 2 desc  ;
-- 7. hourly trends for total orders
select hour(order_time), count(distinct order_id) from pizza_sales
group by 1 order by 2 desc;
-- 8. percentage of sale by pizza category
select pizza_category, (sum(total_price) / (select sum(total_price) from pizza_sales)) *100
from pizza_sales
 group by 1;
-- 9.percentage of sale by pizza size
select pizza_size, round((sum(total_price) / (select sum(total_price) from pizza_sales)) *100 , 3) 
from pizza_sales
 group by 1;
-- 10. pizza sold by category
select pizza_category, sum(quantity) from pizza_sales
group by 1;
-- 11. top 5 sold 
select pizza_name , sum(quantity) from pizza_sales
group by 1 order by 2 desc limit 5 ; 

-- 12. bottom 5 sold
select pizza_name , sum(quantity) from pizza_sales
group by 1 order by 2 limit 5 ; 