USE [Biometrix]
GO

/****** Object:  Table [dbo].[LoginTable]    Script Date: 1/22/2016 8:55:30 PM ******/
DROP TABLE [dbo].[LoginTable]
GO

/****** Object:  Table [dbo].[LoginTable]    Script Date: 1/22/2016 8:55:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LoginTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Username] [nvarchar](40) NOT NULL UNIQUE,
	[Password] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](40) NOT NULL UNIQUE,
)
GO


