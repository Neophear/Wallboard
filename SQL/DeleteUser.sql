USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 22-05-2015 16:10:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jack Lebek
-- Create date: 17-05-2015
-- Description:	Deletes a user
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser] 
	-- Add the parameters for the stored procedure here
	@UserID UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [OnlineUsers] WHERE [UserRefID] = @UserID;
	DELETE FROM [UserTargets] WHERE [UserRefID] = @UserID;
END


GO


