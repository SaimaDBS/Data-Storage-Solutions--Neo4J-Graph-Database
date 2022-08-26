
SELECT 
st.store_name,st.email [store email],st.email [employee email],sf.first_name,sf.last_name
FROM

[sales].[staffs] sf JOIN [sales].[stores] st ON sf.store_id=st.store_id

WHERE st.store_name='Baldwin Bikes'

