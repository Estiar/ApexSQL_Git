SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SalesOrderHeader_ondisk] (
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
		CONSTRAINT [PK__SalesOrd__B14003C2B181FB70]
		PRIMARY KEY
		CLUSTERED
		([SalesOrderID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODCK_SalesOrderHeader_DueDate]
	CHECK
	([DueDate]>=[OrderDate])
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
CHECK CONSTRAINT [ODCK_SalesOrderHeader_DueDate]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODCK_SalesOrderHeader_Freight]
	CHECK
	([Freight]>=(0.00))
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
CHECK CONSTRAINT [ODCK_SalesOrderHeader_Freight]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODCK_SalesOrderHeader_ShipDate]
	CHECK
	([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL)
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
CHECK CONSTRAINT [ODCK_SalesOrderHeader_ShipDate]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODCK_SalesOrderHeader_Status]
	CHECK
	([Status]>=(0) AND [Status]<=(8))
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
CHECK CONSTRAINT [ODCK_SalesOrderHeader_Status]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODCK_SalesOrderHeader_SubTotal]
	CHECK
	([SubTotal]>=(0.00))
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
CHECK CONSTRAINT [ODCK_SalesOrderHeader_SubTotal]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODCK_SalesOrderHeader_TaxAmt]
	CHECK
	([TaxAmt]>=(0.00))
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
CHECK CONSTRAINT [ODCK_SalesOrderHeader_TaxAmt]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODDF_SalesOrderHeader_Freight]
	DEFAULT ((0.00)) FOR [Freight]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODDF_SalesOrderHeader_OnlineOrderFlag]
	DEFAULT ((1)) FOR [OnlineOrderFlag]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODDF_SalesOrderHeader_RevisionNumber]
	DEFAULT ((0)) FOR [RevisionNumber]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODDF_SalesOrderHeader_SalesPersonID]
	DEFAULT ((-1)) FOR [SalesPersonID]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODDF_SalesOrderHeader_Status]
	DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODDF_SalesOrderHeader_SubTotal]
	DEFAULT ((0.00)) FOR [SubTotal]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk]
	ADD
	CONSTRAINT [ODDF_SalesOrderHeader_TaxAmt]
	DEFAULT ((0.00)) FOR [TaxAmt]
GO
CREATE NONCLUSTERED INDEX [IX_CustomerID]
	ON [Sales].[SalesOrderHeader_ondisk] ([CustomerID])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_SalesPersonID]
	ON [Sales].[SalesOrderHeader_ondisk] ([SalesPersonID])
	ON [PRIMARY]
GO
ALTER TABLE [Sales].[SalesOrderHeader_ondisk] SET (LOCK_ESCALATION = TABLE)
GO
