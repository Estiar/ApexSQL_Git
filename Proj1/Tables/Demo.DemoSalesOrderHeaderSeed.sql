SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Demo].[DemoSalesOrderHeaderSeed] (
		[DueDate]             [datetime2](7) NOT NULL,
		[CustomerID]          [int] NOT NULL,
		[SalesPersonID]       [int] NOT NULL,
		[BillToAddressID]     [int] NOT NULL,
		[ShipToAddressID]     [int] NOT NULL,
		[ShipMethodID]        [int] NOT NULL,
		[LocalID]             [int] IDENTITY(1, 1) NOT NULL,
		CONSTRAINT [PK__DemoSale__499359DA31897820]
		PRIMARY KEY
		NONCLUSTERED
		([LocalID])
)
WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_AND_DATA)
GO
