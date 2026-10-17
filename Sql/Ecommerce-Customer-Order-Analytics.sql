create schema sql_day13;
SELECT * FROM CUSTOMERS;
SELECT * FROM ITEMS;
SELECT * FROM ORDERS;
alter table customers
change column ï»¿customer_id  customer_id int;
alter table orders
change column order_id order_id int;
alter table items
change column ï»¿item_id item_id int;
alter table customers
add primary key (ï»¿customer_id);
alter table items
add primary key (ï»¿item_id);
alter table orders
add primary key (order_id);

alter table customers
add constraint fk_customer_id
foreign key (customer_id) references customers(customer_id);

ALTER TABLE customers
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);
show index from customers;
show columns from customers;
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);

select *
from orders o 
join customers on o.order_id = customers.customer_id;

-- --Inner Join--
select  c.customer_id,c.first_name,orders.order_id,orders.item_id
from customers c 
join orders on c.customer_id = orders.customer_id;

select *
from orders
join items on items.item_id = orders.order_id;

-- ---Left Join ---
select * 
from customers 
left join orders on order_id= customers.customer_id
where orders.order_id is null;

-- ---Right join ---
select  c.customer_id,c.first_name,c.city,orders.item_id,orders.order_date
from customers c 
right join orders on orders.customer_id = c.customer_id
order by c.customer_id;

select customers.customer_id,orders.order_id,customers.first_name,items.item_name
from orders 
right join items on orders.order_id = items.item_id
left join customers on customers.customer_id
where orders.order_id ;

select o.customer_id,sum(i.item_price)
from orders o 
join items i
 on i.item_id = o.item_id
group by o.customer_id
order by o.customer_id ;

select orders.customer_id,sum(items.item_price) as total_spend,customers.first_name,customers.city
from orders 
join items on items.item_id = orders.item_id
join customers  on customers.customer_id = customers.customer_id
group by orders.customer_id,customers.first_name,customers.city
ORDER BY total_spend DESC;

select 
avg(item_price) from items;
select *
from items 
where item_price > 25.240000000000006;

select *
from items 
where item_price > (select avg(item_price) from items);

select  c.customer_id,c.first_name,c.last_name,c.phone_number,c.city
from customers c
left join orders o on c.customer_id =c.customer_id
where o.order_id is null;

select distinct customer_id from orders;
select customer_id,first_name,last_name
from customers
where customer_id  not  in (
select distinct customer_id from orders);

select customer_id,max(order_date)
from orders
group by customer_id;

