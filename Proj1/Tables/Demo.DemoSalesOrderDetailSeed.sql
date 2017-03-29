SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Demo].[DemoSalesOrderDetailSeed] (
		[OrderQty]           [smallint] NOT NULL,
		[ProductID]          [int] NOT NULL,
		[SpecialOfferID]     [int] NOT NULL,
		[OrderID]            [int] NOT NULL,
		[LocalID]            [int] IDENTITY(1, 1) NOT NULL,
		CONSTRAINT [PK__DemoSale__499359DA37DC4424]
		PRIMARY KEY
		NONCLUSTERED
		([LocalID]),
INDEX [IX_OrderID] NONCLUSTERED HASH  ([OrderID])
	WITH ( BUCKET_COUNT=1048576)
)
WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_AND_DATA)
GO
