USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  StoredProcedure [dbo].[GetUserTargetsTable]    Script Date: 22-05-2015 16:11:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jack Lebek
-- Create date: 14-05-2015
-- Description:	Gets users targets table
-- =============================================
CREATE PROCEDURE [dbo].[GetUserTargetsTable] 
	-- Add the parameters for the stored procedure here
	@UserID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		P.ID AS [ProductID],
		P.Name,
		P.IsFocus,
		ISNULL(UT.[Current], 0 ) AS [Current],
		dbo.GetUserTarget(@UserID, P.ID) AS [Target],
		dbo.GetCompletionLevel(UT.[Current], dbo.GetUserTarget(@UserID, P.ID)) AS [LevelComplete]
	FROM
		Products P
	LEFT OUTER JOIN
		UserTargets UT ON P.ID = UT.ProductRefID AND UT.UserRefID = @UserID
	WHERE
		UT.UserRefID = @UserID OR UT.UserRefID IS NULL
END


GO


