SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [Sales].[SpecialOfferProduct_ondisk] (
		[SpecialOfferID]     [int] NOT NULL,
		[ProductID]          [int] NOT NULL,
		[ModifiedDate]       [datetime2](7) NOT NULL,
		CONSTRAINT [ODPK_SpecialOfferProduct_SpecialOfferID_ProductID]
		PRIMARY KEY
		NONCLUSTERED
		([SpecialOfferID], [ProductID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Sales].[SpecialOfferProduct_ondisk]
	ADD
	CONSTRAINT [ODDF_SpecialOfferProduct_ModifiedDate]
	DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SpecialOfferProduct_ondisk]
	WITH CHECK
	ADD CONSTRAINT [ODFK_SpecialOfferProduct_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product_ondisk] ([ProductID])
ALTER TABLE [Sales].[SpecialOfferProduct_ondisk]
	CHECK CONSTRAINT [ODFK_SpecialOfferProduct_Product_ProductID]

GO
ALTER TABLE [Sales].[SpecialOfferProduct_ondisk]
	WITH CHECK
	ADD CONSTRAINT [ODFK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]
	FOREIGN KEY ([SpecialOfferID]) REFERENCES [Sales].[SpecialOffer_ondisk] ([SpecialOfferID])
ALTER TABLE [Sales].[SpecialOfferProduct_ondisk]
	CHECK CONSTRAINT [ODFK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]

GO
CREATE NONCLUSTERED INDEX [ix_ProductID]
	ON [Sales].[SpecialOfferProduct_ondisk] ([ProductID])
	ON [PRIMARY]
GO
ALTER TABLE [Sales].[SpecialOfferProduct_ondisk] SET (LOCK_ESCALATION = TABLE)
GO
