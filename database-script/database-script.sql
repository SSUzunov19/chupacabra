USE [master]
GO
/****** Object:  Database [Chupacabra]    Script Date: 2021-06-24 11:57:12 PM ******/
CREATE DATABASE [Chupacabra]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chupacabra', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Chupacabra.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Chupacabra_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Chupacabra_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Chupacabra] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chupacabra].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chupacabra] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chupacabra] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chupacabra] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chupacabra] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chupacabra] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chupacabra] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Chupacabra] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chupacabra] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chupacabra] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chupacabra] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chupacabra] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chupacabra] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chupacabra] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chupacabra] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chupacabra] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Chupacabra] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chupacabra] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chupacabra] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chupacabra] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chupacabra] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chupacabra] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chupacabra] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chupacabra] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Chupacabra] SET  MULTI_USER 
GO
ALTER DATABASE [Chupacabra] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chupacabra] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chupacabra] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chupacabra] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Chupacabra] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Chupacabra] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Chupacabra] SET QUERY_STORE = OFF
GO
USE [Chupacabra]
GO
/****** Object:  Table [dbo].[Boats]    Script Date: 2021-06-24 11:57:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LicenseId] [nvarchar](16) NOT NULL,
	[Name] [nvarchar](32) NULL,
	[Engine] [nvarchar](32) NULL,
	[RegistrationNumber] [nvarchar](32) NOT NULL,
	[BoatLicense] [nvarchar](32) NOT NULL,
	[SeatsCount] [tinyint] NULL,
	[AnchorLength] [tinyint] NULL,
	[LifeJacketsCount] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fishes]    Script Date: 2021-06-24 11:57:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fishes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FishingEvents]    Script Date: 2021-06-24 11:57:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FishingEvents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BoatId] [int] NOT NULL,
	[Start] [datetime] NOT NULL,
	[End] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FishingEventsFishes]    Script Date: 2021-06-24 11:57:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FishingEventsFishes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FishingEventId] [int] NOT NULL,
	[FishId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2021-06-24 11:57:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBoats]    Script Date: 2021-06-24 11:57:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBoats](
	[UserId] [int] NOT NULL,
	[BoatId] [int] NOT NULL,
 CONSTRAINT [PK_User_Boats] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[BoatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2021-06-24 11:57:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](32) NOT NULL,
	[LastName] [nvarchar](32) NOT NULL,
	[Age] [tinyint] NOT NULL,
	[City] [nvarchar](32) NULL,
	[Phone] [varchar](13) NULL,
	[Username] [varchar](32) NOT NULL,
	[Email] [nvarchar](320) NOT NULL,
	[Token] [varchar](69) NULL,
	[TokenExpiresAt] [datetime] NULL,
	[PasswordHash] [varchar](128) NULL,
	[AccountCreatedAt] [datetime] NOT NULL,
	[IsVerified] [bit] NOT NULL,
 CONSTRAINT [PK__Users__3214EC0777E5016A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 2021-06-24 11:57:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [tinyint] NOT NULL,
 CONSTRAINT [PK_User_Roles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (1, N'User')
GO
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (2, N'Admin')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Age], [City], [Phone], [Username], [Email], [Token], [TokenExpiresAt], [PasswordHash], [AccountCreatedAt], [IsVerified]) VALUES (1, N'Fiki', N'Petrov', 12, N'Burgas', N'+359876603828', N'fiki12', N'dffi@abv.bg', N'87EF68A733DB26A5ADD50B4555B290', CAST(N'2021-06-24T21:49:13.647' AS DateTime), N'd261b625dcfe4ac061a7df0d89305130b74da410b57aeda747d961a8f70f4eaf', CAST(N'2021-06-23T21:49:13.647' AS DateTime), 0)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Age], [City], [Phone], [Username], [Email], [Token], [TokenExpiresAt], [PasswordHash], [AccountCreatedAt], [IsVerified]) VALUES (2, N'Fiki', N'Petrov', 12, N'Burgas', N'+359876613828', N'fiki122', N'dffdi@abv.bgf', N'EBEA5452BE5D97F5D238561B0E4DC3', CAST(N'2021-06-24T22:18:26.247' AS DateTime), N'd261b625dcfe4ac061a7df0d89305130b74da410b57aeda747d961a8f70f4eaf', CAST(N'2021-06-23T22:18:26.247' AS DateTime), 0)
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Age], [City], [Phone], [Username], [Email], [Token], [TokenExpiresAt], [PasswordHash], [AccountCreatedAt], [IsVerified]) VALUES (3, N'Fiki', N'Petrov', 12, N'Burgas', N'+359876613821', N'fiki1221', N'dffdi@abv.bgfd', N'63B5358049DA9AB22F0415AD63D0B0', CAST(N'2021-06-24T22:55:17.053' AS DateTime), N'd261b625dcfe4ac061a7df0d89305130b74da410b57aeda747d961a8f70f4eaf', CAST(N'2021-06-23T22:55:17.053' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UsersRoles] ([UserId], [RoleId]) VALUES (2, 1)
GO
INSERT [dbo].[UsersRoles] ([UserId], [RoleId]) VALUES (3, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Boats__72D60083FF06E2F8]    Script Date: 2021-06-24 11:57:12 PM ******/
ALTER TABLE [dbo].[Boats] ADD UNIQUE NONCLUSTERED 
(
	[LicenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Boats__AFC653FA09015F8E]    Script Date: 2021-06-24 11:57:12 PM ******/
ALTER TABLE [dbo].[Boats] ADD UNIQUE NONCLUSTERED 
(
	[BoatLicense] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Boats__E88646021B554EAD]    Script Date: 2021-06-24 11:57:12 PM ******/
ALTER TABLE [dbo].[Boats] ADD UNIQUE NONCLUSTERED 
(
	[RegistrationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_TokenCreatedAt]  DEFAULT (getdate()+(1)) FOR [TokenExpiresAt]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_AccountCreatedAt]  DEFAULT (getdate()) FOR [AccountCreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__IsVerifie__34C8D9D1]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[FishingEvents]  WITH CHECK ADD  CONSTRAINT [FK_FishingEvents_Boats] FOREIGN KEY([BoatId])
REFERENCES [dbo].[Boats] ([Id])
GO
ALTER TABLE [dbo].[FishingEvents] CHECK CONSTRAINT [FK_FishingEvents_Boats]
GO
ALTER TABLE [dbo].[FishingEvents]  WITH CHECK ADD  CONSTRAINT [FK_FishingEvents_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[FishingEvents] CHECK CONSTRAINT [FK_FishingEvents_Users]
GO
ALTER TABLE [dbo].[FishingEventsFishes]  WITH CHECK ADD  CONSTRAINT [FK_FishingEventFishes_Id] FOREIGN KEY([FishingEventId])
REFERENCES [dbo].[FishingEvents] ([Id])
GO
ALTER TABLE [dbo].[FishingEventsFishes] CHECK CONSTRAINT [FK_FishingEventFishes_Id]
GO
ALTER TABLE [dbo].[FishingEventsFishes]  WITH CHECK ADD  CONSTRAINT [FK_FishingEventsFishes_FishId] FOREIGN KEY([FishId])
REFERENCES [dbo].[Fishes] ([Id])
GO
ALTER TABLE [dbo].[FishingEventsFishes] CHECK CONSTRAINT [FK_FishingEventsFishes_FishId]
GO
ALTER TABLE [dbo].[UserBoats]  WITH CHECK ADD  CONSTRAINT [FK_UserBoats_Boat] FOREIGN KEY([BoatId])
REFERENCES [dbo].[Boats] ([Id])
GO
ALTER TABLE [dbo].[UserBoats] CHECK CONSTRAINT [FK_UserBoats_Boat]
GO
ALTER TABLE [dbo].[UserBoats]  WITH CHECK ADD  CONSTRAINT [FK_UserBoats_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserBoats] CHECK CONSTRAINT [FK_UserBoats_User]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UserRoles_Role]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UserRoles_User]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_Email] CHECK  (([Email] like '%__@__%.__%'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_Email]
GO
/****** Object:  StoredProcedure [dbo].[GetProfileInformation]    Script Date: 2021-06-24 11:57:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetProfileInformation]
@Username varchar(32),
@Token varchar(69)
AS
IF (@Token = 'NULL')
BEGIN
	SELECT FirstName, LastName,  Username, Email, City
	FROM Users
	WHERE Username = @Username
END
ELSE
BEGIN
	SELECT FirstName, LastName, Age, Username, Email, Phone, City
	FROM Users
	WHERE TokenExpiresAt <= GETDATE() AND Token = @Token AND Username = @Username
END
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser]    Script Date: 2021-06-24 11:57:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegisterUser]
@FirstName nvarchar(32),
@LastName nvarchar(32),
@Age tinyint,
@City nvarchar(32),
@Phone varchar(13),
@Username varchar(32),
@Email nvarchar(320),
@PasswordHash varchar(128)

AS

-- Checks if Email is taken
IF EXISTS(SELECT Email FROM Users WHERE Email = @Email)
BEGIN
	SELECT 1 AS ReturnCode
END

-- Checks if username is taken
ELSE IF EXISTS(SELECT Username FROM Users WHERE Username = @Username)
BEGIN
	SELECT 2 AS ReturnCode
END

-- Checks if phone is taken
ELSE IF EXISTS(SELECT Phone FROM Users WHERE Phone = @Phone)
BEGIN
	SELECT 3 AS ReturnCode
END

ELSE
BEGIN
	DECLARE @ExpireDate datetime
	SET @ExpireDate = GETDATE() + 1

	DECLARE @Token varchar(69)
	SET @Token = CONVERT(varchar,HASHBYTES('SHA2_256', CONVERT(varchar, GETDATE()-12)+ 'qnko'+ @Email + CONVERT(varchar, RAND()*(25-10)+10)),2)

	-- Insert
	INSERT INTO Users (FirstName, LastName, Age, City, Phone, Username, Email, Token, PasswordHash)
	VALUES(@FirstName, @LastName, @Age, @City, @Phone, @Username, @Email, @Token, @PasswordHash)

	INSERT INTO UsersRoles (UserId, RoleId)
	VALUES (IDENT_CURRENT('Users'), 1)

	-- Select Token and Expire date
	SELECT @Token AS Token,  @ExpireDate AS [ExpireDate]
END
GO
USE [master]
GO
ALTER DATABASE [Chupacabra] SET  READ_WRITE 
GO
