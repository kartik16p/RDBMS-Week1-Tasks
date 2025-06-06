-- 1. Find the total number of orders for each customer.
select customer_id, count(*) as total_orders from orders group by customer_id;

-- 2. Find the total sales amount for each product (revenue per product).
select product_id, sum(quantity * unit_price) as total_revenue from orderdetails group by product_id;

-- 3. Find the most expensive product sold.
select product_id, max(unit_price) as max_price from orderdetails;

-- 4. Get the list of customers who have placed orders in the last 30 days.
select distinct c.customer_id, c.first_name, c.last_name from customers c join orders o on c.customer_id = o.customer_id where o.order_date >= current_date - interval 30 day;

-- 5. Calculate the total amount paid by each customer.
select o.customer_id, sum(p.payment_amount) as total_paid from payments p join orders o on p.order_id = o.order_id group by o.customer_id;

-- 6. Get the number of products sold by category.
select p.category, sum(od.quantity) as total_sold from products p join orderdetails od on p.product_id = od.product_id group by p.category;

-- 7. List all orders that are pending (i.e., orders that haven't been shipped yet).
select * from orders where order_status = 'Pending';

-- 8. Find the average order value (total order amount / number of orders).
select avg(total_amount) as average_order_value from orders;

-- 9. List the top 5 customers who have spent the most money.
select o.customer_id, sum(p.payment_amount) as total_spent from payments p join orders o on p.order_id = o.order_id group by o.customer_id order by total_spent desc limit 5;

-- 10. Find the products that have never been sold.
select p.product_id, p.product_name from products p left join orderdetails od on p.product_id = od.product_id where od.product_id is null;
