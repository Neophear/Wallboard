USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  StoredProcedure [dbo].[SetUserTargets]    Script Date: 22-05-2015 16:11:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jack Lebek
-- Create date: 07-05-2015
-- Description:	Sets a users targets
-- =============================================
CREATE PROCEDURE [dbo].[SetUserTargets] 
	-- Add the parameters for the stored procedure here
	@UserID uniqueidentifier, 
	@ProductID int = 0,
	@Extra int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT TOP 1 [ID] FROM [UserTargets] WHERE [ProductRefID] = @ProductID AND [UserRefID] = @UserID)
	BEGIN
		UPDATE [UserTargets] SET [Extra] = @Extra WHERE [ProductRefID] = @ProductID AND [UserRefID] = @UserID
	END
	ELSE
	BEGIN
		INSERT INTO [UserTargets] ([ProductRefID], [UserRefID], [Extra]) VALUES(@ProductID, @UserID, @Extra)
	END
END


GO


