USE [master]
GO
/****** Object:  Database [lib]    Script Date: 2018/6/7 0:01:06 ******/
CREATE DATABASE [lib]
ALTER DATABASE [lib] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lib].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [lib] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lib] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lib] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lib] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lib] SET ARITHABORT OFF 
GO
ALTER DATABASE [lib] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [lib] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [lib] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lib] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lib] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lib] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lib] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lib] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lib] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lib] SET  DISABLE_BROKER 
GO
ALTER DATABASE [lib] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lib] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lib] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lib] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lib] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lib] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lib] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lib] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [lib] SET  MULTI_USER 
GO
ALTER DATABASE [lib] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [lib] SET DB_CHAINING OFF 
GO
USE [lib]
GO
/****** Object:  Table [dbo].[book]    Script Date: 2018/6/7 0:01:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book](
	[bookid] [char](10) NOT NULL,
	[bookname] [varchar](100) NOT NULL,
	[author] [varchar](50) NULL,
	[price] [float] NULL,
	[catid] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bookid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[borrow]    Script Date: 2018/6/7 0:01:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[borrow](
	[stuid] [char](20) NOT NULL,
	[bookid] [char](10) NOT NULL,
	[borrowdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 2018/6/7 0:01:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[catid] [char](10) NOT NULL,
	[catname] [varchar](100) NOT NULL,
	[num] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[catid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[major]    Script Date: 2018/6/7 0:01:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[major](
	[majorid] [char](10) NOT NULL,
	[majorname] [nchar](30) NULL,
	[department] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[majorid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 2018/6/7 0:01:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[stuid] [char](20) NOT NULL,
	[stuname] [varchar](50) NOT NULL,
	[degree] [varchar](10) NOT NULL,
	[majorid] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[stuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES (N'b001      ', N'货币银行学', N'李双伟', 55, N'c2        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES (N'b003      ', N'数据库系统全书', N'加西亚-莫里纳', 65, N'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES (N'b007      ', N'微观经济学', N'喻德坚', 48, N'c2        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES (N'b009      ', N'算法导论', N'科曼', 85, N'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES (N'b010      ', N'数据挖掘概念与技术', N'韩家炜', 55, N'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES (N'b012      ', N'DB2数据库性能调整和优化', N'牛新庄', 68, N'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES (N'b014      ', N'数学分析原理', N'卢丁', 28, N'c3        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES (N'b016      ', N'现代量子力学', N'J.J.Sakurai', 36, N'c3        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES (N'b021      ', N'现代操作系统', N'Tanenbaum', 55, N'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES (N'b023      ', N'编译原理', N'alfred v．aho', 55, N'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES (N'b025      ', N'数据库系统概念', N'西尔伯沙茨', 69.5, N'c1        ')
INSERT [dbo].[book] ([bookid], [bookname], [author], [price], [catid]) VALUES (N'b032      ', N'马克思主义基本原理概论', N'邓晓辉', 17.8, N'c4        ')
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'200810111           ', N'b003      ', CAST(N'2010-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'200810111           ', N'b023      ', CAST(N'2010-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'200810111           ', N'b014      ', CAST(N'2010-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'200810111           ', N'b021      ', CAST(N'2010-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'200910121           ', N'b003      ', CAST(N'2010-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'200910121           ', N'b014      ', CAST(N'2010-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'201010121           ', N'b014      ', CAST(N'2010-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'201021109           ', N'b001      ', CAST(N'2010-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'201021109           ', N'b012      ', CAST(N'2010-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'1200910211          ', N'b009      ', CAST(N'2010-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'1200910211          ', N'b010      ', CAST(N'2010-10-18T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'1200910211          ', N'b021      ', CAST(N'2010-10-19T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'1200910211          ', N'b023      ', CAST(N'2010-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'1201022135          ', N'b016      ', CAST(N'2010-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'201021109           ', N'b003      ', CAST(N'2010-10-08T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'201010121           ', N'b003      ', CAST(N'2010-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'1201022135          ', N'b025      ', CAST(N'2010-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'200810111           ', N'b025      ', CAST(N'2010-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'200810111           ', N'b007      ', CAST(N'2010-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'200810111           ', N'b032      ', CAST(N'2010-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[borrow] ([stuid], [bookid], [borrowdate]) VALUES (N'1201022135          ', N'b003      ', CAST(N'2010-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[category] ([catid], [catname], [num]) VALUES (N'c1        ', N'计算机技术', 1300)
INSERT [dbo].[category] ([catid], [catname], [num]) VALUES (N'c2        ', N'经济', 1100)
INSERT [dbo].[category] ([catid], [catname], [num]) VALUES (N'c3        ', N'数理科学', 2300)
INSERT [dbo].[category] ([catid], [catname], [num]) VALUES (N'c4        ', N'政治', 500)
INSERT [dbo].[major] ([majorid], [majorname], [department]) VALUES (N'm1        ', N'计算机科学与技术                      ', N'计算机与控制工程学院                    ')
INSERT [dbo].[major] ([majorid], [majorname], [department]) VALUES (N'm2        ', N'信息安全                          ', N'计算机与控制工程学院                    ')
INSERT [dbo].[major] ([majorid], [majorname], [department]) VALUES (N'm3        ', N'金融工程                          ', N'金融学院                          ')
INSERT [dbo].[major] ([majorid], [majorname], [department]) VALUES (N'm4        ', N'政治学                           ', N'周恩来政府管理学院                     ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES (N'1200910211          ', N'周昕', N'研究生', N'm1        ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES (N'1201022020          ', N'张三', N'研究生', N'm2        ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES (N'1201022135          ', N'吴城', N'研究生', N'm4        ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES (N'200810111           ', N'王玲', N'本科生', N'm2        ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES (N'200910121           ', N'王菲', N'本科生', N'm3        ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES (N'201010121           ', N'李飞', N'本科生', N'm3        ')
INSERT [dbo].[student] ([stuid], [stuname], [degree], [majorid]) VALUES (N'201021109           ', N'赵四', N'本科生', N'm1        ')
ALTER TABLE [dbo].[book]  WITH CHECK ADD FOREIGN KEY([catid])
REFERENCES [dbo].[category] ([catid])
GO
ALTER TABLE [dbo].[borrow]  WITH CHECK ADD FOREIGN KEY([bookid])
REFERENCES [dbo].[book] ([bookid])
GO
ALTER TABLE [dbo].[borrow]  WITH CHECK ADD FOREIGN KEY([stuid])
REFERENCES [dbo].[student] ([stuid])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([majorid])
REFERENCES [dbo].[major] ([majorid])
GO
USE [master]
GO
ALTER DATABASE [lib] SET  READ_WRITE 
GO
