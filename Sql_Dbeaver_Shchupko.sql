select customers.company_name, customers.city, orders.order_date, orders.required_date >= orders.shipped_date as is_overdate
from customers
join orders
on customers.customer_id=orders.customer_id 
and orders.order_date=(select max (orders.order_date)
from orders
where customers.customer_id=orders.customer_id)
order by customers.company_name