﻿USE [master]
GO

/****** Object:  Database [Gas]    Script Date: 09/04/2012 13:08:57 ******/
CREATE DATABASE [Gas] ON  PRIMARY 
( NAME = N'Gas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MASOCHISTSQL\MSSQL\DATA\Gas.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Gas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MASOCHISTSQL\MSSQL\DATA\Gas_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Gas] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Gas] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Gas] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Gas] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Gas] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Gas] SET ARITHABORT OFF 
GO

ALTER DATABASE [Gas] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Gas] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [Gas] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Gas] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Gas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Gas] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Gas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Gas] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Gas] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Gas] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Gas] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Gas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Gas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Gas] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Gas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Gas] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Gas] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Gas] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Gas] SET  READ_WRITE 
GO

ALTER DATABASE [Gas] SET RECOVERY FULL 
GO

ALTER DATABASE [Gas] SET  MULTI_USER 
GO

ALTER DATABASE [Gas] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Gas] SET DB_CHAINING OFF 
GO


USE [Gas]
GO

/****** Object:  Table [dbo].[Gas]    Script Date: 09/04/2012 13:12:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Gas](
	[AutoNumber] [uniqueidentifier] NOT NULL,
	[Miles] [int] NOT NULL,
	[Gallons] [float] NOT NULL,
	[Price] [money] NULL,
	[IndexNumber] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Gas] PRIMARY KEY CLUSTERED 
(
	[IndexNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Gas] ADD  CONSTRAINT [DF_Gas_Price]  DEFAULT ((0.0)) FOR [Price]
GO

ALTER TABLE [dbo].[Gas] ADD  CONSTRAINT [DF_Gas_IndexNumber]  DEFAULT (newid()) FOR [IndexNumber]
GO


USE [Gas]
GO

/****** Object:  Table [dbo].[Auto]    Script Date: 09/04/2012 13:12:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Auto](
	[AutoName] [varchar](50) NOT NULL,
	[AutoNumber] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Auto] PRIMARY KEY CLUSTERED 
(
	[AutoNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Auto] ADD  CONSTRAINT [DF_Auto_AutoNumber]  DEFAULT (newid()) FOR [AutoNumber]
GO


