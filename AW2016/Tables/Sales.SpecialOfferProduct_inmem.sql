SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[SpecialOfferProduct_inmem] (
		[SpecialOfferID]     [int] NOT NULL,
		[ProductID]          [int] NOT NULL,
		[ModifiedDate]       [datetime2](7) NOT NULL,
		CONSTRAINT [IMPK_SpecialOfferProduct_SpecialOfferID_ProductID]
		PRIMARY KEY
		NONCLUSTERED
		([SpecialOfferID], [ProductID])
)
WITH (MEMORY_OPTIMIZED=ON, DURABILITY=SCHEMA_AND_DATA)
GO
ALTER TABLE [Sales].[SpecialOfferProduct_inmem]
	ADD
	CONSTRAINT [IMDF_SpecialOfferProduct_ModifiedDate]
	DEFAULT (sysdatetime()) FOR [ModifiedDate]
GO
ALTER TABLE [Sales].[SpecialOfferProduct_inmem]
	WITH CHECK
	ADD CONSTRAINT [IMFK_SpecialOfferProduct_Product_ProductID]
	FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product_inmem] ([ProductID])
ALTER TABLE [Sales].[SpecialOfferProduct_inmem]
	CHECK CONSTRAINT [IMFK_SpecialOfferProduct_Product_ProductID]

GO
ALTER TABLE [Sales].[SpecialOfferProduct_inmem]
	WITH CHECK
	ADD CONSTRAINT [IMFK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]
	FOREIGN KEY ([SpecialOfferID]) REFERENCES [Sales].[SpecialOffer_inmem] ([SpecialOfferID])
ALTER TABLE [Sales].[SpecialOfferProduct_inmem]
	CHECK CONSTRAINT [IMFK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]

GO
CREATE NONCLUSTERED INDEX [ix_ProductID]
	ON [Sales].[SpecialOfferProduct_inmem] ([ProductID])
	WITH ( STATISTICS_NORECOMPUTE = ON, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)
GO
