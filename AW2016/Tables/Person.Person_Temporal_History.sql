SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [Person].[Person_Temporal_History] (
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
		[ValidTo]              [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ix_Person_Temporal_History]
	ON [Person].[Person_Temporal_History] ([BusinessEntityID], [ValidFrom], [ValidTo])
	WITH ( 	DATA_COMPRESSION = PAGE)
	ON [PRIMARY]
GO
ALTER TABLE [Person].[Person_Temporal_History] SET (LOCK_ESCALATION = TABLE)
GO
