SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[Employee_Temporal] (
		[BusinessEntityID]      [int] NOT NULL,
		[NationalIDNumber]      [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[LoginID]               [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[OrganizationNode]      [hierarchyid] NULL,
		[OrganizationLevel]     AS ([OrganizationNode].[GetLevel]()),
		[JobTitle]              [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[BirthDate]             [date] NOT NULL,
		[MaritalStatus]         [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[Gender]                [nchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[HireDate]              [date] NOT NULL,
		[VacationHours]         [smallint] NOT NULL,
		[SickLeaveHours]        [smallint] NOT NULL,
		[ValidFrom]             [datetime2](7) NOT NULL,
		[ValidTo]               [datetime2](7) NOT NULL,
		CONSTRAINT [PK_Employee_History_BusinessEntityID]
		PRIMARY KEY
		CLUSTERED
		([BusinessEntityID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [HumanResources].[Employee_Temporal] SET (LOCK_ESCALATION = TABLE)
GO
