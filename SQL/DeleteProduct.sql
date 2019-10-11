USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 22-05-2015 16:10:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jack Lebek
-- Create date: 19-05-2015
-- Description:	Deletes a product
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProduct] 
	-- Add the parameters for the stored procedure here
	@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [UserTargets] WHERE [ProductRefID] = @ID
	DELETE FROM [Products] WHERE [ID] = @ID
END

GO


