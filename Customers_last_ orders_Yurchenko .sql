select c.company_name, o.order_date , o.required_date , o.shipped_date , o.shipped_date >= o.required_date as Overdate
from customers c 
join orders o on c.customer_id =o.customer_id 
where o.order_date =
	( select max (o.order_date)
	from orders o
	where o.customer_id =c.customer_id 
	)
order by o.customer_id asc  

