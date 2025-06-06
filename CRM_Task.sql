-- 1. Retrieve the full name and email of all customers who joined after January 1, 2023.
select firstname, lastname, email from customers where joindate > '2023-01-01';

-- 2. Find the total amount of completed orders for each customer.
select customerid, sum(orderamount) as total_completed_orders from orders where orderstatus = 'Completed' group by customerid;

-- 3. List all unresolved support tickets (Status = 'Open' or 'In Progress') along with the customer's name.
select s.ticketid, s.status, c.firstname, c.lastname from supporttickets s join customers c on s.customerid = c.customerid where s.status in ('Open', 'In Progress');

-- 4. Retrieve the most recent interaction for each customer.
select i.customerid, max(i.interactiondate) as latest_interaction from interactions i group by i.customerid;

-- 5. Count the number of customers in each country.
select country, count(*) as customer_count from customers group by country;

-- 6. List customers who have placed no orders.
select c.firstname, c.lastname from customers c left join orders o on c.customerid = o.customerid where o.orderid is null;

-- 7. Identify customers who have both unresolved support tickets and pending orders.
select distinct c.customerid, c.firstname, c.lastname from customers c join supporttickets s on c.customerid = s.customerid join orders o on c.customerid = o.customerid where s.status in ('Open', 'In Progress') and o.orderstatus = 'Pending';

-- 8. Calculate the average order amount for each order status.
select orderstatus, avg(orderamount) as average_amount from orders group by orderstatus;

-- 9. List all customers who have interacted with the company via email in the past month.
select distinct c.firstname, c.lastname from customers c join interactions i on c.customerid = i.customerid where i.interactiontype = 'Email' and i.interactiondate >= current_date - interval 1 month;

-- 10. Show the top 5 customers with the highest total order amount.
select c.customerid, c.firstname, c.lastname, sum(o.orderamount) as total_spent from customers c join orders o on c.customerid = o.customerid group by c.customerid, c.firstname, c.lastname order by total_spent desc limit 5;
