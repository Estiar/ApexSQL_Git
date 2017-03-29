SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SalesOrderDetail_inmem] (
		[SalesOrderID]              [int] NOT NULL,
		[SalesOrderDetailID]        [bigint] IDENTITY(1, 1) NOT NULL,
		[CarrierTrackingNumber]     [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[OrderQty]                  [smallint] NOT NULL,
		[ProductID]                 [int] NOT NULL,
		[SpecialOfferID]            [int] NOT NULL,
		[UnitPrice]                 [money] NOT NULL,
		[UnitPriceDiscount]         [money] NOT NULL,
		[ModifiedDate]              [datetime2](7) NOT NULL,
		CONSTRAINT [imPK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID]
		PRIMARY KEY
		NONCLUSTERED HASH
		([SalesOrderID], [SalesOrderDetailID])
		WITH (BUCKET_COUNT=67108864),
INDEX [IX_ProductID] NONCLUSTERED HASH  ([ProductID])
	WITH ( BUCKET_COUNT=1048576),
INDEX [IX_SalesOrderID] NONCLUSTERED HASH  ([SalesOrderID])
	WITH ( BUCKET_COUNT=16777216)
)
WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_AND_DATA)
GO
ALTER TABLE [Sales].[SalesOrderDetail_inmem]
	ADD
	CONSTRAINT [IMCK_SalesOrderDetail_OrderQty]
	CHECK
	([OrderQty]>(0))
GO
ALTER TABLE [Sales].[SalesOrderDetail_inmem]
CHECK CONSTRAINT [IMCK_SalesOrderDetail_OrderQty]
GO
ALTER TABLE [Sales].[SalesOrderDetail_inmem]
	ADD
	CONSTRAINT [IMCK_SalesOrderDetail_UnitPrice]
	CHECK
	([UnitPrice]>=(0.00))
GO
ALTER TABLE [Sales].[SalesOrderDetail_inmem]
CHECK CONSTRAINT [IMCK_SalesOrderDetail_UnitPrice]
GO
ALTER TABLE [Sales].[SalesOrderDetail_inmem]
	ADD
	CONSTRAINT [IMCK_SalesOrderDetail_UnitPriceDiscount]
	CHECK
	([UnitPriceDiscount]>=(0.00))
GO
ALTER TABLE [Sales].[SalesOrderDetail_inmem]
CHECK CONSTRAINT [IMCK_SalesOrderDetail_UnitPriceDiscount]
GO
ALTER TABLE [Sales].[SalesOrderDetail_inmem]
	ADD
	CONSTRAINT [IMDF_SalesOrderDetail_UnitPriceDiscount]
	DEFAULT ((0.0)) FOR [UnitPriceDiscount]
GO
ALTER TABLE [Sales].[SalesOrderDetail_inmem]
	WITH CHECK
	ADD CONSTRAINT [IMFK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]
	FOREIGN KEY ([SalesOrderID]) REFERENCES [Sales].[SalesOrderHeader_inmem] ([SalesOrderID])
ALTER TABLE [Sales].[SalesOrderDetail_inmem]
	CHECK CONSTRAINT [IMFK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]

GO
ALTER TABLE [Sales].[SalesOrderDetail_inmem]
	WITH CHECK
	ADD CONSTRAINT [IMFK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]
	FOREIGN KEY ([SpecialOfferID], [ProductID]) REFERENCES [Sales].[SpecialOfferProduct_inmem] ([SpecialOfferID], [ProductID])
ALTER TABLE [Sales].[SalesOrderDetail_inmem]
	CHECK CONSTRAINT [IMFK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]

GO
