
select s.store_id,s.store_name,o.order_date,o.customer_id,c.email
from [sales].[orders] o  
inner join [sales].[stores] s on o.store_id=s.store_id
inner join [sales].[customers] c on o.customer_id=c.customer_id
Where o.order_date ='2018-04-28' and  s.store_id=2
