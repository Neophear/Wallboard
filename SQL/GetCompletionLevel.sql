USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  UserDefinedFunction [dbo].[GetCompletionLevel]    Script Date: 22-05-2015 16:12:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jack Lebek
-- Create date: 14-05-2015
-- Description:	Gets level of completion
-- =============================================
CREATE FUNCTION [dbo].[GetCompletionLevel] 
(
	-- Add the parameters for the function here
	@Current INT,
	@Target INT
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result INT

	-- Add the T-SQL statements to compute the return value here

	IF ISNULL(@Current, 0) = 0 OR ISNULL(@Target, 0) = 0
		SET @Result = 1
	ELSE
	BEGIN
		SET @Result = (FLOOR(CAST(@Current AS DECIMAL) / @Target * 2) + 1)
	
		IF @Result > 3
			SET @Result = 3
	END

	-- Return the result of the function
	RETURN @Result

END


GO


