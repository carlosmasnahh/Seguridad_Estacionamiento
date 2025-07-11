USE [master]
GO
/****** Object:  Database [estacionamiento]    Script Date: 08/07/2025 09:57:33 a. m. ******/
CREATE DATABASE [estacionamiento]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'estacionamiento', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\estacionamiento.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'estacionamiento_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\estacionamiento_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [estacionamiento] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [estacionamiento].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [estacionamiento] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [estacionamiento] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [estacionamiento] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [estacionamiento] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [estacionamiento] SET ARITHABORT OFF 
GO
ALTER DATABASE [estacionamiento] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [estacionamiento] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [estacionamiento] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [estacionamiento] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [estacionamiento] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [estacionamiento] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [estacionamiento] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [estacionamiento] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [estacionamiento] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [estacionamiento] SET  ENABLE_BROKER 
GO
ALTER DATABASE [estacionamiento] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [estacionamiento] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [estacionamiento] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [estacionamiento] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [estacionamiento] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [estacionamiento] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [estacionamiento] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [estacionamiento] SET RECOVERY FULL 
GO
ALTER DATABASE [estacionamiento] SET  MULTI_USER 
GO
ALTER DATABASE [estacionamiento] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [estacionamiento] SET DB_CHAINING OFF 
GO
ALTER DATABASE [estacionamiento] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [estacionamiento] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [estacionamiento] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [estacionamiento] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'estacionamiento', N'ON'
GO
ALTER DATABASE [estacionamiento] SET QUERY_STORE = OFF
GO
USE [estacionamiento]
GO
/****** Object:  User [usuario_app]    Script Date: 08/07/2025 09:57:33 a. m. ******/
CREATE USER [usuario_app] FOR LOGIN [usuario_app] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usuario_app]
GO
/****** Object:  Table [dbo].[espacios]    Script Date: 08/07/2025 09:57:33 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[espacios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](10) NULL,
	[estado] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservas]    Script Date: 08/07/2025 09:57:33 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dni] [varchar](20) NULL,
	[placa] [varchar](20) NULL,
	[codigo_espacio] [varchar](10) NULL,
	[fecha] [datetime] NULL,
	[hora_entrada] [datetime] NULL,
	[hora_salida] [datetime] NULL,
	[nombre_conductor] [varchar](100) NULL,
	[tarjeta_propiedad] [varchar](100) NULL,
	[foto] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[espacios] ADD  DEFAULT ('libre') FOR [estado]
GO
ALTER TABLE [dbo].[reservas] ADD  DEFAULT (getdate()) FOR [fecha]
GO
USE [master]
GO
ALTER DATABASE [estacionamiento] SET  READ_WRITE 
GO
