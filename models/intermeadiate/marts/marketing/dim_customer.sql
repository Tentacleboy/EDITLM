select 
c.customer_id,
c.first_name,
c.last_name,
min(o.order_date) as first_order_date,
max(o.order_date) as most_recent_order_date,
count(order_id) as number_of_orders
from {{ref('stg_jaffle_shopclientes')}} c
inner join {{ref('stg_jaffle_shoporders')}} o
on c.customer_id = o.customer_id
group by c.customer_id,
c.first_name,
c.last_name