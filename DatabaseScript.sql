USE [HEALTHCARE_FAMILY]
GO
/****** Object:  Table [dbo].[ACCOUNT_TYPE]    Script Date: 19/06/2016 7:36:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT_TYPE](
	[CategoryCode] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ACCOUNT_TYPE] PRIMARY KEY CLUSTERED 
(
	[CategoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APPOINTMENT_SCHEDULE]    Script Date: 19/06/2016 7:36:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APPOINTMENT_SCHEDULE](
	[Username] [nvarchar](100) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Partner_Username] [nvarchar](100) NULL,
	[Detail] [nvarchar](1000) NULL,
 CONSTRAINT [PK_APPOINTENT_SCHEDULE] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FOLLOWER_INFORMATION]    Script Date: 19/06/2016 7:36:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FOLLOWER_INFORMATION](
	[Username] [nvarchar](100) NOT NULL,
	[Follower_Username] [nvarchar](100) NOT NULL,
	[IsPermitAccessInfo] [bit] NULL,
	[Relationship] [nvarchar](100) NULL,
	[IsUserAccepted] [bit] NULL,
 CONSTRAINT [PK_FOLLOWER_INFORMATION] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[Follower_Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HEALTHCARE_INFORMATION]    Script Date: 19/06/2016 7:36:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HEALTHCARE_INFORMATION](
	[Username] [nvarchar](100) NOT NULL,
	[Time] [datetime] NOT NULL,
	[HeartBeat] [int] NULL,
	[Emotion] [nvarchar](100) NULL,
 CONSTRAINT [PK_HEALTHCARE_INFORMATION] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MESSAGE]    Script Date: 19/06/2016 7:36:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MESSAGE](
	[Sender_Username] [nvarchar](100) NOT NULL,
	[Receiver_Username] [nvarchar](100) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Detail] [nvarchar](1000) NULL,
 CONSTRAINT [PK_MESSAGE] PRIMARY KEY CLUSTERED 
(
	[Sender_Username] ASC,
	[Receiver_Username] ASC,
	[Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NOTIFICATION]    Script Date: 19/06/2016 7:36:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NOTIFICATION](
	[Username] [nvarchar](100) NOT NULL,
	[Time] [datetime] NOT NULL,
	[Follower_Username] [nvarchar](100) NOT NULL,
	[Detail] [nvarchar](1000) NULL,
 CONSTRAINT [PK_NOTIFICATION] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[Time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SHARING_INFORMATION]    Script Date: 19/06/2016 7:36:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHARING_INFORMATION](
	[Username] [nvarchar](100) NOT NULL,
	[FollowerUsername] [nvarchar](100) NOT NULL,
	[IsPermitAccessInfo] [bit] NULL,
 CONSTRAINT [PK_SHARING_INFORMATION] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[FollowerUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER_INFORMATION]    Script Date: 19/06/2016 7:36:22 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USER_INFORMATION](
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[Birthday] [datetime] NULL,
	[Gender] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Avatar] [varbinary](max) NULL,
	[AccountType] [nvarchar](50) NULL,
	[IsOnline] [bit] NULL,
 CONSTRAINT [PK_THONGTINUSER] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ACCOUNT_TYPE] ([CategoryCode], [Name]) VALUES (N'HC02', N'Doctor')
INSERT [dbo].[ACCOUNT_TYPE] ([CategoryCode], [Name]) VALUES (N'HC03', N'Family')
INSERT [dbo].[APPOINTMENT_SCHEDULE] ([Username], [Time], [Partner_Username], [Detail]) VALUES (N'admin', CAST(N'2016-01-10 00:00:00.000' AS DateTime), N'ThanhPhong', N'abc')
INSERT [dbo].[APPOINTMENT_SCHEDULE] ([Username], [Time], [Partner_Username], [Detail]) VALUES (N'admin', CAST(N'2016-01-16 00:00:00.000' AS DateTime), N'TheVinh', N'abc')
INSERT [dbo].[FOLLOWER_INFORMATION] ([Username], [Follower_Username], [IsPermitAccessInfo], [Relationship], [IsUserAccepted]) VALUES (N'admin', N'ThanhPhong', 1, N'Doctor', 1)
INSERT [dbo].[FOLLOWER_INFORMATION] ([Username], [Follower_Username], [IsPermitAccessInfo], [Relationship], [IsUserAccepted]) VALUES (N'admin', N'TheVinh', 0, N'Family', 0)
INSERT [dbo].[HEALTHCARE_INFORMATION] ([Username], [Time], [HeartBeat], [Emotion]) VALUES (N'admin', CAST(N'2015-12-10 00:00:00.000' AS DateTime), 80, N'Happy')
INSERT [dbo].[HEALTHCARE_INFORMATION] ([Username], [Time], [HeartBeat], [Emotion]) VALUES (N'admin', CAST(N'2015-12-11 00:00:00.000' AS DateTime), 80, N'Happy')
INSERT [dbo].[HEALTHCARE_INFORMATION] ([Username], [Time], [HeartBeat], [Emotion]) VALUES (N'admin', CAST(N'2016-01-17 00:00:00.000' AS DateTime), 80, N'Sad')
INSERT [dbo].[HEALTHCARE_INFORMATION] ([Username], [Time], [HeartBeat], [Emotion]) VALUES (N'admin', CAST(N'2016-10-01 00:00:00.000' AS DateTime), 80, N'Sad')
INSERT [dbo].[HEALTHCARE_INFORMATION] ([Username], [Time], [HeartBeat], [Emotion]) VALUES (N'TheVinh', CAST(N'2015-01-17 00:00:00.000' AS DateTime), 80, N'Sad')
INSERT [dbo].[MESSAGE] ([Sender_Username], [Receiver_Username], [Time], [Detail]) VALUES (N'admin', N'ThanhPhong', CAST(N'2016-01-16 00:00:00.000' AS DateTime), N'Hello')
INSERT [dbo].[MESSAGE] ([Sender_Username], [Receiver_Username], [Time], [Detail]) VALUES (N'ThanhPhong', N'admin', CAST(N'2016-01-17 00:00:00.000' AS DateTime), N'Hi')
INSERT [dbo].[NOTIFICATION] ([Username], [Time], [Follower_Username], [Detail]) VALUES (N'admin', CAST(N'2016-01-16 00:00:00.000' AS DateTime), N'ThanhPhong', N'Hello')
INSERT [dbo].[NOTIFICATION] ([Username], [Time], [Follower_Username], [Detail]) VALUES (N'admin', CAST(N'2016-01-17 00:00:00.000' AS DateTime), N'TheVinh', N'Hi')
INSERT [dbo].[SHARING_INFORMATION] ([Username], [FollowerUsername], [IsPermitAccessInfo]) VALUES (N'admin', N'ThanhPhong', 1)
INSERT [dbo].[USER_INFORMATION] ([Username], [Password], [Name], [Birthday], [Gender], [Email], [Avatar], [AccountType], [IsOnline]) VALUES (N'admin', N'admin', N'Tran Thanh Phong', CAST(N'1995-08-26 00:00:00.000' AS DateTime), N'Male', N'ttphong2608@gmail.com', NULL, N'HC03', 0)
INSERT [dbo].[USER_INFORMATION] ([Username], [Password], [Name], [Birthday], [Gender], [Email], [Avatar], [AccountType], [IsOnline]) VALUES (N'someone', N'someone', N'ThanhPhong', CAST(N'1995-01-17 00:00:00.000' AS DateTime), N'Female', N'someone@gmail.com', NULL, N'HC02', 0)
INSERT [dbo].[USER_INFORMATION] ([Username], [Password], [Name], [Birthday], [Gender], [Email], [Avatar], [AccountType], [IsOnline]) VALUES (N'ThanhPhong', N'ThanhPhong', N'Tran Thanh Phong', CAST(N'2016-09-01 00:00:00.000' AS DateTime), N'Male', N'ThanhPhong@gmail.com', NULL, N'HC02', 0)
INSERT [dbo].[USER_INFORMATION] ([Username], [Password], [Name], [Birthday], [Gender], [Email], [Avatar], [AccountType], [IsOnline]) VALUES (N'TheVinh', N'TheVinh', N'Nguyen The Vinh', CAST(N'1997-08-16 00:00:00.000' AS DateTime), N'Male', N'TheVinh@gmail.com', NULL, N'HC03', 0)
ALTER TABLE [dbo].[APPOINTMENT_SCHEDULE]  WITH CHECK ADD  CONSTRAINT [FK_APPOINTMENT_SCHEDULE_USER_INFORMATION2] FOREIGN KEY([Username])
REFERENCES [dbo].[USER_INFORMATION] ([Username])
GO
ALTER TABLE [dbo].[APPOINTMENT_SCHEDULE] CHECK CONSTRAINT [FK_APPOINTMENT_SCHEDULE_USER_INFORMATION2]
GO
ALTER TABLE [dbo].[APPOINTMENT_SCHEDULE]  WITH CHECK ADD  CONSTRAINT [FK_APPOINTMENT_SCHEDULE_USER_INFORMATION3] FOREIGN KEY([Partner_Username])
REFERENCES [dbo].[USER_INFORMATION] ([Username])
GO
ALTER TABLE [dbo].[APPOINTMENT_SCHEDULE] CHECK CONSTRAINT [FK_APPOINTMENT_SCHEDULE_USER_INFORMATION3]
GO
ALTER TABLE [dbo].[FOLLOWER_INFORMATION]  WITH CHECK ADD  CONSTRAINT [FK_FOLLOWER_INFORMATION_USER_INFORMATION] FOREIGN KEY([Username])
REFERENCES [dbo].[USER_INFORMATION] ([Username])
GO
ALTER TABLE [dbo].[FOLLOWER_INFORMATION] CHECK CONSTRAINT [FK_FOLLOWER_INFORMATION_USER_INFORMATION]
GO
ALTER TABLE [dbo].[FOLLOWER_INFORMATION]  WITH CHECK ADD  CONSTRAINT [FK_FOLLOWER_INFORMATION_USER_INFORMATION1] FOREIGN KEY([Follower_Username])
REFERENCES [dbo].[USER_INFORMATION] ([Username])
GO
ALTER TABLE [dbo].[FOLLOWER_INFORMATION] CHECK CONSTRAINT [FK_FOLLOWER_INFORMATION_USER_INFORMATION1]
GO
ALTER TABLE [dbo].[HEALTHCARE_INFORMATION]  WITH CHECK ADD  CONSTRAINT [FK_HEALTHCARE_INFORMATION_USER_INFOMATION] FOREIGN KEY([Username])
REFERENCES [dbo].[USER_INFORMATION] ([Username])
GO
ALTER TABLE [dbo].[HEALTHCARE_INFORMATION] CHECK CONSTRAINT [FK_HEALTHCARE_INFORMATION_USER_INFOMATION]
GO
ALTER TABLE [dbo].[MESSAGE]  WITH CHECK ADD  CONSTRAINT [FK_MESSAGE_USER_INFORMATION] FOREIGN KEY([Sender_Username])
REFERENCES [dbo].[USER_INFORMATION] ([Username])
GO
ALTER TABLE [dbo].[MESSAGE] CHECK CONSTRAINT [FK_MESSAGE_USER_INFORMATION]
GO
ALTER TABLE [dbo].[MESSAGE]  WITH CHECK ADD  CONSTRAINT [FK_MESSAGE_USER_INFORMATION1] FOREIGN KEY([Receiver_Username])
REFERENCES [dbo].[USER_INFORMATION] ([Username])
GO
ALTER TABLE [dbo].[MESSAGE] CHECK CONSTRAINT [FK_MESSAGE_USER_INFORMATION1]
GO
ALTER TABLE [dbo].[NOTIFICATION]  WITH CHECK ADD  CONSTRAINT [FK_NOTIFICATION_USER_INFORMATION] FOREIGN KEY([Username])
REFERENCES [dbo].[USER_INFORMATION] ([Username])
GO
ALTER TABLE [dbo].[NOTIFICATION] CHECK CONSTRAINT [FK_NOTIFICATION_USER_INFORMATION]
GO
ALTER TABLE [dbo].[NOTIFICATION]  WITH CHECK ADD  CONSTRAINT [FK_NOTIFICATION_USER_INFORMATION1] FOREIGN KEY([Follower_Username])
REFERENCES [dbo].[USER_INFORMATION] ([Username])
GO
ALTER TABLE [dbo].[NOTIFICATION] CHECK CONSTRAINT [FK_NOTIFICATION_USER_INFORMATION1]
GO
ALTER TABLE [dbo].[SHARING_INFORMATION]  WITH CHECK ADD  CONSTRAINT [FK_SHARING_INFORMATION_USER_INFORMATION] FOREIGN KEY([Username])
REFERENCES [dbo].[USER_INFORMATION] ([Username])
GO
ALTER TABLE [dbo].[SHARING_INFORMATION] CHECK CONSTRAINT [FK_SHARING_INFORMATION_USER_INFORMATION]
GO
ALTER TABLE [dbo].[SHARING_INFORMATION]  WITH CHECK ADD  CONSTRAINT [FK_SHARING_INFORMATION_USER_INFORMATION1] FOREIGN KEY([FollowerUsername])
REFERENCES [dbo].[USER_INFORMATION] ([Username])
GO
ALTER TABLE [dbo].[SHARING_INFORMATION] CHECK CONSTRAINT [FK_SHARING_INFORMATION_USER_INFORMATION1]
GO
ALTER TABLE [dbo].[USER_INFORMATION]  WITH CHECK ADD  CONSTRAINT [FK_USER_INFOMATION_ACCOUNT_TYPE] FOREIGN KEY([AccountType])
REFERENCES [dbo].[ACCOUNT_TYPE] ([CategoryCode])
GO
ALTER TABLE [dbo].[USER_INFORMATION] CHECK CONSTRAINT [FK_USER_INFOMATION_ACCOUNT_TYPE]
GO
