CREATE TABLE [Production].[ProductDescription] (
		[ProductDescriptionID]     [int] IDENTITY(1, 1) NOT NULL,
		[Description]              [nvarchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[rowguid]                  [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]             [datetime] NOT NULL,
		[asd]                      [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_ProductDescription_ProductDescriptionID]
		PRIMARY KEY
		CLUSTERED
		([ProductDescriptionID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'CONSTRAINT', N'PK_ProductDescription_ProductDescriptionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'INDEX', N'PK_ProductDescription_ProductDescriptionID'
GO
ALTER TABLE [Production].[ProductDescription]
	ADD
	CONSTRAINT [DF_ProductDescription_ModifiedDate]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'CONSTRAINT', N'DF_ProductDescription_ModifiedDate'
GO
ALTER TABLE [Production].[ProductDescription]
	ADD
	CONSTRAINT [DF_ProductDescription_rowguid]
	DEFAULT (newid()) FOR [rowguid]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'CONSTRAINT', N'DF_ProductDescription_rowguid'
GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductDescription_rowguid]
	ON [Production].[ProductDescription] ([rowguid])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'INDEX', N'AK_ProductDescription_rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Description of the product.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'COLUMN', N'Description'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'COLUMN', N'ModifiedDate'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Primary key for ProductDescription records.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'COLUMN', N'ProductDescriptionID'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', 'COLUMN', N'rowguid'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product descriptions in several languages.', 'SCHEMA', N'Production', 'TABLE', N'ProductDescription', NULL, NULL
GO
