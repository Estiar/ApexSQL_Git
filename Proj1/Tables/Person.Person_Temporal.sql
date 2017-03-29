SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[Person_Temporal] (
		[BusinessEntityID]     [int] NOT NULL,
		[PersonType]           [nchar](2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[NameStyle]            [dbo].[NameStyle] NOT NULL,
		[Title]                [nvarchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[FirstName]            [dbo].[Name] NOT NULL,
		[MiddleName]           [dbo].[Name] NULL,
		[LastName]             [dbo].[Name] NOT NULL,
		[Suffix]               [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[EmailPromotion]       [int] NOT NULL,
		[ValidFrom]            [datetime2](7) NOT NULL,
		[ValidTo]              [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Person_Temporal_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Person].[Person_Temporal] SET (LOCK_ESCALATION = TABLE)
GO
