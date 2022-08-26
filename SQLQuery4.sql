SELECT 
oi.order_id,p.product_id,p.product_name,oi.quantity,b.brand_id,b.brand_name
From
[sales].[order_items] oi INNER JOIN [production].[products] p ON oi.product_id=p.product_id
INNER JOIN [production].[brands] b ON p.brand_id=b.brand_id
WHERE oi.order_id=2 and p.product_id=20