SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table_2] (
		[asd]      [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[vcb]      [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[vbc]      [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[jhhj]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ggfh]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[gfgf]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_Table_2]
		PRIMARY KEY
		CLUSTERED
		([asd])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Table_2] SET (LOCK_ESCALATION = TABLE)
GO
