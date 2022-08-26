select p.product_name ,c.category_name [category]
from 
[production].[products] p  INNER JOIN [production].[categories] c ON p.category_id=c.category_id
where p.product_name ='Surly Big Fat Dummy Frameset - 2018'