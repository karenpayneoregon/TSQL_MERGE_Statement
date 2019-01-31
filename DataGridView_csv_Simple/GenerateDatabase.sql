﻿USE [master]
GO
/****** Object:  Database [BulkCopyDatabaseCodeSample]    Script Date: 9/15/2017 4:14:31 PM ******/
CREATE DATABASE [BulkCopyDatabaseCodeSample]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BulkCopyDatabaseCodeSample', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BulkCopyDatabaseCodeSample.mdf' , SIZE = 14336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BulkCopyDatabaseCodeSample_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BulkCopyDatabaseCodeSample_log.ldf' , SIZE = 12352KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET COMPATIBILITY_LEVEL = 110
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
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET AUTO_CREATE_STATISTICS ON 
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
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET RECOVERY FULL 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET  MULTI_USER 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BulkCopyDatabaseCodeSample]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/15/2017 4:14:32 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [BulkCopyDatabaseCodeSample] SET  READ_WRITE 
GO
