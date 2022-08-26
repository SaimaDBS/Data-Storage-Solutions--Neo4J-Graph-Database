
SELECT 
sf.first_name,sf.last_name,st.store_name,st.state [state]
FROM

[sales].[staffs] sf JOIN [sales].[stores] st ON sf.store_id=st.store_id

WHERE st.store_id=1 and sf.last_name='Jackson'

