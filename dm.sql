
ádasdasd
USE [SHONLINE]
GO
/****** Object:  Table [dbo].[City]    Script Date: 09/23/2014 09:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[FeeDelivery] [money] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 09/23/2014 09:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Description] [ntext] NOT NULL,
	[CategoryParent] [int] NOT NULL,
	[CategoryAlias] [nvarchar](200) NOT NULL,
	[HomePublic] [nvarchar](50) NOT NULL,
	[Possition] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CategoryParent], [CategoryAlias], [HomePublic], [Possition]) VALUES (1, N'Máy ?nh - Máy quay', N'Chuyên m?c máy ?nh, máy quay k? thu?t s?', 0, N'may-anh-may-quay', N'public', 0)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CategoryParent], [CategoryAlias], [HomePublic], [Possition]) VALUES (2, N'Điện thoại - Máy tính', N'Chuyên m?c di?n tho?i, máy tính', 0, N'dien-thoai-may-tinh', N'public', 1)
INSERT [dbo].[Categories] ([CategoryId], [CategoryName], [Description], [CategoryParent], [CategoryAlias], [HomePublic], [Possition]) VALUES (3, N'Loa - Âm thanh', N'Chuyên m?c thi?t b? nghe, loa', 0, N'loa-am-thanh', N'public', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
/****** Object:  Table [dbo].[Config]    Script Date: 09/23/2014 09:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [int] NOT NULL,
	[OptionName] [nvarchar](50) NOT NULL,
	[OptionValue] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 09/23/2014 09:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerUser] [nvarchar](50) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[City] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 09/23/2014 09:03:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Page]    Script Date: 09/23/2014 09:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[PageId] [int] NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Description] [ntext] NOT NULL,
	[PageContent] [ntext] NOT NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 09/23/2014 09:03:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[insertUserManager]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertUserManager](
@user nvarchar(50),
@fullname nvarchar(50),
@email nvarchar(50),
@password nvarchar(50),
@permission nvarchar(50)
) as
begin
insert into userUserManager (UserName
      ,Email
      ,PassWord
      ,Permission
      ,FullName) values(@user,@fullname,@email,@password,@permission)


end
GO
/****** Object:  Table [dbo].[UserManager]    Script Date: 09/23/2014 09:03:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[selectAllCoupon]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectAllCoupon]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CouponId,CouponCode,Value FROM Coupons
END
GO
/****** Object:  StoredProcedure [dbo].[selectALlConfig]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectALlConfig]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT Id,OptionName,OptionValue FROM Config
END
GO
/****** Object:  StoredProcedure [dbo].[updatePage]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updatePage]
@id int,
@title nvarchar(500),
@desc ntext,
@content ntext
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE Page SET Title = @title, Description = @desc, PageContent = @content WHERE PageId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[updateCustomer]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateCustomer](
@user nvarchar(50),
@name nvarchar(50),
@gender bit,
@email nvarchar(50),
@password nvarchar(50),
@phone nvarchar(50),
@address nvarchar(200),
@city nvarchar(200)
) as
begin
update Customer  set CustomerName = @name,Gender = @gender,Email = @email,PassWord = @password,Phone = @phone,Address = @address ,City = @city
where CustomerUser = @user   
end
GO
/****** Object:  StoredProcedure [dbo].[updateConfigByName]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateConfigByName]
@name nvarchar(50),
@value nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE Config SET OptionValue = @value WHERE OptionName = @name
END
GO
/****** Object:  StoredProcedure [dbo].[updateConfigById]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateConfigById]
@id int,
@name nvarchar(50),
@value nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE Config SET OptionName = @name, OptionValue = @value WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[updateCity]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateCity]
@id int,
@city nvarchar(50),
@fee money
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE City SET City = @city, FeeDelivery = @fee WHERE CityId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[updateCategory]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateCategory]
@id int,
@name nvarchar(50),
@desc text,
@parent int,
@alias nvarchar(200),
@published nvarchar(50),
@position int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Categories SET 
		CategoryName =@name, 
		Description = @desc, 
		CategoryParent = @parent, 
		CategoryAlias = @alias,
		HomePublic = @published,
		Possition = @position
	WHERE CategoryId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[selectUserManager]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectUserManager](
@user nvarchar(50)
) as
begin
SELECT  [UserName]
      ,[Email]
      ,[PassWord]
      ,[Permission]
      ,[FullName]
  FROM [SHONLINE].[dbo].[UserManager] 
  where  UserName = @user
end
GO
/****** Object:  StoredProcedure [dbo].[selectParentCategory]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectParentCategory]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CategoryId,CategoryName,Description,CategoryParent,CategoryAlias,HomePublic,Possition FROM Categories WHERE CategoryParent = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[selectPageByTitle]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectPageByTitle]
@title nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET @title = '%'+@title+'%'
    -- Insert statements for procedure here
	SELECT PageId,Title,Description,PageContent FROM Page WHERE Title like @title
END
GO
/****** Object:  StoredProcedure [dbo].[selectPageById]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectPageById]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT PageId,Title,Description,PageContent FROM Page WHERE PageId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[updateUserManager]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateUserManager](
@user nvarchar(50),
@fullname nvarchar(50),
@email nvarchar(50),
@password nvarchar(50),
@permission nvarchar(50)
) as
begin
update UserManager set
       Email = @email
      ,PassWord = @password
      ,Permission = @permission
      ,FullName = @fullname
	  where UserName = @user
end
GO
/****** Object:  StoredProcedure [dbo].[selectCustomer]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[selectCustomer] (@user nvarchar(50)) as
begin
select CustomerUser,CustomerName,Gender,Email,PassWord,Phone,Address,City from Customer where CustomerUser = @user ;
end
GO
/****** Object:  StoredProcedure [dbo].[selectCouponById]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectCouponById]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CouponId,CouponCode,Value FROM Coupons WHERE CouponId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[selectCouponByCode]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectCouponByCode]
@code nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CouponId,CouponCode,Value FROM Coupons WHERE CouponCode = @code
END
GO
/****** Object:  StoredProcedure [dbo].[selectConfigByName]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectConfigByName]
@name nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT Id,OptionName,OptionValue FROM Config WHERE OptionName = @name
END
GO
/****** Object:  StoredProcedure [dbo].[selectConfigById]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectConfigById]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT Id,OptionName,OptionValue FROM Config WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[insertPage]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertPage]
@title nvarchar(500),
@desc ntext,
@content ntext
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO Page(Title,Description,PageContent) VALUES(@title,@desc,@content)
END
GO
/****** Object:  StoredProcedure [dbo].[selectCityById]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectCityById]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CityId,City,FeeDelivery FROM City WHERE CityId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[selectChildCategory]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectChildCategory]
@parent int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CategoryId,CategoryName,Description,CategoryParent,CategoryAlias,HomePublic,Possition FROM Categories WHERE CategoryParent = @parent
END
GO
/****** Object:  StoredProcedure [dbo].[selectCategoryById]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectCategoryById]
@id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CategoryId,CategoryName,Description,CategoryParent,CategoryAlias,HomePublic,Possition FROM Categories WHERE CategoryId = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[selectCategoryByAlias]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectCategoryByAlias]
@alias nvarchar(200) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CategoryId,CategoryName,Description,CategoryParent,CategoryAlias,HomePublic,Possition FROM Categories WHERE CategoryAlias = @alias;
END
GO
/****** Object:  StoredProcedure [dbo].[selectAllPage]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectAllPage]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT PageId,Title,Description,PageContent FROM Page
END
GO
/****** Object:  StoredProcedure [dbo].[selectAllCity]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectAllCity]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CityId,City,FeeDelivery FROM City
END
GO
/****** Object:  StoredProcedure [dbo].[selectAllCategory]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectAllCategory]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CategoryId,CategoryName,Description,CategoryParent,CategoryAlias,HomePublic,Possition FROM Categories;
END
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09/23/2014 09:03:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[deleteCustomer]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteCustomer](
@user nvarchar(50)

) as
begin
delete from Customer where CustomerUser = @user ;
end
GO
/****** Object:  StoredProcedure [dbo].[deleteCouponById]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteCouponById]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Coupons WHERE CouponId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[deleteCouponByCode]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteCouponByCode]
@code nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Coupons WHERE CouponCode = @code
END
GO
/****** Object:  StoredProcedure [dbo].[deleteConfig]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteConfig]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE FROM Config WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[insertCustomer]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertCustomer](
@user nvarchar(50),
@name nvarchar(50),
@gender bit,
@email nvarchar(50),
@password nvarchar(50),
@phone nvarchar(50),
@address nvarchar(200),
@city nvarchar(200)
) as
begin
insert into Customer (CustomerUser,CustomerName,Gender,Email,PassWord,Phone,Address,City) values(@user,@name,@gender,@email,@password,@phone,@address,@city)


end
GO
/****** Object:  StoredProcedure [dbo].[insertCoupon]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertCoupon]
@code nvarchar(50),
@value float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Coupons(CouponCode,Value) VALUES(@code,@value) 
END
GO
/****** Object:  StoredProcedure [dbo].[deletePage]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deletePage]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE FROM Page WHERE PageId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[insertCity]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertCity]
@city nvarchar(50),
@fee money
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO City(City,FeeDelivery) VALUES(@city,@fee)
END
GO
/****** Object:  StoredProcedure [dbo].[insertCategory]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertCategory]
@name nvarchar(50),
@desc text,
@parent int,
@alias nvarchar(200),
@public nvarchar(50),
@position int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Categories(CategoryName,Description,CategoryParent,CategoryAlias,HomePublic,Possition) 
	VALUES(@name,@desc,@parent,@alias,@public,@position)
END
GO
/****** Object:  Table [dbo].[District]    Script Date: 09/23/2014 09:03:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[deleteUserManager]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteUserManager](
@user nvarchar(50)
) as
begin
delete from UserManager
  where  UserName = @user
end
GO
/****** Object:  StoredProcedure [dbo].[deleteCity]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteCity]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM City WHERE CityId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[deleteCategoryById]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteCategoryById]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Categories WHERE CategoryId = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[countCity]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[countCity]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(CityId) FROM City
END
GO
/****** Object:  StoredProcedure [dbo].[countChildCategory]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[countChildCategory]
@parent int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(CategoryId) FROM Categories WHERE CategoryParent=@parent
END
GO
/****** Object:  StoredProcedure [dbo].[countCategory]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[countCategory]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(CategoryId) FROM Categories
END
GO
/****** Object:  StoredProcedure [dbo].[countParentCategory]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[countParentCategory]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(CategoryId) FROM Categories WHERE CategoryParent=0
END
GO
/****** Object:  StoredProcedure [dbo].[countPage]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[countPage]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT COUNT(PageId) FROM Page
END
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 09/23/2014 09:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Contents] [text] NOT NULL,
	[CustomerUser] [nvarchar](50) NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[countDistrictByCity]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[countDistrictByCity]
@cityId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(DistrictId) FROM District WHERE CityId = @cityId
END
GO
/****** Object:  StoredProcedure [dbo].[countDistrict]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[countDistrict]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(DistrictId) FROM District
END
GO
/****** Object:  StoredProcedure [dbo].[countProduct]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[countProduct]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(ProductId) FROM Product
END
GO
/****** Object:  StoredProcedure [dbo].[deleteProduct]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<>
-- Create date: <19-09-2014>
-- Description:	deleteProduct
-- =============================================
CREATE PROCEDURE [dbo].[deleteProduct] 
	-- Add the parameters for the stored procedure here
	@ProductId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    delete from Product
    where ProductId = @ProductId
  end
GO
/****** Object:  StoredProcedure [dbo].[deleteDistrictByCity]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteDistrictByCity]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM District WHERE CityId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[deleteDistrict]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteDistrict]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM District WHERE DistrictId = @id
END
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 09/23/2014 09:03:49 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[selectAllDistrict]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectAllDistrict]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DistrictId,DistrictName,CityId FROM District
END
GO
/****** Object:  StoredProcedure [dbo].[insertProduct]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<>
-- Create date: <19-09-2014>
-- Description:	insertProduct
-- =============================================
create PROCEDURE [dbo].[insertProduct] 
	-- Add the parameters for the stored procedure here
	@ProductId int,
	@CategoryId int,
	@ProductName nvarchar(50),
	@SKU nvarchar(50),
	@Quantity int,
	@OriginalPrice money, 
	@Price money,
	@Description nvarchar(50),
	@Detail nvarchar(50),
	@Feature nvarchar(50),
	@Review nvarchar(50),
	@Alias nvarchar(50),
	@Published nvarchar(50),
	@ImageSource text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Product(CategoryId,ProductName,SKU,Quantity,OriginalPrice,Price,
    Description,Detail,Feature,Review,Alias,Published,ImageSource) 
    values(@CategoryId,@ProductName,@SKU,@Quantity,@OriginalPrice,@Price,@Description,@Detail,@Feature,@Review
    ,@Alias,@Published,@ImageSource)
END
GO
/****** Object:  StoredProcedure [dbo].[insertDistrict]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertDistrict]
@name nvarchar(50),
@cityId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO District(DistrictName,DistrictId) VALUES(@name,@cityId)
END
GO
/****** Object:  StoredProcedure [dbo].[updateProduct]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateProduct] 
	-- Add the parameters for the stored procedure here
	@ProductId int,
	@CategoryId int,
	@ProductName nvarchar(50),
	@SKU nvarchar(50),
	@Quantity int,
	@OriginalPrice money, 
	@Price money,
	@Description nvarchar(50),
	@Detail nvarchar(50),
	@Feature nvarchar(50),
	@Review nvarchar(50),
	@Alias nvarchar(50),
	@Published nvarchar(50),
	@ImageSource text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Product
	set CategoryId=@CategoryId,ProductName=@ProductName,SKU=@SKU,Quantity=@Quantity,OriginalPrice=@OriginalPrice,Price=@Price,
	Description=@Description,Detail=@Detail,Feature=@Feature,Review=@Review,Alias=@Alias,Published=@Published,ImageSource=@ImageSource
	where
	ProductId=@ProductId
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[selectDistrictDistrictId]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectDistrictDistrictId]
@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DistrictId,DistrictName,CityId FROM District WHERE DistrictId = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[selectDistrictByCityId]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectDistrictByCityId]
@cityId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DistrictId,DistrictName,CityId FROM District WHERE CityId = @cityId
END
GO
/****** Object:  StoredProcedure [dbo].[selectProductBySKU]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: <Create Date,,>
-- Description:	[getListProduct]
-- =============================================
CREATE PROCEDURE [dbo].[selectProductBySKU] 
@SKU nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET @SKU = '%'+@SKU+'%'
	Select 
	Product.ProductId,
	Product.CategoryId,
	Product.ProductName,
	Product.SKU,
	Product.Quantity,
	Product.OriginalPrice,
	Product.Price,
	Product.Description,
	Product.Detail,
	Product.Feature,
	Product.Review,
	Product.Alias,
	Product.Published,
	Product.ImageSource
	from  Product
	WHERE SKU like  @SKU;
END
GO
/****** Object:  StoredProcedure [dbo].[selectProductByName]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: <Create Date,,>
-- Description: [selectProductByName]
-- =============================================
create PROCEDURE [dbo].[selectProductByName] 
@name nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Select 
	Product.ProductId,
	Product.CategoryId,
	Product.ProductName,
	Product.SKU,
	Product.Quantity,
	Product.OriginalPrice,
	Product.Price,
	Product.Description,
	Product.Detail,
	Product.Feature,
	Product.Review,
	Product.Alias,
	Product.Published,
	Product.ImageSource
	from  Product
	WHERE ProductName = @name;
END
GO
/****** Object:  StoredProcedure [dbo].[selectProductById]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: <Create Date,,>
-- Description:	[getListProduct]
-- =============================================
create PROCEDURE [dbo].[selectProductById] 
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Select 
	Product.ProductId,
	Product.CategoryId,
	Product.ProductName,
	Product.SKU,
	Product.Quantity,
	Product.OriginalPrice,
	Product.Price,
	Product.Description,
	Product.Detail,
	Product.Feature,
	Product.Review,
	Product.Alias,
	Product.Published,
	Product.ImageSource
	from  Product
	WHERE ProductId = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[selectProductByCategory]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: <Create Date,,>
-- Description:	[getListProduct]
-- =============================================
create PROCEDURE [dbo].[selectProductByCategory] 
@Category int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Select 
	Product.ProductId,
	Product.CategoryId,
	Product.ProductName,
	Product.SKU,
	Product.Quantity,
	Product.OriginalPrice,
	Product.Price,
	Product.Description,
	Product.Detail,
	Product.Feature,
	Product.Review,
	Product.Alias,
	Product.Published,
	Product.ImageSource
	from  Product
	WHERE CategoryId = @Category;
END
GO
/****** Object:  StoredProcedure [dbo].[selectProduct]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		
-- Create date: <Create Date,,>
-- Description:	[getListProduct]
-- =============================================
CREATE PROCEDURE [dbo].[selectProduct] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	Select 
	Product.ProductId,
	Product.CategoryId,
	Product.ProductName,
	Product.SKU,
	Product.Quantity,
	Product.OriginalPrice,
	Product.Price,
	Product.Description,
	Product.Detail,
	Product.Feature,
	Product.Review,
	Product.Alias,
	Product.Published,
	Product.ImageSource
	from  Product
END
GO
/****** Object:  StoredProcedure [dbo].[selectAllComment]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectAllComment]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CommentId,Title,Contents,CustomerUser,ProductID FROM Comment
END
GO
/****** Object:  StoredProcedure [dbo].[selectCommentByUser]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectCommentByUser]
@user nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CommentId,Title,Contents,CustomerUser,ProductID FROM Comment WHERE CustomerUser = @user
END
GO
/****** Object:  StoredProcedure [dbo].[selectCommentByProductId]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectCommentByProductId]
@productId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CommentId,Title,Contents,CustomerUser,ProductID FROM Comment WHERE ProductID = @productId
END
GO
/****** Object:  StoredProcedure [dbo].[selectCommentById]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectCommentById]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CommentId,Title,Contents,CustomerUser,ProductID FROM Comment WHERE CommentId = @id
END
GO
/****** Object:  StoredProcedure [dbo].[insertComment]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertComment](
      @Title nvarchar(200)
      ,@contend text
      ,@CustomerId nvarchar(50)
      ,@ProductID int

) as
begin
insert into Comment( 
      Title
      ,contents
      ,CustomerUser
      ,ProductID) values(
      @Title 
      ,@contend 
      ,@CustomerId 
      ,@ProductID )


end
GO
/****** Object:  StoredProcedure [dbo].[deleteCommentbyUser]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteCommentbyUser](@User nvarchar(50))
as
delete from Comment where CustomerUser like @User
GO
/****** Object:  StoredProcedure [dbo].[deleteCommentbyProduct]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteCommentbyProduct](@IDProduct int)
as
delete from Comment where ProductID like @IDProduct
GO
/****** Object:  StoredProcedure [dbo].[deleteCommentbyID]    Script Date: 09/23/2014 09:03:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[deleteCommentbyID](@id int)
as
delete from Comment where CommentId like @id
GO
/****** Object:  Default [DF_Categories_CategoryParent]    Script Date: 09/23/2014 09:03:49 ******/
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_CategoryParent]  DEFAULT ((0)) FOR [CategoryParent]
GO
/****** Object:  Default [DF_Categories_HomePublic]    Script Date: 09/23/2014 09:03:49 ******/
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_HomePublic]  DEFAULT (N'public') FOR [HomePublic]
GO
/****** Object:  ForeignKey [FK_Comment_Product]    Script Date: 09/23/2014 09:03:49 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
/****** Object:  ForeignKey [FK_District_City]    Script Date: 09/23/2014 09:03:49 ******/
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_City]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Order]    Script Date: 09/23/2014 09:03:49 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Product]    Script Date: 09/23/2014 09:03:49 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
/****** Object:  ForeignKey [FK_Product_Categories]    Script Date: 09/23/2014 09:03:49 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categories]
GO
