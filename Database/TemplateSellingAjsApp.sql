USE [master]
GO
/****** Object:  Database [AngularJS]    Script Date: 9/30/2018 12:48:40 PM ******/
CREATE DATABASE [AngularJS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AngularJS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AngularJS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AngularJS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AngularJS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AngularJS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AngularJS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AngularJS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AngularJS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AngularJS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AngularJS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AngularJS] SET ARITHABORT OFF 
GO
ALTER DATABASE [AngularJS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AngularJS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AngularJS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AngularJS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AngularJS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AngularJS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AngularJS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AngularJS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AngularJS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AngularJS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AngularJS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AngularJS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AngularJS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AngularJS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AngularJS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AngularJS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AngularJS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AngularJS] SET RECOVERY FULL 
GO
ALTER DATABASE [AngularJS] SET  MULTI_USER 
GO
ALTER DATABASE [AngularJS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AngularJS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AngularJS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AngularJS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AngularJS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AngularJS', N'ON'
GO
USE [AngularJS]
GO
/****** Object:  UserDefinedFunction [dbo].[GetFeatures]    Script Date: 9/30/2018 12:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================

CREATE FUNCTION [dbo].[GetFeatures]
(
                -- Add the parameters for the function here
                @strParam VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
                -- Declare the return variable here
                declare @Var varchar(max)

                select @Var =  isnull( @Var + ', ', '') + [FeatureName]
                from [dbo].[tblFeature]   
                where [ProductId]= @strParam

                -- Return the result of the function
                RETURN @Var

END


GO
/****** Object:  Table [dbo].[tblContact]    Script Date: 9/30/2018 12:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Subject] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFeature]    Script Date: 9/30/2018 12:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeature](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FeatureName] [nvarchar](500) NULL,
	[ProductId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPayment]    Script Date: 9/30/2018 12:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [nvarchar](50) NULL,
	[ExpireyDate] [nvarchar](50) NULL,
	[CVV] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 9/30/2018 12:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [nvarchar](10) NULL,
	[Src] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 9/30/2018 12:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblContact] ON 

INSERT [dbo].[tblContact] ([Id], [Name], [Email], [Subject], [Message]) VALUES (1, N'Test', N'Test', N'Test', N'Test')
INSERT [dbo].[tblContact] ([Id], [Name], [Email], [Subject], [Message]) VALUES (2, N'sas', N'asasas@saccas.com', N'asaa', N'aaxaxaaxc')
INSERT [dbo].[tblContact] ([Id], [Name], [Email], [Subject], [Message]) VALUES (3, N'Dattaraya G Nadiger', N'sushrutagn@gmail.com', N'rtrtr', N'zxsvsvsdvsvsvsdvsdv')
INSERT [dbo].[tblContact] ([Id], [Name], [Email], [Subject], [Message]) VALUES (4, N'Sushruta Gurumurthy Nadiger', N'sushrutagn@gmail.com', N'5:45', N'5:45')
INSERT [dbo].[tblContact] ([Id], [Name], [Email], [Subject], [Message]) VALUES (5, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblContact] ([Id], [Name], [Email], [Subject], [Message]) VALUES (6, N'Dattaraya G Nadiger', N'sushrutagn@gmail.com', N'scssccscscscscscs', N'scscscscscscscscs')
SET IDENTITY_INSERT [dbo].[tblContact] OFF
SET IDENTITY_INSERT [dbo].[tblFeature] ON 

INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (17, N'Interactive UX', 1)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (18, N'Awesome design', 1)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (19, N'Budget friendly', 1)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (20, N'Interactive UX', 2)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (21, N'Awesome design', 2)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (22, N'Budget friendly', 2)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (23, N'Interactive UX', 3)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (24, N'PayPal Enabled', 3)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (25, N'Secure Payment', 3)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (26, N'Interactive UX', 4)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (27, N'Awesome design', 4)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (28, N'Budget friendly', 4)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (29, N'Interactive UX', 5)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (30, N'Awesome design', 5)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (31, N'Budget friendly', 5)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (32, N'Interactive UX', 6)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (33, N'PayPal Enabled', 6)
INSERT [dbo].[tblFeature] ([Id], [FeatureName], [ProductId]) VALUES (34, N'Secure Payment', 6)
SET IDENTITY_INSERT [dbo].[tblFeature] OFF
SET IDENTITY_INSERT [dbo].[tblPayment] ON 

INSERT [dbo].[tblPayment] ([Id], [CardNumber], [ExpireyDate], [CVV]) VALUES (1, N'4111111111111111', N'12/1992', N'963')
INSERT [dbo].[tblPayment] ([Id], [CardNumber], [ExpireyDate], [CVV]) VALUES (2, N'4111111111111111', N'12/1992', N'987')
SET IDENTITY_INSERT [dbo].[tblPayment] OFF
SET IDENTITY_INSERT [dbo].[tblProducts] ON 

INSERT [dbo].[tblProducts] ([Id], [Name], [Description], [Price], [Src]) VALUES (1, N'Log-In Template', N'A simple yet attractive LogIn template', N'$10', N'../../../assets/images/login.jpg')
INSERT [dbo].[tblProducts] ([Id], [Name], [Description], [Price], [Src]) VALUES (2, N'Sign-Up Template', N'A simple yet attractive Sign-Up template', N'$10', N'../../../assets/images/signup.jpg')
INSERT [dbo].[tblProducts] ([Id], [Name], [Description], [Price], [Src]) VALUES (3, N'e-Commerce Template', N'A simple yet attractive e-Commerce template', N'$30', N'../../../assets/images/ecommerce.png')
INSERT [dbo].[tblProducts] ([Id], [Name], [Description], [Price], [Src]) VALUES (4, N'Contact-Us Template', N'A simple yet attractive Contact template', N'$10', N'../../../assets/images/contactus.jpg')
INSERT [dbo].[tblProducts] ([Id], [Name], [Description], [Price], [Src]) VALUES (5, N'About-Us Template', N'A simple yet attractive About template', N'$10', N'../../../assets/images/aboutus.jpg')
INSERT [dbo].[tblProducts] ([Id], [Name], [Description], [Price], [Src]) VALUES (6, N'Buy-Now Template', N'A simple yet attractive Shopping template', N'$30', N'../../../assets/images/buynow.jpg')
SET IDENTITY_INSERT [dbo].[tblProducts] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([Id], [UserName], [Password]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[tblUser] ([Id], [UserName], [Password]) VALUES (2, N'sushrutagn', N'233151')
SET IDENTITY_INSERT [dbo].[tblUser] OFF
ALTER TABLE [dbo].[tblFeature]  WITH CHECK ADD  CONSTRAINT [FK_tblFeature_tblProducts] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProducts] ([Id])
GO
ALTER TABLE [dbo].[tblFeature] CHECK CONSTRAINT [FK_tblFeature_tblProducts]
GO
/****** Object:  StoredProcedure [dbo].[spGetProductDetails]    Script Date: 9/30/2018 12:48:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spGetProductDetails]
as
begin
select * , [dbo].[GetFeatures]([Id]) as Features from tblProducts 
end


GO
USE [master]
GO
ALTER DATABASE [AngularJS] SET  READ_WRITE 
GO