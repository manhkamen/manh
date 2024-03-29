USE [SONLINE]
GO
/****** Object:  StoredProcedure [dbo].[login_admin]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[login_admin](@Email nvarchar(50)
,@PassWord nvarchar(50)) as

select * from SONLINE.dbo.UserManager where Email = @Email and PassWord = @PassWord
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CategoryParent] [nvarchar](50) NOT NULL,
	[CategoryAlias] [nvarchar](50) NOT NULL,
	[HomePublish] [nvarchar](50) NOT NULL,
	[Possition] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[FeeDelivery] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[contend] [nvarchar](50) NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [int] NOT NULL,
	[OptionName] [nvarchar](50) NOT NULL,
	[OptionValue] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[CouponId] [int] IDENTITY(1,1) NOT NULL,
	[CouponCode] [nvarchar](50) NOT NULL,
	[Value] [float] NOT NULL,
 CONSTRAINT [PK_Coupons] PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[District]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[DistrictId] [int] NOT NULL,
	[DistrictName] [nvarchar](50) NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] NOT NULL,
	[InvoiceCode] [nvarchar](50) NOT NULL,
	[TotalPrice] [money] NOT NULL,
	[FeeDelivery] [money] NOT NULL,
	[FinalPrice] [money] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[CityId] [int] NOT NULL,
	[CouponId] [int] NOT NULL,
	[PaymentID] [int] NOT NULL,
	[MethodDelivery] [nvarchar](50) NOT NULL,
	[OrderStatus] [nvarchar](50) NOT NULL,
	[ExportBill] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Page]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[PageId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[PageContend] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[SKU] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[OriginalPrice] [money] NOT NULL,
	[Price] [money] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Detail] [nvarchar](50) NULL,
	[Feature] [nvarchar](50) NULL,
	[Review] [nvarchar](50) NOT NULL,
	[Alias] [nvarchar](50) NOT NULL,
	[Published] [nvarchar](50) NULL,
	[ImageSource] [text] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductComment]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductComment](
	[ProductId] [int] NOT NULL,
	[CommentId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserManager]    Script Date: 9/22/2014 10:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManager](
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[Permission] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserManager] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_City]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categories]
GO
ALTER TABLE [dbo].[ProductComment]  WITH CHECK ADD  CONSTRAINT [FK_ProductComment_Comment] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comment] ([CommentId])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_Comment]
GO
ALTER TABLE [dbo].[ProductComment]  WITH CHECK ADD  CONSTRAINT [FK_ProductComment_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductComment] CHECK CONSTRAINT [FK_ProductComment_Product]
GO
