USE [master]
GO
/****** Object:  Database [UniLogDev]    Script Date: 4/13/2020 9:13:50 AM ******/
CREATE DATABASE [UniLogDev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniLogDev', FILENAME = N'D:\SPRING 2020\New folder\MSSQL15.MSSQLSERVER\MSSQL\DATA\UniLogDev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UniLogDev_log', FILENAME = N'D:\SPRING 2020\New folder\MSSQL15.MSSQLSERVER\MSSQL\DATA\UniLogDev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UniLogDev] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniLogDev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniLogDev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniLogDev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniLogDev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniLogDev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniLogDev] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniLogDev] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UniLogDev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniLogDev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniLogDev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniLogDev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniLogDev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniLogDev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniLogDev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniLogDev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniLogDev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniLogDev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniLogDev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniLogDev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniLogDev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniLogDev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniLogDev] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [UniLogDev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniLogDev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniLogDev] SET  MULTI_USER 
GO
ALTER DATABASE [UniLogDev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniLogDev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniLogDev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniLogDev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniLogDev] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UniLogDev', N'ON'
GO
ALTER DATABASE [UniLogDev] SET QUERY_STORE = OFF
GO
USE [UniLogDev]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AspNetUserId] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Name] [varchar](max) NULL,
	[Address] [varchar](max) NULL,
	[Phone] [varchar](15) NULL,
	[Role] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](300) NOT NULL,
	[SystemsId] [int] NULL,
	[CreateTime] [date] NULL,
	[UpdateTime] [date] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Description] [varchar](max) NULL,
	[Note] [varchar](max) NULL,
	[Category] [int] NOT NULL,
	[Stage] [int] NULL,
	[Efford] [int] NULL,
	[Origin] [varchar](3) NOT NULL,
	[Team] [int] NULL,
	[Type] [varchar](3) NOT NULL,
	[Technologies] [varchar](max) NULL,
	[Priority] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[SourceCodeUrl] [varchar](max) NULL,
	[IsDone] [bit] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationInstance]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationInstance](
	[UpdateTime] [date] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[AppId] [int] NOT NULL,
	[AppCode] [varchar](256) NOT NULL,
	[Description] [varchar](max) NULL,
	[ApplicationVersion] [float] NULL,
	[ReleaseUrl] [varchar](max) NULL,
	[ConfigUrl] [varchar](max) NULL,
	[Active] [bit] NOT NULL,
	[CreateTime] [date] NULL,
 CONSTRAINT [PK_ApplicationInstance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](max) NULL,
	[ProviderKey] [nvarchar](max) NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [int] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorCode]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](300) NULL,
	[CreateTime] [date] NULL,
	[UpdateTime] [date] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ErrorCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogDate] [datetime] NOT NULL,
	[Message] [varchar](max) NOT NULL,
	[AppCode] [varchar](256) NOT NULL,
	[ProjectName] [varchar](max) NOT NULL,
	[FileName] [varchar](max) NOT NULL,
	[LineCode] [int] NOT NULL,
	[Serverity] [int] NOT NULL,
	[LogType] [int] NOT NULL,
	[ErrorCodeId] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManageProject]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManageProject](
	[AccountId] [int] NOT NULL,
	[ApplicationId] [int] NULL,
	[ApplicationInstanceId] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ManageProject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repo]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[ServerId] [int] NOT NULL,
	[ApplicationId] [int] NULL,
	[RepoUrl] [varchar](max) NULL,
	[Note] [varchar](max) NULL,
	[Active] [bit] NOT NULL,
	[CreateTime] [date] NULL,
	[UpdateTime] [date] NULL,
 CONSTRAINT [PK_Repo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Server]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Server](
	[CreateTime] [datetime] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerMaster] [int] NULL,
	[Name] [varchar](200) NOT NULL,
	[IpAddress] [varchar](16) NULL,
	[ServerCode] [varchar](10) NOT NULL,
	[Type] [int] NOT NULL,
	[Os] [int] NOT NULL,
	[ServerUrl] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[ExpiredDate] [date] NULL,
	[Active] [bit] NOT NULL,
	[UpdateTime] [date] NULL,
 CONSTRAINT [PK_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerAccount]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerId] [int] NOT NULL,
	[Username] [varchar](max) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ServerAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerDetail]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerId] [int] NOT NULL,
	[UpdateTime] [datetime] NULL,
	[Disk1] [varchar](50) NULL,
	[VolumeDisk1] [varchar](50) NULL,
	[Disk2] [varchar](50) NULL,
	[VolumeDisk2] [varchar](50) NULL,
	[Disk3] [varchar](50) NULL,
	[VolumeDisk3] [varchar](50) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ServerDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Systems]    Script Date: 4/13/2020 9:13:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Systems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Active] [bit] NOT NULL,
	[CreateTime] [date] NULL,
	[UpdateTime] [date] NULL,
 CONSTRAINT [PK_Systems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (1, 6, N'string@gmail.com', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (2, 8, N'kachy@gmail.com', N'kachy', N'Q12', N'0988388736', 1, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (3, 9, N'kachyct@gmail.com', NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (4, 10, N'kachyctt@gmail.com', N'Kachy', N'Q12', N'0988388736', 1, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (5, 11, N'string', N'string', N'string', N'string', 3, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (6, 12, N'ia.team.k12@gmail.com', N'ia.team.k12@gmail.com', N'', N'', 3, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (7, 13, N'thuctcaoq@gmail.com', N'thuctcaoq@gmail.com', N'', N'', 1, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (8, 14, N'ia.team.k77712@gmail.com', N'ia.team.k77712@gmail.com', N'', N'', 3, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (9, 15, N'ia.teamqq.k12@gmail.com', N'ia.teamqq.k12@gmail.com', N'ia.teamqq.k12@gmail.com', N'0999999', 2, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (10, 16, N'ia.team.k1qqqq2@gmail.com', N'ia.team.k1qqqq2@gmail.com', N'', N'', 2, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (11, 17, N'quyettamquenems@gmail.com', N'quyettamquenems@gmail.com', N'', N'', 2, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (12, 25, N'caothu@gmail.com', N'string', N'string', N'string', 1, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (13, 26, N'kachyct@gmail.com.vn', N'kachyct@gmail.com.vn', N'', N'', 2, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (14, 27, N'kachyct@gmail.com.net', N'kachyct@gmail.com.net', N'', N'', 2, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (15, 28, N'swd2020@gmail.com', N'Jesse', N'Q12, HCMC', N'0988388726', 2, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (16, 29, N'swd2020admin@gmail.com', N'swd2020admin@gmail.com', N'Q12', N'0999999999', 1, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (17, 30, N'abc@xyz.com', N'4456654', N'', N'', 2, 1)
INSERT [dbo].[Account] ([Id], [AspNetUserId], [Email], [Name], [Address], [Phone], [Role], [Active]) VALUES (18, 31, N'google.com.vn', N'4456654', N'', N'', 2, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Application] ON 

INSERT [dbo].[Application] ([Id], [Name], [SystemsId], [CreateTime], [UpdateTime], [StartDate], [EndDate], [Description], [Note], [Category], [Stage], [Efford], [Origin], [Team], [Type], [Technologies], [Priority], [Status], [SourceCodeUrl], [IsDone], [Active]) VALUES (1, N'Log API', 1, CAST(N'2020-03-11' AS Date), CAST(N'2020-03-12' AS Date), CAST(N'2020-03-11' AS Date), NULL, NULL, NULL, 1, NULL, NULL, N'I', NULL, N'N', NULL, 1, 1, NULL, 1, 1)
INSERT [dbo].[Application] ([Id], [Name], [SystemsId], [CreateTime], [UpdateTime], [StartDate], [EndDate], [Description], [Note], [Category], [Stage], [Efford], [Origin], [Team], [Type], [Technologies], [Priority], [Status], [SourceCodeUrl], [IsDone], [Active]) VALUES (2, N'Web UniLog ', NULL, CAST(N'2020-03-11' AS Date), NULL, CAST(N'2020-03-11' AS Date), NULL, NULL, NULL, 1, NULL, NULL, N'I', NULL, N'N', NULL, 3, 1, NULL, 0, 1)
INSERT [dbo].[Application] ([Id], [Name], [SystemsId], [CreateTime], [UpdateTime], [StartDate], [EndDate], [Description], [Note], [Category], [Stage], [Efford], [Origin], [Team], [Type], [Technologies], [Priority], [Status], [SourceCodeUrl], [IsDone], [Active]) VALUES (3, N'TEST 2', NULL, CAST(N'2020-03-11' AS Date), CAST(N'2020-03-13' AS Date), CAST(N'2020-03-11' AS Date), CAST(N'2020-03-13' AS Date), N'wwwww', N'', 3, 3, NULL, N'S2B', NULL, N'E', N'111', 4, 4, N'vnexpress.com.vn', 1, 1)
INSERT [dbo].[Application] ([Id], [Name], [SystemsId], [CreateTime], [UpdateTime], [StartDate], [EndDate], [Description], [Note], [Category], [Stage], [Efford], [Origin], [Team], [Type], [Technologies], [Priority], [Status], [SourceCodeUrl], [IsDone], [Active]) VALUES (4, N'AAAASSs', NULL, CAST(N'2020-03-11' AS Date), NULL, CAST(N'2020-03-11' AS Date), NULL, NULL, NULL, 1, NULL, NULL, N'I', NULL, N'N', NULL, 1, 1, NULL, 0, 1)
INSERT [dbo].[Application] ([Id], [Name], [SystemsId], [CreateTime], [UpdateTime], [StartDate], [EndDate], [Description], [Note], [Category], [Stage], [Efford], [Origin], [Team], [Type], [Technologies], [Priority], [Status], [SourceCodeUrl], [IsDone], [Active]) VALUES (22, N'For Employee', 1, CAST(N'2020-03-16' AS Date), NULL, CAST(N'2020-03-16' AS Date), CAST(N'2020-03-16' AS Date), N'To assign Employee', N'', 1, 1, NULL, N'I', 1, N'N', N'', 1, 1, N'google.com.vn', 0, 1)
SET IDENTITY_INSERT [dbo].[Application] OFF
SET IDENTITY_INSERT [dbo].[ApplicationInstance] ON 

INSERT [dbo].[ApplicationInstance] ([UpdateTime], [Id], [Name], [AppId], [AppCode], [Description], [ApplicationVersion], [ReleaseUrl], [ConfigUrl], [Active], [CreateTime]) VALUES (CAST(N'2020-03-12' AS Date), 1, N'Quan 1', 1, N'number1', N'string', NULL, NULL, NULL, 1, CAST(N'2020-03-12' AS Date))
INSERT [dbo].[ApplicationInstance] ([UpdateTime], [Id], [Name], [AppId], [AppCode], [Description], [ApplicationVersion], [ReleaseUrl], [ConfigUrl], [Active], [CreateTime]) VALUES (CAST(N'2020-03-12' AS Date), 2, N'Quan 2', 1, N'number2', N'string', NULL, NULL, NULL, 1, CAST(N'2020-03-12' AS Date))
INSERT [dbo].[ApplicationInstance] ([UpdateTime], [Id], [Name], [AppId], [AppCode], [Description], [ApplicationVersion], [ReleaseUrl], [ConfigUrl], [Active], [CreateTime]) VALUES (CAST(N'2020-03-12' AS Date), 3, N'Quan 3', 1, N'number3', N'string', NULL, NULL, NULL, 1, CAST(N'2020-03-12' AS Date))
INSERT [dbo].[ApplicationInstance] ([UpdateTime], [Id], [Name], [AppId], [AppCode], [Description], [ApplicationVersion], [ReleaseUrl], [ConfigUrl], [Active], [CreateTime]) VALUES (CAST(N'2020-03-12' AS Date), 4, N'Quan 4', 1, N'number4', N'string', NULL, NULL, NULL, 1, CAST(N'2020-03-12' AS Date))
INSERT [dbo].[ApplicationInstance] ([UpdateTime], [Id], [Name], [AppId], [AppCode], [Description], [ApplicationVersion], [ReleaseUrl], [ConfigUrl], [Active], [CreateTime]) VALUES (CAST(N'2020-03-16' AS Date), 22, N'For Manager', 22, N'Manager', N'To assign Manager', 0, N'string', N'string', 1, CAST(N'2020-03-16' AS Date))
INSERT [dbo].[ApplicationInstance] ([UpdateTime], [Id], [Name], [AppId], [AppCode], [Description], [ApplicationVersion], [ReleaseUrl], [ConfigUrl], [Active], [CreateTime]) VALUES (CAST(N'2020-03-17' AS Date), 23, N'Huyen 11', 1, N'Huyen 11', NULL, NULL, NULL, NULL, 1, CAST(N'2020-03-17' AS Date))
INSERT [dbo].[ApplicationInstance] ([UpdateTime], [Id], [Name], [AppId], [AppCode], [Description], [ApplicationVersion], [ReleaseUrl], [ConfigUrl], [Active], [CreateTime]) VALUES (CAST(N'2020-04-06' AS Date), 24, N'Log API', 1, N'Kachy', NULL, NULL, NULL, NULL, 1, CAST(N'2020-04-06' AS Date))
SET IDENTITY_INSERT [dbo].[ApplicationInstance] OFF
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 

INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (1, N'Adminstrator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (2, N'Manager')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (3, N'Developer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (4, N'Testing')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (5, N'Guest')
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
SET IDENTITY_INSERT [dbo].[AspNetUserLogins] ON 

INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId], [Id]) VALUES (N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjEwIiwibmJmIjoxNTg0MTgwMjg2LCJleHAiOjE1ODQ3ODUwODYsImlhdCI6MTU4NDE4MDI4Nn0.PqWJXcZQBcgsRMPPPEbSSGiNW2QmRNQCTcBgOmTQL4o', NULL, N'Jwt is not existed', 10, 1)
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId], [Id]) VALUES (N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjkiLCJuYmYiOjE1ODY0OTIxNDUsImV4cCI6MTU4NzA5Njk0NCwiaWF0IjoxNTg2NDkyMTQ1fQ.-jMWcfvS43oa6ERVB1QGUPWopRDy-5JPigR2BprV3TI', NULL, N'Jwt is not existed', 9, 2)
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId], [Id]) VALUES (N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjI2IiwibmJmIjoxNTg2MjIxNTc1LCJleHAiOjE1ODY4MjYzNzUsImlhdCI6MTU4NjIyMTU3NX0.JQc6flTTvkrQX32eYdUaRMReCxh-oynRbVZnEt1h26U', NULL, N'Jwt is not existed', 26, 3)
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId], [Id]) VALUES (N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjI4IiwibmJmIjoxNTg2NjkzMTg4LCJleHAiOjE1ODcyOTc5ODgsImlhdCI6MTU4NjY5MzE4OH0.MuujT2QADTy9KGCFL-3E15dpV4dJ2Fj0sCE2XhztkyM', NULL, N'Jwt is not existed', 28, 4)
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId], [Id]) VALUES (N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjI3IiwibmJmIjoxNTg1NjU2NzA2LCJleHAiOjE1ODYyNjE1MDYsImlhdCI6MTU4NTY1NjcwNn0.3mtVo9cN-WhvxYhXdwIL6d53nCzwff5u3uOqQYkongw', NULL, N'Jwt is not existed', 27, 5)
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId], [Id]) VALUES (N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IjI5IiwibmJmIjoxNTg2MzA5MDk3LCJleHAiOjE1ODY5MTM4OTcsImlhdCI6MTU4NjMwOTA5N30.VY8jJGJekAlmwiV1ny7rDN6EJp69Xq7EUVASlrONgpg', NULL, N'Jwt is not existed', 29, 6)
SET IDENTITY_INSERT [dbo].[AspNetUserLogins] OFF
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (6, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (7, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (8, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (9, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (10, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (13, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (21, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (25, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (29, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (15, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (16, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (17, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (26, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (27, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (30, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (31, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (11, 5)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (12, 5)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (14, 5)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (28, 5)
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (1, NULL, N'string@gmail.com', 0, N'3d186804534370c3c817db0563f0e461', NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (2, NULL, N'string@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (3, NULL, N'string@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (4, NULL, N'string@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (5, NULL, N'string@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (6, NULL, N'string@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (7, N'kachy', N'kachy@gmail.com', 0, N'59e32f4d0fe73e35a24b8bf14f738092', N'0988388736', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (8, N'kachy', N'kachy@gmail.com', 0, N'59e32f4d0fe73e35a24b8bf14f738092', N'0988388736', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (9, NULL, N'kachyct@gmail.com', 0, N'03492dda0f7f9c24333d96bdd73bc3e7', NULL, 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (10, N'string', N'kachyctt@gmail.com', 0, N'85f7b59a2dd42f9406427e92492e9fe2', N'0988388736', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (11, N'string', N'string', 0, N'b45cffe084dd3d20d928bee85e7b0f21', N'string', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (12, N'ia.team.k12@gmail.com', N'ia.team.k12@gmail.com', 0, N'af31e897496a36299a407f785fafc743', N'', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (13, N'thuctcaoq@gmail.com', N'thuctcaoq@gmail.com', 0, N'a41d91b57ffafdd6bbf5198daa2d9415', N'', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (14, N'ia.team.k77712@gmail.com', N'ia.team.k77712@gmail.com', 0, N'18ef4837507306f7b3fd1644e6807cf6', N'', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (15, N'ia.teamqq.k12@gmail.com', N'ia.teamqq.k12@gmail.com', 0, N'b194dd9c581b20a6b11262141e503da1', N'', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (16, N'ia.team.k1qqqq2@gmail.com', N'ia.team.k1qqqq2@gmail.com', 0, N'bc3afd4a7f677615bfd2a651811cf8a5', N'', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (17, N'quyettamquenems@gmail.com', N'quyettamquenems@gmail.com', 0, N'20d64782c842d14b1380c49ff8a5181f', N'', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (18, N'string', N'caothu@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', N'string', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (19, N'string', N'caothu@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', N'string', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (20, N'string', N'caothu@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', N'string', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (21, N'string', N'caothu@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', N'string', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (22, N'string', N'caothu@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', N'string', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (23, N'string', N'caothu@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', N'string', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (24, N'string', N'caothu@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', N'string', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (25, N'string', N'caothu@gmail.com', 0, N'b45cffe084dd3d20d928bee85e7b0f21', N'string', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (26, N'kachyct@gmail.com.vn', N'kachyct@gmail.com.vn', 0, N'03492dda0f7f9c24333d96bdd73bc3e7', N'', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (27, N'kachyct@gmail.com.net', N'kachyct@gmail.com.net', 0, N'03492dda0f7f9c24333d96bdd73bc3e7', N'', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (28, N'string', N'swd2020@gmail.com', 0, N'6de0160461dfc14574a4b4041b4bc8bc', N'string', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (29, N'swd2020admin@gmail.com', N'swd2020admin@gmail.com', 0, N'53b107beb5b49525575eb2df18fb4f3f', N'0999999999', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (30, N'4456654', N'abc@xyz.com', 0, N'4e8fb772f3a4034906153f2d4258ee5c', N'', 0, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [TwoFactorEnabled], [AccessFailedCount]) VALUES (31, N'4456654', N'google.com.vn', 0, N'89e433ea69582770c71d32fd54060013', N'', 0, 0)
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (4, N'32440f08ed9edc6ff1881febb15785dd', N'string@gmail.com', NULL)
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (5, N'2e678ecc848aa6294cb1ce217e10a399', N'string@gmail.com', NULL)
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (6, N'452e631be9b80ff2b0a9935203277b9b', N'string@gmail.com', NULL)
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (12, N'fc88c638f723da0e8349d5b2ea178e17', N'ia.team.k12@gmail.com', N'ead0c9db18c8054e74addb6c713b4b80')
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([Id], [LogDate], [Message], [AppCode], [ProjectName], [FileName], [LineCode], [Serverity], [LogType], [ErrorCodeId], [Active]) VALUES (40, CAST(N'2020-04-06T19:45:19.747' AS DateTime), N'The method or operation is not implemented.', N'Kachy', N'Controllers', N'ApplicationInstancesController.cs:line 30', 202, 5, 3, NULL, 0)
INSERT [dbo].[Log] ([Id], [LogDate], [Message], [AppCode], [ProjectName], [FileName], [LineCode], [Serverity], [LogType], [ErrorCodeId], [Active]) VALUES (41, CAST(N'2020-04-07T08:06:34.357' AS DateTime), N'The method or operation is not implemented.', N'Kachy', N'Controllers', N'ApplicationsController.cs:line 31', 202, 5, 3, NULL, 1)
INSERT [dbo].[Log] ([Id], [LogDate], [Message], [AppCode], [ProjectName], [FileName], [LineCode], [Serverity], [LogType], [ErrorCodeId], [Active]) VALUES (42, CAST(N'2020-04-10T11:14:43.843' AS DateTime), N'The method or operation is not implemented.', N'Kachy', N'Controllers', N'AccountsController.cs:line 111', 202, 5, 3, NULL, 1)
SET IDENTITY_INSERT [dbo].[Log] OFF
SET IDENTITY_INSERT [dbo].[ManageProject] ON 

INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (9, 1, 22, 55)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (9, 3, 22, 57)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (10, 4, 22, 58)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (10, 3, 22, 59)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (10, 2, 22, 60)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (1, 1, 22, 61)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (1, 2, 22, 62)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (1, 3, 22, 63)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (1, 22, 2, 64)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (1, 22, 3, 65)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (1, 22, 4, 66)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (4, 22, 4, 67)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (4, 22, 3, 68)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (4, 22, 2, 69)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (4, 2, 22, 70)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (4, 3, 22, 71)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (4, 1, 22, 72)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (9, 4, 22, 1055)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (15, 2, 22, 1056)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (15, 3, 22, 1057)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (15, 1, 22, 1058)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (16, 22, 3, 1059)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (16, 22, 2, 1060)
INSERT [dbo].[ManageProject] ([AccountId], [ApplicationId], [ApplicationInstanceId], [Id]) VALUES (16, 22, 4, 1061)
SET IDENTITY_INSERT [dbo].[ManageProject] OFF
SET IDENTITY_INSERT [dbo].[Repo] ON 

INSERT [dbo].[Repo] ([Id], [Name], [ServerId], [ApplicationId], [RepoUrl], [Note], [Active], [CreateTime], [UpdateTime]) VALUES (1, N'string', 1, 1, N'string', N'string', 1, CAST(N'2020-03-12' AS Date), CAST(N'2020-03-12' AS Date))
INSERT [dbo].[Repo] ([Id], [Name], [ServerId], [ApplicationId], [RepoUrl], [Note], [Active], [CreateTime], [UpdateTime]) VALUES (2, N'161616', 2, 1, N'https://www.google.com', N'string', 1, CAST(N'2020-03-14' AS Date), CAST(N'2020-03-14' AS Date))
INSERT [dbo].[Repo] ([Id], [Name], [ServerId], [ApplicationId], [RepoUrl], [Note], [Active], [CreateTime], [UpdateTime]) VALUES (3, N'16 time', 1, 1, N'16timetillnext.com', N'string', 1, CAST(N'2020-03-14' AS Date), CAST(N'2020-03-14' AS Date))
SET IDENTITY_INSERT [dbo].[Repo] OFF
SET IDENTITY_INSERT [dbo].[Server] ON 

INSERT [dbo].[Server] ([CreateTime], [Id], [ServerMaster], [Name], [IpAddress], [ServerCode], [Type], [Os], [ServerUrl], [Description], [ExpiredDate], [Active], [UpdateTime]) VALUES (CAST(N'2020-03-06T13:25:23.360' AS DateTime), 1, 1, N'cacaky', N'192.1.1.12', N'code code', 1, 1, N'urk.com.vn', N'string', CAST(N'2020-03-11' AS Date), 1, CAST(N'2020-03-11' AS Date))
INSERT [dbo].[Server] ([CreateTime], [Id], [ServerMaster], [Name], [IpAddress], [ServerCode], [Type], [Os], [ServerUrl], [Description], [ExpiredDate], [Active], [UpdateTime]) VALUES (CAST(N'2020-03-06T14:00:42.380' AS DateTime), 2, NULL, N'kachyctt11', N'192.168.1.123', N'kachyctt1s', 1, 1, N'google.com.vn.exp', N'string', NULL, 1, CAST(N'2020-03-11' AS Date))
INSERT [dbo].[Server] ([CreateTime], [Id], [ServerMaster], [Name], [IpAddress], [ServerCode], [Type], [Os], [ServerUrl], [Description], [ExpiredDate], [Active], [UpdateTime]) VALUES (CAST(N'2020-03-06T14:01:02.347' AS DateTime), 3, NULL, N'kachyctt2', N'192.168.1.1', N'kachyctt2', 1, 1, N'google.com.vn', N'string', NULL, 1, CAST(N'2020-03-06' AS Date))
INSERT [dbo].[Server] ([CreateTime], [Id], [ServerMaster], [Name], [IpAddress], [ServerCode], [Type], [Os], [ServerUrl], [Description], [ExpiredDate], [Active], [UpdateTime]) VALUES (CAST(N'2020-03-11T17:20:16.723' AS DateTime), 4, NULL, N'string', NULL, N'string', 1, 1, NULL, NULL, NULL, 1, CAST(N'2020-03-11' AS Date))
INSERT [dbo].[Server] ([CreateTime], [Id], [ServerMaster], [Name], [IpAddress], [ServerCode], [Type], [Os], [ServerUrl], [Description], [ExpiredDate], [Active], [UpdateTime]) VALUES (CAST(N'2020-03-11T17:23:53.313' AS DateTime), 5, NULL, N'Server 224', NULL, N'Server 224', 4, 10, NULL, NULL, NULL, 1, CAST(N'2020-03-11' AS Date))
INSERT [dbo].[Server] ([CreateTime], [Id], [ServerMaster], [Name], [IpAddress], [ServerCode], [Type], [Os], [ServerUrl], [Description], [ExpiredDate], [Active], [UpdateTime]) VALUES (CAST(N'2020-04-07T07:50:35.710' AS DateTime), 6, NULL, N'Test4/7', NULL, N'TESTAPI4/7', 2, 1, NULL, NULL, NULL, 1, CAST(N'2020-04-07' AS Date))
SET IDENTITY_INSERT [dbo].[Server] OFF
SET IDENTITY_INSERT [dbo].[ServerAccount] ON 

INSERT [dbo].[ServerAccount] ([Id], [ServerId], [Username], [Password], [Active]) VALUES (1, 1, N'kaachy', N'kachycttw', 1)
INSERT [dbo].[ServerAccount] ([Id], [ServerId], [Username], [Password], [Active]) VALUES (2, 2, N'kachyctt1', N'kachyctt1', 1)
INSERT [dbo].[ServerAccount] ([Id], [ServerId], [Username], [Password], [Active]) VALUES (3, 3, N'kachyctt2', N'kachyctt2', 1)
SET IDENTITY_INSERT [dbo].[ServerAccount] OFF
SET IDENTITY_INSERT [dbo].[ServerDetail] ON 

INSERT [dbo].[ServerDetail] ([Id], [ServerId], [UpdateTime], [Disk1], [VolumeDisk1], [Disk2], [VolumeDisk2], [Disk3], [VolumeDisk3], [Active]) VALUES (1, 1, CAST(N'2020-03-07T19:50:38.690' AS DateTime), N'a', N'255', N'bs', N'225', N'c', N'100', 1)
INSERT [dbo].[ServerDetail] ([Id], [ServerId], [UpdateTime], [Disk1], [VolumeDisk1], [Disk2], [VolumeDisk2], [Disk3], [VolumeDisk3], [Active]) VALUES (2, 2, CAST(N'2020-03-06T15:31:59.837' AS DateTime), N'D', N'100', N'E', N'100', N'F', N'100', 1)
INSERT [dbo].[ServerDetail] ([Id], [ServerId], [UpdateTime], [Disk1], [VolumeDisk1], [Disk2], [VolumeDisk2], [Disk3], [VolumeDisk3], [Active]) VALUES (3, 3, CAST(N'2020-03-06T15:35:43.350' AS DateTime), N'G', N'100', N'H', N'100', N'I', N'100', 1)
SET IDENTITY_INSERT [dbo].[ServerDetail] OFF
SET IDENTITY_INSERT [dbo].[Systems] ON 

INSERT [dbo].[Systems] ([Id], [Name], [Description], [Active], [CreateTime], [UpdateTime]) VALUES (1, N'Log Record', N'Log Record', 1, CAST(N'2020-03-12' AS Date), CAST(N'2020-03-12' AS Date))
INSERT [dbo].[Systems] ([Id], [Name], [Description], [Active], [CreateTime], [UpdateTime]) VALUES (2, N'Passio', N'Passio', 1, CAST(N'2020-03-12' AS Date), CAST(N'2020-03-12' AS Date))
INSERT [dbo].[Systems] ([Id], [Name], [Description], [Active], [CreateTime], [UpdateTime]) VALUES (3, N'FPT University', N'FPT University', 1, CAST(N'2020-03-12' AS Date), CAST(N'2020-03-12' AS Date))
INSERT [dbo].[Systems] ([Id], [Name], [Description], [Active], [CreateTime], [UpdateTime]) VALUES (4, N'Viettel', N'Viettel', 1, CAST(N'2020-03-12' AS Date), CAST(N'2020-03-12' AS Date))
INSERT [dbo].[Systems] ([Id], [Name], [Description], [Active], [CreateTime], [UpdateTime]) VALUES (5, N'Coffee House', N'Coffee House', 1, CAST(N'2020-03-12' AS Date), CAST(N'2020-03-12' AS Date))
INSERT [dbo].[Systems] ([Id], [Name], [Description], [Active], [CreateTime], [UpdateTime]) VALUES (6, N'Phuc Long', N'Phuc Long', 1, CAST(N'2020-03-12' AS Date), CAST(N'2020-03-12' AS Date))
SET IDENTITY_INSERT [dbo].[Systems] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Email]    Script Date: 4/13/2020 9:13:50 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Email] ON [dbo].[Account]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_IpAspUser]    Script Date: 4/13/2020 9:13:50 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_IpAspUser] ON [dbo].[Account]
(
	[AspNetUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_ApplicationInstance_AppCode]    Script Date: 4/13/2020 9:13:50 AM ******/
ALTER TABLE [dbo].[ApplicationInstance] ADD  CONSTRAINT [AK_ApplicationInstance_AppCode] UNIQUE NONCLUSTERED 
(
	[AppCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApplicationInstance]    Script Date: 4/13/2020 9:13:50 AM ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationInstance] ON [dbo].[ApplicationInstance]
(
	[UpdateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ApplicationInstance_AppId]    Script Date: 4/13/2020 9:13:50 AM ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationInstance_AppId] ON [dbo].[ApplicationInstance]
(
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Applicat__29493F8624927208]    Script Date: 4/13/2020 9:13:50 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Applicat__29493F8624927208] ON [dbo].[ApplicationInstance]
(
	[AppCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 4/13/2020 9:13:50 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 4/13/2020 9:13:50 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Log_AppCode]    Script Date: 4/13/2020 9:13:50 AM ******/
CREATE NONCLUSTERED INDEX [IX_Log_AppCode] ON [dbo].[Log]
(
	[AppCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_RepoName]    Script Date: 4/13/2020 9:13:50 AM ******/
ALTER TABLE [dbo].[Repo] ADD  CONSTRAINT [UK_RepoName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_ServerName]    Script Date: 4/13/2020 9:13:50 AM ******/
ALTER TABLE [dbo].[Server] ADD  CONSTRAINT [UK_ServerName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_ServerCode]    Script Date: 4/13/2020 9:13:50 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_ServerCode] ON [dbo].[Server]
(
	[ServerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServerDetail]    Script Date: 4/13/2020 9:13:50 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ServerDetail] ON [dbo].[ServerDetail]
(
	[ServerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[ApplicationInstance] ADD  CONSTRAINT [DF__Applicati__Activ__70DDC3D8]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Log] ADD  CONSTRAINT [DF__Log__Active__0D7A0286]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Server] ADD  CONSTRAINT [DF__Server__Active__08B54D69]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Systems] ADD  CONSTRAINT [DF__Systems__Active__10566F31]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AspNetUsers]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Systems] FOREIGN KEY([SystemsId])
REFERENCES [dbo].[Systems] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Systems]
GO
ALTER TABLE [dbo].[ApplicationInstance]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationInstance_Application] FOREIGN KEY([AppId])
REFERENCES [dbo].[Application] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationInstance] CHECK CONSTRAINT [FK_ApplicationInstance_Application]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_ApplicationInstance] FOREIGN KEY([AppCode])
REFERENCES [dbo].[ApplicationInstance] ([AppCode])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_ApplicationInstance]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_ErrorCode] FOREIGN KEY([ErrorCodeId])
REFERENCES [dbo].[ErrorCode] ([Id])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_ErrorCode]
GO
ALTER TABLE [dbo].[ManageProject]  WITH CHECK ADD  CONSTRAINT [FK_ManageProject_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[ManageProject] CHECK CONSTRAINT [FK_ManageProject_Account]
GO
ALTER TABLE [dbo].[ManageProject]  WITH CHECK ADD  CONSTRAINT [FK_ManageProject_Application] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([Id])
GO
ALTER TABLE [dbo].[ManageProject] CHECK CONSTRAINT [FK_ManageProject_Application]
GO
ALTER TABLE [dbo].[ManageProject]  WITH CHECK ADD  CONSTRAINT [FK_ManageProject_ApplicationInstance] FOREIGN KEY([ApplicationInstanceId])
REFERENCES [dbo].[ApplicationInstance] ([Id])
GO
ALTER TABLE [dbo].[ManageProject] CHECK CONSTRAINT [FK_ManageProject_ApplicationInstance]
GO
ALTER TABLE [dbo].[Repo]  WITH CHECK ADD  CONSTRAINT [FK_Application_Repo] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([Id])
GO
ALTER TABLE [dbo].[Repo] CHECK CONSTRAINT [FK_Application_Repo]
GO
ALTER TABLE [dbo].[Repo]  WITH CHECK ADD  CONSTRAINT [FK_Server_Repo] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Server] ([Id])
GO
ALTER TABLE [dbo].[Repo] CHECK CONSTRAINT [FK_Server_Repo]
GO
ALTER TABLE [dbo].[Server]  WITH CHECK ADD  CONSTRAINT [FK_Server_ServerMaster] FOREIGN KEY([ServerMaster])
REFERENCES [dbo].[Server] ([Id])
GO
ALTER TABLE [dbo].[Server] CHECK CONSTRAINT [FK_Server_ServerMaster]
GO
ALTER TABLE [dbo].[ServerAccount]  WITH CHECK ADD  CONSTRAINT [FK_Server_ServerAccount] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Server] ([Id])
GO
ALTER TABLE [dbo].[ServerAccount] CHECK CONSTRAINT [FK_Server_ServerAccount]
GO
ALTER TABLE [dbo].[ServerDetail]  WITH CHECK ADD  CONSTRAINT [FK_ServerDetail_Server] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Server] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServerDetail] CHECK CONSTRAINT [FK_ServerDetail_Server]
GO
USE [master]
GO
ALTER DATABASE [UniLogDev] SET  READ_WRITE 
GO
