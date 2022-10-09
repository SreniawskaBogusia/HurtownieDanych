-- 1
use lab1;
with res1 as (
	select od.order_id, sum(p.price) price_sum, o.date 
	from order_details od 
	join pizzas p on p.pizza_id = od.pizza_id
	join orders o on o.order_id = od.order_id 
	where o.date = '2015-02-18' 
	group by od.order_id, o.date)
select avg(price_sum) avg_order_amount, date 
from res1 
group by date

-- 2
use lab1;
with res2 as (
	select od.order_id id
	from order_details od
	join pizzas p on p.pizza_id = od.pizza_id
	join orders o on o.order_id = od.order_id
	where p.pizza_type_id not like 'hawaiian' and o.date like '2015-03-%'
	group by od.order_id
)
select string_agg(CONVERT(NVARCHAR(max),id), ',') all_id from res2

-- 3
use lab1;
with res3 as (
	select od.order_id id, p.price*od.quantity price
	from order_details od
	join orders o on o.order_id = od.order_id
	join pizzas p on p.pizza_id = od.pizza_id
	where o.date like '2015-02-%'
	group by od.order_id, p.price, od.quantity)
select top(10) id, price, rank () over ( order by price desc ) ranking 
from res3

-- 4
use lab1;
with res4 as(
	select od.order_id, sum(p.price*od.quantity) order_amount, month(o.date) month_amount, o.date
	from order_details od
	join pizzas p on p.pizza_id = od.pizza_id
	join orders o on o.order_id = od.order_id
	group by od.order_id, o.date
	),
avg_res4 as(
	select avg(order_amount) average_month_amount, month_amount
	from res4
	group by month_amount)
select order_id, order_amount, average_month_amount, date 
from res4
join avg_res4 on avg_res4.month_amount = res4.month_amount

-- 5
use lab1;
with res5 as(
	select od.quantity, o.time, o.date
	from order_details od
	join orders o on o.order_id=od.order_id
	where o.date = '2015-01-01'
	group by od.quantity,o.time, o.date)
select count(quantity) order_count, date, left(time,2) hour 
from res5
group by date, left(time,2)

-- 6
use lab1;
with res6 as (
	select od.quantity, p.pizza_type_id, pt.name, pt.category
	from order_details od
	join orders o on o.order_id = od.order_id
	join pizzas p on p.pizza_id = od.pizza_id
	join pizza_types pt on pt.pizza_type_id = p.pizza_type_id
	where o.date like '2015-01-%')
select count(quantity) pizzas_count, name, category 
from res6
group by name, category
order by pizzas_count desc

-- 7
use lab1;
with res7 as(
	select od.quantity, od.pizza_id, o.date
	from order_details od
	join orders o on o.order_id = od.order_id
	where o.date like '2015-02-%' OR o.date like '2015-03-%')
select right(pizza_id,1) size, count(quantity) count
from res7
group by right(pizza_id,1)


select * from orders o
select * from pizzas p
select * from order_details
select * from pizza_types pt