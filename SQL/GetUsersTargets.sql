USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  StoredProcedure [dbo].[GetUsersTargets]    Script Date: 22-05-2015 16:10:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jack Lebek
-- Create date: 13-05-2015
-- Description:	Gets users targets
-- =============================================
CREATE PROCEDURE [dbo].[GetUsersTargets] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF 1=0 BEGIN
		SET FMTONLY OFF
	END

    -- Insert statements for procedure here
	DECLARE @cols AS NVARCHAR(MAX),
		@query  AS NVARCHAR(MAX),
		@firstPart AS NVARCHAR(MAX)


	SELECT @firstPart = STUFF((SELECT ', dbo.GetUserFraction(O.UserRefID, ' + CONVERT(VARCHAR,ID) + ') AS ' + QUOTENAME(Name) 
						from Products
						group by Name, id, TargetCount
						order by id
				FOR XML PATH(''), TYPE
				).value('.', 'NVARCHAR(MAX)') 
			,1,1,'')

	select @cols = STUFF((SELECT ',' + QUOTENAME(Name)
						from Products
						group by Name, id
						order by id
				FOR XML PATH(''), TYPE
				).value('.', 'NVARCHAR(MAX)') 
			,1,1,'')

	set @query = N'
	SELECT O.UserRefID, 
		' + @firstPart + '

	 FROM OnlineUsers O LEFT OUTER JOIN (

	SELECT ' + @cols + N' from 
				 (
					select TargetCount, Name
					from Products
				) x
				pivot 
				(
					SUM(TargetCount)
					for Name in (' + @cols + N')
				) p ) T ON 1=1 WHERE [Online] = 1 '

	exec sp_executesql @query;
END


GO


