USE [BikeStores]
GO

/****** Object:  Table [production].[status]    Script Date: 27-07-2022 08:25:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [production].[Status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status_desc] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/*Truncate Table production].[Status]

Insert into [production].[Status] values('New')
Insert into [production].[Status] values('In-progress')
Insert into [production].[Status] values('Pending')
Insert into [production].[Status] values('Completed')

select * from [production].[Status]

--SELECT order_status, COUNT(order_status)
--  FROM [BikeStores].[sales].[orders] o
--  join [production].[Status] st on o.order_status =st.[status_id]
--  group by order_status,st.s

select  count (ord.order_status), s.status_desc
from  [BikeStores].[sales].[orders]  ord JOIN [production].[Status] s
on ord.order_status=s.status_id
group by ord.order_status, s.status_desc
*/

