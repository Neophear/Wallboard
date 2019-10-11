USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  StoredProcedure [dbo].[SetProductTargets]    Script Date: 22-05-2015 16:11:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Jack Lebek
-- Create date: 25-04-2015
-- Description:	Divides targets out on online users
-- =============================================
CREATE PROCEDURE [dbo].[SetProductTargets] 
	-- Add the parameters for the stored procedure here
	@ProductID int,
	@Count int,
	@Focus bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Products] SET [TargetCount] = @Count, [IsFocus] = @Focus WHERE [ID] = @ProductID
END

GO


