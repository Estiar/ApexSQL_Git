SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Employee_Temporal_History] (
		[BusinessEntityID]      [int] NOT NULL,
		[NationalIDNumber]      [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[LoginID]               [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[OrganizationNode]      [hierarchyid] NULL,
		[OrganizationLevel]     [smallint] NULL,
		[JobTitle]              [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[BirthDate]             [date] NOT NULL,
		[MaritalStatus]         [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Gender]                [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[HireDate]              [date] NOT NULL,
		[VacationHours]         [smallint] NOT NULL,
		[SickLeaveHours]        [smallint] NOT NULL,
		[ValidFrom]             [datetime2](7) NOT NULL,
		[ValidTo]               [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [ix_Employee_Temporal_History]
	ON [HumanResources].[Employee_Temporal_History] ([BusinessEntityID], [ValidFrom], [ValidTo])
	WITH ( 	DATA_COMPRESSION = PAGE)
	ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[Employee_Temporal_History] SET (LOCK_ESCALATION = TABLE)
GO
