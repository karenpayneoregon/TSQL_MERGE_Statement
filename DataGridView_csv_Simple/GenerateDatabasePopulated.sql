USE [master]
GO
/****** Object:  Database [BulkCopyDatabaseCodeSample]    Script Date: 12/25/2022 2:37:44 AM ******/
CREATE DATABASE [BulkCopyDatabaseCodeSample]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BulkCopyDatabaseCodeSample', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BulkCopyDatabaseCodeSample.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BulkCopyDatabaseCodeSample_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BulkCopyDatabaseCodeSample_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BulkCopyDatabaseCodeSample].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET ARITHABORT OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET  MULTI_USER 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET QUERY_STORE = OFF
GO
USE [BulkCopyDatabaseCodeSample]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 12/25/2022 2:37:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [text] NULL,
	[LastName] [text] NULL,
	[Gender] [int] NULL,
	[BirthDay] [datetime2](7) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (1, N'Stefanie', N'Buckley', 1, CAST(N'2022-02-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (2, N'Sandy', N'Mc Gee', 2, CAST(N'2022-05-07T23:09:06.0816608' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (3, N'Lee', N'Warren', 2, CAST(N'1992-06-19T15:04:28.9376532' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (4, N'Regina', N'Forbes', 1, CAST(N'1981-10-29T14:14:24.8576678' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (5, N'Daniel', N'Kim', 2, CAST(N'1953-11-03T02:20:21.7781419' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (6, N'Dennis', N'Nunez', 1, CAST(N'1956-10-24T08:27:47.2019280' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (7, N'Myra', N'Zuniga', 1, CAST(N'2001-11-11T16:05:15.2030916' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (8, N'Teddy', N'Ingram', 2, CAST(N'1984-05-31T19:56:27.1796362' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (9, N'Annie', N'Larson', 1, CAST(N'1986-01-22T11:52:24.1598852' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (10, N'Herman', N'Anderson', 1, CAST(N'2005-05-24T05:59:12.7086956' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (11, N'Jenifer', N'Livingston', 2, CAST(N'1969-09-18T05:09:34.8819974' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (12, N'Stefanie', N'Perez', 2, CAST(N'1994-04-20T05:14:33.5254794' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (13, N'Chastity', N'Garcia', 2, CAST(N'1979-10-07T09:06:45.6508828' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (14, N'Evelyn', N'Stokes', 1, CAST(N'1991-07-12T01:43:24.2787224' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (15, N'Jeannie', N'Daniel', 1, CAST(N'2007-09-23T03:03:39.7209618' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (16, N'Rickey', N'Santos', 2, CAST(N'1989-12-24T16:02:18.4858042' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (17, N'Bobbie', N'Hurst', 1, CAST(N'1991-01-21T03:34:03.9424904' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (18, N'Lesley', N'Lawson', 2, CAST(N'1986-04-07T07:51:14.3577762' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (19, N'Shawna', N'Browning', 2, CAST(N'2007-12-19T15:23:03.3931658' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (20, N'Theresa', N'Ross', 1, CAST(N'2013-06-02T22:19:11.5945824' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (21, N'Tasha', N'Hughes', 1, CAST(N'1977-05-19T12:02:16.8300163' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (22, N'Karla', N'Hale', 2, CAST(N'2011-01-15T14:21:18.8547384' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (23, N'Otis', N'Holt', 1, CAST(N'1999-09-28T10:10:28.2988288' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (24, N'Alisa', N'Browning', 1, CAST(N'1983-02-03T14:13:34.8252294' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (25, N'Peggy', N'Donaldson', 2, CAST(N'1959-06-09T12:42:10.3158481' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (26, N'Lisa', N'Bentley', 1, CAST(N'1959-12-06T18:06:42.5903633' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (27, N'Vicky', N'Wiley', 2, CAST(N'1979-02-09T12:19:47.2196121' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (28, N'Nicolas', N'Spence', 2, CAST(N'1964-08-15T03:01:40.8991158' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (29, N'Miranda', N'Barnes', 1, CAST(N'1998-08-08T23:13:15.7458066' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (30, N'Kara', N'Barry', 1, CAST(N'1974-03-04T19:58:32.8701634' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (31, N'Rosemary', N'Levine', 1, CAST(N'1999-06-15T23:20:31.3732568' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (32, N'Ernest', N'Gamble', 1, CAST(N'1988-06-23T05:59:07.5354786' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (33, N'Lindsay', N'Henderson', 2, CAST(N'2016-05-17T23:04:37.8567224' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (34, N'Lorenzo', N'Adams', 1, CAST(N'1959-03-21T07:27:25.8001246' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (35, N'Tammie', N'Graves', 2, CAST(N'1955-10-05T07:55:52.5192930' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (36, N'Kareem', N'Benton', 2, CAST(N'2018-07-10T07:00:13.2209684' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (37, N'Cesar', N'Vance', 2, CAST(N'1977-01-21T23:13:03.1924649' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (38, N'Charlene', N'Rocha', 1, CAST(N'1960-06-27T19:22:34.5131308' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (39, N'Sonja', N'Mac Donald', 2, CAST(N'1954-12-21T11:20:30.1828187' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (40, N'Gwendolyn', N'Russell', 2, CAST(N'1969-01-01T12:17:27.3841605' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (41, N'Stephan', N'Hill', 2, CAST(N'1993-04-20T18:14:44.8140604' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (42, N'Maggie', N'Day', 2, CAST(N'2010-11-22T03:20:35.9252672' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (43, N'Earnest', N'Walters', 2, CAST(N'1981-07-09T10:19:53.5077125' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (44, N'Zachary', N'Pratt', 2, CAST(N'2003-10-24T13:56:59.5506436' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (45, N'Erin', N'Hinton', 1, CAST(N'1954-02-15T00:20:01.9478967' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (46, N'Rodolfo', N'Collier', 1, CAST(N'1975-03-17T12:26:24.2436910' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (47, N'Carla', N'Jackson', 1, CAST(N'2001-11-06T08:23:12.9867990' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (48, N'Norma', N'Robles', 2, CAST(N'1989-05-19T10:01:40.7023742' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (49, N'Jean', N'Haynes', 1, CAST(N'1990-08-15T12:21:58.6672194' AS DateTime2))
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Gender], [BirthDay]) VALUES (50, N'Tara', N'Pope', 2, CAST(N'2005-06-26T01:13:47.8488880' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
USE [master]
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET  READ_WRITE 
GO
