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
	[Password] [nvarchar](255) NULL,
	[Email] [nvarchar](40) NOT NULL UNIQUE,
	[IsGoogle] [bit] NOT NULL DEFAULT 0,
	CONSTRAINT chk_google CHECK ([Password] is not null OR [IsGoogle] = 1)
)
GO 