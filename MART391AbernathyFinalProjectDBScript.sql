USE [master]
GO
/****** Object:  Database [MART391_Game]    Script Date: 12/12/2019 11:38:53 AM ******/
CREATE DATABASE [MART391_Game]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MART391_Game', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MART391_Game.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MART391_Game_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MART391_Game_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MART391_Game] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MART391_Game].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MART391_Game] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MART391_Game] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MART391_Game] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MART391_Game] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MART391_Game] SET ARITHABORT OFF 
GO
ALTER DATABASE [MART391_Game] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MART391_Game] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MART391_Game] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MART391_Game] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MART391_Game] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MART391_Game] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MART391_Game] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MART391_Game] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MART391_Game] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MART391_Game] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MART391_Game] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MART391_Game] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MART391_Game] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MART391_Game] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MART391_Game] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MART391_Game] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MART391_Game] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MART391_Game] SET RECOVERY FULL 
GO
ALTER DATABASE [MART391_Game] SET  MULTI_USER 
GO
ALTER DATABASE [MART391_Game] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MART391_Game] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MART391_Game] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MART391_Game] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MART391_Game] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MART391_Game', N'ON'
GO
ALTER DATABASE [MART391_Game] SET QUERY_STORE = OFF
GO
USE [MART391_Game]
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characters](
	[characterID] [int] IDENTITY(1,1) NOT NULL,
	[characterName] [varchar](25) NOT NULL,
	[realm] [varchar](100) NOT NULL,
	[race] [varchar](100) NOT NULL,
	[class] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Characters] PRIMARY KEY CLUSTERED 
(
	[characterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerCharacters]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerCharacters](
	[playerID] [int] NOT NULL,
	[characterID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerPurchases]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerPurchases](
	[playerID] [int] NOT NULL,
	[productID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[playerID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](1000) NULL,
	[lastName] [varchar](1000) NULL,
	[email] [varchar](900) NOT NULL,
	[profileName] [varchar](1000) NOT NULL,
	[userName] [varchar](1000) NOT NULL,
	[password] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professions]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professions](
	[professionID] [int] IDENTITY(1,1) NOT NULL,
	[professionName] [varchar](1000) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebProducts]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebProducts](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](1000) NOT NULL,
	[cost] [money] NOT NULL,
 CONSTRAINT [PK_Web Products] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spAddNewCharacter]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddNewCharacter] 
	@characterName varchar(25),
	@realm varchar(100),
	@race varchar(100),
	@class varchar(25)
AS
BEGIN
    INSERT INTO Characters(characterName, realm, race, class)
	VALUES(@characterName, @realm, @race, @class)
END
GO
/****** Object:  StoredProcedure [dbo].[spAddNewPlayer]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spAddNewPlayer] 
	@firstName varchar(1000),
	@lastName varchar(1000),
	@email varchar(900),
	@profileName varchar(1000),
	@userName varchar(1000),
	@password varchar(1000)
AS
BEGIN

	INSERT INTO Players(firstName, lastName, email, profileName, userName, password)
	VALUES(@firstName, @lastName, @email, @profileName, @userName, @password)

END
GO
/****** Object:  StoredProcedure [dbo].[spDeletePlayer]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDeletePlayer] 
	@playerID int
AS
BEGIN
	DELETE FROM Players
	WHERE playerID = @playerID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCharactersByClass]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllCharactersByClass]
	
AS
BEGIN
	SELECT * FROM Characters
	ORDER BY Class ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCharactersByName]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllCharactersByName] 
	
AS
BEGIN
	SELECT * FROM Characters
	ORDER BY characterName ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCharactersByRace]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllCharactersByRace]
AS
BEGIN
	SELECT * FROM Characters
	ORDER BY race ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spGetAllPlayers]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllPlayers]

AS
BEGIN
	SELECT * FROM Players
END
GO
/****** Object:  StoredProcedure [dbo].[spGetSpecificPlayer]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetSpecificPlayer]
	@playerID as int
AS
BEGIN
	SELECT * FROM Players WHERE playerID = @playerID
END
GO
/****** Object:  StoredProcedure [dbo].[spLoginVarification]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spLoginVarification]
	@userName varchar(1000),
	@password varchar(1000)
AS
BEGIN
	SELECT email FROM Players WHERE email = @userName AND password= CONVERT(varbinary(256), @password)
	RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[spNumberOfCharacters]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spNumberOfCharacters]

AS
BEGIN
	SELECT COUNT(*)
	FROM Characters
END
GO
/****** Object:  StoredProcedure [dbo].[spNumberOfRace]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spNumberOfRace]
	@race varchar(100)
AS
BEGIN
	SELECT COUNT(*)
	FROM Characters WHERE race = @race;
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePlayerInfo]    Script Date: 12/12/2019 11:38:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUpdatePlayerInfo]
	@playerID int,
	@firstName varchar(1000),
	@lastName varchar(1000),
	@email varchar(900),
	@address varchar(1000),
	@phoneNumber varchar(1000),
	@profileName varchar(1000),
	@userName varchar(1000),
	@password varbinary(MAX)
AS
BEGIN
	UPDATE Players SET firstName = @firstName, lastName = @lastName, 
					   email = @email, address = @address, phoneNumber = @phoneNumber,
					   profileName = @profileName, userName = @userName, password = @password

	WHERE playerID = @playerID
END
GO
USE [master]
GO
ALTER DATABASE [MART391_Game] SET  READ_WRITE 
GO
