select max(item_price)
from items;

select item_name,
	item_type,
    max(item_price) over()
from items;

select item_name,
        item_type,
        max(item_price) over(partition by item_type)
from items;

select item_type,max(item_price),min(item_price),avg(item_price)
from items
group by item_type;
select * from orders;
select * from items;

select o.*,i.item_price,
	sum(item_price) over(order by order_date asc)
from orders o
join items  i 
on i.item_id = o.item_id;

select o.*,i.item_price,
	sum(item_price) over(order by order_date asc),
    count(order_id) over(partition by customer_id),
    round(avg(item_price) over(partition by customer_id), 1)
from orders o
join items  i 
on i.item_id = o.item_id;


select *,
dense_rank() over(order by item_id),
rank() over(order by item_id),
row_number () over (order by item_price)
from items;

select *,
dense_rank () over(partition by item_type order by item_price desc)
from items;

with t as (
select *,
dense_rank () over(partition by item_type order by item_price desc)
from items
)
select *
from t ;

select o.* , i.item_price,
        lead(item_price) over(partition by customer_id order by order_date)
from orders o 
join items i 
on i.item_id = o.item_id
order by customer_id ,
order_date;

select o.* , i.item_price,
        lag(item_price) over(partition by customer_id order by order_date)
from orders o 
join items i 
on i.item_id = o.item_id
order by customer_id ,
order_date;

select 
customer_id ,count(order_id),
dense_rank() over(partition by count(order_id))
from orders
group by customer_id
order by customer_id;

