USE [master]
GO
/****** Object:  Database [ContosoUniversity]    Script Date: 2015/3/25 下午 06:57:39 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ContosoUniversity')
BEGIN
CREATE DATABASE [ContosoUniversity]
END

GO
ALTER DATABASE [ContosoUniversity] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContosoUniversity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContosoUniversity] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ContosoUniversity] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ContosoUniversity] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ContosoUniversity] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ContosoUniversity] SET ARITHABORT OFF
GO
ALTER DATABASE [ContosoUniversity] SET AUTO_CLOSE ON
GO
ALTER DATABASE [ContosoUniversity] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ContosoUniversity] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ContosoUniversity] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ContosoUniversity] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ContosoUniversity] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ContosoUniversity] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ContosoUniversity] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ContosoUniversity] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ContosoUniversity] SET  DISABLE_BROKER
GO
ALTER DATABASE [ContosoUniversity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ContosoUniversity] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ContosoUniversity] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ContosoUniversity] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ContosoUniversity] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ContosoUniversity] SET READ_COMMITTED_SNAPSHOT ON
GO
ALTER DATABASE [ContosoUniversity] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ContosoUniversity] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ContosoUniversity] SET  MULTI_USER
GO
ALTER DATABASE [ContosoUniversity] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ContosoUniversity] SET DB_CHAINING OFF
GO
ALTER DATABASE [ContosoUniversity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [ContosoUniversity] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO
USE [ContosoUniversity]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2015/3/25 下午 06:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Credits] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL CONSTRAINT [DF__Course__Departme__1CF15040]  DEFAULT ((1)),
 CONSTRAINT [PK_dbo.Course] PRIMARY KEY CLUSTERED
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CourseInstructor]    Script Date: 2015/3/25 下午 06:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseInstructor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CourseInstructor](
	[CourseID] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.CourseInstructor] PRIMARY KEY CLUSTERED
(
	[CourseID] ASC,
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2015/3/25 下午 06:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Budget] [money] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[InstructorID] [int] NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Department] PRIMARY KEY CLUSTERED
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 2015/3/25 下午 06:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Enrollment](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Grade] [int] NULL,
 CONSTRAINT [PK_dbo.Enrollment] PRIMARY KEY CLUSTERED
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OfficeAssignment]    Script Date: 2015/3/25 下午 06:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OfficeAssignment]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OfficeAssignment](
	[InstructorID] [int] NOT NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.OfficeAssignment] PRIMARY KEY CLUSTERED
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Person]    Script Date: 2015/3/25 下午 06:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Person](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[HireDate] [datetime] NULL,
	[EnrollmentDate] [datetime] NULL,
	[Discriminator] [nvarchar](128) NOT NULL DEFAULT ('Instructor'),
 CONSTRAINT [PK_dbo.Person] PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Course] ON

INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (1, N'Entity Framework 6 開發實戰', 1, 1)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (2, N'Git新手入門', 1, 1)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (3, N'Git進階版控流程', 2, 1)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (4, N'MVC5開發實戰', 5, 1)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (5, N'Javascript新手入門', 1, 1)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (6, N'AngularJS開發實戰', 1, 1)
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (7, N'LINQ語法入門', 1, 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (1, 1)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (2, 1)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (6, 1)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (1, 2)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (3, 2)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (5, 2)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (1, 4)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (2, 4)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (5, 4)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (3, 18)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (6, 18)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (3, 20)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (6, 20)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (2, 21)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (3, 21)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (4, 21)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (5, 21)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (6, 21)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (1, 22)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (2, 22)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (1, 23)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (2, 23)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (4, 23)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (3, 28)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (4, 28)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (5, 28)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (6, 28)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (1, 29)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (4, 29)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (6, 29)
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (5, 30)
SET IDENTITY_INSERT [dbo].[Department] ON

INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (1, N'教育訓練部門', 1000.0000, CAST(N'2015-03-21 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (2, N'人事部', 1250.0000, CAST(N'2015-01-01 00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (4, N'專案管理部', 1000.0000, CAST(N'2015-01-01 00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (5, N'專案部', 1000.0000, CAST(N'2015-01-01 00:00:00.000' AS DateTime), 17)
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (13, N'產品開發部', 1000.0000, CAST(N'2015-01-01 00:00:00.000' AS DateTime), 30)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Enrollment] ON

INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (2, 1, 1, 80)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (3, 1, 3, 70)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (4, 1, 5, 81)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (5, 1, 6, 86)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (6, 1, 7, 85)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (7, 1, 8, 75)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (8, 1, 9, 60)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (9, 1, 10, 0)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (10, 1, 11, 91)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (11, 1, 12, 92)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (12, 1, 13, 52)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (13, 1, 14, 59)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (14, 1, 15, 98)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (15, 2, 1, 65)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (16, 2, 3, 15)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (17, 2, 5, 84)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (18, 2, 6, 65)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (19, 2, 7, 60)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (21, 2, 8, 60)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (22, 2, 9, 21)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (23, 2, 10, 19)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (25, 2, 11, 52)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (26, 2, 12, 50)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (28, 2, 13, 59)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (29, 2, 14, 61)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (30, 2, 15, 67)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (31, 3, 1, 38)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (32, 3, 3, 31)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (33, 3, 5, 48)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (34, 3, 6, 41)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (35, 3, 7, 40)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (36, 3, 8, 19)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (37, 3, 9, 8)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (38, 3, 10, 99)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (39, 3, 11, 91)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (41, 3, 12, 80)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (42, 3, 13, 51)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (43, 3, 14, 67)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (44, 3, 15, 82)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (45, 4, 1, 46)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (46, 4, 3, 51)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (47, 4, 5, 34)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (48, 4, 6, 29)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (49, 4, 7, 81)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (50, 4, 8, 57)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (51, 4, 9, 96)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (52, 4, 10, 84)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (53, 4, 11, 75)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (54, 4, 12, 68)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (55, 4, 13, 12)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (56, 4, 14, 34)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (57, 4, 15, 89)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (58, 5, 1, 21)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (59, 5, 3, 94)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (60, 5, 5, 15)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (61, 5, 6, 36)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (62, 5, 7, 54)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (63, 5, 8, 85)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (64, 5, 9, 65)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (65, 5, 10, 8)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (66, 5, 11, 2)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (67, 5, 12, 19)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (68, 5, 13, 94)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (69, 5, 14, 98)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (70, 5, 15, 56)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (71, 6, 1, 88)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (72, 6, 3, 86)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (73, 6, 5, 81)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (74, 6, 6, 76)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (75, 6, 7, 57)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (77, 6, 8, 67)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (78, 6, 9, 66)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (79, 6, 10, 51)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (80, 6, 11, 51)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (81, 6, 12, 34)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (83, 6, 13, 45)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (84, 6, 14, 44)
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [Grade]) VALUES (85, 6, 15, 49)
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (2, N'Taipei')
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (4, N'Taipei')
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (16, N'Taichung')
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (17, N'Kaohsiung')
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (18, N'Kaohsiung')
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (19, N'Taichung')
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (20, N'Kaohsiung')
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (21, N'Kaohsiung')
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (22, N'Kaohsiung')
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (23, N'Kaohsiung')
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (28, N'Taipei')
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (29, N'Taichung')
INSERT [dbo].[OfficeAssignment] ([InstructorID], [Location]) VALUES (30, N'Kaohsiung')
SET IDENTITY_INSERT [dbo].[Person] ON

INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (1, N'Huang', N'Will', NULL, CAST(N'2015-03-21 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (2, N'Huang', N'Will', CAST(N'2015-01-01 00:00:00.000' AS DateTime), NULL, N'Instructor')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (3, N'Wang', N'Eric', CAST(N'2014-09-01 00:00:00.000' AS DateTime), CAST(N'2015-03-21 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (4, N'Lu', N'David', CAST(N'2015-03-02 00:00:00.000' AS DateTime), NULL, N'Instructor')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (5, N'White', N'Senior', CAST(N'2013-03-01 00:00:00.000' AS DateTime), CAST(N'2015-01-21 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (6, N'Norman', N'Albert', CAST(N'2013-05-26 00:00:00.000' AS DateTime), CAST(N'2015-02-11 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (7, N'Voyager', N'Geraldine', CAST(N'2013-06-17 00:00:00.000' AS DateTime), CAST(N'2015-02-06 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (8, N'Downs', N'Irving', CAST(N'2013-06-17 00:00:00.000' AS DateTime), CAST(N'2015-01-29 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (9, N'Castle', N'Gregg', CAST(N'2010-12-31 00:00:00.000' AS DateTime), CAST(N'2015-03-08 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (10, N'Taylor', N'Israel', CAST(N'2012-01-15 00:00:00.000' AS DateTime), CAST(N'2015-03-21 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (11, N'Thomas', N'Brian', CAST(N'2015-03-02 00:00:00.000' AS DateTime), CAST(N'2015-03-25 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (12, N'Green', N'Alfonso', CAST(N'1953-01-21 00:00:00.000' AS DateTime), CAST(N'2015-01-16 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (13, N'Banks', N'Troy', CAST(N'2015-03-02 00:00:00.000' AS DateTime), CAST(N'2015-01-31 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (14, N'Vine', N'Chad', CAST(N'1944-08-17 00:00:00.000' AS DateTime), CAST(N'2015-02-01 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (15, N'Jackson', N'Robin', CAST(N'2015-03-02 00:00:00.000' AS DateTime), CAST(N'2015-02-20 00:00:00.000' AS DateTime), N'Student')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (16, N'Ward', N'Cunningham', CAST(N'1949-05-26 00:00:00.000' AS DateTime), NULL, N'Instructor')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (17, N'Be', N'Leuf', CAST(N'1949-05-26 00:00:00.000' AS DateTime), NULL, N'Instructor')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (18, N'Gates', N'Bill', CAST(N'1955-10-28 00:00:00.000' AS DateTime), NULL, N'Instructor')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (19, N'popo', N'Paul', CAST(N'1953-01-21 00:00:00.000' AS DateTime), NULL, N'Instructor')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (20, N'Paul', N'Gardner Allen', CAST(N'1953-01-21 00:00:00.000' AS DateTime), NULL, N'Instructor')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (21, N'W. Thompson', N'John', CAST(N'1949-04-24 00:00:00.000' AS DateTime), NULL, N'Instructor')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (22, N'Nadella', N'Satya', CAST(N'1967-01-10 00:00:00.000' AS DateTime), NULL, N'Instructor')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (23, N'Larry', N'Ellison', CAST(N'1944-08-17 00:00:00.000' AS DateTime), NULL, N'Instructor')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (28, N'Larry', N'Page', CAST(N'1973-03-26 00:00:00.000' AS DateTime), NULL, N'Instructor')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (29, N'Schmidt', N'Eric', CAST(N'1955-04-27 00:00:00.000' AS DateTime), NULL, N'Instructor')
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [EnrollmentDate], [Discriminator]) VALUES (30, N'Doerr', N'John', CAST(N'1951-06-29 00:00:00.000' AS DateTime), NULL, N'Instructor')
SET IDENTITY_INSERT [dbo].[Person] OFF
/****** Object:  Index [IX_DepartmentID]    Script Date: 2015/3/25 下午 06:57:39 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Course]') AND name = N'IX_DepartmentID')
CREATE NONCLUSTERED INDEX [IX_DepartmentID] ON [dbo].[Course]
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseID]    Script Date: 2015/3/25 下午 06:57:39 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CourseInstructor]') AND name = N'IX_CourseID')
CREATE NONCLUSTERED INDEX [IX_CourseID] ON [dbo].[CourseInstructor]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InstructorID]    Script Date: 2015/3/25 下午 06:57:39 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CourseInstructor]') AND name = N'IX_InstructorID')
CREATE NONCLUSTERED INDEX [IX_InstructorID] ON [dbo].[CourseInstructor]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InstructorID]    Script Date: 2015/3/25 下午 06:57:39 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Department]') AND name = N'IX_InstructorID')
CREATE NONCLUSTERED INDEX [IX_InstructorID] ON [dbo].[Department]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseID]    Script Date: 2015/3/25 下午 06:57:39 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Enrollment]') AND name = N'IX_CourseID')
CREATE NONCLUSTERED INDEX [IX_CourseID] ON [dbo].[Enrollment]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_StudentID]    Script Date: 2015/3/25 下午 06:57:39 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Enrollment]') AND name = N'IX_StudentID')
CREATE NONCLUSTERED INDEX [IX_StudentID] ON [dbo].[Enrollment]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InstructorID]    Script Date: 2015/3/25 下午 06:57:39 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[OfficeAssignment]') AND name = N'IX_InstructorID')
CREATE NONCLUSTERED INDEX [IX_InstructorID] ON [dbo].[OfficeAssignment]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Course_dbo.Department_DepartmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course]'))
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Course_dbo.Department_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Course_dbo.Department_DepartmentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Course]'))
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_dbo.Course_dbo.Department_DepartmentID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CourseInstructor_dbo.Course_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseInstructor]'))
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CourseInstructor_dbo.Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CourseInstructor_dbo.Course_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseInstructor]'))
ALTER TABLE [dbo].[CourseInstructor] CHECK CONSTRAINT [FK_dbo.CourseInstructor_dbo.Course_CourseID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CourseInstructor_dbo.Instructor_InstructorID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseInstructor]'))
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CourseInstructor_dbo.Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Person] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.CourseInstructor_dbo.Instructor_InstructorID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseInstructor]'))
ALTER TABLE [dbo].[CourseInstructor] CHECK CONSTRAINT [FK_dbo.CourseInstructor_dbo.Instructor_InstructorID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Department_dbo.Instructor_InstructorID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Department]'))
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Department_dbo.Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Person] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Department_dbo.Instructor_InstructorID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Department]'))
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_dbo.Department_dbo.Instructor_InstructorID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Enrollment_dbo.Course_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollment]'))
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Enrollment_dbo.Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Enrollment_dbo.Course_CourseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollment]'))
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_dbo.Enrollment_dbo.Course_CourseID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Enrollment_dbo.Person_StudentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollment]'))
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Enrollment_dbo.Person_StudentID] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Person] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.Enrollment_dbo.Person_StudentID]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollment]'))
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_dbo.Enrollment_dbo.Person_StudentID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.OfficeAssignment_dbo.Instructor_InstructorID]') AND parent_object_id = OBJECT_ID(N'[dbo].[OfficeAssignment]'))
ALTER TABLE [dbo].[OfficeAssignment]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OfficeAssignment_dbo.Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Person] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.OfficeAssignment_dbo.Instructor_InstructorID]') AND parent_object_id = OBJECT_ID(N'[dbo].[OfficeAssignment]'))
ALTER TABLE [dbo].[OfficeAssignment] CHECK CONSTRAINT [FK_dbo.OfficeAssignment_dbo.Instructor_InstructorID]
GO
/****** Object:  StoredProcedure [dbo].[Department_Delete]    Script Date: 2015/3/25 下午 06:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Department_Delete] AS'
END
GO
ALTER PROCEDURE [dbo].[Department_Delete]
    @DepartmentID [int],
    @RowVersion_Original [rowversion]
AS
BEGIN
    DELETE [dbo].[Department]
    WHERE (([DepartmentID] = @DepartmentID) AND (([RowVersion] = @RowVersion_Original) OR ([RowVersion] IS NULL AND @RowVersion_Original IS NULL)))
END


GO
/****** Object:  StoredProcedure [dbo].[Department_Insert]    Script Date: 2015/3/25 下午 06:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Department_Insert] AS'
END
GO
ALTER PROCEDURE [dbo].[Department_Insert]
    @Name [nvarchar](50),
    @Budget [money],
    @StartDate [datetime],
    @InstructorID [int]
AS
BEGIN
    INSERT [dbo].[Department]([Name], [Budget], [StartDate], [InstructorID])
    VALUES (@Name, @Budget, @StartDate, @InstructorID)

    DECLARE @DepartmentID int
    SELECT @DepartmentID = [DepartmentID]
    FROM [dbo].[Department]
    WHERE @@ROWCOUNT > 0 AND [DepartmentID] = scope_identity()

    SELECT t0.[DepartmentID], t0.[RowVersion]
    FROM [dbo].[Department] AS t0
    WHERE @@ROWCOUNT > 0 AND t0.[DepartmentID] = @DepartmentID
END


GO
/****** Object:  StoredProcedure [dbo].[Department_Update]    Script Date: 2015/3/25 下午 06:57:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Department_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Department_Update] AS'
END
GO
ALTER PROCEDURE [dbo].[Department_Update]
    @DepartmentID [int],
    @Name [nvarchar](50),
    @Budget [money],
    @StartDate [datetime],
    @InstructorID [int],
    @RowVersion_Original [rowversion]
AS
BEGIN
    UPDATE [dbo].[Department]
    SET [Name] = @Name, [Budget] = @Budget, [StartDate] = @StartDate, [InstructorID] = @InstructorID
    WHERE (([DepartmentID] = @DepartmentID) AND (([RowVersion] = @RowVersion_Original) OR ([RowVersion] IS NULL AND @RowVersion_Original IS NULL)))

    SELECT t0.[RowVersion]
    FROM [dbo].[Department] AS t0
    WHERE @@ROWCOUNT > 0 AND t0.[DepartmentID] = @DepartmentID
END


GO
USE [master]
GO
ALTER DATABASE [ContosoUniversity] SET  READ_WRITE
GO
