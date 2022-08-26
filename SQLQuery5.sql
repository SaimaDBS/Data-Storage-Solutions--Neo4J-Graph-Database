SELECT 
oi.order_id,p.product_id,p.product_name,oi.quantity,c.category_id,c.category_name
From
[sales].[order_items] oi INNER JOIN [production].[products] p ON oi.product_id=p.product_id
INNER JOIN [production].[categories] c  ON p.category_id=c.category_id

WHERE oi.order_id=2 and p.product_id=20