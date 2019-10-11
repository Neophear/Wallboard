USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  UserDefinedFunction [dbo].[GetUserFraction]    Script Date: 22-05-2015 16:12:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jack Lebek
-- Create date: 17-05-2015
-- Description:	Gets users targetfraction
-- =============================================
CREATE FUNCTION [dbo].[GetUserFraction] 
(
	-- Add the parameters for the function here
	@UserID UNIQUEIDENTIFIER,
	@ProductID int
)
RETURNS VARCHAR(MAX)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result VARCHAR(MAX)
	DECLARE @Current INT
	DECLARE @Target INT

	-- Add the T-SQL statements to compute the return value here
	SELECT @Current = [Current] FROM [UserTargets] WHERE [UserRefID] = @UserID AND [ProductRefID] = @ProductID
	SET @Target = dbo.GetUserTarget(@UserID, @ProductID)

	SET @Result = CONVERT(VARCHAR, ISNULL(@Current, 0)) + '/' + CONVERT(VARCHAR, @Target)

	-- Return the result of the function
	RETURN @Result

END


GO


