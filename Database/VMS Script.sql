USE [master]
GO
/****** Object:  Database [VMS]    Script Date: 4/30/2020 5:48:26 PM ******/
CREATE DATABASE [VMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\VMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\VMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VMS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [VMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VMS] SET  MULTI_USER 
GO
ALTER DATABASE [VMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VMS] SET QUERY_STORE = OFF
GO
USE [VMS]
GO
/****** Object:  Table [dbo].[ESL]    Script Date: 4/30/2020 5:48:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESL](
	[EslId] [int] IDENTITY(1,1) NOT NULL,
	[SystemName] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[Domain] [nvarchar](50) NULL,
	[Environment] [nvarchar](50) NULL,
	[GeneralNotes] [nvarchar](max) NULL,
	[SystemDescription] [nvarchar](max) NULL,
	[SystemStaus] [nvarchar](50) NULL,
	[DCOwner] [nvarchar](50) NULL,
	[AliasIPName] [nvarchar](50) NULL,
	[IPAddress] [nvarchar](50) NULL,
	[ConsoleIP] [nvarchar](50) NULL,
	[BusinessDescription] [nvarchar](max) NULL,
	[PrimaryOwner] [int] NULL,
	[SecondaryOwner] [int] NULL,
	[TertiaryOwner] [int] NULL,
 CONSTRAINT [PK_ESL] PRIMARY KEY CLUSTERED 
(
	[EslId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/30/2020 5:48:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servers]    Script Date: 4/30/2020 5:48:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servers](
	[ServerId] [int] IDENTITY(1,1) NOT NULL,
	[ServerName] [nvarchar](50) NULL,
	[TeamId] [int] NULL,
	[OldOrNew] [nvarchar](10) NULL,
	[PrimaryOwner] [int] NULL,
	[SecondaryOwner] [int] NULL,
	[TertairyOwnder] [int] NULL,
 CONSTRAINT [PK_Servers] PRIMARY KEY CLUSTERED 
(
	[ServerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 4/30/2020 5:48:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](50) NULL,
	[TeamDL] [nvarchar](100) NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/30/2020 5:48:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[EmailId] [nvarchar](100) NULL,
	[Phone] [nvarchar](30) NULL,
	[SecondaryPhone] [nvarchar](30) NULL,
	[UserName] [nvarchar](50) NULL,
	[TeamId] [int] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vulnerability]    Script Date: 4/30/2020 5:48:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vulnerability](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UniqueKey] [nvarchar](100) NULL,
	[SnowTicket] [nvarchar](50) NULL,
	[OwnerTeam] [nvarchar](50) NULL,
	[TreatmentPlan] [nvarchar](50) NULL,
	[RemediationTeam] [nvarchar](50) NULL,
	[RemediationDate] [date] NULL,
	[RemediationPlan] [nvarchar](50) NULL,
	[RemediationApproval] [nvarchar](50) NULL,
	[Exemption] [nvarchar](50) NULL,
	[AddedDate] [date] NULL,
	[CombinedCVSSScore] [nvarchar](20) NULL,
	[BOQSeverity] [nvarchar](20) NULL,
	[Patchable] [nvarchar](50) NULL,
	[IPSystemName] [nvarchar](50) NULL,
	[IPHostName] [nvarchar](50) NULL,
	[IPSystemStatus] [nvarchar](50) NULL,
	[MatchHostName] [nvarchar](20) NULL,
	[NHSystemStatus] [nvarchar](50) NULL,
	[MatchNetwork] [nvarchar](50) NULL,
	[NetName] [nvarchar](50) NULL,
	[NetHostName] [nvarchar](50) NULL,
	[NetStep] [nvarchar](50) NULL,
	[HostName] [nvarchar](50) NULL,
	[SystemName] [nvarchar](50) NULL,
	[SystemStatus] [nvarchar](50) NULL,
	[DxcManaged] [nvarchar](50) NULL,
	[Duplicated] [nvarchar](30) NULL,
	[IP] [nvarchar](50) NULL,
	[DNS] [nvarchar](50) NULL,
	[NetBIOS] [nvarchar](50) NULL,
	[OS] [nvarchar](100) NULL,
	[IPStatus] [nvarchar](100) NULL,
	[QID] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Type] [nvarchar](50) NULL,
	[Severity] [int] NULL,
	[Port] [int] NULL,
	[Protocol] [nvarchar](20) NULL,
	[FQDN] [nvarchar](50) NULL,
	[SSL] [nvarchar](50) NULL,
	[CVEID] [nvarchar](50) NULL,
	[VendorReference] [nvarchar](50) NULL,
	[BugtraqID] [nvarchar](50) NULL,
	[CVSSBase] [nvarchar](100) NULL,
	[CVSSTemporal1] [nvarchar](100) NULL,
	[CVSS3Base] [nvarchar](100) NULL,
	[CVSS3Temporal1] [nvarchar](100) NULL,
	[Threat] [nvarchar](max) NULL,
	[Impact] [nvarchar](max) NULL,
	[Solution] [nvarchar](max) NULL,
	[Exploitability] [nvarchar](max) NULL,
	[AssociatedMalware] [nvarchar](max) NULL,
	[Results] [nvarchar](max) NULL,
	[PCIVuln] [nvarchar](max) NULL,
	[Instance] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[ResultErrors] [nvarchar](max) NULL,
	[ResultBug] [nvarchar](max) NULL,
	[TeamId] [int] NULL,
	[RemediationRemarks] [nvarchar](max) NULL,
	[AuthStatus] [nvarchar](50) NULL,
	[VulnerabilityUploadDataID] [int] NULL,
 CONSTRAINT [PK_Vulnerability] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VulnerabilityAssignment]    Script Date: 4/30/2020 5:48:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VulnerabilityAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AssignedByTeam] [int] NOT NULL,
	[AssignedByUser] [nvarchar](50) NULL,
	[AssignedToTeam] [int] NULL,
	[VulnerabilityId] [int] NULL,
 CONSTRAINT [PK_VulnerabilityAssignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VulnerabilityComment]    Script Date: 4/30/2020 5:48:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VulnerabilityComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VulnerabilityId] [int] NULL,
	[VulnerabilityVersion] [nvarchar](50) NULL,
	[Comment] [nvarchar](max) NULL,
	[Date] [date] NULL,
	[CreatedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_VulnerabilityComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VulnerabilityFollowUp]    Script Date: 4/30/2020 5:48:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VulnerabilityFollowUp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VulnerabilityId] [int] NULL,
	[VulnerabilityVersion] [nvarchar](50) NULL,
	[ExpiryDate] [date] NULL,
	[TeamId] [int] NULL,
	[LastFollowUpDate] [date] NULL,
	[FollowUpId] [int] NULL,
 CONSTRAINT [PK_VulnerabilityFollowUp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VulnerabilityUploadData]    Script Date: 4/30/2020 5:48:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VulnerabilityUploadData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UploadedBy] [nvarchar](50) NULL,
	[UploadedDate] [date] NULL,
	[Path] [nvarchar](max) NULL,
	[Fields] [nvarchar](50) NULL,
	[RecordCount] [int] NULL,
	[IsProcessed] [bit] NULL,
	[IsMailSend] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_VulnerabilityUploadData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ESL]  WITH CHECK ADD  CONSTRAINT [FK_ESL_PrimaryOwner_Team] FOREIGN KEY([PrimaryOwner])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[ESL] CHECK CONSTRAINT [FK_ESL_PrimaryOwner_Team]
GO
ALTER TABLE [dbo].[ESL]  WITH CHECK ADD  CONSTRAINT [FK_ESL_SecondaryOwner_Team] FOREIGN KEY([SecondaryOwner])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[ESL] CHECK CONSTRAINT [FK_ESL_SecondaryOwner_Team]
GO
ALTER TABLE [dbo].[ESL]  WITH CHECK ADD  CONSTRAINT [FK_ESL_TertiaryOwner_Team] FOREIGN KEY([TertiaryOwner])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[ESL] CHECK CONSTRAINT [FK_ESL_TertiaryOwner_Team]
GO
ALTER TABLE [dbo].[Servers]  WITH CHECK ADD  CONSTRAINT [FK_Servers_PrimaryOwner_Team] FOREIGN KEY([PrimaryOwner])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Servers] CHECK CONSTRAINT [FK_Servers_PrimaryOwner_Team]
GO
ALTER TABLE [dbo].[Servers]  WITH CHECK ADD  CONSTRAINT [FK_Servers_SecondryOwnder_Team] FOREIGN KEY([SecondaryOwner])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Servers] CHECK CONSTRAINT [FK_Servers_SecondryOwnder_Team]
GO
ALTER TABLE [dbo].[Servers]  WITH CHECK ADD  CONSTRAINT [FK_Servers_TertairyOwner_Team] FOREIGN KEY([TertairyOwnder])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Servers] CHECK CONSTRAINT [FK_Servers_TertairyOwner_Team]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Team]
GO
ALTER TABLE [dbo].[Vulnerability]  WITH CHECK ADD  CONSTRAINT [FK_Vulnerability_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Vulnerability] CHECK CONSTRAINT [FK_Vulnerability_Team]
GO
ALTER TABLE [dbo].[Vulnerability]  WITH CHECK ADD  CONSTRAINT [FK_Vulnerability_VulnerabilityUploadData] FOREIGN KEY([VulnerabilityUploadDataID])
REFERENCES [dbo].[VulnerabilityUploadData] ([Id])
GO
ALTER TABLE [dbo].[Vulnerability] CHECK CONSTRAINT [FK_Vulnerability_VulnerabilityUploadData]
GO
ALTER TABLE [dbo].[VulnerabilityAssignment]  WITH CHECK ADD  CONSTRAINT [FK_VulnerabilityAssignment_Vulnerability] FOREIGN KEY([VulnerabilityId])
REFERENCES [dbo].[Vulnerability] ([Id])
GO
ALTER TABLE [dbo].[VulnerabilityAssignment] CHECK CONSTRAINT [FK_VulnerabilityAssignment_Vulnerability]
GO
ALTER TABLE [dbo].[VulnerabilityAssignment]  WITH CHECK ADD  CONSTRAINT [FK_VulnerabilityAssignmentByTeam_Team] FOREIGN KEY([AssignedByTeam])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[VulnerabilityAssignment] CHECK CONSTRAINT [FK_VulnerabilityAssignmentByTeam_Team]
GO
ALTER TABLE [dbo].[VulnerabilityAssignment]  WITH CHECK ADD  CONSTRAINT [FK_VulnerabilityAssignmentToTeam_Team] FOREIGN KEY([AssignedToTeam])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[VulnerabilityAssignment] CHECK CONSTRAINT [FK_VulnerabilityAssignmentToTeam_Team]
GO
ALTER TABLE [dbo].[VulnerabilityComment]  WITH CHECK ADD  CONSTRAINT [FK_VulnerabilityComment_Vulnerability] FOREIGN KEY([VulnerabilityId])
REFERENCES [dbo].[Vulnerability] ([Id])
GO
ALTER TABLE [dbo].[VulnerabilityComment] CHECK CONSTRAINT [FK_VulnerabilityComment_Vulnerability]
GO
ALTER TABLE [dbo].[VulnerabilityFollowUp]  WITH CHECK ADD  CONSTRAINT [FK_VulnerabilityFollowUp_Vulnerability] FOREIGN KEY([VulnerabilityId])
REFERENCES [dbo].[Vulnerability] ([Id])
GO
ALTER TABLE [dbo].[VulnerabilityFollowUp] CHECK CONSTRAINT [FK_VulnerabilityFollowUp_Vulnerability]
GO
USE [master]
GO
ALTER DATABASE [VMS] SET  READ_WRITE 
GO
