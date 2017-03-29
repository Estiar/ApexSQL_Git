SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SalesOrderHeader_inmem] (
		[SalesOrderID]               [int] IDENTITY(1, 1) NOT NULL,
		[RevisionNumber]             [tinyint] NOT NULL,
		[OrderDate]                  [datetime2](7) NOT NULL,
		[DueDate]                    [datetime2](7) NOT NULL,
		[ShipDate]                   [datetime2](7) NULL,
		[Status]                     [tinyint] NOT NULL,
		[OnlineOrderFlag]            [bit] NOT NULL,
		[PurchaseOrderNumber]        [nvarchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[AccountNumber]              [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CustomerID]                 [int] NOT NULL,
		[SalesPersonID]              [int] NOT NULL,
		[TerritoryID]                [int] NULL,
		[BillToAddressID]            [int] NOT NULL,
		[ShipToAddressID]            [int] NOT NULL,
		[ShipMethodID]               [int] NOT NULL,
		[CreditCardID]               [int] NULL,
		[CreditCardApprovalCode]     [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[CurrencyRateID]             [int] NULL,
		[SubTotal]                   [money] NOT NULL,
		[TaxAmt]                     [money] NOT NULL,
		[Freight]                    [money] NOT NULL,
		[Comment]                    [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ModifiedDate]               [datetime2](7) NOT NULL,
		CONSTRAINT [PK__SalesOrd__B14003C3270C320B]
		PRIMARY KEY
		NONCLUSTERED HASH
		([SalesOrderID])
		WITH (BUCKET_COUNT=16777216),
INDEX [IX_CustomerID] NONCLUSTERED HASH  ([CustomerID])
	WITH ( BUCKET_COUNT=1048576),
INDEX [IX_SalesPersonID] NONCLUSTERED HASH  ([SalesPersonID])
	WITH ( BUCKET_COUNT=1048576)
)
WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_AND_DATA)
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMCK_SalesOrderHeader_DueDate]
	CHECK
	([DueDate]>=[OrderDate])
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
CHECK CONSTRAINT [IMCK_SalesOrderHeader_DueDate]
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMCK_SalesOrderHeader_Freight]
	CHECK
	([Freight]>=(0.00))
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
CHECK CONSTRAINT [IMCK_SalesOrderHeader_Freight]
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMCK_SalesOrderHeader_ShipDate]
	CHECK
	([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL)
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
CHECK CONSTRAINT [IMCK_SalesOrderHeader_ShipDate]
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMCK_SalesOrderHeader_Status]
	CHECK
	([Status]>=(0) AND [Status]<=(8))
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
CHECK CONSTRAINT [IMCK_SalesOrderHeader_Status]
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMCK_SalesOrderHeader_SubTotal]
	CHECK
	([SubTotal]>=(0.00))
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
CHECK CONSTRAINT [IMCK_SalesOrderHeader_SubTotal]
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMCK_SalesOrderHeader_TaxAmt]
	CHECK
	([TaxAmt]>=(0.00))
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
CHECK CONSTRAINT [IMCK_SalesOrderHeader_TaxAmt]
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMDF_SalesOrderHeader_Freight]
	DEFAULT ((0.00)) FOR [Freight]
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMDF_SalesOrderHeader_OnlineOrderFlag]
	DEFAULT ((1)) FOR [OnlineOrderFlag]
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMDF_SalesOrderHeader_RevisionNumber]
	DEFAULT ((0)) FOR [RevisionNumber]
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMDF_SalesOrderHeader_SalesPersonID]
	DEFAULT ((-1)) FOR [SalesPersonID]
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMDF_SalesOrderHeader_Status]
	DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMDF_SalesOrderHeader_SubTotal]
	DEFAULT ((0.00)) FOR [SubTotal]
GO
ALTER TABLE [Sales].[SalesOrderHeader_inmem]
	ADD
	CONSTRAINT [IMDF_SalesOrderHeader_TaxAmt]
	DEFAULT ((0.00)) FOR [TaxAmt]
GO
