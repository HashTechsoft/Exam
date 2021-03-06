USE [master]
GO
/****** Object:  Database [BS]    Script Date: 5/20/2020 12:25:34 AM ******/
CREATE DATABASE [BS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AMIN\MSSQL\DATA\BS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AMIN\MSSQL\DATA\BS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BS] SET ARITHABORT OFF 
GO
ALTER DATABASE [BS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BS] SET  MULTI_USER 
GO
ALTER DATABASE [BS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BS] SET QUERY_STORE = OFF
GO
USE [BS]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/20/2020 12:25:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [varchar](max) NULL,
	[CrateTime] [datetime] NULL,
	[PostId] [int] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 5/20/2020 12:25:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](60) NULL,
	[Content] [varchar](max) NULL,
	[CrateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/20/2020 12:25:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](60) NULL,
	[Mobile] [varchar](20) NULL,
	[Email] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vote]    Script Date: 5/20/2020 12:25:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vote](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Voting] [bit] NULL,
	[ComentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [Content], [CrateTime], [PostId], [UserId]) VALUES (1, N'Comment1', CAST(N'2019-02-12T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Comment] ([Id], [Content], [CrateTime], [PostId], [UserId]) VALUES (2, N'Comment1', CAST(N'2019-03-12T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Comment] ([Id], [Content], [CrateTime], [PostId], [UserId]) VALUES (3, N'Comment2', CAST(N'2019-04-12T00:00:00.000' AS DateTime), 2, 3)
INSERT [dbo].[Comment] ([Id], [Content], [CrateTime], [PostId], [UserId]) VALUES (4, N'Comment3', CAST(N'2019-05-12T00:00:00.000' AS DateTime), 2, 4)
INSERT [dbo].[Comment] ([Id], [Content], [CrateTime], [PostId], [UserId]) VALUES (5, N'Comment4', CAST(N'2019-06-12T00:00:00.000' AS DateTime), 3, 2)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [Title], [Content], [CrateTime], [UpdateTime], [UserId]) VALUES (1, N'Post1', N'Post1', CAST(N'2019-02-12T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Post] ([Id], [Title], [Content], [CrateTime], [UpdateTime], [UserId]) VALUES (2, N'Post2', N'Post2_Content', CAST(N'2019-02-12T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Post] ([Id], [Title], [Content], [CrateTime], [UpdateTime], [UserId]) VALUES (3, N'Post3', N'Post3_Content', CAST(N'2019-02-12T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Post] ([Id], [Title], [Content], [CrateTime], [UpdateTime], [UserId]) VALUES (4, N'Post4', N'Post4_Content', CAST(N'2019-02-12T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Mobile], [Email]) VALUES (1, N'Admin', N'123', N'admin@gmail.com')
INSERT [dbo].[Users] ([Id], [Username], [Mobile], [Email]) VALUES (2, N'User1', N'235', N'user1@gmail.com')
INSERT [dbo].[Users] ([Id], [Username], [Mobile], [Email]) VALUES (3, N'User2', N'445', N'user2@gmail.com')
INSERT [dbo].[Users] ([Id], [Username], [Mobile], [Email]) VALUES (4, N'User3', N'454', N'user1@gmail.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Vote] ON 

INSERT [dbo].[Vote] ([Id], [Voting], [ComentId]) VALUES (1, 1, 1)
INSERT [dbo].[Vote] ([Id], [Voting], [ComentId]) VALUES (2, 0, 2)
INSERT [dbo].[Vote] ([Id], [Voting], [ComentId]) VALUES (3, 1, 1)
INSERT [dbo].[Vote] ([Id], [Voting], [ComentId]) VALUES (4, 0, 1)
INSERT [dbo].[Vote] ([Id], [Voting], [ComentId]) VALUES (5, 1, 2)
INSERT [dbo].[Vote] ([Id], [Voting], [ComentId]) VALUES (6, 0, 3)
INSERT [dbo].[Vote] ([Id], [Voting], [ComentId]) VALUES (7, 1, 4)
INSERT [dbo].[Vote] ([Id], [Voting], [ComentId]) VALUES (8, 1, 2)
INSERT [dbo].[Vote] ([Id], [Voting], [ComentId]) VALUES (9, 0, 2)
INSERT [dbo].[Vote] ([Id], [Voting], [ComentId]) VALUES (10, 1, 2)
SET IDENTITY_INSERT [dbo].[Vote] OFF
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD FOREIGN KEY([ComentId])
REFERENCES [dbo].[Comment] ([Id])
GO
USE [master]
GO
ALTER DATABASE [BS] SET  READ_WRITE 
GO
