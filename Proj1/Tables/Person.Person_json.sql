SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[Person_json] (
		[PersonID]                  [int] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		[PersonType]                [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[NameStyle]                 [dbo].[NameStyle] NOT NULL,
		[Title]                     [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[FirstName]                 [dbo].[Name] NOT NULL,
		[MiddleName]                [dbo].[Name] NULL,
		[LastName]                  [dbo].[Name] NOT NULL,
		[Suffix]                    [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[EmailPromotion]            [int] NOT NULL,
		[AdditionalContactInfo]     [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Demographics]              [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[rowguid]                   [uniqueidentifier] NOT NULL ROWGUIDCOL,
		[ModifiedDate]              [datetime] NOT NULL,
		CONSTRAINT [PK_Person_json_PersonID]
		PRIMARY KEY
		CLUSTERED
		([PersonID])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Person].[Person_json]
	ADD
	CONSTRAINT [AdditionalContactInfo must be formatted as JSON]
	CHECK
	(isjson([AdditionalContactInfo])>(0))
GO
ALTER TABLE [Person].[Person_json]
CHECK CONSTRAINT [AdditionalContactInfo must be formatted as JSON]
GO
ALTER TABLE [Person].[Person_json]
	ADD
	CONSTRAINT [Demographics must be formatted as JSON]
	CHECK
	(isjson([Demographics])>(0))
GO
ALTER TABLE [Person].[Person_json]
CHECK CONSTRAINT [Demographics must be formatted as JSON]
GO
ALTER TABLE [Person].[Person_json]
	ADD
	CONSTRAINT [DF__Person_js__Email__5E54FF49]
	DEFAULT ((0)) FOR [EmailPromotion]
GO
ALTER TABLE [Person].[Person_json]
	ADD
	CONSTRAINT [DF__Person_js__Modif__6225902D]
	DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [Person].[Person_json]
	ADD
	CONSTRAINT [DF__Person_js__NameS__5D60DB10]
	DEFAULT ((0)) FOR [NameStyle]
GO
ALTER TABLE [Person].[Person_json]
	ADD
	CONSTRAINT [DF__Person_js__rowgu__61316BF4]
	DEFAULT (newid()) FOR [rowguid]
GO
ALTER TABLE [Person].[Person_json] SET (LOCK_ESCALATION = TABLE)
GO
