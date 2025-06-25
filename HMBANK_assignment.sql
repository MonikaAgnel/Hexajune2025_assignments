USE [HMBank]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 26-06-2025 00:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[account_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[account_type] [varchar](20) NULL,
	[balance] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 26-06-2025 00:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customer_id] [int] NOT NULL,
	[first_name] [varchar](100) NULL,
	[last_name] [varchar](100) NULL,
	[DOB] [date] NULL,
	[email] [varchar](255) NULL,
	[phone_number] [nvarchar](100) NULL,
	[address] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 26-06-2025 00:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[transaction_id] [int] NOT NULL,
	[account_id] [int] NULL,
	[transaction_type] [varchar](100) NULL,
	[amount] [decimal](18, 2) NULL,
	[transaction_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[transaction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
