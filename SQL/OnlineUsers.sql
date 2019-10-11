USE [wallboardosrdenmark_dk_db]
GO

/****** Object:  Table [dbo].[OnlineUsers]    Script Date: 22-05-2015 16:08:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OnlineUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserRefID] [uniqueidentifier] NOT NULL,
	[Online] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


