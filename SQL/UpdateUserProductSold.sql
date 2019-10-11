USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  StoredProcedure [dbo].[UpdateUserProductSold]    Script Date: 22-05-2015 16:11:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jack Lebek
-- Create date: 14-05-2015
-- Description:	Updates users products sold
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUserProductSold] 
	-- Add the parameters for the stored procedure here
	@UserID UNIQUEIDENTIFIER, 
	@ProductID int = 0,
	@Count int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Current INT

    -- Insert statements for procedure here
	SELECT @Current = [Current] FROM [UserTargets] WHERE [UserRefID] = @UserID AND [ProductRefID] = @ProductID

	IF @Current IS NOT NULL
	BEGIN
		DECLARE @NewCount INT = (@Current + @Count)

		IF @NewCount >= 0
			UPDATE [UserTargets] SET [Current] = [Current] + @Count WHERE [UserRefID] = @UserID AND [ProductRefID] = @ProductID
	END
	ELSE
	BEGIN
		IF @Count > 0
			INSERT INTO [UserTargets] ([ProductRefID], [Current], [UserRefID]) VALUES(@ProductID, @Count, @UserID)
	END
END


GO


