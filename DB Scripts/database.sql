USE [master]
GO
/****** Object:  Database [OCM]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE DATABASE [OCM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OCM', FILENAME = N'D:\MyData\NHLP\NHLP Systems\copy&OCM\Database\OCM.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OCM_log', FILENAME = N'D:\MyData\NHLP\NHLP Systems\copy&OCM\Database\OCM_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OCM] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OCM].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [OCM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OCM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OCM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OCM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OCM] SET ARITHABORT OFF 
GO
ALTER DATABASE [OCM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OCM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OCM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OCM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OCM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OCM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OCM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OCM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OCM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OCM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OCM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OCM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OCM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OCM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OCM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OCM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OCM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OCM] SET RECOVERY FULL 
GO
ALTER DATABASE [OCM] SET  MULTI_USER 
GO
ALTER DATABASE [OCM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OCM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OCM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OCM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OCM', N'ON'
GO
USE [OCM]
GO
/****** Object:  DatabaseRole [aspnet_WebEvent_FullAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_ReportingAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_FullAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_Roles_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Roles_BasicAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_ReportingAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_FullAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_Profile_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Profile_BasicAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_ReportingAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_FullAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Personalization_BasicAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_ReportingAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_FullAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_Membership_FullAccess]
GO
/****** Object:  DatabaseRole [aspnet_Membership_BasicAccess]    Script Date: 4/15/2022 10:58:01 PM ******/
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
ALTER ROLE [aspnet_Roles_BasicAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Roles_ReportingAccess] ADD MEMBER [aspnet_Roles_FullAccess]
GO
ALTER ROLE [aspnet_Profile_BasicAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Profile_ReportingAccess] ADD MEMBER [aspnet_Profile_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_BasicAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Personalization_ReportingAccess] ADD MEMBER [aspnet_Personalization_FullAccess]
GO
ALTER ROLE [aspnet_Membership_BasicAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
ALTER ROLE [aspnet_Membership_ReportingAccess] ADD MEMBER [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aspnet_Applications_Index]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications]
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aspnet_Membership_index]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership]
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aspnet_Paths_index]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths]
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_index1]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aspnet_Roles_index1]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles]
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_UserProvince]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UserProvince](
	[UserID] [nvarchar](200) NOT NULL,
	[ProvinceID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [aspnet_Users_Index]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_District]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_District](
	[DistrictID] [int] NOT NULL,
	[DistrictEngName] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_FemaleH02bAdopOfImprovedKGP]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_FemaleH02bAdopOfImprovedKGP](
	[FemalHFormID] [varchar](50) NULL,
	[PracticeID] [int] NULL,
	[Recieved] [bit] NULL,
	[Application] [int] NULL,
	[Usefullness] [int] NULL,
	[Understood] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_FemaleH02bAdopOfImprovedMP]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_FemaleH02bAdopOfImprovedMP](
	[FemalHFormID] [varchar](50) NULL,
	[PracticeID] [int] NULL,
	[Recieved] [bit] NULL,
	[Application] [int] NULL,
	[Usefullness] [int] NULL,
	[Understood] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_FemaleH02bFamilyComposition]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_FemaleH02bFamilyComposition](
	[FemalHFormID] [varchar](50) NULL,
	[NameOfFamilyHead] [nvarchar](50) NULL,
	[FName] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[TotalFamilyMembers] [int] NULL,
	[MaleFamilyMembers] [int] NULL,
	[FemaleFamilyMembers] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_FemaleH02bGeneralInfo]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_FemaleH02bGeneralInfo](
	[FemalHFormID] [varchar](50) NULL,
	[TotalFarmArea] [decimal](18, 0) NULL,
	[Irrigated] [decimal](18, 0) NULL,
	[Rainfed] [decimal](18, 0) NULL,
	[ISFruitOrchard] [bit] NULL,
	[OrchardArea] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_FemaleH02bKGProductionAndProductUses]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_FemaleH02bKGProductionAndProductUses](
	[FemalHFormID] [varchar](50) NULL,
	[ProductID] [int] NULL,
	[SeedPlanted] [decimal](18, 0) NULL,
	[PlantedArea] [decimal](18, 0) NULL,
	[YieldHarvest] [decimal](18, 0) NULL,
	[KGSold] [int] NULL,
	[Price] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_FemaleH02bNHLPDevServices]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_FemaleH02bNHLPDevServices](
	[FemalHFormID] [varchar](50) NULL,
	[ServiceID] [int] NULL,
	[Recieved] [bit] NULL,
	[LevelOfSatisfication] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_FemaleH02bSelfSustained]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_FemaleH02bSelfSustained](
	[FemalHFormID] [varchar](50) NULL,
	[HasKGContinued] [bit] NULL,
	[KGReason] [nvarchar](50) NULL,
	[KGWayPurchased] [bit] NULL,
	[KGWayPrdByself] [bit] NULL,
	[KGWayByProj] [bit] NULL,
	[KGWayNHLP] [bit] NULL,
	[KGOtherMethod] [nvarchar](50) NULL,
	[HasMGHContinued] [bit] NULL,
	[MGHReason] [nvarchar](50) NULL,
	[MGHWayPurchased] [bit] NULL,
	[MGHWayPrdByself] [bit] NULL,
	[MGHWayByProj] [bit] NULL,
	[MGHWayNHLP] [bit] NULL,
	[MGHOtherMethod] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_FemaleH02bSocialProblem]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_FemaleH02bSocialProblem](
	[FemalHFormID] [varchar](50) NULL,
	[FarmerRemarks] [nvarchar](200) NULL,
	[InterviewerRemarks] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_FemalH02bDetailForm]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_FemalH02bDetailForm](
	[FemalHFormID] [varchar](50) NOT NULL,
	[NameOfInterviewee] [nvarchar](50) NOT NULL,
	[DistrictID] [int] NOT NULL,
	[ProvinceID] [int] NULL,
	[Year] [int] NULL,
	[SampleGroupType1] [bit] NULL,
	[SampleGroupType2] [bit] NULL,
	[NameOfVillage] [nvarchar](50) NULL,
	[InterviewDate] [nvarchar](50) NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[Interviewer] [nvarchar](50) NULL,
	[UserId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_FemalHDetailForm] PRIMARY KEY CLUSTERED 
(
	[FemalHFormID] ASC,
	[NameOfInterviewee] ASC,
	[DistrictID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_LKP_ETrainingResult]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_LKP_ETrainingResult](
	[ETResultID] [int] NULL,
	[Result] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_LKP_Gender]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_LKP_Gender](
	[GenderID] [int] NULL,
	[Gender] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_LKP_Products]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_LKP_Products](
	[ProductID] [int] NOT NULL,
	[ProductNameEng] [varchar](50) NULL,
	[ProductName] [nvarchar](50) NULL,
 CONSTRAINT [PK_OCM_LKP_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_LKP_Service]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_LKP_Service](
	[ServiceID] [int] NULL,
	[Service] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_Province]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_Province](
	[ProvinceID] [int] NULL,
	[ProvinceEngName] [nvarchar](50) NULL,
	[Region] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OCM_Region]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OCM_Region](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[userID] [int] NULL,
 CONSTRAINT [PK___region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'OCM', N'ocm', N'34764d90-4054-47ea-ab95-17c5d32a6136', NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'f2a59670-20f2-436f-96c5-4a68572b13cd', N'FqK8j88sdQwwt8VGJ0KSsJYibmw=', 1, N'SpRvvrkh6zS7Tlu4z9cNVA==', NULL, N'123@hh.kk', N'123@hh.kk', N'kj', N'N0Qai5+/sEGzOwgj5ABV5eZm4cE=', 1, 0, CAST(N'2016-12-20T10:35:35.000' AS DateTime), CAST(N'2016-12-20T10:35:35.000' AS DateTime), CAST(N'2016-12-20T10:35:35.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'5b58c8c8-1c33-410b-bdc5-a9b9502f01a1', N'xtaRwvLVrJo9i5R2+P7SpjGinl4=', 1, N'cIAODy7KiGnJ+VSmxAKe9A==', NULL, N'ali@kk.com', N'ali@kk.com', NULL, NULL, 1, 0, CAST(N'2015-12-29T15:56:02.000' AS DateTime), CAST(N'2015-12-30T09:36:06.567' AS DateTime), CAST(N'2015-12-29T15:56:02.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'5fba0ace-dc82-4bee-838e-24488bf6ce54', N't877VWNp1mSPkvXezvmw6oLkAuQ=', 1, N'SEqj/lYzMMOosRpHJYgRzQ==', NULL, N'asd@sd.com', N'asd@sd.com', N'khan', N'PfE1A2Av8axTpiALRmte4OBWAKo=', 1, 0, CAST(N'2015-12-29T16:04:15.000' AS DateTime), CAST(N'2016-11-17T06:36:05.167' AS DateTime), CAST(N'2015-12-29T16:04:15.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2016-11-26T04:32:58.337' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'c4b38c5d-3b61-47ee-a852-25418b6b5aa9', N't877VWNp1mSPkvXezvmw6oLkAuQ=', 1, N'SEqj/lYzMMOosRpHJYgRzQ==', NULL, N'jan@jan.com', N'jan@jan.com', N'jan', N'BzeKxHKo8V5vv8XRm7BOzFaiDvM=', 1, 0, CAST(N'2015-12-29T15:41:38.000' AS DateTime), CAST(N'2017-02-14T15:58:40.920' AS DateTime), CAST(N'2015-12-29T15:41:38.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'afe24e5b-e2b9-4908-b524-93a8c988922c', N'ZGv0j/BkXGrsu7VbGVKtIHZMVII=', 1, N'ujN24/7LnS50yDFGaeMSXQ==', NULL, N'jan@jj.com', N'jan@jj.com', NULL, NULL, 1, 0, CAST(N'2017-02-14T15:28:53.000' AS DateTime), CAST(N'2017-02-14T15:29:12.007' AS DateTime), CAST(N'2017-02-14T15:28:53.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'3d1573ae-500d-4bb6-93ae-5cb8f3d18c00', N't877VWNp1mSPkvXezvmw6oLkAuQ=', 1, N'SEqj/lYzMMOosRpHJYgRzQ==', NULL, N'jj@kk.com', N'jj@kk.com', N'jj', N'YP40biyXgEJmgKn/cUyGaJ5NkNc=', 1, 0, CAST(N'2015-12-29T17:48:10.000' AS DateTime), CAST(N'2015-12-30T06:04:54.353' AS DateTime), CAST(N'2015-12-29T17:48:10.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'9a988173-0f41-4a7b-b011-9367291104c2', N'czj2ioGwV9AOl355unYan8NQP4A=', 1, N'pW0HahWRjltBIZeHclPM4w==', NULL, N'khan@gmail.com', N'khan@gmail.com', N'name', N'czj2ioGwV9AOl355unYan8NQP4A=', 1, 0, CAST(N'2016-11-01T04:24:17.000' AS DateTime), CAST(N'2017-01-06T04:00:42.513' AS DateTime), CAST(N'2016-11-01T04:24:17.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'a0eeda4c-5804-43ea-bfd4-a770e69101af', N'bXsfX0kvcquuctq4iEdgrz0osVc=', 1, N'0/WEZQYPLaY0tigZcMQ33Q==', NULL, N'kj@df.com', N'kj@df.com', NULL, NULL, 1, 0, CAST(N'2015-12-29T15:01:54.000' AS DateTime), CAST(N'2016-10-10T05:56:01.883' AS DateTime), CAST(N'2015-12-29T15:01:54.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'15e098eb-d16b-464c-a209-ee35316faff3', N't877VWNp1mSPkvXezvmw6oLkAuQ=', 1, N'SEqj/lYzMMOosRpHJYgRzQ==', NULL, N'kk@csd.com', N'kk@csd.com', N'kk', N'mTEQOcakGnn4OAHGHD+GltWNMu4=', 1, 0, CAST(N'2015-12-29T16:13:41.000' AS DateTime), CAST(N'2015-12-30T08:58:43.667' AS DateTime), CAST(N'2015-12-29T16:13:41.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'9fd59425-15e3-4d05-b2bf-4255eb7f194c', N'Egbs0kDy2B0BhXpR6ovxEX4AIhI=', 1, N'L5Q01wedaMEGfFgBQdkQ+w==', NULL, N'sad@kk.com', N'sad@kk.com', N'kk', N'OjsBamYpMYpks+vKxptqMbx6NhI=', 1, 0, CAST(N'2015-12-30T05:52:24.000' AS DateTime), CAST(N'2015-12-30T09:07:53.130' AS DateTime), CAST(N'2015-12-30T05:52:24.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'3991301d-643f-43d4-9dbc-c8c4c109798e', N'2l6PYFHV7CuvFBzvZFUDhP9XGcc=', 1, N'2m4N/vmUjPYWSp/WCWNqNw==', NULL, N'test@d.dcom', N'test@d.dcom', N'name', N'u5OiYyakquQhu7Us3pLGlPXLbf0=', 1, 0, CAST(N'2016-11-07T07:23:01.000' AS DateTime), CAST(N'2016-11-12T06:39:29.910' AS DateTime), CAST(N'2016-11-07T07:23:01.000' AS DateTime), CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), 0, CAST(N'1754-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'5fba0ace-dc82-4bee-838e-24488bf6ce54', N'FullName:S:0:6:Province:S:6:1:District:S:7:3:Age:S:10:6:Designation:S:16:3:', N'zubair1102zubairjob', 0x, CAST(N'2015-12-29T16:04:15.173' AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'c4b38c5d-3b61-47ee-a852-25418b6b5aa9', N'FullName:S:0:3:Province:S:3:1:District:S:4:3:Age:S:7:2:Designation:S:9:1:', N'jan1102jnj', 0x, CAST(N'2015-12-29T15:41:38.493' AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'9fd59425-15e3-4d05-b2bf-4255eb7f194c', N'FullName:S:0:4:Province:S:4:1:District:S:5:3:Age:S:8:4:Designation:S:12:2:', N'asif1103asifas', 0x, CAST(N'2015-12-30T05:52:25.453' AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'f2a59670-20f2-436f-96c5-4a68572b13cd', N'FullName:S:0:4:Province:S:4:1:District:S:5:1:Age:S:6:2:Designation:S:8:5:', N'john1623ldkfj', 0x, CAST(N'2016-12-20T10:35:35.763' AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'3d1573ae-500d-4bb6-93ae-5cb8f3d18c00', N'FullName:S:0:2:Province:S:2:1:District:S:3:3:Age:S:6:2:Designation:S:8:2:', N'jj1102jjjj', 0x, CAST(N'2015-12-29T17:48:10.290' AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'9a988173-0f41-4a7b-b011-9367291104c2', N'FullName:S:0:4:Province:S:4:2:District:S:6:2:Age:S:8:2:Designation:S:10:4:', N'khan143023asdf', 0x, CAST(N'2016-11-01T04:24:17.520' AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'3991301d-643f-43d4-9dbc-c8c4c109798e', N'FullName:S:0:4:Province:S:4:1:District:S:5:3:Age:S:8:3:Designation:S:11:3:', N'test4108sdftes', 0x, CAST(N'2016-11-07T07:23:01.883' AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'15e098eb-d16b-464c-a209-ee35316faff3', N'FullName:S:0:2:Province:S:2:1:District:S:3:3:Age:S:6:2:Designation:S:8:2:', N'kk1102kkkk', 0x, CAST(N'2015-12-29T16:13:41.177' AS DateTime))
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'e57c6cad-e111-4141-b79e-88bcbe3b982b', N'Admin', N'admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'9ac51d21-6fb9-4fd5-a8a2-100df799b28b', N'User', N'user', NULL)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
INSERT [dbo].[aspnet_UserProvince] ([UserID], [ProvinceID]) VALUES (N'9a988173-0f41-4a7b-b011-9367291104c2', 14)
INSERT [dbo].[aspnet_UserProvince] ([UserID], [ProvinceID]) VALUES (N'9a988173-0f41-4a7b-b011-9367291104c2', 15)
INSERT [dbo].[aspnet_UserProvince] ([UserID], [ProvinceID]) VALUES (N'c4b38c5d-3b61-47ee-a852-25418b6b5aa9', 12)
INSERT [dbo].[aspnet_UserProvince] ([UserID], [ProvinceID]) VALUES (N'9a988173-0f41-4a7b-b011-9367291104c2', 1)
INSERT [dbo].[aspnet_UserProvince] ([UserID], [ProvinceID]) VALUES (N'3991301d-643f-43d4-9dbc-c8c4c109798e', 1)
INSERT [dbo].[aspnet_UserProvince] ([UserID], [ProvinceID]) VALUES (N'3991301d-643f-43d4-9dbc-c8c4c109798e', 14)
INSERT [dbo].[aspnet_UserProvince] ([UserID], [ProvinceID]) VALUES (N'3991301d-643f-43d4-9dbc-c8c4c109798e', 15)
INSERT [dbo].[aspnet_UserProvince] ([UserID], [ProvinceID]) VALUES (N'9a988173-0f41-4a7b-b011-9367291104c2', 12)
INSERT [dbo].[aspnet_UserProvince] ([UserID], [ProvinceID]) VALUES (N'9a988173-0f41-4a7b-b011-9367291104c2', 4)
INSERT [dbo].[aspnet_UserProvince] ([UserID], [ProvinceID]) VALUES (N'9a988173-0f41-4a7b-b011-9367291104c2', 31)
INSERT [dbo].[aspnet_UserProvince] ([UserID], [ProvinceID]) VALUES (N'9a988173-0f41-4a7b-b011-9367291104c2', 28)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [ProvinceID], [DistrictID]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'5b58c8c8-1c33-410b-bdc5-a9b9502f01a1', N'ali', N'ali', NULL, 0, CAST(N'2015-12-30T09:36:06.567' AS DateTime), NULL, NULL)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [ProvinceID], [DistrictID]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'9fd59425-15e3-4d05-b2bf-4255eb7f194c', N'asif', N'asif', NULL, 0, CAST(N'2015-12-30T09:07:53.130' AS DateTime), 1, 103)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [ProvinceID], [DistrictID]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'9a988173-0f41-4a7b-b011-9367291104c2', N'aziz', N'aziz', NULL, 0, CAST(N'2017-01-06T04:00:42.513' AS DateTime), 14, 30)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [ProvinceID], [DistrictID]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'c4b38c5d-3b61-47ee-a852-25418b6b5aa9', N'jan', N'jan', NULL, 0, CAST(N'2017-02-14T15:58:40.920' AS DateTime), 1, 102)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [ProvinceID], [DistrictID]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'3d1573ae-500d-4bb6-93ae-5cb8f3d18c00', N'jj', N'jj', NULL, 0, CAST(N'2015-12-30T06:04:54.353' AS DateTime), 1, 102)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [ProvinceID], [DistrictID]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'a0eeda4c-5804-43ea-bfd4-a770e69101af', N'khan', N'khan', NULL, 0, CAST(N'2016-10-10T05:56:01.883' AS DateTime), 1, 102)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [ProvinceID], [DistrictID]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'15e098eb-d16b-464c-a209-ee35316faff3', N'kk', N'kk', NULL, 0, CAST(N'2015-12-30T08:58:43.667' AS DateTime), 1, 102)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [ProvinceID], [DistrictID]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'f2a59670-20f2-436f-96c5-4a68572b13cd', N'mukarj', N'mukarj', NULL, 0, CAST(N'2016-12-20T10:35:35.763' AS DateTime), 1, 6)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [ProvinceID], [DistrictID]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'3991301d-643f-43d4-9dbc-c8c4c109798e', N'test', N'test', NULL, 0, CAST(N'2016-11-12T06:39:29.910' AS DateTime), 4, 108)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [ProvinceID], [DistrictID]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'afe24e5b-e2b9-4908-b524-93a8c988922c', N'user', N'user', NULL, 0, CAST(N'2017-02-14T15:29:12.007' AS DateTime), NULL, NULL)
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [ProvinceID], [DistrictID]) VALUES (N'34764d90-4054-47ea-ab95-17c5d32a6136', N'5fba0ace-dc82-4bee-838e-24488bf6ce54', N'zubair', N'zubair', NULL, 0, CAST(N'2016-11-17T06:36:17.630' AS DateTime), 1, 102)
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5fba0ace-dc82-4bee-838e-24488bf6ce54', N'9ac51d21-6fb9-4fd5-a8a2-100df799b28b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c4b38c5d-3b61-47ee-a852-25418b6b5aa9', N'9ac51d21-6fb9-4fd5-a8a2-100df799b28b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3d1573ae-500d-4bb6-93ae-5cb8f3d18c00', N'9ac51d21-6fb9-4fd5-a8a2-100df799b28b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'9a988173-0f41-4a7b-b011-9367291104c2', N'9ac51d21-6fb9-4fd5-a8a2-100df799b28b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'afe24e5b-e2b9-4908-b524-93a8c988922c', N'9ac51d21-6fb9-4fd5-a8a2-100df799b28b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3991301d-643f-43d4-9dbc-c8c4c109798e', N'9ac51d21-6fb9-4fd5-a8a2-100df799b28b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'15e098eb-d16b-464c-a209-ee35316faff3', N'9ac51d21-6fb9-4fd5-a8a2-100df799b28b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5fba0ace-dc82-4bee-838e-24488bf6ce54', N'e57c6cad-e111-4141-b79e-88bcbe3b982b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c4b38c5d-3b61-47ee-a852-25418b6b5aa9', N'e57c6cad-e111-4141-b79e-88bcbe3b982b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'9a988173-0f41-4a7b-b011-9367291104c2', N'e57c6cad-e111-4141-b79e-88bcbe3b982b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'afe24e5b-e2b9-4908-b524-93a8c988922c', N'e57c6cad-e111-4141-b79e-88bcbe3b982b')
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (1, N'Pul-e-Khumri', 3)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (2, N'Baghlan-e-Jadid', 3)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (3, N'Nahreen', 3)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (4, N'Doshi', 3)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (5, N'Imam Saheb', 19)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (6, N'Fayzabad', 1)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (7, N'Surkh Rod', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (8, N'Alishing', 20)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (9, N'Bazarak', 28)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (10, N'Rukha', 28)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (11, N'Charikar', 29)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (12, N'Sayed Khail', 29)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (13, N'Salang', 29)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (14, N'Bagraam', 29)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (15, N'Jibl-e-Saraj', 29)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (19, N'Hesa -e- Awal ', 16)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (22, N'Unaba', 28)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (23, N'Hesa -e- dowm', 16)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (24, N'Mahmood Raqi', 16)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (25, N'Guzara', 12)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (26, N'Enjil', 12)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (30, N'Paghman', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (33, N'Farkhar', 32)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (34, N'Khinjan', 3)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (35, N'Chahar Dara', 19)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (36, N'Ali Abad', 19)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (38, N'Dasht e Archi', 19)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (39, N'Asad Abad', 18)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (41, N'Hazrat Sultan', 30)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (44, N'Aibak', 30)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (46, N'Chaghcharan', 10)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (48, N'Bagrami ', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (49, N'Baharak', 1)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (50, N'Farza', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (51, N'Guldara', 1)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (53, N'Guldara', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (66, N'Khanabad', 19)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (72, N'Kabul City', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (73, N'Khuram Wa Sarbagh', 30)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (74, N'Ruyi Du Ab', 30)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (75, N'Dara e Soof Paien', 30)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (76, N'Feroz Nakhchir', 30)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (77, N'Narang', 18)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (79, N'Shakar Dara', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (80, N'Kalakaan', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (81, N'Qarabagh', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (82, N'Deh Sabz', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (83, N'Sheberghan', 13)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (84, N'Aqcha', 13)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (85, N'Kuz Kunar', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (86, N'Behsud', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (88, N'Kama', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (89, N'Dara-e-Noor', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (90, N'Qarghayi', 20)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (91, N'Mihtarlam', 20)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (92, N'Zinda Jan', 12)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (93, N'Karukh', 12)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (94, N'Ghoryan', 12)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (95, N'Kohsan', 12)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (96, N'Kohistan', 16)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (97, N'Kunduz', 19)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (98, N'Mir Bacha Kot', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (99, N'Balkh', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (100, N'Charbolak', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (101, N'Charkint', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (102, N'Chimtal', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (103, N'Dawlatabad', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (104, N'Dihdadi', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (105, N'Kaldar', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (106, N'Khulm', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (107, N'Kishindih', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (108, N'Marmul', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (109, N'Nahri Shahi', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (110, N'Sholgara', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (111, N'Shortepa', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (112, N'Zari', 4)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (113, N'Ahmad Abad', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (114, N'Dand Aw Patan', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (115, N'Gardez', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (116, N'Gerda Serai', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (117, N'Janikhel', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (118, N'Lazha Ahmadkhel', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (119, N'Lazha Mangal', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (120, N'Mirzaka', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (121, N'Tsamkani', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (122, N'Sayed Karam', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (123, N'Shwak', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (124, N'Wuza Zadran', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (125, N'Zazi', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (126, N'Zurmat', 26)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (127, N'Azra', 21)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (128, N'Baraki Barak', 21)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (129, N'CHarkh', 21)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (130, N'Kharwar', 21)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (131, N'Khoshi', 21)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (132, N'Mohammad Agha', 21)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (133, N'Pul-e-Alam', 21)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (134, N'Darzab', 13)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (135, N'Fayzabad', 13)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (136, N'Khamyab', 13)
GO
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (137, N'Khaniqa', 13)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (138, N'Khwaja Du koh', 13)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (139, N'Mardyan', 13)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (140, N'Mingajik', 13)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (141, N'Qarqin', 13)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (142, N'Qush Tepa', 13)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (143, N'Dawlatyar', 10)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (144, N'Pashtun Zarghoon', 12)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (145, N'Balkhab', 31)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (146, N'Gosfandi', 31)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (147, N'Kohestanat', 31)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (148, N'Sancharak', 31)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (149, N'Sar-e-Pul Center', 31)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (150, N'Sayaad', 31)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (151, N'Sozma Qala', 31)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (152, N'Goshta', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (153, N'Achin', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (154, N'Bati Kot', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (155, N'Chaparhar', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (156, N'Jalalabad', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (157, N'Deh Bala', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (158, N'Dur Baba', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (159, N'Hisarak', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (160, N'Khogyani', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (161, N'Kot', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (162, N'Lal Poor', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (163, N'Momand Dara', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (164, N'Nazyan', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (165, N'Rodat', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (166, N'Sherzad', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (167, N'Shinwar', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (168, N'Pachir Aw Agam', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (169, N'Khewa', 23)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (170, N'Taluqan', 32)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (171, N'Dara e Soof Bala', 30)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (172, N'Kalafgan', 32)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (173, N'Bangi', 32)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (174, N'Baharak', 32)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (175, N'Qala-e-Zaal', 19)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (176, N'Chahar Asiab', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (177, N'Istalif', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (178, N'Khak e Jabbar', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (179, N'Surobi', 14)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (180, N'Koh e Safi', 29)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (181, N'Markaz', 29)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (182, N'Seyah Gerd', 29)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (183, N'Shaikh Ali', 29)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (184, N'Shinwary', 29)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (185, N'Surkh Parsa', 29)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (186, N'Center', 16)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (187, N'Kohband', 16)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (188, N'Nejrab', 16)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (189, N'Abshar', 28)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (190, N'Dara', 28)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (191, N'Khenj', 28)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (192, N'Paryan', 28)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (197, N'Maimana', 8)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (198, N'Khwaja Sabzposh', 8)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (199, N'Almar', 8)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (200, N'Belcheragh', 8)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (201, N'Gurziwan', 8)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (202, N'Qaysar', 8)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (203, N'Pashton Koot', 8)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (204, N'Chrintagab', 8)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (205, N'Kohistanat', 8)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (206, N'Jelga', 3)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (207, N'Tala wa barfak', 3)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (208, N'Bano', 3)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (209, N'Andarab', 3)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (210, N'Guzargah-e- Nur', 3)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (211, N'Deh Salah', 3)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (212, N'Worsaj', 32)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (213, N'dasht-e-Qala', 32)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (214, N'Chah Ab', 32)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (215, N'Rostaq', 32)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (216, N'Darayem', 1)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (217, N'Argo', 1)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (218, N'Jurm', 1)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (219, N'Kishim', 1)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (220, N'Alingar', 20)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (221, N'Marwara', 18)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (222, N'Watta poor', 18)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (223, N'Firoz Koh', 10)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (224, N'Noor Gal', 18)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (225, N'Sawkai', 18)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (226, N'Khas Kunar', 18)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (227, N'Shegal', 18)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (228, N'Baghlan-e-Markazi', 3)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (229, N'Sayed Abad', 22)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (230, N'Shotal', 28)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (231, N'Yak Awlang', 5)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (232, N'khowaja bohawudin ', 32)
INSERT [dbo].[OCM_District] ([DistrictID], [DistrictEngName], [ProvinceID]) VALUES (234, N'Qadoghak', 8)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedKGP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1103-1', 1, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedKGP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1103-1', 2, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedKGP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1103-1', 3, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedKGP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1103-1', 4, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedKGP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1103-1', 5, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedKGP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1103-1', 6, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedKGP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1226-1', 1, 1, 4, 1, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedKGP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1226-1', 2, 1, 3, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedKGP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1226-1', 3, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedKGP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1226-1', 4, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedKGP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1226-1', 5, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedKGP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1226-1', 6, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedMP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1103-1', 1, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedMP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1103-1', 2, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedMP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1103-1', 3, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedMP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1103-1', 4, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedMP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1103-1', 5, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedMP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1226-1', 1, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedMP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1226-1', 2, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedMP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1226-1', 3, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedMP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1226-1', 4, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bAdopOfImprovedMP] ([FemalHFormID], [PracticeID], [Recieved], [Application], [Usefullness], [Understood]) VALUES (N'F02b-1226-1', 5, 0, 4, 3, 0)
INSERT [dbo].[OCM_FemaleH02bFamilyComposition] ([FemalHFormID], [NameOfFamilyHead], [FName], [Gender], [TotalFamilyMembers], [MaleFamilyMembers], [FemaleFamilyMembers]) VALUES (N'F02b-1103-1', N'kj', N'kj', 1, 24, 12, 12)
INSERT [dbo].[OCM_FemaleH02bFamilyComposition] ([FemalHFormID], [NameOfFamilyHead], [FName], [Gender], [TotalFamilyMembers], [MaleFamilyMembers], [FemaleFamilyMembers]) VALUES (N'F02b-1226-1', N'kj', N'kj', 1, 24, 12, 12)
INSERT [dbo].[OCM_FemaleH02bGeneralInfo] ([FemalHFormID], [TotalFarmArea], [Irrigated], [Rainfed], [ISFruitOrchard], [OrchardArea]) VALUES (N'F02b-1103-1', CAST(12 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), 1, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[OCM_FemaleH02bGeneralInfo] ([FemalHFormID], [TotalFarmArea], [Irrigated], [Rainfed], [ISFruitOrchard], [OrchardArea]) VALUES (N'F02b-1226-1', CAST(12 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), 1, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 1, CAST(12 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), 12, 12)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 6, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 7, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 11, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 12, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 13, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 14, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 15, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 16, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 17, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bKGProductionAndProductUses] ([FemalHFormID], [ProductID], [SeedPlanted], [PlantedArea], [YieldHarvest], [KGSold], [Price]) VALUES (N'F02b-1103-1', 18, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OCM_FemaleH02bNHLPDevServices] ([FemalHFormID], [ServiceID], [Recieved], [LevelOfSatisfication]) VALUES (N'F02b-1103-1', 1, 0, 3)
INSERT [dbo].[OCM_FemaleH02bNHLPDevServices] ([FemalHFormID], [ServiceID], [Recieved], [LevelOfSatisfication]) VALUES (N'F02b-1103-1', 2, 0, 3)
INSERT [dbo].[OCM_FemaleH02bNHLPDevServices] ([FemalHFormID], [ServiceID], [Recieved], [LevelOfSatisfication]) VALUES (N'F02b-1103-1', 3, 0, 3)
INSERT [dbo].[OCM_FemaleH02bNHLPDevServices] ([FemalHFormID], [ServiceID], [Recieved], [LevelOfSatisfication]) VALUES (N'F02b-1103-1', 4, 0, 3)
INSERT [dbo].[OCM_FemaleH02bNHLPDevServices] ([FemalHFormID], [ServiceID], [Recieved], [LevelOfSatisfication]) VALUES (N'F02b-1226-1', 1, 0, 3)
INSERT [dbo].[OCM_FemaleH02bNHLPDevServices] ([FemalHFormID], [ServiceID], [Recieved], [LevelOfSatisfication]) VALUES (N'F02b-1226-1', 2, 0, 3)
INSERT [dbo].[OCM_FemaleH02bNHLPDevServices] ([FemalHFormID], [ServiceID], [Recieved], [LevelOfSatisfication]) VALUES (N'F02b-1226-1', 3, 0, 3)
INSERT [dbo].[OCM_FemaleH02bNHLPDevServices] ([FemalHFormID], [ServiceID], [Recieved], [LevelOfSatisfication]) VALUES (N'F02b-1226-1', 4, 0, 3)
INSERT [dbo].[OCM_FemaleH02bSelfSustained] ([FemalHFormID], [HasKGContinued], [KGReason], [KGWayPurchased], [KGWayPrdByself], [KGWayByProj], [KGWayNHLP], [KGOtherMethod], [HasMGHContinued], [MGHReason], [MGHWayPurchased], [MGHWayPrdByself], [MGHWayByProj], [MGHWayNHLP], [MGHOtherMethod]) VALUES (N'F02b-1103-1', 0, N'', NULL, NULL, NULL, NULL, N'', 0, N'', NULL, NULL, NULL, NULL, N'')
INSERT [dbo].[OCM_FemaleH02bSelfSustained] ([FemalHFormID], [HasKGContinued], [KGReason], [KGWayPurchased], [KGWayPrdByself], [KGWayByProj], [KGWayNHLP], [KGOtherMethod], [HasMGHContinued], [MGHReason], [MGHWayPurchased], [MGHWayPrdByself], [MGHWayByProj], [MGHWayNHLP], [MGHOtherMethod]) VALUES (N'F02b-1226-1', 1, N'', 1, 0, 0, 0, N'', 1, N'', 1, 0, 0, 0, N'')
INSERT [dbo].[OCM_FemaleH02bSocialProblem] ([FemalHFormID], [FarmerRemarks], [InterviewerRemarks]) VALUES (N'F02b-1103-1', N'kj', N'kj')
INSERT [dbo].[OCM_FemaleH02bSocialProblem] ([FemalHFormID], [FarmerRemarks], [InterviewerRemarks]) VALUES (N'F02b-1226-1', N'', N'')
INSERT [dbo].[OCM_FemalH02bDetailForm] ([FemalHFormID], [NameOfInterviewee], [DistrictID], [ProvinceID], [Year], [SampleGroupType1], [SampleGroupType2], [NameOfVillage], [InterviewDate], [StartTime], [EndTime], [Interviewer], [UserId]) VALUES (N'F02b-1103-1', N'kj', 203, 2, 1392, 0, 1, N'kj', N'29.12.2015', N'09:19', N'09:19', N'lk', N'5fba0ace-dc82-4bee-838e-24488bf6ce54')
INSERT [dbo].[OCM_FemalH02bDetailForm] ([FemalHFormID], [NameOfInterviewee], [DistrictID], [ProvinceID], [Year], [SampleGroupType1], [SampleGroupType2], [NameOfVillage], [InterviewDate], [StartTime], [EndTime], [Interviewer], [UserId]) VALUES (N'F02b-1226-1', N'kj', 26, 12, 1392, 0, 1, N'kj', N'16.02.2017', N'20:00', N'21:00', N'kj', N'c4b38c5d-3b61-47ee-a852-25418b6b5aa9')
INSERT [dbo].[OCM_LKP_ETrainingResult] ([ETResultID], [Result]) VALUES (1, N'Very Useful')
INSERT [dbo].[OCM_LKP_ETrainingResult] ([ETResultID], [Result]) VALUES (2, N'SomeWhat Useful')
INSERT [dbo].[OCM_LKP_ETrainingResult] ([ETResultID], [Result]) VALUES (3, N'Useless')
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (1, N'Onion', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (2, N'Squash', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (3, N'Cucumber', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (4, N'Green Bean', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (5, N'Radish', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (6, N'Cauliflawer', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (7, N'Spinach', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (8, N'Tomato', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (9, N'Garlic', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (10, N'Leek', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (11, N'Egg Plant', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (12, N'Cubbage', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (13, N'Pepper', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (14, N'Okra', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (15, N'Green Cress', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (16, N'Corriander', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (17, N'Pumpkin', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (18, N'Letuce', NULL)
INSERT [dbo].[OCM_LKP_Products] ([ProductID], [ProductNameEng], [ProductName]) VALUES (19, N'PrdName', N'شلغم')
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (1, N'Badakhshan', 7)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (2, N'Badghis', 2)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (3, N'Baghlan', 7)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (4, N'Balkh', 4)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (5, N'Bamyan', 9)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (6, N'Daykundi', 6)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (7, N'Farah', 2)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (8, N'Faryab', 8)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (9, N'Ghazni', 5)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (10, N'Ghor', 2)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (11, N'Helmand', 6)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (12, N'Herat', 2)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (13, N'Jowzjan', 4)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (14, N'Kabul', 9)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (15, N'Kandahar', 5)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (16, N'Kapisa', 9)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (17, N'Khost', 5)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (18, N'Kunar', 1)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (19, N'Kunduz', 7)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (20, N'Laghman', 1)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (21, N'Logar', 9)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (22, N'Maidan Wardak', 9)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (23, N'Nangarhar', 1)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (24, N'Nimruz', 6)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (25, N'Nuristan', 7)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (26, N'Paktia', 9)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (27, N'Paktika', 5)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (28, N'Panjshir', 9)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (29, N'Parwan', 9)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (30, N'Samangan', 4)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (31, N'Sar-e-Pul', 4)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (32, N'Takhar', 7)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (33, N'Urozgan', 9)
INSERT [dbo].[OCM_Province] ([ProvinceID], [ProvinceEngName], [Region]) VALUES (34, N'Zabul', 5)
SET IDENTITY_INSERT [dbo].[OCM_Region] ON 

INSERT [dbo].[OCM_Region] ([id], [name], [userID]) VALUES (1, N'East', 1)
INSERT [dbo].[OCM_Region] ([id], [name], [userID]) VALUES (2, N'West', 1)
INSERT [dbo].[OCM_Region] ([id], [name], [userID]) VALUES (3, N'South', 0)
INSERT [dbo].[OCM_Region] ([id], [name], [userID]) VALUES (4, N'North', 1)
INSERT [dbo].[OCM_Region] ([id], [name], [userID]) VALUES (5, N'South-East', 0)
INSERT [dbo].[OCM_Region] ([id], [name], [userID]) VALUES (6, N'South-West', 0)
INSERT [dbo].[OCM_Region] ([id], [name], [userID]) VALUES (7, N'North-East', 1)
INSERT [dbo].[OCM_Region] ([id], [name], [userID]) VALUES (8, N'North-West', 0)
INSERT [dbo].[OCM_Region] ([id], [name], [userID]) VALUES (9, N'Center', 1)
SET IDENTITY_INSERT [dbo].[OCM_Region] OFF
/****** Object:  Index [PK__aspnet_Applicati__75A278F5]    Script Date: 4/15/2022 10:58:02 PM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__aspnet_Applicati__76969D2E]    Script Date: 4/15/2022 10:58:02 PM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__aspnet_Applicati__778AC167]    Script Date: 4/15/2022 10:58:02 PM ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_Membershi__0A9D95DB]    Script Date: 4/15/2022 10:58:02 PM ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_Paths__3C34F16F]    Script Date: 4/15/2022 10:58:02 PM ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_Personali__44CA3770]    Script Date: 4/15/2022 10:58:02 PM ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_PersonalizationPerUser_ncindex2]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_Roles__29221CFB]    Script Date: 4/15/2022 10:58:02 PM ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK__aspnet_Users__7A672E12]    Script Date: 4/15/2022 10:58:02 PM ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_Users_Index2]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aspnet_UsersInRoles_index]    Script Date: 4/15/2022 10:58:02 PM ******/
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
GO
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
GO
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.ApplicationId = a.ApplicationId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  StoredProcedure [dbo].[GetFarmerMoneyDepositListByYear]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetFarmerMoneyDepositListByYear]
@Year int,
@ExtWorkerId varchar(50),
@SeasonId int
as

;with tbl as

(
SELECT     Id, Name,
(
	select isnull(sum(FC_FormerFruitDetails.Amount),0) from FC_FormerFruitDetails where FC_FormerFruitDetails.FarmerId=FC_FarmerInfo.Id and FC_FormerFruitDetails.Year=@Year and FC_FormerFruitDetails.SeasonId=@SeasonId and FC_FormerFruitDetails.IsDeleted='false'
) as TotalAmount,
(
select isnull(sum( FC_FarmerRecieveAmount.RecievedAmount),0) from FC_FarmerRecieveAmount where FC_FarmerRecieveAmount.FarmerId=FC_FarmerInfo.Id and FC_FarmerRecieveAmount.Year=@Year and FC_FarmerRecieveAmount.SeasonId=@SeasonId
)as RecievedAmount,
(
(
	select isnull(sum(FC_FormerFruitDetails.Amount),0) from FC_FormerFruitDetails where FC_FormerFruitDetails.FarmerId=FC_FarmerInfo.Id and FC_FormerFruitDetails.Year=@Year and FC_FormerFruitDetails.SeasonId=@SeasonId and FC_FormerFruitDetails.IsDeleted='false'
)-
(
select isnull(sum( FC_FarmerRecieveAmount.RecievedAmount),0) from FC_FarmerRecieveAmount where FC_FarmerRecieveAmount.FarmerId=FC_FarmerInfo.Id  and FC_FarmerRecieveAmount.Year=@Year and FC_FarmerRecieveAmount.SeasonId=@SeasonId
)
) as Balance
FROM         FC_FarmerInfo
 WHERE     (FC_FarmerInfo.ExtWId =@ExtWorkerId)

 )
 select * from tbl where TotalAmount>0
GO
/****** Object:  StoredProcedure [dbo].[GetUserRoleName]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetUserRoleName]
@UserId	uniqueidentifier
as

SELECT        aspnet_Users.UserName, aspnet_Roles.RoleName
FROM            aspnet_UsersInRoles INNER JOIN
                         aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId INNER JOIN
                         aspnet_Users ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId
WHERE        (aspnet_Users.UserId LIKE @UserId)
GO
/****** Object:  StoredProcedure [dbo].[SharedGetCDC]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SharedGetCDC]
@ExtWId varchar(50)
as
SELECT        Code + '/' + Name AS Detail, CommunityId
FROM            HC_CDC
WHERE        (ExtWId =@ExtWId)
ORDER BY ProvinceId
GO
/****** Object:  StoredProcedure [dbo].[SharedGetDistrict]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[SharedGetDistrict]
@ProvinceId	int

as
select * from OCM_District where ProvinceID=@ProvinceId order by DistrictID
GO
/****** Object:  StoredProcedure [dbo].[SharedGetExtensionWorker]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[SharedGetExtensionWorker]
@DistrictId	int

as
select ExtWID,Name from FC_ExtensionWorkerInfo where DistrictID=@DistrictId order by ProvinceID
GO
/****** Object:  StoredProcedure [dbo].[SharedGetFarmer]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[SharedGetFarmer]
@ExtensionWorker Nvarchar(50)
as
select Id,Name from FC_FarmerInfo where ExtWId=@ExtensionWorker order by ExtWId
GO
/****** Object:  StoredProcedure [dbo].[SharedGetFruit]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[SharedGetFruit]
@ActivityId int
as
select FruitId,Fruit from FC_FruitTools where ActivityID=@ActivityId
GO
/****** Object:  StoredProcedure [dbo].[SharedGetFruitVariety]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SharedGetFruitVariety]
@FruitId int
as

SELECT        VarietyId, Variety
FROM            FC_FruitVariety
WHERE        (FruitId =@FruitId)
GO
/****** Object:  StoredProcedure [dbo].[SharedGetUserProvinces]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[SharedGetUserProvinces] 
@UserId	uniqueidentifier

as

SELECT     aspnet_UserProvince.ProvinceID, OCM_Province.ProvinceEngName
FROM         aspnet_UserProvince INNER JOIN
                      OCM_Province ON aspnet_UserProvince.ProvinceID = OCM_Province.ProvinceID
where  aspnet_UserProvince.UserID=@UserId order by aspnet_UserProvince.ProvinceID 
GO
/****** Object:  StoredProcedure [dbo].[SpDashboardByProvince]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SpDashboardByProvince]

as
;with tbl as(
			SELECT     OCM_Province.ProvinceEngName,
                (
                SELECT     ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) AS Expr1
                FROM         FC_FormerFruitDetails INNER JOIN
                                      FC_FarmerInfo ON FC_FormerFruitDetails.FarmerId = FC_FarmerInfo.Id where FC_FarmerInfo.ExtWId=FC_ExtensionWorkerInfo.ExtWID and IsDeleted='false'
                ) as TotalAmount,
                (
                select isnull(sum( FC_FarmerRecieveAmount.RecievedAmount),0) from FC_FarmerRecieveAmount where FC_FarmerRecieveAmount.ExtWId=FC_ExtensionWorkerInfo.ExtWID
                )as RecievedAmount
                FROM  FC_ExtensionWorkerInfo INNER JOIN
                                      OCM_Province ON FC_ExtensionWorkerInfo.ProvinceID = OCM_Province.ProvinceID )
 select ProvinceEngName,sum(TotalAmount) as TotalAmount ,sum(RecievedAmount) as RecievedAmount from tbl group by ProvinceEngName
 having sum(TotalAmount)<>0
GO
/****** Object:  StoredProcedure [dbo].[SpDashboardByRegion]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SpDashboardByRegion]

as
;with tbl as(
	SELECT        OCM_Province.ProvinceEngName,
                             (SELECT        ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) AS Expr1
                               FROM            FC_FormerFruitDetails INNER JOIN
                                                         FC_FarmerInfo ON FC_FormerFruitDetails.FarmerId = FC_FarmerInfo.Id
                               WHERE        (FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID and IsDeleted='false')) AS TotalAmount,
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount
                               WHERE        (ExtWId = FC_ExtensionWorkerInfo.ExtWID)) AS RecievedAmount, OCM_Region.id, OCM_Region.name as RegionName
FROM            FC_ExtensionWorkerInfo INNER JOIN
                         OCM_Province ON FC_ExtensionWorkerInfo.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         OCM_Region ON OCM_Province.Region = OCM_Region.id)
 select RegionName,sum(TotalAmount) as TotalAmount ,sum(RecievedAmount) as RecievedAmount from tbl group by RegionName
 having sum(TotalAmount)<>0
GO
/****** Object:  StoredProcedure [dbo].[spPageBioNutrientFarmerList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spPageBioNutrientFarmerList4GridView]
@Year int,
@ExtWId varchar(50),
@SeasonId int,
@ActivityId int
as
SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.Area, HC_FarmerNonContActivityDetails.NoOfSpecies, 
                         HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.FarmerActivityId, HC_FarmerActivityDetails.FarmerId, 
                         HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId, FC_FruitTools.Fruit
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_FruitTools ON HC_FarmerNonContActivityDetails.FruitCropId = FC_FruitTools.FruitID
WHERE        (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.Year = @Year) AND (FC_FarmerInfo.ExtWID =@ExtWId) AND (HC_FarmerActivityDetails.ActivityId = @ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted =0)

GO
/****** Object:  StoredProcedure [dbo].[spPageBioNutrientGetFarmerDetailToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageBioNutrientGetFarmerDetailToUpdate]

@Year int,
@ExtWId nvarchar(50),
@FarmerId nvarchar(50),
@SeasonId int,
@ActivityId int,
@FarmerActivityId varchar(70)
as
SELECT        HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId, HC_FarmerNonContActivityDetails.Area, 
                         HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.NoOfSpecies, HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, 
                         HC_FarmerNonContActivityDetails.IsDeleted, FC_ExtensionWorkerInfo.DistrictID, FC_ExtensionWorkerInfo.ProvinceID, HC_FarmerNonContActivityDetails.Id
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID
WHERE       (HC_FarmerNonContActivityDetails.FarmerActivityId =@FarmerActivityId ) and (HC_FarmerActivityDetails.FarmerId =@FarmerId)  and(FC_FarmerInfo.ExtWID=@ExtWId) AND (HC_FarmerActivityDetails.Year = @Year) AND (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.ActivityId =@ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted ='false' )

GO
/****** Object:  StoredProcedure [dbo].[spPageBioNutrientSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[spPageBioNutrientSave]
@FarmerId varchar(50),
@ActivityId int,
@FruitCropId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@InsertionDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@IsDeleted bit,
@exist bit output
as

--checknig for existance 
If EXISTS (SELECT 1         
FROM            HC_FarmerActivityDetails INNER JOIN
                        HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
                    WHERE HC_FarmerNonContActivityDetails.FruitCropId=@FruitCropId and HC_FarmerActivityDetails.FarmerId=@FarmerId and  HC_FarmerActivityDetails.YEAR=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId and HC_FarmerActivityDetails.ActivityId=@ActivityId)
	BEGIN
			set @exist=1
	END 


ELSE    
 BEGIN
	
	--id chekcing id

		            declare @FarmerActivityId varchar(70)
					declare @DetailId varchar(10)
					if exists ( select 1  from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
						begin

							set @FarmerActivityId=(select FarmerActivityId from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )
						 end
					else
						
						begin	
							set @FarmerActivityId=(select count(*)+1 from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @FarmerActivityId=@FarmerId+'-'+cast(@ActivityId as varchar)+'-'+@FarmerActivityId+'-'+cast(@SeasonId as varchar)+'-'+cast(@Year as varchar)

							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

							INSERT INTO [dbo].[HC_FarmerActivityDetails]
								([FarmerActivityId]	
								,[FarmerId]
								,[ActivityId]
								,[Year]
								,[SeasonId]
								,[ContributionType])
							VALUES
								(@FarmerActivityId,@FarmerId,@ActivityId,@Year,@SeasonId,2)

						end

		

-- activity Details

	
	INSERT INTO [dbo].HC_FarmerNonContActivityDetails
           ([Id]
		   ,[FarmerActivityId]
		   ,[FruitCropId]
           ,[Area]
           ,[AreaUnit]
           ,[NoOfSpecies]
           ,[SpeciesUnit]
           ,[InsertionDate]
           ,[UserId]
           ,[Latitude]
           ,[Longtitude]
           ,[IsDeleted])
     VALUES
           (@DetailId,
			@FarmerActivityId,
			@FruitCropId,
			@Area,
			@AreaUnit,
			@NoOfSpecies,
			@SpeciesUnit,
			@InsertionDate,
			@UserId,
			@Latitude,
			@Longtitude,
			@IsDeleted)

	set  @exist=0


	  END

select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageBioNutrientUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  proc [dbo].[spPageBioNutrientUpdate]
@FarmerId varchar(50),
@ActivityId int,
@FruitCropId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@UpdationDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@FarmerActivityId varchar(70),
@DetailId varchar(10)
as

--updating seting false value

update      HC_FarmerNonContActivityDetails set  HC_FarmerNonContActivityDetails.IsDeleted=1
FROM            HC_FarmerActivityDetails INNER JOIN
                         HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
						 WHERE HC_FarmerNonContActivityDetails.Id=@DetailId and  HC_FarmerNonContActivityDetails.FarmerActivityId=@FarmerActivityId  and  HC_FarmerActivityDetails.FarmerId =@FarmerId  and HC_FarmerActivityDetails.ActivityId =@ActivityId and HC_FarmerActivityDetails.Year=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId

--inserting new value
declare @Id varchar(10)
set @Id=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

 INSERT INTO [dbo].[HC_FarmerNonContActivityDetails]
           ([Id],[FarmerActivityId]
		   ,[FruitCropId]
           ,[Area]
           ,[AreaUnit]
           ,[NoOfSpecies]
           ,[SpeciesUnit]
           ,[InsertionDate]
           ,[UserId]
           ,[Latitude]
           ,[Longtitude]
           ,[IsDeleted])
     VALUES
           (
		   @Id,
@FarmerActivityId,
@FruitCropId,
@Area,
@AreaUnit,
@NoOfSpecies,
@SpeciesUnit,
@UpdationDate,
@UserId,
@Latitude,
@Longtitude,
0)
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCChairmanList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageCDCChairmanList4GridView]
@ProvinceId int 
as 
 SELECT        HC_CDC.CommunityId, HC_CDC.Code, HC_CDC.Name, HC_CDC.ChairmanName, HC_CDC.ChairmanContactNo, HC_CDC.BankAccount, HC_CDC.DistrictId, HC_CDC.ProvinceId, OCM_Province.ProvinceEngName, 
                         OCM_District.DistrictEngName
FROM            HC_CDC INNER JOIN
                         OCM_Province ON HC_CDC.ProvinceId = OCM_Province.ProvinceID INNER JOIN
                         OCM_District ON HC_CDC.DistrictId = OCM_District.DistrictID
WHERE    (OCM_Province.ProvinceID =@ProvinceId)
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCGetChairmanToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPageCDCGetChairmanToUpdate]
@Id varchar(50)

as

select * from HC_CDC where CommunityId=@Id
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCProjectDetailGetToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageCDCProjectDetailGetToUpdate]
@Id varchar(50),
@Year int,
@SeasonId int,
@ExtWId varchar(50),
@CommunityId varchar(50)

as
SELECT        HC_CDCProjectsDetail.CommunityId, HC_CDCProjectsDetail.Longtitude, HC_CDCProjectsDetail.Latitude, HC_CDCProjectsDetail.NoOfOtherMembers, HC_CDCProjectsDetail.OwnerContactNo, 
                         HC_CDCProjectsDetail.OwnerName, HC_CDCProjectsDetail.NHLPCost, HC_CDCProjectsDetail.ContractCost, HC_CDCProjectsDetail.ProjectType, HC_CDCProjectsDetail.Year, HC_CDCProjectsDetail.SeasonId, 
                         HC_CDC.DistrictId, HC_CDC.ProvinceId, HC_CDC.ExtWId
FROM            HC_CDCProjectsDetail INNER JOIN
                         HC_CDC ON HC_CDCProjectsDetail.CommunityId = HC_CDC.CommunityId
WHERE        (HC_CDCProjectsDetail.ProjectId = @Id) AND (HC_CDC.ExtWId = @ExtWId) AND (HC_CDCProjectsDetail.Year = @Year) AND (HC_CDCProjectsDetail.SeasonId = @SeasonId)
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCProjectDetailsList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageCDCProjectDetailsList4GridView]

@Year int,
@SeasonId int,
@ExtWId varchar(50)
as 
SELECT        HC_CDCProjectsDetail.OwnerName, HC_CDC.Code, HC_ProjectType.ProjectType, HC_CDCProjectsDetail.Year, HC_CDCProjectsDetail.SeasonId, HC_CDC.ExtWId, HC_CDCProjectsDetail.CommunityId, 
                         HC_CDCProjectsDetail.ProjectId
FROM            HC_CDCProjectsDetail INNER JOIN
                         HC_CDC ON HC_CDCProjectsDetail.CommunityId = HC_CDC.CommunityId INNER JOIN
                         HC_ProjectType ON HC_CDCProjectsDetail.ProjectType = HC_ProjectType.ProjectTypeId
        
WHERE        (HC_CDCProjectsDetail.Year = @Year) AND (HC_CDCProjectsDetail.SeasonId = @SeasonId) and (HC_CDC.ExtWId = @ExtWId) 
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCProjectInstallmentGetToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spPageCDCProjectInstallmentGetToUpdate]

@CommunityId varchar(50),
@ProjectId varchar(50)

as 
SELECT        HC_CDCProjectsInstallmentDetail.Year, HC_CDCProjectsInstallmentDetail.SeasonId, HC_CDCProjectsInstallmentDetail.InstallmentId, HC_CDCProjectsInstallmentDetail.Percentage, 
                         HC_CDCProjectsInstallmentDetail.Tax, HC_CDCProjectsInstallmentDetail.BankTransferCost, HC_CDCProjectsInstallmentDetail.NetInstallment, HC_CDCProjectsInstallmentDetail.ProjectId, 
                         HC_CDCProjectsInstallmentDetail.CommunityId, HC_CDC.ProvinceId, HC_CDC.DistrictId, HC_CDC.ExtWId
FROM            HC_CDCProjectsInstallmentDetail INNER JOIN
                         HC_CDCProjectsDetail ON HC_CDCProjectsInstallmentDetail.ProjectId = HC_CDCProjectsDetail.ProjectId AND HC_CDCProjectsInstallmentDetail.CommunityId = HC_CDCProjectsDetail.CommunityId INNER JOIN
                         HC_CDC ON HC_CDCProjectsDetail.CommunityId = HC_CDC.CommunityId

WHERE        (HC_CDCProjectsInstallmentDetail.CommunityId =@CommunityId ) AND   
                         (HC_CDCProjectsInstallmentDetail.ProjectId =@ProjectId) 
        
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCProjectInstallmentList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spPageCDCProjectInstallmentList4GridView]

@CommunityId varchar(50),
@ProjectId varchar(50)

as 

SELECT        HC_CDCProjectsInstallmentDetail.InstallmentId, HC_CDCProjectsInstallmentDetail.NetInstallment, HC_CDCProjectsInstallmentDetail.ProjectId, HC_CDCProjectsDetail.OwnerName, 
                         HC_CDCProjectsInstallmentDetail.CommunityId, HC_ProjectType.ProjectType
FROM            HC_CDCProjectsInstallmentDetail INNER JOIN
                         HC_CDCProjectsDetail ON HC_CDCProjectsInstallmentDetail.CommunityId = HC_CDCProjectsDetail.CommunityId AND HC_CDCProjectsInstallmentDetail.ProjectId = HC_CDCProjectsDetail.ProjectId INNER JOIN
                         HC_ProjectType ON HC_CDCProjectsDetail.ProjectType = HC_ProjectType.ProjectTypeId
WHERE        (HC_CDCProjectsInstallmentDetail.CommunityId =@CommunityId ) AND   
                         (HC_CDCProjectsInstallmentDetail.ProjectId =@ProjectId) 
        
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCProjectInstallmentsGetCost]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spPageCDCProjectInstallmentsGetCost]
@SeasonId int,
@Year int,
@CommunityId varchar(50),
@ProjectId varchar(50)
as

SELECT        NHLPCost
FROM            HC_CDCProjectsDetail
WHERE        (SeasonId = @SeasonId) AND (Year = @Year) AND (CommunityId = @CommunityId) AND (ProjectId = @ProjectId)
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCProjectInstallmentsGetOwner]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spPageCDCProjectInstallmentsGetOwner]
@SeasonId int,
@Year int,
@CommunityId varchar(50)
as

SELECT        HC_CDCProjectsDetail.OwnerName + '/' + HC_ProjectType.ProjectType AS Detail, HC_CDCProjectsDetail.ProjectId
FROM            HC_CDCProjectsDetail INNER JOIN
                         HC_ProjectType ON HC_CDCProjectsDetail.ProjectType = HC_ProjectType.ProjectTypeId
WHERE        (HC_CDCProjectsDetail.SeasonId = @SeasonId) AND (HC_CDCProjectsDetail.Year = @Year) AND (HC_CDCProjectsDetail.CommunityId =@CommunityId)
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCProjectInstallmentsSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageCDCProjectInstallmentsSave]
@Year int,
@SeasonId int,
@ProjectId varchar(50),
@CommunityId varchar(50),
@InstallmentId int,
@Percentage float,
@Tax float,
@BankFee float,
@NetInstallment decimal(18,2),
@UserId uniqueidentifier,
@InsertionDate nvarchar(50),
@exist bit output
as

--checknig for existance
declare @TotalSum decimal(18,2)
declare @TotalContract decimal(18,2)
set @TotalSum=(select   isnull(SUM(NetInstallment),0) +isnull(SUM(Tax),0)+ isnull(SUM(BankTransferCost),0) FROM    HC_CDCProjectsInstallmentDetail where [ProjectId]=@ProjectId and [CommunityId]=@CommunityId)
set @TotalContract=(select [NHLPCost] from  HC_CDCProjectsDetail where [ProjectId]=@ProjectId and [CommunityId]=@CommunityId)
If (@TotalSum+@NetInstallment)>@TotalContract
	BEGIN
			set @exist=1
	END 
ElSE 
	BEGIN
		if exists(select 1 from HC_CDCProjectsInstallmentDetail where InstallmentId=@InstallmentId)
			begin
				set @exist=1
			end
	
		ElSE

			Begin

		
					INSERT INTO [dbo].[HC_CDCProjectsInstallmentDetail]
           ([Year]
		   ,[SeasonId]
		   ,[ProjectId]
           ,[CommunityId]
           ,[InstallmentId]
           ,[Percentage]
           ,[Tax]
           ,[BankTransferCost]
           ,[NetInstallment]
           ,[UserId]
           ,[InsertionDate]
		   )
     VALUES
           (@Year,
			@SeasonId,
		    @ProjectId,
			@CommunityId,
			@InstallmentId,
			@Percentage,
			@Tax,
			@BankFee,
			@NetInstallment,
			@UserId,
			@InsertionDate)
			
					set @exist=0

			end
	End

select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCProjectInstallmentsUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageCDCProjectInstallmentsUpdate]
@Year int,
@SeasonId int,
@ProjectId varchar(50),
@CommunityId varchar(50),
@InstallmentId int,
@Percentage float,
@Tax float,
@BankFee float,
@NetInstallment decimal(18,2),
@UserId uniqueidentifier,
@Updationdate nvarchar(50),
@exist bit output
as

--checknig for existance
declare @TotalSum decimal(18,2)
declare @TotalContract decimal(18,2)
set @TotalSum=(select   isnull(SUM(NetInstallment),0) +isnull(SUM(Tax),0)+ isnull(SUM(BankTransferCost),0) FROM    HC_CDCProjectsInstallmentDetail where [ProjectId]=@ProjectId and [CommunityId]=@CommunityId and InstallmentId<>@InstallmentId)
set @TotalContract=(select [NHLPCost] from  HC_CDCProjectsDetail where [ProjectId]=@ProjectId and [CommunityId]=@CommunityId)
If (@TotalSum+@NetInstallment)>@TotalContract
	BEGIN
			set @exist=1
	END 
ElSE

Begin

UPDATE [dbo].[HC_CDCProjectsInstallmentDetail]
   SET [Year] =@Year
      ,[SeasonId] = @SeasonId
      ,[Percentage] = @Percentage
      ,[Tax] = @Tax
      ,[BankTransferCost] = @BankFee
      ,[NetInstallment] = @NetInstallment
      ,[UpdateBy] = @UserId
      ,[UpdationDate] = @Updationdate
 WHERE [ProjectId]=@ProjectId and [CommunityId]=@CommunityId and InstallmentId=@InstallmentId


			
			set @exist=0

	end

	select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCProjectsDetailSAVE]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageCDCProjectsDetailSAVE]
@Year int,
@SeasonId int,
@CommunityId varchar(50),
@ProjectTypeId int,
@ContractCost decimal(18,2),
@NHLPCost decimal(18,2),
@OwnerName nvarchar(50),
@OwnerConactNo nvarchar(50),
@NoOfMembers int,
@Latitude nvarchar(50),
@Longtitude nvarchar(50),
@UserId uniqueidentifier,
@InsertionDate nvarchar(50),
@exist bit output
as

--checknig for existance 
If EXISTS (SELECT 1  from HC_CDCProjectsDetail where [OwnerName]=@OwnerName and [CommunityId]=@CommunityId and [ProjectType]=@ProjectTypeId and Year=@Year and SeasonId=@SeasonId)
	BEGIN
			set @exist=1
	END 
ElSE
	BEGIN
	declare @Id varchar(50)
	set @Id=(select count(*)+1 from [dbo].[HC_CDCProjectsDetail] where [CommunityId]=@CommunityId)
	set @Id=@CommunityId+'-'+cast(@ProjectTypeId as varchar)+'-'+@Id

	INSERT INTO [dbo].[HC_CDCProjectsDetail]
           ([ProjectId]
           ,[CommunityId]
		   ,[Year]
		   ,[SeasonId]
           ,[ProjectType]
           ,[ContractCost]
           ,[NHLPCost]
           ,[OwnerName]
           ,[OwnerContactNo]
           ,[NoOfOtherMembers]
           ,[Latitude]
           ,[Longtitude]
           ,[UserId]
           ,[InsertionDate]
           ,[IsDeleted])
     VALUES
           (@Id
           ,@CommunityId
		   ,@Year
		   ,@SeasonId
           ,@ProjectTypeId
           ,@ContractCost
           ,@NHLPCost
           ,@OwnerName
           ,@OwnerConactNo
           ,@NoOfMembers
           ,@Latitude
           ,@Longtitude
           ,@UserId
           ,@InsertionDate
           ,0)
		   set @exist=0
	END

select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCProjectsDetailUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageCDCProjectsDetailUpdate]
@ProjectId varchar(50),
@Year int,
@SeasonId int,
@CommunityId varchar(50),
@ProjectTypeId int,
@ContractCost decimal(18,2),
@NHLPCost decimal(18,2),
@OwnerName nvarchar(50),
@OwnerConactNo nvarchar(50),
@NoOfMembers int,
@Latitude nvarchar(50),
@Longtitude nvarchar(50),
@UserId uniqueidentifier,
@updationDate nvarchar(50)
as

--setting

	update [dbo].[HC_CDCProjectsDetail] set [IsDeleted]=1 where [Year]=@Year and [SeasonId]=@SeasonId and [CommunityId]=@CommunityId and [ProjectId]=@ProjectId
	
	declare @Id varchar(50)
	set @Id=(select count(*)+1 from [dbo].[HC_CDCProjectsDetail] where [CommunityId]=@CommunityId)
	set @Id=@CommunityId+'-'+cast( @ProjectTypeId as varchar)+'-'+@Id

	INSERT INTO [dbo].[HC_CDCProjectsDetail]
           ([ProjectId]
           ,[CommunityId]
		   ,[Year]
		   ,[SeasonId]
           ,[ProjectType]
           ,[ContractCost]
           ,[NHLPCost]
           ,[OwnerName]
           ,[OwnerContactNo]
           ,[NoOfOtherMembers]
           ,[Latitude]
           ,[Longtitude]
           ,[UserId]
           ,[InsertionDate]
           ,[IsDeleted])
     VALUES
           (@Id
           ,@CommunityId
		   ,@Year
		   ,@SeasonId
           ,@ProjectTypeId
           ,@ContractCost
           ,@NHLPCost
           ,@OwnerName
           ,@OwnerConactNo
           ,@NoOfMembers
           ,@Latitude
           ,@Longtitude
           ,@UserId
           ,@updationDate
           ,0)
	
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageCDCSave]
@Code varchar(50),
@CDCName Varchar(50),
@ChairmanName varchar(50),
@ContactNo varchar(50),
@BankAccount varchar(50),
@DistrictId int,
@ProvinceId int,
@UserId uniqueidentifier,
@InsertedDate nvarchar(50),
@ExtWId varchar(50),
@exist bit output
as

If EXISTS (SELECT 1 from HC_CDC where CommunityId=@Code)
	BEGIN
			set @exist=1
	END 

	
ELSE    
	BEGIN

			INSERT INTO [dbo].[HC_CDC]
					   ([CommunityId]
					   ,[Code]
					   ,[Name]
					   ,[ChairmanName]
					   ,[ChairmanContactNo]
					   ,[BankAccount]
					   ,[DistrictId]
					   ,[ProvinceId]
					   ,[ExtWId]
					   ,[UserId]
					   ,[InsertedDate]
					   )
				 VALUES
					   (@Code
					   ,@Code
					   ,@CDCName
					   ,@ChairmanName
					   ,@ContactNo
					   ,@BankAccount
					   ,@DistrictId
					   ,@ProvinceId
					   ,@ExtWId
					   ,@UserId
					   ,@InsertedDate
					   )

			set  @exist=0


	 END

select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageCDCUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageCDCUpdate]
@Id varchar(50),
@Code varchar(50),
@CDCName Varchar(50),
@ChairmanName varchar(50),
@ContactNo varchar(50),
@BankAccount varchar(50),
@DistrictId int,
@ProvinceId int,
@UserId uniqueidentifier,
@UpdationDate nvarchar(50),
@ExtWId varchar(50)
as

UPDATE [dbo].[HC_CDC]
   SET 
     [Name] =@CDCName
      ,[ChairmanName] = @ChairmanName
      ,[ChairmanContactNo] = @ContactNo
      ,[BankAccount] = @BankAccount
	  ,[ExtWId]=@ExtWId
      ,[UpdatedBy] = @UserId
      ,[UpdationDate] =@UpdationDate
 WHERE [CommunityId] =@Id and [Code] = @Code
GO
/****** Object:  StoredProcedure [dbo].[spPageCIGFemaleGetFarmerDetailToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageCIGFemaleGetFarmerDetailToUpdate]
@Year int,
@ExtWId varchar(50),
@FarmerId varchar(50),
@SeasonId int,
@CIGType int
as

SELECT        FC_FarmerInfo.Id, HC_CIGDetail.Year, HC_CIGDetail.SeasonId, FC_ExtensionWorkerInfo.ProvinceID, FC_ExtensionWorkerInfo.DistrictID, HC_CIGDetail.AreaByProject, HC_CIGDetail.AreaByFarmer, 
                         FC_FarmerInfo.ExtWId, HC_CIG.PositionId, HC_CIG.MembershipId, HC_CIGDetail.Longtitude, HC_CIGDetail.Latitude, HC_CIGDetail.Area, HC_CIGDetail.FarmerId
FROM            FC_ExtensionWorkerInfo INNER JOIN
                         FC_FarmerInfo ON FC_ExtensionWorkerInfo.ExtWID = FC_FarmerInfo.ExtWId INNER JOIN
                         HC_CIGDetail ON FC_FarmerInfo.Id = HC_CIGDetail.FarmerId INNER JOIN
                         HC_CIG ON FC_FarmerInfo.Id = HC_CIG.FarmerId
WHERE        (HC_CIGDetail.FarmerId =@FarmerId) AND (HC_CIGDetail.Year = @Year) AND (FC_FarmerInfo.ExtWId =@ExtWId) AND (HC_CIG.CIGType=@CIGType) and (HC_CIGDetail.SeasonId=@SeasonId)


GO
/****** Object:  StoredProcedure [dbo].[spPageCIGFemaleGetFarmerList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageCIGFemaleGetFarmerList4GridView]
@Year int,
@ExtWId varchar(50),
@SeasonId int,
@CIGType int
as

SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, HC_CIGDetail.Year, HC_CIGDetail.SeasonId, HC_CIGDetail.Area, HC_CIGDetail.FarmerId, FC_FarmerInfo.ExtWId, HC_CIG.CIGType
FROM            FC_ExtensionWorkerInfo INNER JOIN
                         FC_FarmerInfo ON FC_ExtensionWorkerInfo.ExtWID = FC_FarmerInfo.ExtWId INNER JOIN
                         HC_CIG ON FC_FarmerInfo.Id = HC_CIG.FarmerId INNER JOIN
                         HC_CIGDetail ON FC_FarmerInfo.Id = HC_CIGDetail.FarmerId
WHERE        (HC_CIGDetail.Year = @Year) AND (HC_CIGDetail.SeasonId = @SeasonId) AND (FC_FarmerInfo.ExtWId =@ExtWId) AND (HC_CIG.CIGType = @CIGType)
GO
/****** Object:  StoredProcedure [dbo].[spPageCIGMaleGetFarmerDetailToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageCIGMaleGetFarmerDetailToUpdate]
@Year int,
@ExtWId varchar(50),
@FarmerId varchar(50),
@SeasonId int,
@CIGType int
as
SELECT        HC_CIGDetail.FarmerId, HC_CIGDetail.Year, HC_CIGDetail.SeasonId, HC_CIGDetail.FruitToolsId, HC_CIGDetail.NoOfTrees, HC_CIGDetail.Area, HC_CIGDetail.AreaByProject, HC_CIGDetail.AreaByFarmer, 
                         HC_CIGDetail.Rehabilited, HC_CIGDetail.Longtitude, HC_CIGDetail.Latitude, HC_CIG.PositionId, HC_CIG.MembershipId, FC_FarmerInfo.ExtWId, FC_ExtensionWorkerInfo.DistrictID, 
                         FC_ExtensionWorkerInfo.ProvinceID, HC_CIG.CIGType, FC_FruitTools.Fruit
FROM            FC_ExtensionWorkerInfo INNER JOIN
                         FC_FarmerInfo ON FC_ExtensionWorkerInfo.ExtWID = FC_FarmerInfo.ExtWId INNER JOIN
                         HC_CIG ON FC_FarmerInfo.Id = HC_CIG.FarmerId INNER JOIN
                         HC_CIGDetail ON FC_FarmerInfo.Id = HC_CIGDetail.FarmerId INNER JOIN
                         FC_FruitTools ON HC_CIGDetail.FruitToolsId = FC_FruitTools.FruitID
WHERE        (HC_CIG.FarmerId =@FarmerId) AND (HC_CIGDetail.Year = @Year) AND (HC_CIGDetail.SeasonId = @SeasonId) AND (FC_FarmerInfo.ExtWId = @ExtWId) AND (HC_CIG.CIGType = @CIGType)

GO
/****** Object:  StoredProcedure [dbo].[spPageCIGMaleGetFarmerList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageCIGMaleGetFarmerList4GridView]
@Year int,
@ExtWId varchar(50),
@SeasonId int,
@CIGType int
as

SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, HC_CIGDetail.Year, HC_CIGDetail.SeasonId, SUM(HC_CIGDetail.Area) AS Area, HC_CIGDetail.FarmerId, FC_FarmerInfo.ExtWId, HC_CIG.CIGType
FROM            FC_ExtensionWorkerInfo INNER JOIN
                         FC_FarmerInfo ON FC_ExtensionWorkerInfo.ExtWID = FC_FarmerInfo.ExtWId INNER JOIN
                         HC_CIG ON FC_FarmerInfo.Id = HC_CIG.FarmerId INNER JOIN
                         HC_CIGDetail ON FC_FarmerInfo.Id = HC_CIGDetail.FarmerId
GROUP BY FC_FarmerInfo.Name, FC_FarmerInfo.FName, HC_CIGDetail.Year, HC_CIGDetail.SeasonId, HC_CIGDetail.FarmerId, FC_FarmerInfo.ExtWId, HC_CIG.CIGType
HAVING        (HC_CIGDetail.Year = @Year) AND (HC_CIGDetail.SeasonId = @SeasonId) AND (FC_FarmerInfo.ExtWId =@ExtWId) AND (HC_CIG.CIGType = @CIGType)

GO
/****** Object:  StoredProcedure [dbo].[spPageDashboardGetFarmerAlert]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageDashboardGetFarmerAlert]
as

;with tbl as(

SELECT        FC_FormerFruitDetails.FarmerId, ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) AS TotalAmount, FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_ExtensionWorkerInfo.Name AS ExtName, 
                         FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId, OCM_Province.ProvinceEngName, OCM_Region.name AS RegionName,
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount
                               WHERE        (FarmerId = FC_FormerFruitDetails.FarmerId) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS RecievedAmount, 
                         ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) -
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount AS FC_FarmerRecieveAmount_1
                               WHERE        (FarmerId = FC_FormerFruitDetails.FarmerId) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS Balance, FC_Season.SeasonName
FROM            OCM_Region INNER JOIN
                         OCM_Province ON OCM_Region.id = OCM_Province.Region INNER JOIN
                         FC_ExtensionWorkerInfo INNER JOIN
                         FC_FarmerInfo ON FC_ExtensionWorkerInfo.ExtWID = FC_FarmerInfo.ExtWId INNER JOIN
                         FC_FormerFruitDetails ON FC_FarmerInfo.Id = FC_FormerFruitDetails.FarmerId ON OCM_Province.ProvinceID = FC_ExtensionWorkerInfo.ProvinceID INNER JOIN
                         FC_Season ON FC_FormerFruitDetails.SeasonId = FC_Season.SeasonId
WHERE        (CONVERT(Date, FC_FormerFruitDetails.PayableDate, 101) <= CONVERT(Date, GETDATE(), 101))
GROUP BY FC_FormerFruitDetails.FarmerId, FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_ExtensionWorkerInfo.Name, FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId, OCM_Province.ProvinceEngName, 
                         OCM_Region.name, FC_Season.SeasonName						 
		)

 select * from tbl where Balance>0
GO
/****** Object:  StoredProcedure [dbo].[spPageDashboardGetFarmerAlertDistinctRegion]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPageDashboardGetFarmerAlertDistinctRegion]
as

;with tbl as(

SELECT        FC_FormerFruitDetails.FarmerId, ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) AS TotalAmount, FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_ExtensionWorkerInfo.Name AS ExtName, 
                         FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId, OCM_Province.ProvinceEngName, OCM_Region.name AS RegionName,OCM_Region.id,
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount
                               WHERE        (FarmerId = FC_FormerFruitDetails.FarmerId) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS RecievedAmount, 
                         ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) -
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount AS FC_FarmerRecieveAmount_1
                               WHERE        (FarmerId = FC_FormerFruitDetails.FarmerId) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS Balance, FC_Season.SeasonName
FROM            OCM_Region INNER JOIN
                         OCM_Province ON OCM_Region.id = OCM_Province.Region INNER JOIN
                         FC_ExtensionWorkerInfo INNER JOIN
                         FC_FarmerInfo ON FC_ExtensionWorkerInfo.ExtWID = FC_FarmerInfo.ExtWId INNER JOIN
                         FC_FormerFruitDetails ON FC_FarmerInfo.Id = FC_FormerFruitDetails.FarmerId ON OCM_Province.ProvinceID = FC_ExtensionWorkerInfo.ProvinceID INNER JOIN
                         FC_Season ON FC_FormerFruitDetails.SeasonId = FC_Season.SeasonId
WHERE        (CONVERT(Date, FC_FormerFruitDetails.PayableDate, 101) <= CONVERT(Date, GETDATE(), 101))
GROUP BY FC_FormerFruitDetails.FarmerId, FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_ExtensionWorkerInfo.Name, FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId, OCM_Province.ProvinceEngName, 
                         OCM_Region.name, FC_Season.SeasonName,OCM_Region.id						 
		)

 select distinct id,RegionName from tbl where Balance>0
GO
/****** Object:  StoredProcedure [dbo].[spPageDemoOrchardFarmerList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageDemoOrchardFarmerList4GridView]
@Year int,
@ExtWId varchar(50),
@SeasonId int,
@ActivityId int
as
SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.Area, HC_FarmerNonContActivityDetails.NoOfSpecies, 
                         HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.FarmerActivityId, HC_FarmerActivityDetails.FarmerId, 
                         HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId, FC_FruitTools.Fruit, HC_FarmerNonContActivityDetails.Id
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_FruitTools ON HC_FarmerNonContActivityDetails.FruitCropId = FC_FruitTools.FruitID
        
WHERE        (FC_FarmerInfo.ExtWId = @ExtWId) and (HC_FarmerActivityDetails.ActivityId = @ActivityId) AND (HC_FarmerActivityDetails.Year = @Year) AND (HC_FarmerActivityDetails.SeasonId = @SeasonId) and (HC_FarmerNonContActivityDetails.IsDeleted=0)


GO
/****** Object:  StoredProcedure [dbo].[spPageDemoOrchardGetFarmerDetailToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageDemoOrchardGetFarmerDetailToUpdate]

@Year int,
@ExtWId nvarchar(50),
@FarmerId nvarchar(50),
@SeasonId int,
@ActivityId int,
@FruitCropId int,
@FarmerActivityId varchar(70)
as
SELECT        HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId, HC_FarmerNonContActivityDetails.Area, 
                         HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.NoOfSpecies, HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, HC_VarietyInfo.VarietyId, 
                         HC_DensityInfo.DensityType, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.IsDeleted, FC_ExtensionWorkerInfo.DistrictID, FC_ExtensionWorkerInfo.ProvinceID, 
                         HC_FarmerNonContActivityDetails.Id
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         HC_VarietyInfo ON HC_FarmerActivityDetails.FarmerActivityId = HC_VarietyInfo.FarmerActivityId AND HC_FarmerNonContActivityDetails.FruitCropId = HC_VarietyInfo.FruitCropId INNER JOIN
                         HC_DensityInfo ON HC_FarmerActivityDetails.FarmerActivityId = HC_DensityInfo.FarmerActivityId AND HC_FarmerNonContActivityDetails.FruitCropId = HC_DensityInfo.FruitCropId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID
WHERE        (HC_FarmerActivityDetails.FarmerId = @FarmerId) AND (HC_FarmerNonContActivityDetails.FruitCropId = @FruitCropId) AND (FC_FarmerInfo.ExtWId = @ExtWId) AND (HC_FarmerActivityDetails.Year = @Year) AND 
                         (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.ActivityId = @ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted = 0) and (HC_FarmerNonContActivityDetails.FarmerActivityId =@FarmerActivityId )

       

GO
/****** Object:  StoredProcedure [dbo].[spPageDemoOrchardSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageDemoOrchardSave]
@FarmerId varchar(50),
@ActivityId int,
@FruitCropId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@VarietyId int,
@DensityType int,
@InsertionDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@IsDeleted bit,
@exist bit output
as

--checknig for existance 
If EXISTS (SELECT 1         
FROM            HC_FarmerActivityDetails INNER JOIN
                        HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
                    WHERE HC_FarmerActivityDetails.FarmerId=@FarmerId and HC_FarmerNonContActivityDetails.FruitCropId=@FruitCropId and  HC_FarmerActivityDetails.YEAR=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId and HC_FarmerActivityDetails.ActivityId=@ActivityId)
BEGIN
        set @exist=1
END 

ELSE    
    BEGIN

	--id chekcing id

					declare @FarmerActivityId varchar(70)
					declare @DetailId varchar(10)
					if exists ( select 1  from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
						begin

							set @FarmerActivityId=(select FarmerActivityId from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )
						 end
					else
						
						begin	
							set @FarmerActivityId=(select count(*)+1 from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @FarmerActivityId=@FarmerId+'-'+cast(@ActivityId as varchar)+'-'+@FarmerActivityId+'-'+cast(@SeasonId as varchar)+'-'+cast(@Year as varchar)

							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

							INSERT INTO [dbo].[HC_FarmerActivityDetails]
								([FarmerActivityId]	
								,[FarmerId]
								,[ActivityId]
								,[Year]
								,[SeasonId]
								,[ContributionType])
							VALUES
								(@FarmerActivityId,@FarmerId,@ActivityId,@Year,@SeasonId,2)

						end

	

-- activity Details

INSERT INTO [dbo].[HC_FarmerNonContActivityDetails]
        ([Id]
		,[FarmerActivityId]
		,[FruitCropId]
        ,[Area]
        ,[AreaUnit]
        ,[NoOfSpecies]
        ,[SpeciesUnit]
        ,[InsertionDate]
        ,[UserId]
        ,[Latitude]
        ,[Longtitude]
        ,[IsDeleted])
    VALUES
        (
@DetailId,
@FarmerActivityId,
@FruitCropId,
@Area,
@AreaUnit,
@NoOfSpecies,
@SpeciesUnit,
@InsertionDate,
@UserId,
@Latitude,
@Longtitude,
@IsDeleted)

INSERT INTO [dbo].[HC_DensityInfo]
        (DetailId
		,FarmerActivityId
        ,[FruitCropId]           
        ,[DensityType])
    VALUES
        (@DetailId,@FarmerActivityId,@FruitCropId,@DensityType)

INSERT INTO [dbo].[HC_VarietyInfo]
        (DetailId
		,FarmerActivityId
        ,[FruitCropId]
        ,[VarietyId])
    VALUES
        (@DetailId,@FarmerActivityId,@FruitCropId,@VarietyId)

set  @exist=0



		END

		select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageDemoOrchardUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  proc [dbo].[spPageDemoOrchardUpdate]
@FarmerId varchar(50),
@ActivityId int,
@FruitCropId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@VarietyId int,
@DensityType int,
@UpdationDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@FarmerActivityId varchar(70),
@DetailId varchar(10)
as

--updating seting false value

update      HC_FarmerNonContActivityDetails set  HC_FarmerNonContActivityDetails.IsDeleted=1
FROM            HC_FarmerActivityDetails INNER JOIN
                         HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
						 WHERE HC_FarmerNonContActivityDetails.Id=@DetailId and  HC_FarmerNonContActivityDetails.FarmerActivityId=@FarmerActivityId and  HC_FarmerActivityDetails.FarmerId =@FarmerId and HC_FarmerActivityDetails.ActivityId =@ActivityId and HC_FarmerActivityDetails.Year=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId

--inserting new value
declare @Id varchar(10)
set @Id=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

 INSERT INTO [dbo].[HC_FarmerNonContActivityDetails]
           ([Id]
		   ,[FarmerActivityId]
           ,[FruitCropId]
           ,[Area]
           ,[AreaUnit]
           ,[NoOfSpecies]
           ,[SpeciesUnit]
           ,[InsertionDate]
           ,[UserId]
           ,[Latitude]
           ,[Longtitude]
           ,[IsDeleted])
     VALUES
           (
		   @Id,
@FarmerActivityId,
@FruitCropId,
@Area,
@AreaUnit,
@NoOfSpecies,
@SpeciesUnit,
@UpdationDate,
@UserId,
@Latitude,
@Longtitude,
0)

--updating density table

if exists( select 1 from [dbo].[HC_DensityInfo] WHERE  [FarmerActivityId] =@FarmerActivityId and DetailId=@DetailId )
	 begin
			delete from  [dbo].[HC_DensityInfo]
			 WHERE  [FarmerActivityId] =@FarmerActivityId  and DetailId=@DetailId

			 INSERT INTO [dbo].[HC_DensityInfo]
			(DetailId
			,FarmerActivityId
			,[FruitCropId]           
			,[DensityType])
		VALUES
			(@Id,@FarmerActivityId,@FruitCropId,@DensityType)
	 end


 --updating varity information 
 if exists( select 1 from [dbo].[HC_VarietyInfo] WHERE  [FarmerActivityId] =@FarmerActivityId  and DetailId=@DetailId)
	 begin
		 delete from  [dbo].[HC_VarietyInfo]
		 WHERE [FarmerActivityId] =@FarmerActivityId and DetailId=@DetailId

		 INSERT INTO [dbo].[HC_VarietyInfo]
        (DetailId
		,FarmerActivityId
        ,[FruitCropId]
        ,[VarietyId])
    VALUES
        (@Id,@FarmerActivityId,@FruitCropId,@VarietyId)
	 end

GO
/****** Object:  StoredProcedure [dbo].[spPageDepositGetFarmerAmountDetail]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageDepositGetFarmerAmountDetail]
@Year int,
@FarmerId varchar(50),
@SeasonId int,
@ExtWorkerId varchar(50)
as
SELECT        FC_FarmerInfo.Name, FC_FarmerRecieveAmount.Year, FC_FarmerRecieveAmount.SeasonId, FC_FarmerRecieveAmount.RecievedAmount, FC_FarmerRecieveAmount.EntryDate, aspnet_Users.UserName, 
                         FC_FarmerRecieveAmount.UserId, FC_FarmerRecieveAmount.ExtWID,FC_FarmerRecieveAmount.FarmerId
FROM            aspnet_Users INNER JOIN
                         FC_FarmerRecieveAmount ON aspnet_Users.UserId = FC_FarmerRecieveAmount.UserId INNER JOIN
                         FC_FarmerInfo ON FC_FarmerRecieveAmount.FarmerId = FC_FarmerInfo.Id
WHERE        (FC_FarmerRecieveAmount.Year = @Year) AND (FC_FarmerRecieveAmount.SeasonId = @SeasonId) AND (FC_FarmerRecieveAmount.ExtWID = @ExtWorkerId) AND (FC_FarmerRecieveAmount.FarmerId =@FarmerId)
GO
/****** Object:  StoredProcedure [dbo].[spPageFarmerContrinbutionGetPercentage]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spPageFarmerContrinbutionGetPercentage]
@Year int,
@FruitToolsId int,
@ProvinceId int
as

SELECT        Percentage
FROM            FC_FruitToolsPercentage
where  (FC_FruitToolsPercentage.FruitToolsId = @FruitToolsId) and (FC_FruitToolsPercentage.ProvinceTypeId=(
																								select ProvinceTypeId from  FC_ProvinceTypeDetail where Year=@Year and ProvinceId=@ProvinceId
																								)
														)

GO
/****** Object:  StoredProcedure [dbo].[SpPageFemaleCIGSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SpPageFemaleCIGSave]
@FarmerId nvarchar(50),
@Year int,
@SeasonId int,
@AreaByProject float,
@AreaByFarmer float,
@Area decimal(18,2),
@Longtitude nvarchar(50),
@Latitude nvarchar(50),
@Position int,
@Membership int,
@UserId uniqueidentifier,
@InsertedDate nvarchar(50),
@CIGType int,
@AreaUnit int,
@exist bit output
as


If EXISTS (SELECT        1  FROM HC_CIGDetail INNER JOIN HC_CIG ON HC_CIGDetail.FarmerId = HC_CIG.FarmerId
WHERE        (HC_CIGDetail.FarmerId = @FarmerId) AND (HC_CIGDetail.Year = @Year) AND (HC_CIGDetail.SeasonId = @SeasonId) and( HC_CIG.[CIGType]=@CIGType))
    BEGIN
         set @exist=1
    END 

ELSE    
     BEGIN
       
				If Not EXISTS (SELECT 1 FROM HC_CIG WHERE FarmerId=@FarmerId)
			   begin
					   INSERT INTO [dbo].[HC_CIG]
						   ([FarmerId]
						   ,[ContributionYear]
						   ,[SeasonId]
						   ,[CIGType]
						   ,[PositionId]
						   ,[MembershipId]
						   ,[UserId]
						   ,[InsertionDate])
					 VALUES
						   (@FarmerId,@Year,@SeasonId,@CIGType,@Position,@Membership,@UserId,@InsertedDate)
			   end

INSERT INTO [dbo].[HC_CIGDetail]
           ([FarmerId]
           ,[Year]
           ,[SeasonId]
           ,[Area]
		   ,[AreaByFarmer]
		   ,[AreaByProject]
           ,[Longtitude]
           ,[Latitude]
           ,[UserId]
           ,[InsertedDate]
		   ,[AreaUnit])
     VALUES
           (
		   @FarmerId,
@Year ,
@SeasonId ,
@Area,
@AreaByFarmer,
@AreaByProject,
@Longtitude ,
@Latitude,
@UserId ,
@InsertedDate ,
@AreaUnit
		   )

		 set  @exist=0


select @exist
		    END
GO
/****** Object:  StoredProcedure [dbo].[spPageFemaleCIGUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageFemaleCIGUpdate]

@FarmerId varchar(50),

@Year int,

@SeasonId int,

@ExtWId varchar(50),

@Area decimal(18,2),

@AreaByFarmer float,
@AreaByProject float,


@Longtitude nvarchar(50),

@Latitude nvarchar(50),

@Position int,

@Membership int,

@UserId uniqueidentifier,

@UpdationDate nvarchar(50)

as

UPDATE [dbo].[HC_CIGDetail]

   SET 
      
       [Area] = @Area
      ,[Longtitude] = @Longtitude
      ,[Latitude] =@Latitude
      ,[UpdatedBy] =@UserId
      ,[UpdationDate] =@UpdationDate
	  ,[AreaByProject]=@AreaByProject
	  ,[AreaByFarmer]=@AreaByFarmer
 WHERE FarmerId=@FarmerId and YEAR=@Year and  [SeasonId] =@SeasonId

 UPDATE [dbo].[HC_CIG]
   SET 
      [PositionId] = @Position
      ,[MembershipId] = @Membership
	   ,[UpdatedBy] =@UserId
      ,[UpdationDate] =@UpdationDate
WHERE FarmerId=@FarmerId and ContributionYear=@Year and [SeasonId] =@SeasonId
GO
/****** Object:  StoredProcedure [dbo].[spPageKGFarmerList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageKGFarmerList4GridView]
@Year int,
@ExtWId varchar(50),
@SeasonId int,
@ActivityId int
as
SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, SUM(HC_FarmerNonContActivityDetails.Area) AS Area, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.FarmerActivityId, 
                         HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_FruitTools ON HC_FarmerNonContActivityDetails.FruitCropId = FC_FruitTools.FruitID        
WHERE        (FC_FarmerInfo.ExtWId = @ExtWId) and (HC_FarmerActivityDetails.ActivityId = @ActivityId) AND (HC_FarmerActivityDetails.Year = @Year) AND (HC_FarmerActivityDetails.SeasonId = @SeasonId) and (HC_FarmerNonContActivityDetails.IsDeleted=0)
GROUP BY FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.FarmerActivityId, HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, 
                         HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId

GO
/****** Object:  StoredProcedure [dbo].[spPageKGGetFarmerDetailToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[spPageKGGetFarmerDetailToUpdate]

@Year int,
@ExtWId nvarchar(50),
@FarmerId nvarchar(50),
@SeasonId int,
@ActivityId int,
@FarmerActivityId varchar(70)
as
SELECT        HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId, HC_FarmerNonContActivityDetails.Area, 
                         HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.NoOfSpecies, HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, 
                         FC_ExtensionWorkerInfo.DistrictID, FC_ExtensionWorkerInfo.ProvinceID, HC_FarmerNonContActivityDetails.Id, HC_FarmerNonContActivityDetails.FarmerActivityId, FC_FruitTools.Fruit
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID INNER JOIN
                         FC_FruitTools ON HC_FarmerNonContActivityDetails.FruitCropId = FC_FruitTools.FruitID
WHERE        (HC_FarmerActivityDetails.FarmerId = @FarmerId)  AND (FC_FarmerInfo.ExtWId = @ExtWId) AND (HC_FarmerActivityDetails.Year = @Year) AND 
                         (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.ActivityId = @ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted = 0) and (HC_FarmerNonContActivityDetails.FarmerActivityId =@FarmerActivityId )

       

GO
/****** Object:  StoredProcedure [dbo].[spPageKGSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageKGSave]
@FarmerId varchar(50),
@ActivityId int,
@FruitCropId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@InsertionDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@IsDeleted bit,
@exist bit output
as

--checknig for existance 
If EXISTS (SELECT 1         
FROM            HC_FarmerActivityDetails INNER JOIN
                        HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
                    WHERE HC_FarmerActivityDetails.FarmerId=@FarmerId and HC_FarmerNonContActivityDetails.FruitCropId=@FruitCropId and  HC_FarmerActivityDetails.YEAR=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId and HC_FarmerActivityDetails.ActivityId=@ActivityId)
BEGIN
        set @exist=1
END 

ELSE    
    BEGIN

	--id chekcing id

					declare @FarmerActivityId varchar(70)
					declare @DetailId varchar(10)
					if exists ( select 1  from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
						begin

							set @FarmerActivityId=(select FarmerActivityId from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )
						 end
					else
						
						begin	
							set @FarmerActivityId=(select count(*)+1 from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @FarmerActivityId=@FarmerId+'-'+cast(@ActivityId as varchar)+'-'+@FarmerActivityId+'-'+cast(@SeasonId as varchar)+'-'+cast(@Year as varchar)

							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

							INSERT INTO [dbo].[HC_FarmerActivityDetails]
								([FarmerActivityId]	
								,[FarmerId]
								,[ActivityId]
								,[Year]
								,[SeasonId]
								,[ContributionType])
							VALUES
								(@FarmerActivityId,@FarmerId,@ActivityId,@Year,@SeasonId,2)

						end

	

-- activity Details

INSERT INTO [dbo].[HC_FarmerNonContActivityDetails]
        ([Id]
		,[FarmerActivityId]
		,[FruitCropId]
        ,[Area]
        ,[AreaUnit]
        ,[NoOfSpecies]
        ,[SpeciesUnit]
        ,[InsertionDate]
        ,[UserId]
        ,[Latitude]
        ,[Longtitude]
        ,[IsDeleted])
    VALUES
        (
@DetailId,
@FarmerActivityId,
@FruitCropId,
@Area,
@AreaUnit,
@NoOfSpecies,
@SpeciesUnit,
@InsertionDate,
@UserId,
@Latitude,
@Longtitude,
@IsDeleted)


set  @exist=0



		END

		select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageKGUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  proc [dbo].[spPageKGUpdate]
@FarmerId varchar(50),
@ActivityId int,
@FruitCropId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@UpdationDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@FarmerActivityId varchar(70)
as

--updating seting false value

--update      HC_FarmerNonContActivityDetails set  HC_FarmerNonContActivityDetails.IsDeleted=1
--FROM            HC_FarmerActivityDetails INNER JOIN
--                         HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
--						 WHERE   HC_FarmerNonContActivityDetails.FarmerActivityId=@FarmerActivityId and  HC_FarmerActivityDetails.FarmerId =@FarmerId and HC_FarmerActivityDetails.ActivityId =@ActivityId and HC_FarmerActivityDetails.Year=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId

--inserting new value
declare @Id varchar(10)
set @Id=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

 INSERT INTO [dbo].[HC_FarmerNonContActivityDetails]
           ([Id]
		   ,[FarmerActivityId]
           ,[FruitCropId]
           ,[Area]
           ,[AreaUnit]
           ,[NoOfSpecies]
           ,[SpeciesUnit]
           ,[InsertionDate]
           ,[UserId]
           ,[Latitude]
           ,[Longtitude]
           ,[IsDeleted])
     VALUES
           (
		   @Id,
@FarmerActivityId,
@FruitCropId,
@Area,
@AreaUnit,
@NoOfSpecies,
@SpeciesUnit,
@UpdationDate,
@UserId,
@Latitude,
@Longtitude,
0)



GO
/****** Object:  StoredProcedure [dbo].[SpPageMaleCIGSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SpPageMaleCIGSave]
@FarmerId varchar(50),
@Year int,
@SeasonId int,
@FruitToolsId int,
@NoOfTrees int,
@AreaByProject float,
@AreaByFarmer float,
@Area decimal(18,2),
@Rehabilited float,
@Longtitude nvarchar(50),
@Latitude nvarchar(50),
@Position int,
@Membership int,
@UserId uniqueidentifier,
@InsertedDate nvarchar(50),
@AreaUnit varchar(10),
@CIGType int,
@exist bit output
as


If EXISTS (SELECT 1 FROM HC_CIGDetail WHERE FarmerId=@FarmerId and YEAR=@Year and SeasonId=@SeasonId and FruitToolsId=@FruitToolsId)
    BEGIN
         set @exist=1
    END 

ELSE    
     BEGIN
       
	   If Not EXISTS (SELECT 1 FROM HC_CIG WHERE FarmerId=@FarmerId)
	   begin
			   INSERT INTO [dbo].[HC_CIG]
				   ([FarmerId]
				   ,[ContributionYear]
				   ,[SeasonId]
				   ,[CIGType]
				   ,[PositionId]
				   ,[MembershipId]
				   ,[UserId]
				   ,[InsertionDate])
			 VALUES
				   (@FarmerId,@Year,@SeasonId,@CIGType,@Position,@Membership,@UserId,@InsertedDate)
	   end
    
 
INSERT INTO [dbo].[HC_CIGDetail]
           ([FarmerId]
           ,[Year]
           ,[SeasonId]
           ,[FruitToolsId]
           ,[NoOfTrees]
           ,[Area]
		   ,[AreaByFarmer]
		   ,[AreaByProject]
           ,[Rehabilited]
           ,[Longtitude]
           ,[Latitude]
           ,[UserId]
           ,[InsertedDate]
		   ,[AreaUnit])
     VALUES
           (
@FarmerId,
@Year ,
@SeasonId ,
@FruitToolsId ,
@NoOfTrees ,
@Area,
@AreaByFarmer,
@AreaByProject,
@Rehabilited ,
@Longtitude ,
@Latitude,
@UserId ,
@InsertedDate ,
@AreaUnit
		   )

		 set  @exist=0

		    END

select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageMaleCIGUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spPageMaleCIGUpdate]

@FarmerId varchar(50),

@Year int,

@SeasonId int,

@ExtWId varchar(50),

@FruitToolsId int,

@NoOfTrees int,

@Area decimal(18,2),

@AreaByFarmer float,
@AreaByProject float,

@Rehabilited float,

@Longtitude nvarchar(50),

@Latitude nvarchar(50),

@Position int,

@Membership int,

@UserId uniqueidentifier,

@UpdationDate nvarchar(50),
@AreaUnit int

as

delete from HC_CIGDetail  WHERE FarmerId=@FarmerId and YEAR=@Year and [SeasonId] =@SeasonId and InsertedDate<>@UpdationDate
INSERT INTO [dbo].[HC_CIGDetail]
           ([FarmerId]
           ,[Year]
           ,[SeasonId]
           ,[FruitToolsId]
           ,[NoOfTrees]
           ,[Area]
		   ,[AreaByFarmer]
		   ,[AreaByProject]
           ,[Rehabilited]
           ,[Longtitude]
           ,[Latitude]
           ,[UserId]
           ,[InsertedDate]
		   ,[AreaUnit])
     VALUES
           (
@FarmerId,
@Year ,
@SeasonId ,
@FruitToolsId ,
@NoOfTrees ,
@Area,
@AreaByFarmer,
@AreaByProject,
@Rehabilited ,
@Longtitude ,
@Latitude,
@UserId ,
@UpdationDate ,
@AreaUnit
		   )
       
 

  UPDATE [dbo].[HC_CIG]
   SET 
      [PositionId] = @Position
      ,[MembershipId] = @Membership
	   ,[UpdatedBy] =@UserId
      ,[UpdationDate] =@UpdationDate
WHERE FarmerId=@FarmerId and ContributionYear=@Year and [SeasonId] =@SeasonId
GO
/****** Object:  StoredProcedure [dbo].[spPageMicroGreenHouseFarmerList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageMicroGreenHouseFarmerList4GridView]
@Year int,
@ExtWId varchar(50),
@SeasonId int,
@ActivityId int
as
SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, HC_FarmerNonContActivityDetails.Area, HC_FarmerNonContActivityDetails.NoOfSpecies, HC_FarmerNonContActivityDetails.Latitude, 
                         HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.FarmerActivityId, HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, 
                         HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id
WHERE        (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.Year = @Year) AND (FC_FarmerInfo.ExtWID =@ExtWId) AND (HC_FarmerActivityDetails.ActivityId = @ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted =0)

GO
/****** Object:  StoredProcedure [dbo].[spPageMicroGreenHouseGetFarmerDetailToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageMicroGreenHouseGetFarmerDetailToUpdate]

@Year int,
@ExtWId nvarchar(50),
@FarmerId nvarchar(50),
@SeasonId int,
@ActivityId int,
@FarmerActivityId varchar(70)
as
SELECT        HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId, HC_FarmerNonContActivityDetails.Area, 
                         HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.NoOfSpecies, HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, 
                         HC_FarmerNonContActivityDetails.IsDeleted, FC_ExtensionWorkerInfo.DistrictID, FC_ExtensionWorkerInfo.ProvinceID
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID
WHERE       (HC_FarmerNonContActivityDetails.FarmerActivityId =@FarmerActivityId ) and  (HC_FarmerActivityDetails.FarmerId =@FarmerId)  and(FC_ExtensionWorkerInfo.ExtWID=@ExtWId) AND (HC_FarmerActivityDetails.Year = @Year) AND (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.ActivityId =@ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted ='false' )

GO
/****** Object:  StoredProcedure [dbo].[spPageMicroGreenHouseSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageMicroGreenHouseSave]
@FarmerId varchar(50),
@ActivityId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@InsertionDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@IsDeleted bit,
@exist bit output
as

--checknig for existance 
If EXISTS (SELECT 1         
FROM           HC_FarmerActivityDetails INNER JOIN
                        HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
                    WHERE HC_FarmerActivityDetails.FarmerId=@FarmerId  and  HC_FarmerActivityDetails.YEAR=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId and HC_FarmerActivityDetails.ActivityId=@ActivityId)
		BEGIN
				set @exist=1
		END

ELSE    
		 BEGIN

		 
					--id chekcing id

						declare @FarmerActivityId varchar(70)
						declare @DetailId varchar(10)
					if exists ( select 1  from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
						begin

							set @FarmerActivityId=(select FarmerActivityId from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )
						 end
					else
						
						begin	
							set @FarmerActivityId=(select count(*)+1 from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @FarmerActivityId=@FarmerId+'-'+cast(@ActivityId as varchar)+'-'+@FarmerActivityId+'-'+cast(@SeasonId as varchar)+'-'+cast(@Year as varchar)

							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

							INSERT INTO [dbo].[HC_FarmerActivityDetails]
								([FarmerActivityId]	
								,[FarmerId]
								,[ActivityId]
								,[Year]
								,[SeasonId]
								,[ContributionType])
							VALUES
								(@FarmerActivityId,@FarmerId,@ActivityId,@Year,@SeasonId,2)

						end

						
				-- activity Details

					INSERT INTO [dbo].HC_FarmerNonContActivityDetails
							   ([Id]
							   ,FarmerActivityId
							   ,[Area]
							   ,[AreaUnit]
							   ,[NoOfSpecies]
							   ,[SpeciesUnit]
							   ,[InsertionDate]
							   ,[UserId]
							   ,[Latitude]
							   ,[Longtitude]
							   ,[IsDeleted])
						 VALUES
							   (
							   @DetailId,
					@FarmerActivityId,
					@Area,
					@AreaUnit,
					@NoOfSpecies,
					@SpeciesUnit,
					@InsertionDate,
					@UserId,
					@Latitude,
					@Longtitude,
					@IsDeleted)

					 set  @exist=0



					END

	select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageMicroGreenHouseUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  proc [dbo].[spPageMicroGreenHouseUpdate]
@FarmerId varchar(50),
@ActivityId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@UpdationDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@FarmerActivityId varchar(70)
as

--updating seting false value

update      HC_FarmerNonContActivityDetails set  HC_FarmerNonContActivityDetails.IsDeleted=1
FROM            HC_FarmerActivityDetails INNER JOIN
                         HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
						 WHERE HC_FarmerNonContActivityDetails.FarmerActivityId=@FarmerActivityId and  HC_FarmerActivityDetails.FarmerId =@FarmerId  and HC_FarmerActivityDetails.ActivityId =@ActivityId and HC_FarmerActivityDetails.Year=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId

declare @Id varchar(10)
set @Id=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

 INSERT INTO [dbo].[HC_FarmerNonContActivityDetails]
           ([Id],
		   [FarmerActivityId]
           ,[Area]
           ,[AreaUnit]
           ,[NoOfSpecies]
           ,[SpeciesUnit]
           ,[InsertionDate]
           ,[UserId]
           ,[Latitude]
           ,[Longtitude]
           ,[IsDeleted])
     VALUES
           (
@Id,
@FarmerActivityId,
@Area,
@AreaUnit,
@NoOfSpecies,
@SpeciesUnit,
@UpdationDate,
@UserId,
@Latitude,
@Longtitude,
0)
GO
/****** Object:  StoredProcedure [dbo].[spPageMicroNutrientFarmerList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spPageMicroNutrientFarmerList4GridView]
@Year int,
@ExtWId varchar(50),
@SeasonId int,
@ActivityId int
as
SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.Area, HC_FarmerNonContActivityDetails.NoOfSpecies, 
                         HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.FarmerActivityId, HC_FarmerActivityDetails.FarmerId, 
                         HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id
WHERE        (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.Year = @Year) AND (FC_FarmerInfo.ExtWID =@ExtWId) AND (HC_FarmerActivityDetails.ActivityId = @ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted =0)

GO
/****** Object:  StoredProcedure [dbo].[spPageMicroNutrientGetFarmerDetailToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageMicroNutrientGetFarmerDetailToUpdate]

@Year int,
@ExtWId nvarchar(50),
@FarmerId nvarchar(50),
@SeasonId int,
@ActivityId int,
@FarmerActivityId varchar(70)
as
SELECT        HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId, HC_FarmerNonContActivityDetails.Area, 
                         HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.NoOfSpecies, HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, 
                         HC_FarmerNonContActivityDetails.IsDeleted, FC_ExtensionWorkerInfo.DistrictID, FC_ExtensionWorkerInfo.ProvinceID
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID
WHERE       (HC_FarmerNonContActivityDetails.FarmerActivityId =@FarmerActivityId ) and (HC_FarmerActivityDetails.FarmerId =@FarmerId)  and(FC_FarmerInfo.ExtWID=@ExtWId) AND (HC_FarmerActivityDetails.Year = @Year) AND (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.ActivityId =@ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted ='false' )

GO
/****** Object:  StoredProcedure [dbo].[spPageMicroNutrientSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spPageMicroNutrientSave]
@FarmerId varchar(50),
@ActivityId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@InsertionDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@IsDeleted bit,
@exist bit output
as

--checknig for existance 
If EXISTS (SELECT 1         
FROM            HC_FarmerActivityDetails INNER JOIN
                        HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
                    WHERE HC_FarmerActivityDetails.FarmerId=@FarmerId and  HC_FarmerActivityDetails.YEAR=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId and HC_FarmerActivityDetails.ActivityId=@ActivityId)
	BEGIN
			set @exist=1
	END 


ELSE    
 BEGIN
	
	--id chekcing id

						declare @FarmerActivityId varchar(70)
					declare @DetailId varchar(10)
					if exists ( select 1  from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
						begin

							set @FarmerActivityId=(select FarmerActivityId from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )
						 end
					else
						
						begin	
							set @FarmerActivityId=(select count(*)+1 from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @FarmerActivityId=@FarmerId+'-'+cast(@ActivityId as varchar)+'-'+@FarmerActivityId+'-'+cast(@SeasonId as varchar)+'-'+cast(@Year as varchar)

							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

							INSERT INTO [dbo].[HC_FarmerActivityDetails]
								([FarmerActivityId]	
								,[FarmerId]
								,[ActivityId]
								,[Year]
								,[SeasonId]
								,[ContributionType])
							VALUES
								(@FarmerActivityId,@FarmerId,@ActivityId,@Year,@SeasonId,2)

						end

		

-- activity Details

	
	INSERT INTO [dbo].HC_FarmerNonContActivityDetails
           ([Id]
		   ,[FarmerActivityId]
           ,[Area]
           ,[AreaUnit]
           ,[NoOfSpecies]
           ,[SpeciesUnit]
           ,[InsertionDate]
           ,[UserId]
           ,[Latitude]
           ,[Longtitude]
           ,[IsDeleted])
     VALUES
           (
		   @DetailId,
			@FarmerActivityId,
			@Area,
			@AreaUnit,
			@NoOfSpecies,
			@SpeciesUnit,
			@InsertionDate,
			@UserId,
			@Latitude,
			@Longtitude,
			@IsDeleted)

	set  @exist=0


	  END

select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageMicroNutrientUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  proc [dbo].[spPageMicroNutrientUpdate]
@FarmerId varchar(50),
@ActivityId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@UpdationDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@FarmerActivityId varchar(70)
as

--updating seting false value

update      HC_FarmerNonContActivityDetails set  HC_FarmerNonContActivityDetails.IsDeleted=1
FROM            HC_FarmerActivityDetails INNER JOIN
                         HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
						 WHERE HC_FarmerNonContActivityDetails.FarmerActivityId=@FarmerActivityId and  HC_FarmerActivityDetails.FarmerId =@FarmerId  and HC_FarmerActivityDetails.ActivityId =@ActivityId and HC_FarmerActivityDetails.Year=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId

--inserting new value
declare @Id varchar(10)
set @Id=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

 INSERT INTO [dbo].[HC_FarmerNonContActivityDetails]
           ([Id],[FarmerActivityId]
           ,[Area]
           ,[AreaUnit]
           ,[NoOfSpecies]
           ,[SpeciesUnit]
           ,[InsertionDate]
           ,[UserId]
           ,[Latitude]
           ,[Longtitude]
           ,[IsDeleted])
     VALUES
           (
		   @Id,
@FarmerActivityId,
@Area,
@AreaUnit,
@NoOfSpecies,
@SpeciesUnit,
@UpdationDate,
@UserId,
@Latitude,
@Longtitude,
0)
GO
/****** Object:  StoredProcedure [dbo].[spPagePistachioFarmerList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spPagePistachioFarmerList4GridView]
@Year int,
@ExtWId varchar(50),
@SeasonId int,
@ActivityId int
as
SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.FarmerActivityId, HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, 
                         HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id

WHERE        (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.Year = @Year) AND (FC_FarmerInfo.ExtWID =@ExtWId) AND (HC_FarmerActivityDetails.ActivityId = @ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted =0)

GROUP BY FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.FarmerActivityId, HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, 
                         HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId
GO
/****** Object:  StoredProcedure [dbo].[spPagePistachioGetFarmerDetailToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPagePistachioGetFarmerDetailToUpdate]

@Year int,
@ExtWId nvarchar(50),
@FarmerId nvarchar(50),
@SeasonId int,
@ActivityId int,
@FarmerActivityId varchar(70)
as
SELECT        HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId, HC_FarmerNonContActivityDetails.Area, 
                         HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.NoOfSpecies, HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, 
                         HC_FarmerNonContActivityDetails.IsDeleted, FC_ExtensionWorkerInfo.DistrictID, FC_ExtensionWorkerInfo.ProvinceID, HC_InterCropInfo.Quantity AS CropQuantity, HC_InterCropInfo.Area AS CropArea, 
                         HC_WaterTankInfo.NoOfTank, HC_FenceInfo.Qantity AS FenceQuantity, HC_FarmerNonContActivityDetails.SpeciesUnit
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID INNER JOIN
                         HC_InterCropInfo ON HC_FarmerActivityDetails.FarmerActivityId = HC_InterCropInfo.FarmerActivityId INNER JOIN
                         HC_FenceInfo ON HC_FarmerActivityDetails.FarmerActivityId = HC_FenceInfo.FarmerActivityId INNER JOIN
                         HC_WaterTankInfo ON HC_FarmerActivityDetails.FarmerActivityId = HC_WaterTankInfo.FarmerActivityId
WHERE       (HC_FarmerNonContActivityDetails.FarmerActivityId =@FarmerActivityId ) and (HC_FarmerActivityDetails.FarmerId =@FarmerId)  and(FC_FarmerInfo.ExtWID=@ExtWId) AND (HC_FarmerActivityDetails.Year = @Year) AND (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.ActivityId =@ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted ='false' )

GO
/****** Object:  StoredProcedure [dbo].[spPagePistachioSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spPagePistachioSave]
@FarmerId varchar(50),
@ActivityId int,
@SeasonId int,
@Year int,
@SeedsArea decimal(18,2),
@SapplesArea decimal(18,2),
@AreaUnit int,
@SeedsNoOfSpecies float,
@SeedsSpeciesUnit int,
@SapplesNoOfSpecies float,
@SapplesSpeciesUnit int,
@InsertionDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@IsDeleted bit,
@checkHing bit,
@checkSeed bit,
@checkSapples bit,
@checkWaterTank bit,
@checkFence bit,
@interCropId int,
@CropQuantity float,
@CropArea float,
@NoOfTank int,
@FenceM float,
@exist bit output
as

--checknig for existance 
If EXISTS (SELECT 1         
FROM            HC_FarmerActivityDetails INNER JOIN
                        HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
                    WHERE HC_FarmerActivityDetails.FarmerId=@FarmerId and  HC_FarmerActivityDetails.YEAR=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId and HC_FarmerActivityDetails.ActivityId=@ActivityId)
	BEGIN
			set @exist=1
	END 


ELSE    
 BEGIN
	
	--id chekcing id

					declare @FarmerActivityId varchar(70)
					declare @DetailId varchar(10)
					if exists ( select 1  from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
						begin

							set @FarmerActivityId=(select FarmerActivityId from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )
						 end
					else
						
						begin	
							set @FarmerActivityId=(select count(*)+1 from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @FarmerActivityId=@FarmerId+'-'+cast(@ActivityId as varchar)+'-'+@FarmerActivityId+'-'+cast(@SeasonId as varchar)+'-'+cast(@Year as varchar)

							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

							INSERT INTO [dbo].[HC_FarmerActivityDetails]
								([FarmerActivityId]	
								,[FarmerId]
								,[ActivityId]
								,[Year]
								,[SeasonId]
								,[ContributionType])
							VALUES
								(@FarmerActivityId,@FarmerId,@ActivityId,@Year,@SeasonId,2)

						end

-- activity Details

				if @checkSeed='True'
				begin
						INSERT INTO [dbo].HC_FarmerNonContActivityDetails
							   ([id]
							   ,[FarmerActivityId]
							   ,[Area]
							   ,[AreaUnit]
							   ,[NoOfSpecies]
							   ,[SpeciesUnit]
							   ,[InsertionDate]
							   ,[UserId]
							   ,[Latitude]
							   ,[Longtitude]
							   ,[IsDeleted])
						 VALUES
							   (
							   @DetailId,
								@FarmerActivityId,
								@SeedsArea,
								@AreaUnit,
								@SeedsNoOfSpecies,
								@SeedsSpeciesUnit,
								@InsertionDate,
								@UserId,
								@Latitude,
								@Longtitude,
								@IsDeleted)
					end
				if @checkSapples='True'
				begin
						INSERT INTO [dbo].HC_FarmerNonContActivityDetails
							   ([id]
							   ,[FarmerActivityId]
							   ,[Area]
							   ,[AreaUnit]
							   ,[NoOfSpecies]
							   ,[SpeciesUnit]
							   ,[InsertionDate]
							   ,[UserId]
							   ,[Latitude]
							   ,[Longtitude]
							   ,[IsDeleted])
						 VALUES
							   (
							   @DetailId,
								@FarmerActivityId,
								@SapplesArea,
								@AreaUnit,
								@SapplesNoOfSpecies,
								@SapplesSpeciesUnit,
								@InsertionDate,
								@UserId,
								@Latitude,
								@Longtitude,
								@IsDeleted)
					end

					if @checkHing='True'
					begin
						INSERT INTO [dbo].[HC_InterCropInfo]
						   ([FarmerActivityId]
						   ,[InterCropId]
						   ,[Quantity]
						   ,[Area],[AreaUnit],[QuantityUnit])
						VALUES
						   (@FarmerActivityId,
							@interCropId
						   ,@CropQuantity
						   ,@CropArea,@AreaUnit,1)
					end

					if @checkWaterTank='True'
					begin
						INSERT INTO [dbo].[HC_WaterTankInfo]
								   ([FarmerActivityId]
								   ,[NoOfTank])
							 VALUES
								   (@FarmerActivityId
								   ,@NoOfTank)
					end

					if @checkFence='True'
					begin
						INSERT INTO [dbo].[HC_FenceInfo]
							   ([FarmerActivityId]
							   ,[Qantity])
						 VALUES
							   (@FarmerActivityId
							   ,@FenceM)
					end

	set  @exist=0


	  END

select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPagePistachioUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  proc [dbo].[spPagePistachioUpdate]
@FarmerId varchar(50),
@ActivityId int,
@SeasonId int,
@Year int,
@SeedsArea decimal(18,2),
@SapplesArea decimal(18,2),
@AreaUnit int,
@SeedsNoOfSpecies float,
@SeedsSpeciesUnit int,
@SapplesNoOfSpecies float,
@SapplesSpeciesUnit int,
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@checkHing bit,
@checkSeed bit,
@checkSapples bit,
@checkWaterTank bit,
@checkFence bit,
@interCropId int,
@CropQuantity float,
@CropArea float,
@NoOfTank int,
@FenceM float,
@UpdationDate nvarchar(50),
@FarmerActivityId varchar(70)
as

declare @Id varchar(10)
--updating seting false value

update      HC_FarmerNonContActivityDetails set  HC_FarmerNonContActivityDetails.IsDeleted=1
FROM            HC_FarmerActivityDetails INNER JOIN
                         HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
						 WHERE HC_FarmerNonContActivityDetails.FarmerActivityId=@FarmerActivityId and  HC_FarmerActivityDetails.FarmerId =@FarmerId  and HC_FarmerActivityDetails.ActivityId =@ActivityId and HC_FarmerActivityDetails.Year=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId

--inserting new value
				if @checkSeed='True'
				begin
				
				set @Id=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

						INSERT INTO [dbo].HC_FarmerNonContActivityDetails
							   ([Id],[FarmerActivityId]
							   ,[Area]
							   ,[AreaUnit]
							   ,[NoOfSpecies]
							   ,[SpeciesUnit]
							   ,[InsertionDate]
							   ,[UserId]
							   ,[Latitude]
							   ,[Longtitude]
							   ,[IsDeleted])
						 VALUES
							   (@Id,
								@FarmerActivityId,
								@SeedsArea,
								@AreaUnit,
								@SeedsNoOfSpecies,
								@SeedsSpeciesUnit,
								@UpdationDate,
								@UserId,
								@Latitude,
								@Longtitude,
								0)
					end
				if @checkSapples='True'
				begin
						set @Id=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )
						INSERT INTO [dbo].HC_FarmerNonContActivityDetails
							   ([Id],[FarmerActivityId]
							   ,[Area]
							   ,[AreaUnit]
							   ,[NoOfSpecies]
							   ,[SpeciesUnit]
							   ,[InsertionDate]
							   ,[UserId]
							   ,[Latitude]
							   ,[Longtitude]
							   ,[IsDeleted])
						 VALUES
							   (@Id,
								@FarmerActivityId,
								@SapplesArea,
								@AreaUnit,
								@SapplesNoOfSpecies,
								@SapplesSpeciesUnit,
								@UpdationDate,
								@UserId,
								@Latitude,
								@Longtitude,
								0)
					end

					if @checkHing='True'
					begin
					UPDATE [dbo].[HC_InterCropInfo]
						 SET 
							  [Quantity] =@CropQuantity
							  ,[Area] =@CropArea
						 WHERE [FarmerActivityId] =@FarmerActivityId
					end

					if @checkWaterTank='True'
					begin
						UPDATE [dbo].[HC_WaterTankInfo]
						   SET 
							  [NoOfTank] = @NoOfTank
						 WHERE [FarmerActivityId] = @FarmerActivityId
					end

					if @checkFence='True'
					begin
						
						UPDATE [dbo].[HC_FenceInfo]
						   SET 
							  [Qantity] = @FenceM
						 WHERE [FarmerActivityId] = @FarmerActivityId
					end
GO
/****** Object:  StoredProcedure [dbo].[spPagePlasticTunnelFarmerList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[spPagePlasticTunnelFarmerList4GridView]
@Year int,
@ExtWId varchar(50),
@SeasonId int,
@ActivityId int
as
SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, SUM(HC_FarmerNonContActivityDetails.Area) AS Area, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.FarmerActivityId, 
                         HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_FruitTools ON HC_FarmerNonContActivityDetails.FruitCropId = FC_FruitTools.FruitID        
WHERE        (FC_FarmerInfo.ExtWId = @ExtWId) and (HC_FarmerActivityDetails.ActivityId = @ActivityId) AND (HC_FarmerActivityDetails.Year = @Year) AND (HC_FarmerActivityDetails.SeasonId = @SeasonId) and (HC_FarmerNonContActivityDetails.IsDeleted=0)
GROUP BY FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.FarmerActivityId, HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, 
                         HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId

GO
/****** Object:  StoredProcedure [dbo].[spPagePlasticTunnelGetFarmerDetailToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[spPagePlasticTunnelGetFarmerDetailToUpdate]

@Year int,
@ExtWId nvarchar(50),
@FarmerId nvarchar(50),
@SeasonId int,
@ActivityId int,
@FarmerActivityId varchar(70)
as
SELECT        HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId, HC_FarmerNonContActivityDetails.Area, 
                         HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.NoOfSpecies, HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, 
                         FC_ExtensionWorkerInfo.DistrictID, FC_ExtensionWorkerInfo.ProvinceID, HC_FarmerNonContActivityDetails.Id, HC_FarmerNonContActivityDetails.FarmerActivityId, FC_FruitTools.Fruit
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID INNER JOIN
                         FC_FruitTools ON HC_FarmerNonContActivityDetails.FruitCropId = FC_FruitTools.FruitID
WHERE        (HC_FarmerActivityDetails.FarmerId = @FarmerId)  AND (FC_FarmerInfo.ExtWId = @ExtWId) AND (HC_FarmerActivityDetails.Year = @Year) AND 
                         (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.ActivityId = @ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted = 0) and (HC_FarmerNonContActivityDetails.FarmerActivityId =@FarmerActivityId )

       

GO
/****** Object:  StoredProcedure [dbo].[spPagePlasticTunnelSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[spPagePlasticTunnelSave]
@FarmerId varchar(50),
@ActivityId int,
@FruitCropId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@InsertionDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@IsDeleted bit,
@exist bit output
as

--checknig for existance 
If EXISTS (SELECT 1         
FROM            HC_FarmerActivityDetails INNER JOIN
                        HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
                    WHERE HC_FarmerActivityDetails.FarmerId=@FarmerId and HC_FarmerNonContActivityDetails.FruitCropId=@FruitCropId and  HC_FarmerActivityDetails.YEAR=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId and HC_FarmerActivityDetails.ActivityId=@ActivityId)
BEGIN
        set @exist=1
END 

ELSE    
    BEGIN

	--id chekcing id

					declare @FarmerActivityId varchar(70)
					declare @DetailId varchar(10)
					if exists ( select 1  from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
						begin

							set @FarmerActivityId=(select FarmerActivityId from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )
						 end
					else
						
						begin	
							set @FarmerActivityId=(select count(*)+1 from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @FarmerActivityId=@FarmerId+'-'+cast(@ActivityId as varchar)+'-'+@FarmerActivityId+'-'+cast(@SeasonId as varchar)+'-'+cast(@Year as varchar)

							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

							INSERT INTO [dbo].[HC_FarmerActivityDetails]
								([FarmerActivityId]	
								,[FarmerId]
								,[ActivityId]
								,[Year]
								,[SeasonId]
								,[ContributionType])
							VALUES
								(@FarmerActivityId,@FarmerId,@ActivityId,@Year,@SeasonId,2)

						end

	

-- activity Details

INSERT INTO [dbo].[HC_FarmerNonContActivityDetails]
        ([Id]
		,[FarmerActivityId]
		,[FruitCropId]
        ,[Area]
        ,[AreaUnit]
        ,[NoOfSpecies]
        ,[SpeciesUnit]
        ,[InsertionDate]
        ,[UserId]
        ,[Latitude]
        ,[Longtitude]
        ,[IsDeleted])
    VALUES
        (
@DetailId,
@FarmerActivityId,
@FruitCropId,
@Area,
@AreaUnit,
@NoOfSpecies,
@SpeciesUnit,
@InsertionDate,
@UserId,
@Latitude,
@Longtitude,
@IsDeleted)


set  @exist=0



		END

		select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPagePlasticTunnelUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create  proc [dbo].[spPagePlasticTunnelUpdate]
@FarmerId varchar(50),
@ActivityId int,
@FruitCropId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@UpdationDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@FarmerActivityId varchar(70)
as

--updating seting false value

--update      HC_FarmerNonContActivityDetails set  HC_FarmerNonContActivityDetails.IsDeleted=1
--FROM            HC_FarmerActivityDetails INNER JOIN
--                         HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
--						 WHERE   HC_FarmerNonContActivityDetails.FarmerActivityId=@FarmerActivityId and  HC_FarmerActivityDetails.FarmerId =@FarmerId and HC_FarmerActivityDetails.ActivityId =@ActivityId and HC_FarmerActivityDetails.Year=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId

--inserting new value
declare @Id varchar(10)
set @Id=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

 INSERT INTO [dbo].[HC_FarmerNonContActivityDetails]
           ([Id]
		   ,[FarmerActivityId]
           ,[FruitCropId]
           ,[Area]
           ,[AreaUnit]
           ,[NoOfSpecies]
           ,[SpeciesUnit]
           ,[InsertionDate]
           ,[UserId]
           ,[Latitude]
           ,[Longtitude]
           ,[IsDeleted])
     VALUES
           (
		   @Id,
@FarmerActivityId,
@FruitCropId,
@Area,
@AreaUnit,
@NoOfSpecies,
@SpeciesUnit,
@UpdationDate,
@UserId,
@Latitude,
@Longtitude,
0)



GO
/****** Object:  StoredProcedure [dbo].[spPageSaffronFarmerList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[spPageSaffronFarmerList4GridView]
@Year int,
@ExtWId varchar(50),
@SeasonId int,
@ActivityId int
as
SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.Area, HC_FarmerNonContActivityDetails.NoOfSpecies, 
                         HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.FarmerActivityId, HC_FarmerActivityDetails.FarmerId, 
                         HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id
WHERE        (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.Year = @Year) AND (FC_FarmerInfo.ExtWID =@ExtWId) AND (HC_FarmerActivityDetails.ActivityId = @ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted =0)

GO
/****** Object:  StoredProcedure [dbo].[spPageSaffronGetFarmerDetailToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spPageSaffronGetFarmerDetailToUpdate]

@Year int,
@ExtWId nvarchar(50),
@FarmerId nvarchar(50),
@SeasonId int,
@ActivityId int,
@FarmerActivityId varchar(70)
as
SELECT        HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId, HC_FarmerNonContActivityDetails.Area, 
                         HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.NoOfSpecies, HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, 
                         HC_FarmerNonContActivityDetails.IsDeleted, FC_ExtensionWorkerInfo.DistrictID, FC_ExtensionWorkerInfo.ProvinceID
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID
WHERE       (HC_FarmerNonContActivityDetails.FarmerActivityId =@FarmerActivityId ) and (HC_FarmerActivityDetails.FarmerId =@FarmerId)  and(FC_FarmerInfo.ExtWID=@ExtWId) AND (HC_FarmerActivityDetails.Year = @Year) AND (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.ActivityId =@ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted ='false' )

GO
/****** Object:  StoredProcedure [dbo].[spPageSaffronSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spPageSaffronSave]
@FarmerId varchar(50),
@ActivityId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@InsertionDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@IsDeleted bit,
@exist bit output
as

--checknig for existance 
If EXISTS (SELECT 1         
FROM            HC_FarmerActivityDetails INNER JOIN
                        HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
                    WHERE HC_FarmerActivityDetails.FarmerId=@FarmerId and  HC_FarmerActivityDetails.YEAR=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId and HC_FarmerActivityDetails.ActivityId=@ActivityId)
	BEGIN
			set @exist=1
	END 


ELSE    
 BEGIN
	
	--id chekcing id

						declare @FarmerActivityId varchar(70)
					declare @DetailId varchar(10)
					if exists ( select 1  from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
						begin

							set @FarmerActivityId=(select FarmerActivityId from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )
						 end
					else
						
						begin	
							set @FarmerActivityId=(select count(*)+1 from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @FarmerActivityId=@FarmerId+'-'+cast(@ActivityId as varchar)+'-'+@FarmerActivityId+'-'+cast(@SeasonId as varchar)+'-'+cast(@Year as varchar)

							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

							INSERT INTO [dbo].[HC_FarmerActivityDetails]
								([FarmerActivityId]	
								,[FarmerId]
								,[ActivityId]
								,[Year]
								,[SeasonId]
								,[ContributionType])
							VALUES
								(@FarmerActivityId,@FarmerId,@ActivityId,@Year,@SeasonId,2)

						end

		

-- activity Details

	
	INSERT INTO [dbo].HC_FarmerNonContActivityDetails
           ([Id]
		   ,[FarmerActivityId]
           ,[Area]
           ,[AreaUnit]
           ,[NoOfSpecies]
           ,[SpeciesUnit]
           ,[InsertionDate]
           ,[UserId]
           ,[Latitude]
           ,[Longtitude]
           ,[IsDeleted])
     VALUES
           (
		   @DetailId,
			@FarmerActivityId,
			@Area,
			@AreaUnit,
			@NoOfSpecies,
			@SpeciesUnit,
			@InsertionDate,
			@UserId,
			@Latitude,
			@Longtitude,
			@IsDeleted)

	set  @exist=0


	  END

select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageSaffronUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  proc [dbo].[spPageSaffronUpdate]
@FarmerId varchar(50),
@ActivityId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@UpdationDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@FarmerActivityId varchar(70)
as

--updating seting false value

update      HC_FarmerNonContActivityDetails set  HC_FarmerNonContActivityDetails.IsDeleted=1
FROM            HC_FarmerActivityDetails INNER JOIN
                         HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
						 WHERE HC_FarmerNonContActivityDetails.FarmerActivityId=@FarmerActivityId and  HC_FarmerActivityDetails.FarmerId =@FarmerId  and HC_FarmerActivityDetails.ActivityId =@ActivityId and HC_FarmerActivityDetails.Year=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId

--inserting new value
declare @Id varchar(10)
set @Id=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

 INSERT INTO [dbo].[HC_FarmerNonContActivityDetails]
           ([Id]
		   ,[FarmerActivityId]
           ,[Area]
           ,[AreaUnit]
           ,[NoOfSpecies]
           ,[SpeciesUnit]
           ,[InsertionDate]
           ,[UserId]
           ,[Latitude]
           ,[Longtitude]
           ,[IsDeleted])
     VALUES
           (
@Id,
@FarmerActivityId,
@Area,
@AreaUnit,
@NoOfSpecies,
@SpeciesUnit,
@UpdationDate,
@UserId,
@Latitude,
@Longtitude,
0)
GO
/****** Object:  StoredProcedure [dbo].[spPageSFProductionFarmerList4GridView]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spPageSFProductionFarmerList4GridView]
@Year int,
@ExtWId varchar(50),
@SeasonId int,
@ActivityId int
as
SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.Area, HC_FarmerNonContActivityDetails.NoOfSpecies, 
                         HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, HC_FarmerNonContActivityDetails.FarmerActivityId, HC_FarmerActivityDetails.FarmerId, 
                         HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id
WHERE        (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.Year = @Year) AND (FC_FarmerInfo.ExtWID =@ExtWId) AND (HC_FarmerActivityDetails.ActivityId = @ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted =0)

GO
/****** Object:  StoredProcedure [dbo].[spPageSFProductionGetFarmerDetailToUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spPageSFProductionGetFarmerDetailToUpdate]

@Year int,
@ExtWId nvarchar(50),
@FarmerId nvarchar(50),
@SeasonId int,
@ActivityId int,
@FarmerActivityId varchar(70)
as
SELECT        HC_FarmerActivityDetails.FarmerId, HC_FarmerActivityDetails.ActivityId, HC_FarmerActivityDetails.Year, HC_FarmerActivityDetails.SeasonId, HC_FarmerNonContActivityDetails.Area, 
                         HC_FarmerNonContActivityDetails.FruitCropId, HC_FarmerNonContActivityDetails.NoOfSpecies, HC_FarmerNonContActivityDetails.Latitude, HC_FarmerNonContActivityDetails.Longtitude, FC_FarmerInfo.ExtWId, 
                         HC_FarmerNonContActivityDetails.IsDeleted, FC_ExtensionWorkerInfo.DistrictID, FC_ExtensionWorkerInfo.ProvinceID
FROM            HC_FarmerNonContActivityDetails INNER JOIN
                         HC_FarmerActivityDetails ON HC_FarmerNonContActivityDetails.FarmerActivityId = HC_FarmerActivityDetails.FarmerActivityId INNER JOIN
                         FC_FarmerInfo ON HC_FarmerActivityDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID
WHERE       (HC_FarmerNonContActivityDetails.FarmerActivityId =@FarmerActivityId ) and (HC_FarmerActivityDetails.FarmerId =@FarmerId)  and(FC_FarmerInfo.ExtWID=@ExtWId) AND (HC_FarmerActivityDetails.Year = @Year) AND (HC_FarmerActivityDetails.SeasonId = @SeasonId) AND (HC_FarmerActivityDetails.ActivityId =@ActivityId) AND (HC_FarmerNonContActivityDetails.IsDeleted ='false' )

GO
/****** Object:  StoredProcedure [dbo].[spPageSFProductionSave]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spPageSFProductionSave]
@FarmerId varchar(50),
@ActivityId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@InsertionDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@IsDeleted bit,
@exist bit output
as

--checknig for existance 
If EXISTS (SELECT 1         
FROM            HC_FarmerActivityDetails INNER JOIN
                        HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
                    WHERE HC_FarmerActivityDetails.FarmerId=@FarmerId and  HC_FarmerActivityDetails.YEAR=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId and HC_FarmerActivityDetails.ActivityId=@ActivityId)
	BEGIN
			set @exist=1
	END 


ELSE    
 BEGIN
	
	--id chekcing id

				    declare @FarmerActivityId varchar(70)
					declare @DetailId varchar(10)
					if exists ( select 1  from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
						begin

							set @FarmerActivityId=(select FarmerActivityId from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )
						 end
					else
						
						begin	
							set @FarmerActivityId=(select count(*)+1 from [dbo].[HC_FarmerActivityDetails] where ActivityId=@ActivityId and   FarmerId=@FarmerId and Year=@Year and SeasonId=@SeasonId)
							set @FarmerActivityId=@FarmerId+'-'+cast(@ActivityId as varchar)+'-'+@FarmerActivityId+'-'+cast(@SeasonId as varchar)+'-'+cast(@Year as varchar)

							set @DetailId=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

							INSERT INTO [dbo].[HC_FarmerActivityDetails]
								([FarmerActivityId]	
								,[FarmerId]
								,[ActivityId]
								,[Year]
								,[SeasonId]
								,[ContributionType])
							VALUES
								(@FarmerActivityId,@FarmerId,@ActivityId,@Year,@SeasonId,2)

						end

			

-- activity Details

	
	INSERT INTO [dbo].HC_FarmerNonContActivityDetails
           ([Id]
		   ,[FarmerActivityId]
           ,[Area]
           ,[AreaUnit]
           ,[NoOfSpecies]
           ,[SpeciesUnit]
           ,[InsertionDate]
           ,[UserId]
           ,[Latitude]
           ,[Longtitude]
           ,[IsDeleted])
     VALUES
           (
		   @DetailId,
			@FarmerActivityId,
			@Area,
			@AreaUnit,
			@NoOfSpecies,
			@SpeciesUnit,
			@InsertionDate,
			@UserId,
			@Latitude,
			@Longtitude,
			@IsDeleted)

	set  @exist=0


	  END

select @exist
GO
/****** Object:  StoredProcedure [dbo].[spPageSFProductionUpdate]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  proc [dbo].[spPageSFProductionUpdate]
@FarmerId varchar(50),
@ActivityId int,
@SeasonId int,
@Year int,
@Area decimal(18,2),
@AreaUnit int,
@NoOfSpecies float,
@SpeciesUnit int,
@UpdationDate nvarchar(50),
@UserId uniqueidentifier,
@Latitude varchar(50),
@Longtitude varchar(50),
@FarmerActivityId varchar(70)
as

--updating seting false value

update      HC_FarmerNonContActivityDetails set  HC_FarmerNonContActivityDetails.IsDeleted=1
FROM            HC_FarmerActivityDetails INNER JOIN
                         HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
						 WHERE HC_FarmerNonContActivityDetails.FarmerActivityId=@FarmerActivityId and  HC_FarmerActivityDetails.FarmerId =@FarmerId  and HC_FarmerActivityDetails.ActivityId =@ActivityId and HC_FarmerActivityDetails.Year=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId

--inserting new value
declare @Id varchar(10)
set @Id=(select count(*)+1 from [dbo].HC_FarmerNonContActivityDetails where FarmerActivityId=@FarmerActivityId )

 INSERT INTO [dbo].[HC_FarmerNonContActivityDetails]
           ([Id]
		   ,[FarmerActivityId]
           ,[Area]
           ,[AreaUnit]
           ,[NoOfSpecies]
           ,[SpeciesUnit]
           ,[InsertionDate]
           ,[UserId]
           ,[Latitude]
           ,[Longtitude]
           ,[IsDeleted])
     VALUES
           (
		   @Id,
@FarmerActivityId,
@Area,
@AreaUnit,
@NoOfSpecies,
@SpeciesUnit,
@UpdationDate,
@UserId,
@Latitude,
@Longtitude,
0)
GO
/****** Object:  StoredProcedure [dbo].[spSetFalseNonContrActivityDetails]    Script Date: 4/15/2022 10:58:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spSetFalseNonContrActivityDetails]

@FarmerActivityId varchar(70),
@FarmerId varchar(50),
@ActivityId int,
@SeasonId int,
@Year int
as

update      HC_FarmerNonContActivityDetails set  HC_FarmerNonContActivityDetails.IsDeleted=1
FROM            HC_FarmerActivityDetails INNER JOIN
                         HC_FarmerNonContActivityDetails ON HC_FarmerActivityDetails.FarmerActivityId = HC_FarmerNonContActivityDetails.FarmerActivityId
						 WHERE   HC_FarmerNonContActivityDetails.FarmerActivityId=@FarmerActivityId and  HC_FarmerActivityDetails.FarmerId =@FarmerId and HC_FarmerActivityDetails.ActivityId =@ActivityId and HC_FarmerActivityDetails.Year=@Year and HC_FarmerActivityDetails.SeasonId=@SeasonId
GO
USE [master]
GO
ALTER DATABASE [OCM] SET  READ_WRITE 
GO
