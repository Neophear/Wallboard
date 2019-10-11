USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  StoredProcedure [dbo].[UpdateOnline]    Script Date: 22-05-2015 16:11:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jack
-- Create date: 26-04-2015
-- Description:	Updates online status for user
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOnline] 
	-- Add the parameters for the stored procedure here
	@UserID uniqueidentifier,
	@online bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT TOP 1 * FROM [OnlineUsers] WHERE [UserRefID] = @UserID)
		UPDATE [OnlineUsers] SET [Online] = @online WHERE [UserRefID] = @UserID
	ELSE
		INSERT INTO [OnlineUsers] ([UserRefID], [Online]) VALUES(@UserID, @online)
END


GO


