USE [master]
GO
/****** Object:  Database [Glamping_Addventures]    Script Date: 12/1/2024 2:19:25 PM ******/
/*importar  */
CREATE DATABASE [Glamping_Addventures]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Glamping_Addventures', FILENAME = N'C:\Users\allta\Glamping_Addventures.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Glamping_Addventures_log', FILENAME = N'C:\Users\allta\Glamping_Addventures_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Glamping_Addventures] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Glamping_Addventures].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Glamping_Addventures] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET ARITHABORT OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Glamping_Addventures] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Glamping_Addventures] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Glamping_Addventures] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Glamping_Addventures] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Glamping_Addventures] SET  MULTI_USER 
GO
ALTER DATABASE [Glamping_Addventures] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Glamping_Addventures] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Glamping_Addventures] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Glamping_Addventures] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Glamping_Addventures] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Glamping_Addventures] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Glamping_Addventures] SET QUERY_STORE = ON
GO
ALTER DATABASE [Glamping_Addventures] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Glamping_Addventures]
GO
/****** Object:  Table [dbo].[Abono]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abono](
	[IDAbono] [int] IDENTITY(1,1) NOT NULL,
	[IDReserva] [int] NULL,
	[FechaAbono] [date] NULL,
	[ValorDeuda] [float] NULL,
	[Porcentaje] [float] NULL,
	[Pendiente] [float] NULL,
	[CantAbono] [float] NULL,
	[Comprobante] [varbinary](max) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDAbono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[NroDocumento] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Estado] [bit] NULL,
	[IDRol] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NroDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleReservaPaquetes]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleReservaPaquetes](
	[IDDetalleReservaPaquetes] [int] IDENTITY(1,1) NOT NULL,
	[IDReserva] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio] [float] NULL,
	[Estado] [bit] NULL,
	[IDPaquete] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDDetalleReservaPaquetes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleReservaServicio]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleReservaServicio](
	[IDDetalleReservaServicio] [int] IDENTITY(1,1) NOT NULL,
	[IDReserva] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio] [float] NULL,
	[Estado] [bit] NULL,
	[IDServicio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDDetalleReservaServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadosReserva]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadosReserva](
	[IdEstadoReserva] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstadoReserva] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstadoReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[IDHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[NombreHabitacion] [varchar](30) NULL,
	[ImagenHabitacion] [varbinary](max) NULL,
	[Descripcion] [varchar](50) NULL,
	[Costo] [float] NULL,
	[IDTipodeHabitacion] [int] NULL,
	[CantidadPersona] [int] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabitacionMuebles]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitacionMuebles](
	[IDHabitacionMuebles] [int] IDENTITY(1,1) NOT NULL,
	[IDHabitacion] [int] NULL,
	[IDMueble] [int] NULL,
	[CantidadUsada] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDHabitacionMuebles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoPago]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPago](
	[IdMetodoPago] [int] IDENTITY(1,1) NOT NULL,
	[NomMetodoPago] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMetodoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Muebles]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Muebles](
	[IDMueble] [int] IDENTITY(1,1) NOT NULL,
	[NombreMueble] [varchar](30) NULL,
	[ImagenMueble] [varbinary](max) NULL,
	[CantidadDisponible] [int] NOT NULL,
	[Valor] [float] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDMueble] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paquetes]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paquetes](
	[IDPaquete] [int] IDENTITY(1,1) NOT NULL,
	[NombrePaquete] [varchar](30) NULL,
	[ImagenPaquete] [varbinary](max) NULL,
	[Descripcion] [varchar](max) NULL,
	[IDHabitacion] [int] NULL,
	[IDServicio] [int] NULL,
	[Precio] [float] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPaquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[IDPermiso] [int] IDENTITY(1,1) NOT NULL,
	[NombrePermisos] [varchar](50) NULL,
	[EstadoPermisos] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[NroDocumentoCliente] [varchar](50) NULL,
	[FechaReserva] [datetime] NULL,
	[FechaInicio] [date] NULL,
	[FechaFinalizacion] [date] NULL,
	[SubTotal] [float] NULL,
	[Descuento] [float] NULL,
	[IVA] [float] NULL,
	[MontoTotal] [float] NULL,
	[MetodoPago] [int] NULL,
	[IdEstadoReserva] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IDRol] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Estado] [bit] NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesPermisos]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesPermisos](
	[IDRolPermiso] [int] IDENTITY(1,1) NOT NULL,
	[IDRol] [int] NULL,
	[IDPermiso] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRolPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicios](
	[IDServicio] [int] IDENTITY(1,1) NOT NULL,
	[NombreServicio] [varchar](30) NULL,
	[Descripcion] [varchar](50) NULL,
	[Duracion] [varchar](50) NULL,
	[CantidadMaximaPersonas] [int] NULL,
	[Costo] [float] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipodeHabitacion]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipodeHabitacion](
	[IDTipodeHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipodeHabitacion] [varchar](30) NULL,
	[Descripcion] [varchar](50) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTipodeHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TokenRecuperacion]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TokenRecuperacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Token] [varchar](max) NULL,
	[FechaExpiracion] [datetime] NOT NULL,
	[Usado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 12/1/2024 2:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IDUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[TipoDocumento] [varchar](50) NULL,
	[NumeroDocumento] [int] NULL,
	[Telefono] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[Cuidad] [varchar](50) NULL,
	[IDRol] [int] NULL,
	[Contrasena] [varchar](256) NULL,
	[Apellido] [varchar](50) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Clientes] ([NroDocumento], [Nombre], [Apellido], [Direccion], [Email], [Telefono], [Estado], [IDRol]) VALUES (N'096456878', N'julio', N'perez', N'nagua', N'piyoyo279@gmail.com', N'829804', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[DetalleReservaPaquetes] ON 

INSERT [dbo].[DetalleReservaPaquetes] ([IDDetalleReservaPaquetes], [IDReserva], [Cantidad], [Precio], [Estado], [IDPaquete]) VALUES (1, 1, NULL, 300, NULL, 1)
INSERT [dbo].[DetalleReservaPaquetes] ([IDDetalleReservaPaquetes], [IDReserva], [Cantidad], [Precio], [Estado], [IDPaquete]) VALUES (2, 2, NULL, 6000, NULL, 2)
INSERT [dbo].[DetalleReservaPaquetes] ([IDDetalleReservaPaquetes], [IDReserva], [Cantidad], [Precio], [Estado], [IDPaquete]) VALUES (3, 3, NULL, 4000, NULL, 1)
SET IDENTITY_INSERT [dbo].[DetalleReservaPaquetes] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleReservaServicio] ON 

INSERT [dbo].[DetalleReservaServicio] ([IDDetalleReservaServicio], [IDReserva], [Cantidad], [Precio], [Estado], [IDServicio]) VALUES (1, NULL, 1, 3000, 1, 1)
INSERT [dbo].[DetalleReservaServicio] ([IDDetalleReservaServicio], [IDReserva], [Cantidad], [Precio], [Estado], [IDServicio]) VALUES (2, NULL, 1, 5000, 1, 2)
INSERT [dbo].[DetalleReservaServicio] ([IDDetalleReservaServicio], [IDReserva], [Cantidad], [Precio], [Estado], [IDServicio]) VALUES (3, NULL, 1, 7000, 1, 1)
INSERT [dbo].[DetalleReservaServicio] ([IDDetalleReservaServicio], [IDReserva], [Cantidad], [Precio], [Estado], [IDServicio]) VALUES (4, NULL, 1, 7000, 1, 1)
SET IDENTITY_INSERT [dbo].[DetalleReservaServicio] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadosReserva] ON 

INSERT [dbo].[EstadosReserva] ([IdEstadoReserva], [NombreEstadoReserva]) VALUES (1, N'completo')
INSERT [dbo].[EstadosReserva] ([IdEstadoReserva], [NombreEstadoReserva]) VALUES (2, N'completo')
SET IDENTITY_INSERT [dbo].[EstadosReserva] OFF
GO
SET IDENTITY_INSERT [dbo].[MetodoPago] ON 

INSERT [dbo].[MetodoPago] ([IdMetodoPago], [NomMetodoPago]) VALUES (1, N'paypal')
INSERT [dbo].[MetodoPago] ([IdMetodoPago], [NomMetodoPago]) VALUES (2, N'skill')
INSERT [dbo].[MetodoPago] ([IdMetodoPago], [NomMetodoPago]) VALUES (3, N'payonner')
SET IDENTITY_INSERT [dbo].[MetodoPago] OFF
GO
SET IDENTITY_INSERT [dbo].[Paquetes] ON 

INSERT [dbo].[Paquetes] ([IDPaquete], [NombrePaquete], [ImagenPaquete], [Descripcion], [IDHabitacion], [IDServicio], [Precio], [Estado]) VALUES (1, N'premium y esencial', 0xB6BB9E, N'pagos de paquete premiun', NULL, 1, 4000, 1)
INSERT [dbo].[Paquetes] ([IDPaquete], [NombrePaquete], [ImagenPaquete], [Descripcion], [IDHabitacion], [IDServicio], [Precio], [Estado]) VALUES (2, N'bronce', 0xB6BB9E, N'pagos ', NULL, 1, 6000, 1)
SET IDENTITY_INSERT [dbo].[Paquetes] OFF
GO
SET IDENTITY_INSERT [dbo].[Permisos] ON 

INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (1, N'Dashboard', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (2, N'Listar Roles', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (3, N'Buscar Roles', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (4, N'Crear Roles', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (5, N'Ver Detalles Roles', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (6, N'Editar Roles', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (7, N'Cambiar Estado Roles', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (8, N'Listar Usuarios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (9, N'Buscar Usuarios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (10, N'Crear Usuarios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (11, N'Ver Detalles Usuarios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (12, N'Editar Usuarios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (13, N'Cambiar Estado Usuarios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (14, N'Listar Clientes', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (15, N'Buscar Clientes', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (16, N'Crear Clientes', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (17, N'Ver Detalles Clientes', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (18, N'Editar Clientes', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (19, N'Cambiar Estado Clientes', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (20, N'Listar Habitaciones', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (21, N'Buscar Habitaciones', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (22, N'Crear Habitaciones', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (23, N'Ver Detalles Habitaciones', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (24, N'Editar Habitaciones', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (25, N'Cambiar Estado Habitaciones', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (26, N'Listar Tipo Habitaciones', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (27, N'Buscar Tipo Habitaciones', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (28, N'Crear Tipo Habitaciones', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (29, N'Editar Tipo Habitaciones', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (30, N'Cambiar Estado Tipo Habitaciones', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (31, N'Listar Servicios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (32, N'Buscar Servicios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (33, N'Crear Servicios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (34, N'Ver Detalles Servicios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (35, N'Editar Servicios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (36, N'Cambiar Estado Servicios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (37, N'Listar Tipo Servicio', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (38, N'Buscar Tipo Servicios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (39, N'Crear Tipo Servicios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (40, N'Editar Tipo Servicios', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (41, N'Listar Paquetes', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (42, N'Buscar Paquetes', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (43, N'Crear Paquetes', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (44, N'Ver Detalles Paquetes', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (45, N'Editar Paquetes', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (46, N'Cambiar Estado Paquetes', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (47, N'Listar Reservas', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (48, N'Buscar Reservas', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (49, N'Crear Reservas', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (50, N'Ver Detalles Reservas', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (51, N'Editar Reservas', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (52, N'Cambiar Estado Reservas', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (53, N'Anular Reserva', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (54, N'Listar Abono', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (55, N'Buscar Abono', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (56, N'Crear Abono', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (57, N'Ver Detalle Abono', NULL, NULL, 1)
INSERT [dbo].[Permisos] ([IDPermiso], [NombrePermisos], [EstadoPermisos], [Descripcion], [IsActive]) VALUES (58, N'Anular Abono', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Permisos] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserva] ON 

INSERT [dbo].[Reserva] ([IdReserva], [NroDocumentoCliente], [FechaReserva], [FechaInicio], [FechaFinalizacion], [SubTotal], [Descuento], [IVA], [MontoTotal], [MetodoPago], [IdEstadoReserva]) VALUES (1, N'096456878', CAST(N'2024-11-12T21:25:00.000' AS DateTime), CAST(N'2024-11-30' AS Date), CAST(N'2024-12-01' AS Date), 3300, 330, 396, 303366, 2, 1)
INSERT [dbo].[Reserva] ([IdReserva], [NroDocumentoCliente], [FechaReserva], [FechaInicio], [FechaFinalizacion], [SubTotal], [Descuento], [IVA], [MontoTotal], [MetodoPago], [IdEstadoReserva]) VALUES (2, N'096456878', CAST(N'2024-12-13T12:45:00.000' AS DateTime), CAST(N'2024-12-11' AS Date), CAST(N'2024-12-16' AS Date), 18000, 1800, 2160, 318360, 2, 1)
INSERT [dbo].[Reserva] ([IdReserva], [NroDocumentoCliente], [FechaReserva], [FechaInicio], [FechaFinalizacion], [SubTotal], [Descuento], [IVA], [MontoTotal], [MetodoPago], [IdEstadoReserva]) VALUES (3, N'096456878', CAST(N'2024-12-02T13:25:00.000' AS DateTime), CAST(N'2024-12-02' AS Date), CAST(N'2024-12-03' AS Date), 11000, 1100, 1320, 311220, 3, 1)
SET IDENTITY_INSERT [dbo].[Reserva] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([IDRol], [Nombre], [Estado], [IsActive]) VALUES (1, N'Administrador', NULL, 1)
INSERT [dbo].[Roles] ([IDRol], [Nombre], [Estado], [IsActive]) VALUES (2, N'Recepcionista', NULL, 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[RolesPermisos] ON 

INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (1, 1, 1)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (2, 1, 2)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (3, 1, 3)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (4, 1, 4)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (5, 1, 5)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (6, 1, 6)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (7, 1, 7)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (8, 1, 8)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (9, 1, 9)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (10, 1, 10)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (11, 1, 11)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (12, 1, 12)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (13, 1, 13)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (14, 1, 14)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (15, 1, 15)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (16, 1, 16)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (17, 1, 17)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (18, 1, 18)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (19, 1, 19)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (20, 1, 20)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (21, 1, 21)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (22, 1, 22)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (23, 1, 23)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (24, 1, 24)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (25, 1, 25)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (26, 1, 26)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (27, 1, 27)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (28, 1, 28)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (29, 1, 29)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (30, 1, 30)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (31, 1, 31)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (32, 1, 32)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (33, 1, 33)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (34, 1, 34)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (35, 1, 35)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (36, 1, 36)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (37, 1, 37)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (38, 1, 38)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (39, 1, 39)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (40, 1, 40)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (41, 1, 41)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (42, 1, 42)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (43, 1, 43)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (44, 1, 44)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (45, 1, 45)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (46, 1, 46)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (47, 1, 47)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (48, 1, 48)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (49, 1, 49)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (50, 1, 50)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (51, 1, 51)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (52, 1, 52)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (53, 1, 53)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (54, 1, 54)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (55, 1, 55)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (56, 1, 56)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (57, 1, 57)
INSERT [dbo].[RolesPermisos] ([IDRolPermiso], [IDRol], [IDPermiso]) VALUES (58, 1, 58)
SET IDENTITY_INSERT [dbo].[RolesPermisos] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicios] ON 

INSERT [dbo].[Servicios] ([IDServicio], [NombreServicio], [Descripcion], [Duracion], [CantidadMaximaPersonas], [Costo], [Estado]) VALUES (1, N'pago de agua y luz', N'pagos en linea', N'4', 10, 7000, 1)
INSERT [dbo].[Servicios] ([IDServicio], [NombreServicio], [Descripcion], [Duracion], [CantidadMaximaPersonas], [Costo], [Estado]) VALUES (2, N'pago de aquiller', N'pagos', N'3', 5, 5000, 1)
SET IDENTITY_INSERT [dbo].[Servicios] OFF
GO
ALTER TABLE [dbo].[Permisos] ADD  CONSTRAINT [EF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Abono]  WITH CHECK ADD  CONSTRAINT [FK_Abono_Reserva] FOREIGN KEY([IDReserva])
REFERENCES [dbo].[Reserva] ([IdReserva])
GO
ALTER TABLE [dbo].[Abono] CHECK CONSTRAINT [FK_Abono_Reserva]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Roles] FOREIGN KEY([IDRol])
REFERENCES [dbo].[Roles] ([IDRol])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Roles]
GO
ALTER TABLE [dbo].[DetalleReservaPaquetes]  WITH CHECK ADD  CONSTRAINT [FK_DetalleReservaPaquetes_Paquete] FOREIGN KEY([IDPaquete])
REFERENCES [dbo].[Paquetes] ([IDPaquete])
GO
ALTER TABLE [dbo].[DetalleReservaPaquetes] CHECK CONSTRAINT [FK_DetalleReservaPaquetes_Paquete]
GO
ALTER TABLE [dbo].[DetalleReservaPaquetes]  WITH CHECK ADD  CONSTRAINT [FK_DetalleReservaPaquetes_Reserva] FOREIGN KEY([IDReserva])
REFERENCES [dbo].[Reserva] ([IdReserva])
GO
ALTER TABLE [dbo].[DetalleReservaPaquetes] CHECK CONSTRAINT [FK_DetalleReservaPaquetes_Reserva]
GO
ALTER TABLE [dbo].[DetalleReservaServicio]  WITH CHECK ADD  CONSTRAINT [FK_DetalleReservaServicio_Reserva] FOREIGN KEY([IDReserva])
REFERENCES [dbo].[Reserva] ([IdReserva])
GO
ALTER TABLE [dbo].[DetalleReservaServicio] CHECK CONSTRAINT [FK_DetalleReservaServicio_Reserva]
GO
ALTER TABLE [dbo].[DetalleReservaServicio]  WITH CHECK ADD  CONSTRAINT [FK_DetalleReservaServicio_Servicio] FOREIGN KEY([IDServicio])
REFERENCES [dbo].[Servicios] ([IDServicio])
GO
ALTER TABLE [dbo].[DetalleReservaServicio] CHECK CONSTRAINT [FK_DetalleReservaServicio_Servicio]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_TipodeHabitacion] FOREIGN KEY([IDTipodeHabitacion])
REFERENCES [dbo].[TipodeHabitacion] ([IDTipodeHabitacion])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_TipodeHabitacion]
GO
ALTER TABLE [dbo].[HabitacionMuebles]  WITH CHECK ADD  CONSTRAINT [FK_HabitacionMuebles_Habitacion] FOREIGN KEY([IDHabitacion])
REFERENCES [dbo].[Habitacion] ([IDHabitacion])
GO
ALTER TABLE [dbo].[HabitacionMuebles] CHECK CONSTRAINT [FK_HabitacionMuebles_Habitacion]
GO
ALTER TABLE [dbo].[HabitacionMuebles]  WITH CHECK ADD  CONSTRAINT [FK_HabitacionMuebles_Muebles] FOREIGN KEY([IDMueble])
REFERENCES [dbo].[Muebles] ([IDMueble])
GO
ALTER TABLE [dbo].[HabitacionMuebles] CHECK CONSTRAINT [FK_HabitacionMuebles_Muebles]
GO
ALTER TABLE [dbo].[Paquetes]  WITH CHECK ADD  CONSTRAINT [FK_Habitacione_Paquetes] FOREIGN KEY([IDHabitacion])
REFERENCES [dbo].[Habitacion] ([IDHabitacion])
GO
ALTER TABLE [dbo].[Paquetes] CHECK CONSTRAINT [FK_Habitacione_Paquetes]
GO
ALTER TABLE [dbo].[Paquetes]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_Paquetes] FOREIGN KEY([IDServicio])
REFERENCES [dbo].[Servicios] ([IDServicio])
GO
ALTER TABLE [dbo].[Paquetes] CHECK CONSTRAINT [FK_Servicio_Paquetes]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([IdEstadoReserva])
REFERENCES [dbo].[EstadosReserva] ([IdEstadoReserva])
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([MetodoPago])
REFERENCES [dbo].[MetodoPago] ([IdMetodoPago])
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD FOREIGN KEY([NroDocumentoCliente])
REFERENCES [dbo].[Clientes] ([NroDocumento])
GO
ALTER TABLE [dbo].[RolesPermisos]  WITH CHECK ADD FOREIGN KEY([IDPermiso])
REFERENCES [dbo].[Permisos] ([IDPermiso])
GO
ALTER TABLE [dbo].[RolesPermisos]  WITH CHECK ADD FOREIGN KEY([IDRol])
REFERENCES [dbo].[Roles] ([IDRol])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([IDRol])
REFERENCES [dbo].[Roles] ([IDRol])
GO
ALTER TABLE [dbo].[HabitacionMuebles]  WITH CHECK ADD CHECK  (([CantidadUsada]>=(0)))
GO
ALTER TABLE [dbo].[Muebles]  WITH CHECK ADD CHECK  (([CantidadDisponible]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [Glamping_Addventures] SET  READ_WRITE 
GO
