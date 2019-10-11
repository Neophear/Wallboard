USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  StoredProcedure [dbo].[GetUserTargets]    Script Date: 22-05-2015 16:10:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jack Lebek
-- Create date: 07-05-2015
-- Description:	Gets targets for user
-- =============================================
CREATE PROCEDURE [dbo].[GetUserTargets] 
	-- Add the parameters for the stored procedure here
	@UserID uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Products P LEFT JOIN (SELECT * FROM [UserTargets] WHERE [UserRefID] = @UserID) U ON U.ProductRefID = P.ID
END


GO


