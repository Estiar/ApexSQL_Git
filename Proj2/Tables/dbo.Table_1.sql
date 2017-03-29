SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_1] (
		[sad]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[asd]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ddf]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[4]       [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[5]       [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_Table_1]
		PRIMARY KEY
		CLUSTERED
		([sad])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Table_1] SET (LOCK_ESCALATION = TABLE)
GO
