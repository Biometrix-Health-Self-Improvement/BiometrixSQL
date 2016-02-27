USE [Biometrix]
GO

if Object_ID(N'[dbo].[LoginTable]', N'U') is NOT NULL
BEGIN
/****** Object:  Table [dbo].[LoginTable]    Script Date: 1/22/2016 8:55:30 PM ******/
DROP TABLE [dbo].[LoginTable]
END
GO

/****** Object:  Table [dbo].[LoginTable]    Script Date: 1/22/2016 8:55:30 PM ******/
SET ANSI_NULLS ON
GO

SET ANSI_WARNINGS ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[LoginTable](
	[UserID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY
	, [Username] NVARCHAR(40) NOT NULL UNIQUE
	, [Password] NVARCHAR(255) NULL
	, [Email] NVARCHAR(40) NULL
	, [IsGoogle] BIT NOT NULL DEFAULT 0
	, [Verified] BIT NOT NULL DEFAULT 0
	/*An email and password are not required for google accounts. Password should NOT be filled in for a google account*/
	, CONSTRAINT chk_google CHECK (([Password] is not null AND [Email] is not null) OR ([IsGoogle] = 1 AND [Password] is null))
	
	/*Credit to http://stackoverflow.com/questions/1796414/sql-server-unique-constraint-with-duplicate-nulls */
	/*Email needs to be allowed to be null in case google users have not verified their email on google. So multiple nulls are allowed for that column
	This computed column and constraint allow that*/
	,[Nullbuster] as (case when [Email] is NULL then [UserID] else 0 end)

	, CONSTRAINT allow_email_nulls UNIQUE ([Email], [Nullbuster])
)
GO 