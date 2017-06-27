SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SpecialOffer_ondisk] (
		[SpecialOfferID]     [int] IDENTITY(1, 1) NOT NULL,
		[Description]        [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[DiscountPct]        [smallmoney] NOT NULL,
		[Type]               [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Category]           [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[StartDate]          [datetime2](7) NOT NULL,
		[EndDate]            [datetime2](7) NOT NULL,
		[MinQty]             [int] NOT NULL,
		[MaxQty]             [int] NULL,
		[ModifiedDate]       [datetime2](7) NOT NULL,
		CONSTRAINT [ODPK_SpecialOffer_SpecialOfferID]
		PRIMARY KEY
		CLUSTERED
		([SpecialOfferID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]
	ADD
	CONSTRAINT [ODCK_SpecialOffer_DiscountPct]
	CHECK
	([DiscountPct]>=(0.00))
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]
CHECK CONSTRAINT [ODCK_SpecialOffer_DiscountPct]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]
	ADD
	CONSTRAINT [ODCK_SpecialOffer_EndDate]
	CHECK
	([EndDate]>=[StartDate])
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]
CHECK CONSTRAINT [ODCK_SpecialOffer_EndDate]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]
	ADD
	CONSTRAINT [ODCK_SpecialOffer_MaxQty]
	CHECK
	([MaxQty]>=(0))
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]
CHECK CONSTRAINT [ODCK_SpecialOffer_MaxQty]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]
	ADD
	CONSTRAINT [ODCK_SpecialOffer_MinQty]
	CHECK
	([MinQty]>=(0))
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]
CHECK CONSTRAINT [ODCK_SpecialOffer_MinQty]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]
	ADD
	CONSTRAINT [ODDF_SpecialOffer_DiscountPct]
	DEFAULT ((0.00)) FOR [DiscountPct]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]
	ADD
	CONSTRAINT [ODDF_SpecialOffer_MinQty]
	DEFAULT ((0)) FOR [MinQty]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk]
	ADD
	CONSTRAINT [ODDF_SpecialOffer_ModifiedDate]
	DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SpecialOffer_ondisk] SET (LOCK_ESCALATION = TABLE)
GO
