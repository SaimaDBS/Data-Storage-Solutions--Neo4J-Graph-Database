select o.order_date,o.order_id,oi.quantity,p.product_name,oi.list_price
from [sales].[orders] o  
INNER JOIN [sales].[order_items] oi on oi.order_id=o.order_id
INNER JOIN [production].[products] p ON oi.product_id=p.product_id
Where o.order_date ='2016-01-03' and  o.order_id=4