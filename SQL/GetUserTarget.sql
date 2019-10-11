USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  UserDefinedFunction [dbo].[GetUserTarget]    Script Date: 22-05-2015 16:12:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jack Lebek
-- Create date: 13-05-2015
-- Description:	Gets specifik users target for product
-- =============================================
CREATE FUNCTION [dbo].[GetUserTarget] 
(
	-- Add the parameters for the function here
	@UserID UNIQUEIDENTIFIER,
	@ProductID INT
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @OnlineUserCount INT
	DECLARE @BaseCount INT = 0
	DECLARE @UserExtra INT = 0

	-- Add the T-SQL statements to compute the return value here
	SELECT @OnlineUserCount = COUNT(*) FROM OnlineUsers WHERE [Online] = 1
	SELECT @BaseCount = CEILING(CAST([TargetCount] AS decimal) / @OnlineUserCount) FROM Products WHERE ID = @ProductID
	SET @UserExtra = ISNULL((SELECT [Extra] FROM UserTargets WHERE UserRefID = @UserID AND [ProductRefID] = @ProductID), 0)

	-- Return the result of the function
	RETURN (@BaseCount + @UserExtra)
END


GO


