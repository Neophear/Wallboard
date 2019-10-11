USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  Table [dbo].[UserTargets]    Script Date: 22-05-2015 16:09:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserTargets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductRefID] [int] NOT NULL,
	[Current] [int] NULL,
	[Extra] [int] NULL,
	[UserRefID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[UserTargets] ADD  DEFAULT ((0)) FOR [Current]
GO

ALTER TABLE [dbo].[UserTargets] ADD  DEFAULT ((0)) FOR [Extra]
GO


