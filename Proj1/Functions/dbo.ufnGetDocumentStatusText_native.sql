SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.ufnGetDocumentStatusText_native (@Status tinyint)
RETURNS nvarchar(15) 
WITH NATIVE_COMPILATION, SCHEMABINDING
AS
BEGIN ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = N'English')

    IF @Status=1 RETURN 'Pending approval'
    IF @Status=2 RETURN 'Approved'
    IF @Status=3 RETURN 'Obsolete'
    
    RETURN '** Invalid **'

END
GO
