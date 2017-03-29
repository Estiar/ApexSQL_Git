CREATE TYPE [Sales].[SalesOrderDetailType_inmem]
AS TABLE (
		[OrderQty]           [smallint] NOT NULL,
		[ProductID]          [int] NOT NULL,
		[SpecialOfferID]     [int] NOT NULL
)
WITH (MEMORY_OPTIMIZED = ON)
GO
