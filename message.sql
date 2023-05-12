CREATE DATABASE esencialDB
USE [esencialDB]
GO
/****** Object:  Table [dbo].[asociaciones]    Script Date: 3/5/2023 23:56:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asociaciones](
	[asociacionId] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](30) NOT NULL,
	[cuentaBancaria] [varchar](30) NOT NULL,
	[direccionId] [bigint] NOT NULL,
 CONSTRAINT [PK_asociaciones] PRIMARY KEY CLUSTERED 
(
	[asociacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudades]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudades](
	[ciudadId] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estadoId] [bigint] NOT NULL,
 CONSTRAINT [PK_ciudades] PRIMARY KEY CLUSTERED 
(
	[ciudadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ciudadesXregion]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ciudadesXregion](
	[ciudadId] [bigint] NULL,
	[regionId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[codigosPostales]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[codigosPostales](
	[codigoPostalId] [bigint] IDENTITY(1,1) NOT NULL,
	[ciudadId] [nchar](10) NOT NULL,
	[codigoPostal] [int] NOT NULL,
	[distrito] [varchar](50) NOT NULL,
 CONSTRAINT [PK_codigosPostales] PRIMARY KEY CLUSTERED 
(
	[codigoPostalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[codigosPostalesXregion]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[codigosPostalesXregion](
	[codigoPostalId] [bigint] NOT NULL,
	[regionId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosXAsociaciones]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosXAsociaciones](
	[asociacionId] [bigint] NOT NULL,
	[contactoValueId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosXGobierno]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosXGobierno](
	[gobiernoId] [int] NOT NULL,
	[contactoValueId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosXInspector]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosXInspector](
	[inspectorId] [bigint] NOT NULL,
	[contactoValueId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosXMarca]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosXMarca](
	[marcaId] [smallint] NOT NULL,
	[contactoValueId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosXPlanta]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosXPlanta](
	[plantaId] [int] NOT NULL,
	[contactoValueId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosXProductor]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosXProductor](
	[productorId] [int] NOT NULL,
	[contactoValueId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosXrecolectora]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosXrecolectora](
	[recolectoraId] [bigint] NOT NULL,
	[contactoValueId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosXSubproductores]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosXSubproductores](
	[subproductorId] [bigint] NOT NULL,
	[contactoValueId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactosXUsuario]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactosXUsuario](
	[usuarioId] [bigint] NOT NULL,
	[contactoValueId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactoType]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactoType](
	[contactoTypeId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_contactoType] PRIMARY KEY CLUSTERED 
(
	[contactoTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactoValue]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactoValue](
	[contactoValueId] [bigint] IDENTITY(1,1) NOT NULL,
	[value] [varchar](50) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[enabled] [bit] NOT NULL,
	[contactoTypeId] [int] NOT NULL,
 CONSTRAINT [PK_contactoValue] PRIMARY KEY CLUSTERED 
(
	[contactoValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contratos]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contratos](
	[contratoId] [bigint] IDENTITY(1,1) NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](20) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
	[tipoRecurrencia] [tinyint] NOT NULL,
	[contratoStatusId] [tinyint] NOT NULL,
	[porcProductor] [decimal](5, 2) NULL,
	[productorId] [int] NULL,
	[porcRecolector] [decimal](5, 2) NULL,
	[recolectorId] [bigint] NULL,
	[porcAsociacion] [decimal](5, 2) NULL,
	[asociacionId] [bigint] NULL,
	[porcGobierno] [decimal](5, 2) NULL,
	[gobiernoId] [int] NULL,
 CONSTRAINT [PK_logContratos] PRIMARY KEY CLUSTERED 
(
	[contratoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contratosStatus]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contratosStatus](
	[contratoStatusId] [tinyint] IDENTITY(1,1) NOT NULL,
	[descriptionj] [varchar](50) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_contratosStatus] PRIMARY KEY CLUSTERED 
(
	[contratoStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechos]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechos](
	[desechoId] [int] IDENTITY(1,1) NOT NULL,
	[tipoDesechoId] [smallint] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[deleted] [bit] NOT NULL,
	[salubridad] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_desechos] PRIMARY KEY CLUSTERED 
(
	[desechoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechosXRecipiente]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechosXRecipiente](
	[tipoRecId] [int] NOT NULL,
	[tipoDesechoId] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechosXtratamiento]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechosXtratamiento](
	[tratamientoId] [int] NOT NULL,
	[desechoId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[desechoXContrato]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[desechoXContrato](
	[contratoId] [bigint] NOT NULL,
	[desechoId] [int] NOT NULL,
	[tratamientoId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[direcciones]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direcciones](
	[direccionId] [bigint] NOT NULL,
	[codigoPostalId] [bigint] NOT NULL,
	[direccionFisica] [varchar](100) NOT NULL,
	[geoLocation] [geography] NOT NULL,
 CONSTRAINT [PK_direcciones] PRIMARY KEY CLUSTERED 
(
	[direccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estados]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estados](
	[estadoId] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[paisId] [smallint] NOT NULL,
 CONSTRAINT [PK_estados] PRIMARY KEY CLUSTERED 
(
	[estadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadosXregion]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadosXregion](
	[estadoId] [bigint] NOT NULL,
	[regionId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eventLogs]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventLogs](
	[eventLogId] [bigint] IDENTITY(1,1) NOT NULL,
	[levelId] [tinyint] NOT NULL,
	[eventTypeId] [smallint] NOT NULL,
	[sourceId] [tinyint] NOT NULL,
	[reference1] [bigint] NOT NULL,
	[reference2] [bigint] NULL,
	[value1] [varchar](60) NOT NULL,
	[value2] [varchar](60) NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
	[description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_eventLogs] PRIMARY KEY CLUSTERED 
(
	[eventLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eventType]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventType](
	[eventTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](45) NOT NULL,
 CONSTRAINT [PK_eventType] PRIMARY KEY CLUSTERED 
(
	[eventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gobiernos]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gobiernos](
	[gobiernoId] [int] IDENTITY(1,1) NOT NULL,
	[regionId] [int] NOT NULL,
	[cuentaBanco] [varchar](30) NOT NULL,
 CONSTRAINT [PK_gobiernos] PRIMARY KEY CLUSTERED 
(
	[gobiernoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historialesXrecipiente]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historialesXrecipiente](
	[recipienteId] [bigint] NOT NULL,
	[ubicacionId] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idiomas]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idiomas](
	[idiomaId] [smallint] IDENTITY(1,1) NOT NULL,
	[base] [bit] NOT NULL,
	[enabled] [bit] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_idiomas] PRIMARY KEY CLUSTERED 
(
	[idiomaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idiomasXRegion]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idiomasXRegion](
	[regionId] [int] NOT NULL,
	[idiomaId] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inspectores]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inspectores](
	[inspectorId] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[profilePic] [varchar](100) NOT NULL,
	[deleted] [bit] NOT NULL,
	[apellido] [varchar](50) NOT NULL,
 CONSTRAINT [PK_inspectores] PRIMARY KEY CLUSTERED 
(
	[inspectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventarioMateriales]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventarioMateriales](
	[materialId] [int] NOT NULL,
	[cantidad] [decimal](18, 2) NOT NULL,
	[inspectorId] [bigint] NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[produccionId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[levels]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[levels](
	[levelId] [tinyint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](100) NOT NULL,
 CONSTRAINT [PK_levels] PRIMARY KEY CLUSTERED 
(
	[levelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logExchanges]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logExchanges](
	[exchangeId] [bigint] IDENTITY(1,1) NOT NULL,
	[moneda1] [smallint] NOT NULL,
	[moneda2] [smallint] NOT NULL,
	[base] [bit] NOT NULL,
	[cambio] [decimal](18, 4) NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_logExchanges] PRIMARY KEY CLUSTERED 
(
	[exchangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logNivelContaminacion]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logNivelContaminacion](
	[contaminanteId] [bigint] IDENTITY(1,1) NOT NULL,
	[productorId] [int] NOT NULL,
	[porcentaje] [decimal](8, 2) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](20) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_logContaminantes] PRIMARY KEY CLUSTERED 
(
	[contaminanteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logPrecios]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logPrecios](
	[precioTratamientoId] [bigint] IDENTITY(1,1) NOT NULL,
	[tratamientoId] [smallint] NOT NULL,
	[precio] [decimal](18, 2) NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](20) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_logPreciosTratamiento] PRIMARY KEY CLUSTERED 
(
	[precioTratamientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logProducciones]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logProducciones](
	[produccionId] [bigint] IDENTITY(1,1) NOT NULL,
	[productoId] [int] NOT NULL,
	[cantidad] [bigint] NOT NULL,
	[inspectorId] [bigint] NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[posttime] [timestamp] NOT NULL,
 CONSTRAINT [PK_logProducciones] PRIMARY KEY CLUSTERED 
(
	[produccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logVentas]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logVentas](
	[ventaId] [bigint] IDENTITY(1,1) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](20) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_logVentas] PRIMARY KEY CLUSTERED 
(
	[ventaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcasRecipiente]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcasRecipiente](
	[marcaId] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_marcasRecipiente] PRIMARY KEY CLUSTERED 
(
	[marcaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materiales]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materiales](
	[materialId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[uniMedida] [varchar](10) NOT NULL,
 CONSTRAINT [PK_materiales] PRIMARY KEY CLUSTERED 
(
	[materialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materialesXProducto]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materialesXProducto](
	[materialId] [int] NOT NULL,
	[productoId] [int] NOT NULL,
	[cantidad] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelosRecipiente]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modelosRecipiente](
	[modeloId] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[enabled] [bit] NOT NULL,
	[marcaId] [smallint] NOT NULL,
 CONSTRAINT [PK_modelosRecipiente] PRIMARY KEY CLUSTERED 
(
	[modeloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monedas]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monedas](
	[monedaId] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[simbolo] [varchar](1) NOT NULL,
	[acronimo] [varchar](3) NOT NULL,
	[base] [bit] NOT NULL,
	[deleted] [bit] NOT NULL,
	[cambioActual] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_monedas] PRIMARY KEY CLUSTERED 
(
	[monedaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monedasXpais]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monedasXpais](
	[monedaId] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monedasXRegion]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monedasXRegion](
	[monedaId] [smallint] NOT NULL,
	[regionId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movementType]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movementType](
	[movementTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_movementType] PRIMARY KEY CLUSTERED 
(
	[movementTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movimientosRecipiente]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimientosRecipiente](
	[movimientoId] [bigint] IDENTITY(1,1) NOT NULL,
	[tipoRecId] [int] NOT NULL,
	[cantidadRec] [bigint] NOT NULL,
	[desechoId] [int] NULL,
	[cantidadDes] [bigint] NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[movementTypeId] [smallint] NOT NULL,
	[plantaId] [int] NULL,
	[productorId] [int] NULL,
	[subProductorId] [bigint] NULL,
	[direccionId] [bigint] NOT NULL,
 CONSTRAINT [PK_movimientosRecipiente] PRIMARY KEY CLUSTERED 
(
	[movimientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[objectTypes]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[objectTypes](
	[objectTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_objectTypes] PRIMARY KEY CLUSTERED 
(
	[objectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagos]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagos](
	[pagoId] [bigint] IDENTITY(1,1) NOT NULL,
	[transaccionId] [bigint] NOT NULL,
	[detalle] [varchar](50) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[accesdFrom] [varchar](50) NOT NULL,
 CONSTRAINT [PK_pagos] PRIMARY KEY CLUSTERED 
(
	[pagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paises]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paises](
	[paisId] [smallint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_paises] PRIMARY KEY CLUSTERED 
(
	[paisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paisesXregion]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paisesXregion](
	[paisId] [smallint] NOT NULL,
	[regionId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plantas]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantas](
	[plantaId] [int] IDENTITY(1,1) NOT NULL,
	[enabled] [bit] NOT NULL,
	[direccion] [bigint] NOT NULL,
 CONSTRAINT [PK_puntosRecoleccion] PRIMARY KEY CLUSTERED 
(
	[plantaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preciosProXPais]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preciosProXPais](
	[productoId] [int] NOT NULL,
	[paisId] [smallint] NOT NULL,
	[precio] [decimal](18, 2) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preciosTratamientoXPais]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preciosTratamientoXPais](
	[paisId] [smallint] NOT NULL,
	[precioXUni] [decimal](18, 2) NOT NULL,
	[unidadBase] [varchar](10) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[accesedFrom] [varchar](50) NOT NULL,
	[checksum] [varbinary](150) NOT NULL,
	[enabled] [bit] NOT NULL,
	[tratamientoId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productores]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productores](
	[productorId] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [tinyint] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[direccionId] [bigint] NULL,
	[contaminacionActual] [decimal](5, 2) NOT NULL,
	[balance] [decimal](18, 2) NOT NULL,
	[cuentaBanco] [varchar](30) NOT NULL,
 CONSTRAINT [PK_productores] PRIMARY KEY CLUSTERED 
(
	[productorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[productoId] [int] IDENTITY(1,1) NOT NULL,
	[enabled] [bit] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[productoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productosXventa]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productosXventa](
	[productoId] [int] NOT NULL,
	[cantidad] [bigint] NOT NULL,
	[ventaId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recolectoras]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recolectoras](
	[recolectoraId] [bigint] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[regionId] [int] NOT NULL,
	[direccionId] [bigint] NOT NULL,
	[enabled] [bit] NOT NULL,
	[cuentaBanco] [varchar](30) NOT NULL,
 CONSTRAINT [PK_recolectores] PRIMARY KEY CLUSTERED 
(
	[recolectoraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regiones]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regiones](
	[regionId] [int] IDENTITY(1,1) NOT NULL,
	[enabled] [bit] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_regiones] PRIMARY KEY CLUSTERED 
(
	[regionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sources]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sources](
	[sourceId] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](45) NOT NULL,
 CONSTRAINT [PK_sources] PRIMARY KEY CLUSTERED 
(
	[sourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sponsors]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sponsors](
	[sponsorId] [bigint] IDENTITY(1,1) NOT NULL,
	[regionId] [int] NOT NULL,
	[productorId] [int] NOT NULL,
	[porcentaje] [decimal](5, 2) NOT NULL,
	[contratoId] [bigint] NOT NULL,
 CONSTRAINT [PK_sponsors] PRIMARY KEY CLUSTERED 
(
	[sponsorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subproductores]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subproductores](
	[subproductorId] [bigint] IDENTITY(1,1) NOT NULL,
	[productorId] [int] NOT NULL,
	[deleted] [bit] NOT NULL,
	[direccionId] [bigint] NOT NULL,
 CONSTRAINT [PK_productorXlocalidades] PRIMARY KEY CLUSTERED 
(
	[subproductorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiposDesecho]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiposDesecho](
	[tipoDesechoId] [smallint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[uniMedida] [varchar](10) NOT NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tiposDesecho] PRIMARY KEY CLUSTERED 
(
	[tipoDesechoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiposRecipiente]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiposRecipiente](
	[tipoRecId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[modeloId] [int] NULL,
	[cantDisponible] [bigint] NOT NULL,
	[cantDesechada] [bigint] NOT NULL,
	[cantEnMante] [bigint] NOT NULL,
	[cantEnUso] [bigint] NOT NULL,
	[capacidad] [decimal](18, 2) NOT NULL,
	[pesoBase] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_tiposRecipiente] PRIMARY KEY CLUSTERED 
(
	[tipoRecId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[traducciones]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[traducciones](
	[traduccionId] [bigint] IDENTITY(1,1) NOT NULL,
	[textTraducido] [varchar](150) NOT NULL,
	[idiomaTraducido] [smallint] NOT NULL,
	[objectTypeId] [bigint] NOT NULL,
	[referenceId] [bigint] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_traducciones] PRIMARY KEY CLUSTERED 
(
	[traduccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transacciones]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transacciones](
	[transaccionId] [bigint] IDENTITY(1,1) NOT NULL,
	[transactionType] [smallint] NOT NULL,
	[monedaId] [smallint] NOT NULL,
	[exchangeId] [bigint] NOT NULL,
	[cambio] [decimal](18, 4) NOT NULL,
	[monto] [decimal](18, 2) NOT NULL,
	[posttime] [timestamp] NOT NULL,
	[chekcsum] [varbinary](150) NOT NULL,
	[accessedFrom] [varchar](50) NOT NULL,
	[ventaId] [bigint] NULL,
	[contratoId] [bigint] NULL,
 CONSTRAINT [PK_transacciones] PRIMARY KEY CLUSTERED 
(
	[transaccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactionType]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactionType](
	[transactionTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_transactionType] PRIMARY KEY CLUSTERED 
(
	[transactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tratamientos]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tratamientos](
	[tratamientoId] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_tratamientos] PRIMARY KEY CLUSTERED 
(
	[tratamientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ubicaciones]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ubicaciones](
	[ubicacionId] [bigint] NOT NULL,
	[fecha] [timestamp] NOT NULL,
	[geoLocation] [geography] NOT NULL,
	[accesedFrom] [varchar](20) NOT NULL,
	[checkSum] [varbinary](150) NOT NULL,
 CONSTRAINT [PK_ubicaciones] PRIMARY KEY CLUSTERED 
(
	[ubicacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 3/5/2023 23:56:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[usuarioId] [bigint] IDENTITY(1,1) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[nickname] [varchar](50) NOT NULL,
	[checksum] [varbinary](150) NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[deleted] [bit] NOT NULL,
	[profilePicture] [varchar](150) NOT NULL,
	[password] [varchar](16) NOT NULL,
	[direccionId] [bigint] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[contactoValue] ADD  CONSTRAINT [DF_contactoValue_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[contratosStatus] ADD  CONSTRAINT [DF_contratosStatus_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[desechos] ADD  CONSTRAINT [DF_desechos_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[idiomas] ADD  CONSTRAINT [DF_idiomas_base]  DEFAULT ((0)) FOR [base]
GO
ALTER TABLE [dbo].[idiomas] ADD  CONSTRAINT [DF_idiomas_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[inspectores] ADD  CONSTRAINT [DF_inspectores_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[inventarioMateriales] ADD  CONSTRAINT [DF_inventarioMateriales_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[logExchanges] ADD  CONSTRAINT [DF_logExchanges_base]  DEFAULT ((0)) FOR [base]
GO
ALTER TABLE [dbo].[logExchanges] ADD  CONSTRAINT [DF_logConversiones_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[logNivelContaminacion] ADD  CONSTRAINT [DF_logContaminantes_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[logPrecios] ADD  CONSTRAINT [DF_logPreciosTratamiento_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[logProducciones] ADD  CONSTRAINT [DF_logProducciones_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[logVentas] ADD  CONSTRAINT [DF_logVentas_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[marcasRecipiente] ADD  CONSTRAINT [DF_marcasRecipiente_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[modelosRecipiente] ADD  CONSTRAINT [DF_modelosRecipiente_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[monedas] ADD  CONSTRAINT [DF_monedas_default]  DEFAULT ((0)) FOR [base]
GO
ALTER TABLE [dbo].[monedas] ADD  CONSTRAINT [DF_monedas_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[movimientosRecipiente] ADD  CONSTRAINT [DF_movimientosRecipiente_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[pagos] ADD  CONSTRAINT [DF_pagos_accesdFrom]  DEFAULT ('root') FOR [accesdFrom]
GO
ALTER TABLE [dbo].[plantas] ADD  CONSTRAINT [DF_puntosRecoleccion_estado]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[preciosProXPais] ADD  CONSTRAINT [DF_preciosProXPais_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[preciosTratamientoXPais] ADD  CONSTRAINT [DF_preciosTratamientoXPais_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[preciosTratamientoXPais] ADD  CONSTRAINT [DF_preciosTratamientoXPais_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[productores] ADD  CONSTRAINT [DF_productores_balance]  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[productos] ADD  CONSTRAINT [DF_productos_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[recolectoras] ADD  CONSTRAINT [DF_empresasRecolectoras_estado_1]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[regiones] ADD  CONSTRAINT [DF_regiones_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[subproductores] ADD  CONSTRAINT [DF_productorXlocalidades_estado]  DEFAULT ((1)) FOR [deleted]
GO
ALTER TABLE [dbo].[tiposDesecho] ADD  CONSTRAINT [DF_tiposDesecho_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[tiposRecipiente] ADD  CONSTRAINT [DF_tiposRecipiente_cantDisponible]  DEFAULT ((0)) FOR [cantDisponible]
GO
ALTER TABLE [dbo].[tiposRecipiente] ADD  CONSTRAINT [DF_tiposRecipiente_cantDesechada]  DEFAULT ((0)) FOR [cantDesechada]
GO
ALTER TABLE [dbo].[tiposRecipiente] ADD  CONSTRAINT [DF_tiposRecipiente_cantEnMante]  DEFAULT ((0)) FOR [cantEnMante]
GO
ALTER TABLE [dbo].[tiposRecipiente] ADD  CONSTRAINT [DF_tiposRecipiente_cantEnUso]  DEFAULT ((0)) FOR [cantEnUso]
GO
ALTER TABLE [dbo].[traducciones] ADD  CONSTRAINT [DF_traducciones_estado]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[transacciones] ADD  CONSTRAINT [DF_transacciones_accessedFrom]  DEFAULT ('root') FOR [accessedFrom]
GO
ALTER TABLE [dbo].[transactionType] ADD  CONSTRAINT [DF_transactionType_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[tratamientos] ADD  CONSTRAINT [DF_tratamientos_estado]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[ubicaciones] ADD  CONSTRAINT [DF_ubicaciones_accesedFrom]  DEFAULT ('root') FOR [accesedFrom]
GO
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF_usuarios_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[asociaciones]  WITH CHECK ADD  CONSTRAINT [FK_asociaciones_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[asociaciones] CHECK CONSTRAINT [FK_asociaciones_direcciones]
GO
ALTER TABLE [dbo].[ciudades]  WITH CHECK ADD  CONSTRAINT [FK_ciudades_estados1] FOREIGN KEY([estadoId])
REFERENCES [dbo].[estados] ([estadoId])
GO
ALTER TABLE [dbo].[ciudades] CHECK CONSTRAINT [FK_ciudades_estados1]
GO
ALTER TABLE [dbo].[ciudadesXregion]  WITH CHECK ADD  CONSTRAINT [FK_ciudadesXregion_ciudades] FOREIGN KEY([ciudadId])
REFERENCES [dbo].[ciudades] ([ciudadId])
GO
ALTER TABLE [dbo].[ciudadesXregion] CHECK CONSTRAINT [FK_ciudadesXregion_ciudades]
GO
ALTER TABLE [dbo].[ciudadesXregion]  WITH CHECK ADD  CONSTRAINT [FK_ciudadesXregion_regiones1] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[ciudadesXregion] CHECK CONSTRAINT [FK_ciudadesXregion_regiones1]
GO
ALTER TABLE [dbo].[codigosPostales]  WITH CHECK ADD  CONSTRAINT [FK_codigosPostales_ciudades] FOREIGN KEY([codigoPostalId])
REFERENCES [dbo].[ciudades] ([ciudadId])
GO
ALTER TABLE [dbo].[codigosPostales] CHECK CONSTRAINT [FK_codigosPostales_ciudades]
GO
ALTER TABLE [dbo].[codigosPostalesXregion]  WITH CHECK ADD  CONSTRAINT [FK_codigosPostalesXregion_codigosPostales] FOREIGN KEY([codigoPostalId])
REFERENCES [dbo].[codigosPostales] ([codigoPostalId])
GO
ALTER TABLE [dbo].[codigosPostalesXregion] CHECK CONSTRAINT [FK_codigosPostalesXregion_codigosPostales]
GO
ALTER TABLE [dbo].[codigosPostalesXregion]  WITH CHECK ADD  CONSTRAINT [FK_codigosPostalesXregion_regiones1] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[codigosPostalesXregion] CHECK CONSTRAINT [FK_codigosPostalesXregion_regiones1]
GO
ALTER TABLE [dbo].[contactosXAsociaciones]  WITH CHECK ADD  CONSTRAINT [FK_contactosXAsociaciones_asociaciones] FOREIGN KEY([asociacionId])
REFERENCES [dbo].[asociaciones] ([asociacionId])
GO
ALTER TABLE [dbo].[contactosXAsociaciones] CHECK CONSTRAINT [FK_contactosXAsociaciones_asociaciones]
GO
ALTER TABLE [dbo].[contactosXAsociaciones]  WITH CHECK ADD  CONSTRAINT [FK_contactosXAsociaciones_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXAsociaciones] CHECK CONSTRAINT [FK_contactosXAsociaciones_contactoValue]
GO
ALTER TABLE [dbo].[contactosXGobierno]  WITH CHECK ADD  CONSTRAINT [FK_contactosXGobierno_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXGobierno] CHECK CONSTRAINT [FK_contactosXGobierno_contactoValue]
GO
ALTER TABLE [dbo].[contactosXGobierno]  WITH CHECK ADD  CONSTRAINT [FK_contactosXGobierno_gobiernos] FOREIGN KEY([gobiernoId])
REFERENCES [dbo].[gobiernos] ([gobiernoId])
GO
ALTER TABLE [dbo].[contactosXGobierno] CHECK CONSTRAINT [FK_contactosXGobierno_gobiernos]
GO
ALTER TABLE [dbo].[contactosXInspector]  WITH CHECK ADD  CONSTRAINT [FK_contactosXInspector_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXInspector] CHECK CONSTRAINT [FK_contactosXInspector_contactoValue]
GO
ALTER TABLE [dbo].[contactosXInspector]  WITH CHECK ADD  CONSTRAINT [FK_contactosXInspector_inspectores] FOREIGN KEY([inspectorId])
REFERENCES [dbo].[inspectores] ([inspectorId])
GO
ALTER TABLE [dbo].[contactosXInspector] CHECK CONSTRAINT [FK_contactosXInspector_inspectores]
GO
ALTER TABLE [dbo].[contactosXMarca]  WITH CHECK ADD  CONSTRAINT [FK_contactosXMarca_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXMarca] CHECK CONSTRAINT [FK_contactosXMarca_contactoValue]
GO
ALTER TABLE [dbo].[contactosXMarca]  WITH CHECK ADD  CONSTRAINT [FK_contactosXMarca_marcasRecipiente] FOREIGN KEY([marcaId])
REFERENCES [dbo].[marcasRecipiente] ([marcaId])
GO
ALTER TABLE [dbo].[contactosXMarca] CHECK CONSTRAINT [FK_contactosXMarca_marcasRecipiente]
GO
ALTER TABLE [dbo].[contactosXPlanta]  WITH CHECK ADD  CONSTRAINT [FK_contactosXPlanta_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXPlanta] CHECK CONSTRAINT [FK_contactosXPlanta_contactoValue]
GO
ALTER TABLE [dbo].[contactosXPlanta]  WITH CHECK ADD  CONSTRAINT [FK_contactosXPlanta_plantas] FOREIGN KEY([plantaId])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[contactosXPlanta] CHECK CONSTRAINT [FK_contactosXPlanta_plantas]
GO
ALTER TABLE [dbo].[contactosXProductor]  WITH CHECK ADD  CONSTRAINT [FK_contactosXProductor_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXProductor] CHECK CONSTRAINT [FK_contactosXProductor_contactoValue]
GO
ALTER TABLE [dbo].[contactosXProductor]  WITH CHECK ADD  CONSTRAINT [FK_contactosXProductor_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[contactosXProductor] CHECK CONSTRAINT [FK_contactosXProductor_productores]
GO
ALTER TABLE [dbo].[contactosXrecolectora]  WITH CHECK ADD  CONSTRAINT [FK_contactosXrecolectora_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXrecolectora] CHECK CONSTRAINT [FK_contactosXrecolectora_contactoValue]
GO
ALTER TABLE [dbo].[contactosXrecolectora]  WITH CHECK ADD  CONSTRAINT [FK_contactosXrecolectora_recolectoras] FOREIGN KEY([recolectoraId])
REFERENCES [dbo].[recolectoras] ([recolectoraId])
GO
ALTER TABLE [dbo].[contactosXrecolectora] CHECK CONSTRAINT [FK_contactosXrecolectora_recolectoras]
GO
ALTER TABLE [dbo].[contactosXSubproductores]  WITH CHECK ADD  CONSTRAINT [FK_contactosXSubproductores_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXSubproductores] CHECK CONSTRAINT [FK_contactosXSubproductores_contactoValue]
GO
ALTER TABLE [dbo].[contactosXSubproductores]  WITH CHECK ADD  CONSTRAINT [FK_contactosXSubproductores_subproductores] FOREIGN KEY([subproductorId])
REFERENCES [dbo].[subproductores] ([subproductorId])
GO
ALTER TABLE [dbo].[contactosXSubproductores] CHECK CONSTRAINT [FK_contactosXSubproductores_subproductores]
GO
ALTER TABLE [dbo].[contactosXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_contactosXUsuario_contactoValue] FOREIGN KEY([contactoValueId])
REFERENCES [dbo].[contactoValue] ([contactoValueId])
GO
ALTER TABLE [dbo].[contactosXUsuario] CHECK CONSTRAINT [FK_contactosXUsuario_contactoValue]
GO
ALTER TABLE [dbo].[contactosXUsuario]  WITH CHECK ADD  CONSTRAINT [FK_contactosXUsuario_usuarios] FOREIGN KEY([usuarioId])
REFERENCES [dbo].[usuarios] ([usuarioId])
GO
ALTER TABLE [dbo].[contactosXUsuario] CHECK CONSTRAINT [FK_contactosXUsuario_usuarios]
GO
ALTER TABLE [dbo].[contactoValue]  WITH CHECK ADD  CONSTRAINT [FK_contactoValue_contactoType] FOREIGN KEY([contactoTypeId])
REFERENCES [dbo].[contactoType] ([contactoTypeId])
GO
ALTER TABLE [dbo].[contactoValue] CHECK CONSTRAINT [FK_contactoValue_contactoType]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_asociaciones] FOREIGN KEY([asociacionId])
REFERENCES [dbo].[asociaciones] ([asociacionId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_asociaciones]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_contratosStatus] FOREIGN KEY([contratoStatusId])
REFERENCES [dbo].[contratosStatus] ([contratoStatusId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_contratosStatus]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_gobiernos] FOREIGN KEY([gobiernoId])
REFERENCES [dbo].[gobiernos] ([gobiernoId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_gobiernos]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_productores]
GO
ALTER TABLE [dbo].[contratos]  WITH CHECK ADD  CONSTRAINT [FK_contratos_recolectoras] FOREIGN KEY([recolectorId])
REFERENCES [dbo].[recolectoras] ([recolectoraId])
GO
ALTER TABLE [dbo].[contratos] CHECK CONSTRAINT [FK_contratos_recolectoras]
GO
ALTER TABLE [dbo].[desechos]  WITH CHECK ADD  CONSTRAINT [FK_desechos_tiposDesecho] FOREIGN KEY([tipoDesechoId])
REFERENCES [dbo].[tiposDesecho] ([tipoDesechoId])
GO
ALTER TABLE [dbo].[desechos] CHECK CONSTRAINT [FK_desechos_tiposDesecho]
GO
ALTER TABLE [dbo].[desechosXRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_desechosXRecipiente_tiposDesecho] FOREIGN KEY([tipoDesechoId])
REFERENCES [dbo].[tiposDesecho] ([tipoDesechoId])
GO
ALTER TABLE [dbo].[desechosXRecipiente] CHECK CONSTRAINT [FK_desechosXRecipiente_tiposDesecho]
GO
ALTER TABLE [dbo].[desechosXRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_desechosXRecipiente_tiposRecipiente] FOREIGN KEY([tipoRecId])
REFERENCES [dbo].[tiposRecipiente] ([tipoRecId])
GO
ALTER TABLE [dbo].[desechosXRecipiente] CHECK CONSTRAINT [FK_desechosXRecipiente_tiposRecipiente]
GO
ALTER TABLE [dbo].[desechosXtratamiento]  WITH CHECK ADD  CONSTRAINT [FK_desechosXtratamiento_desechos] FOREIGN KEY([desechoId])
REFERENCES [dbo].[desechos] ([desechoId])
GO
ALTER TABLE [dbo].[desechosXtratamiento] CHECK CONSTRAINT [FK_desechosXtratamiento_desechos]
GO
ALTER TABLE [dbo].[desechosXtratamiento]  WITH CHECK ADD  CONSTRAINT [FK_desechosXtratamiento_tratamientos] FOREIGN KEY([tratamientoId])
REFERENCES [dbo].[tratamientos] ([tratamientoId])
GO
ALTER TABLE [dbo].[desechosXtratamiento] CHECK CONSTRAINT [FK_desechosXtratamiento_tratamientos]
GO
ALTER TABLE [dbo].[desechoXContrato]  WITH CHECK ADD  CONSTRAINT [FK_desechoXContrato_contratos] FOREIGN KEY([contratoId])
REFERENCES [dbo].[contratos] ([contratoId])
GO
ALTER TABLE [dbo].[desechoXContrato] CHECK CONSTRAINT [FK_desechoXContrato_contratos]
GO
ALTER TABLE [dbo].[desechoXContrato]  WITH CHECK ADD  CONSTRAINT [FK_desechoXContrato_desechos] FOREIGN KEY([desechoId])
REFERENCES [dbo].[desechos] ([desechoId])
GO
ALTER TABLE [dbo].[desechoXContrato] CHECK CONSTRAINT [FK_desechoXContrato_desechos]
GO
ALTER TABLE [dbo].[desechoXContrato]  WITH CHECK ADD  CONSTRAINT [FK_desechoXContrato_tratamientos] FOREIGN KEY([tratamientoId])
REFERENCES [dbo].[tratamientos] ([tratamientoId])
GO
ALTER TABLE [dbo].[desechoXContrato] CHECK CONSTRAINT [FK_desechoXContrato_tratamientos]
GO
ALTER TABLE [dbo].[direcciones]  WITH CHECK ADD  CONSTRAINT [FK_direcciones_codigosPostales] FOREIGN KEY([codigoPostalId])
REFERENCES [dbo].[codigosPostales] ([codigoPostalId])
GO
ALTER TABLE [dbo].[direcciones] CHECK CONSTRAINT [FK_direcciones_codigosPostales]
GO
ALTER TABLE [dbo].[estados]  WITH CHECK ADD  CONSTRAINT [FK_estados_paises1] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[estados] CHECK CONSTRAINT [FK_estados_paises1]
GO
ALTER TABLE [dbo].[estadosXregion]  WITH CHECK ADD  CONSTRAINT [FK_estadosXregion_estados] FOREIGN KEY([estadoId])
REFERENCES [dbo].[estados] ([estadoId])
GO
ALTER TABLE [dbo].[estadosXregion] CHECK CONSTRAINT [FK_estadosXregion_estados]
GO
ALTER TABLE [dbo].[estadosXregion]  WITH CHECK ADD  CONSTRAINT [FK_estadosXregion_regiones1] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[estadosXregion] CHECK CONSTRAINT [FK_estadosXregion_regiones1]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_eventType] FOREIGN KEY([eventTypeId])
REFERENCES [dbo].[eventType] ([eventTypeId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_eventType]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_levels] FOREIGN KEY([levelId])
REFERENCES [dbo].[levels] ([levelId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_levels]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_objectTypes] FOREIGN KEY([reference1])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_objectTypes]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_objectTypes1] FOREIGN KEY([reference2])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_objectTypes1]
GO
ALTER TABLE [dbo].[eventLogs]  WITH CHECK ADD  CONSTRAINT [FK_eventLogs_sources] FOREIGN KEY([sourceId])
REFERENCES [dbo].[sources] ([sourceId])
GO
ALTER TABLE [dbo].[eventLogs] CHECK CONSTRAINT [FK_eventLogs_sources]
GO
ALTER TABLE [dbo].[gobiernos]  WITH CHECK ADD  CONSTRAINT [FK_gobiernos_regiones] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[gobiernos] CHECK CONSTRAINT [FK_gobiernos_regiones]
GO
ALTER TABLE [dbo].[historialesXrecipiente]  WITH CHECK ADD  CONSTRAINT [FK_historialesXrecipiente_ubicaciones] FOREIGN KEY([ubicacionId])
REFERENCES [dbo].[ubicaciones] ([ubicacionId])
GO
ALTER TABLE [dbo].[historialesXrecipiente] CHECK CONSTRAINT [FK_historialesXrecipiente_ubicaciones]
GO
ALTER TABLE [dbo].[idiomasXRegion]  WITH CHECK ADD  CONSTRAINT [FK_idiomasXpais_idiomas] FOREIGN KEY([idiomaId])
REFERENCES [dbo].[idiomas] ([idiomaId])
GO
ALTER TABLE [dbo].[idiomasXRegion] CHECK CONSTRAINT [FK_idiomasXpais_idiomas]
GO
ALTER TABLE [dbo].[idiomasXRegion]  WITH CHECK ADD  CONSTRAINT [FK_idiomasXRegion_regiones] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[idiomasXRegion] CHECK CONSTRAINT [FK_idiomasXRegion_regiones]
GO
ALTER TABLE [dbo].[inventarioMateriales]  WITH CHECK ADD  CONSTRAINT [FK_inventarioMateriales_inspectores] FOREIGN KEY([inspectorId])
REFERENCES [dbo].[inspectores] ([inspectorId])
GO
ALTER TABLE [dbo].[inventarioMateriales] CHECK CONSTRAINT [FK_inventarioMateriales_inspectores]
GO
ALTER TABLE [dbo].[inventarioMateriales]  WITH CHECK ADD  CONSTRAINT [FK_inventarioMateriales_logProducciones] FOREIGN KEY([produccionId])
REFERENCES [dbo].[logProducciones] ([produccionId])
GO
ALTER TABLE [dbo].[inventarioMateriales] CHECK CONSTRAINT [FK_inventarioMateriales_logProducciones]
GO
ALTER TABLE [dbo].[inventarioMateriales]  WITH CHECK ADD  CONSTRAINT [FK_inventarioMateriales_materiales] FOREIGN KEY([materialId])
REFERENCES [dbo].[materiales] ([materialId])
GO
ALTER TABLE [dbo].[inventarioMateriales] CHECK CONSTRAINT [FK_inventarioMateriales_materiales]
GO
ALTER TABLE [dbo].[logExchanges]  WITH CHECK ADD  CONSTRAINT [FK_logConversiones_monedas] FOREIGN KEY([moneda1])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[logExchanges] CHECK CONSTRAINT [FK_logConversiones_monedas]
GO
ALTER TABLE [dbo].[logExchanges]  WITH CHECK ADD  CONSTRAINT [FK_logConversiones_monedas1] FOREIGN KEY([moneda2])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[logExchanges] CHECK CONSTRAINT [FK_logConversiones_monedas1]
GO
ALTER TABLE [dbo].[logNivelContaminacion]  WITH CHECK ADD  CONSTRAINT [FK_logContaminantes_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[logNivelContaminacion] CHECK CONSTRAINT [FK_logContaminantes_productores]
GO
ALTER TABLE [dbo].[logProducciones]  WITH CHECK ADD  CONSTRAINT [FK_logProducciones_inspectores] FOREIGN KEY([inspectorId])
REFERENCES [dbo].[inspectores] ([inspectorId])
GO
ALTER TABLE [dbo].[logProducciones] CHECK CONSTRAINT [FK_logProducciones_inspectores]
GO
ALTER TABLE [dbo].[logProducciones]  WITH CHECK ADD  CONSTRAINT [FK_logProducciones_productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[logProducciones] CHECK CONSTRAINT [FK_logProducciones_productos]
GO
ALTER TABLE [dbo].[materialesXProducto]  WITH CHECK ADD  CONSTRAINT [FK_materialesXProducto_materiales] FOREIGN KEY([materialId])
REFERENCES [dbo].[materiales] ([materialId])
GO
ALTER TABLE [dbo].[materialesXProducto] CHECK CONSTRAINT [FK_materialesXProducto_materiales]
GO
ALTER TABLE [dbo].[materialesXProducto]  WITH CHECK ADD  CONSTRAINT [FK_materialesXProducto_productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[materialesXProducto] CHECK CONSTRAINT [FK_materialesXProducto_productos]
GO
ALTER TABLE [dbo].[modelosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_modelosRecipiente_marcasRecipiente] FOREIGN KEY([marcaId])
REFERENCES [dbo].[marcasRecipiente] ([marcaId])
GO
ALTER TABLE [dbo].[modelosRecipiente] CHECK CONSTRAINT [FK_modelosRecipiente_marcasRecipiente]
GO
ALTER TABLE [dbo].[monedasXpais]  WITH CHECK ADD  CONSTRAINT [FK_monedasXpais_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[monedasXpais] CHECK CONSTRAINT [FK_monedasXpais_monedas]
GO
ALTER TABLE [dbo].[monedasXRegion]  WITH CHECK ADD  CONSTRAINT [FK_monedasXRegion_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[monedasXRegion] CHECK CONSTRAINT [FK_monedasXRegion_monedas]
GO
ALTER TABLE [dbo].[monedasXRegion]  WITH CHECK ADD  CONSTRAINT [FK_monedasXRegion_regiones] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[monedasXRegion] CHECK CONSTRAINT [FK_monedasXRegion_regiones]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_desechos] FOREIGN KEY([desechoId])
REFERENCES [dbo].[desechos] ([desechoId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_desechos]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_direcciones]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_movementType] FOREIGN KEY([movementTypeId])
REFERENCES [dbo].[movementType] ([movementTypeId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_movementType]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_plantas] FOREIGN KEY([plantaId])
REFERENCES [dbo].[plantas] ([plantaId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_plantas]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_productores]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_subproductores] FOREIGN KEY([subProductorId])
REFERENCES [dbo].[subproductores] ([subproductorId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_subproductores]
GO
ALTER TABLE [dbo].[movimientosRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_movimientosRecipiente_tiposRecipiente] FOREIGN KEY([tipoRecId])
REFERENCES [dbo].[tiposRecipiente] ([tipoRecId])
GO
ALTER TABLE [dbo].[movimientosRecipiente] CHECK CONSTRAINT [FK_movimientosRecipiente_tiposRecipiente]
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD  CONSTRAINT [FK_pagos_transacciones] FOREIGN KEY([transaccionId])
REFERENCES [dbo].[transacciones] ([transaccionId])
GO
ALTER TABLE [dbo].[pagos] CHECK CONSTRAINT [FK_pagos_transacciones]
GO
ALTER TABLE [dbo].[paisesXregion]  WITH CHECK ADD  CONSTRAINT [FK_paisesXregion_paises] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[paisesXregion] CHECK CONSTRAINT [FK_paisesXregion_paises]
GO
ALTER TABLE [dbo].[paisesXregion]  WITH CHECK ADD  CONSTRAINT [FK_paisesXregion_regiones1] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[paisesXregion] CHECK CONSTRAINT [FK_paisesXregion_regiones1]
GO
ALTER TABLE [dbo].[plantas]  WITH CHECK ADD  CONSTRAINT [FK_puntosEntrega_direcciones] FOREIGN KEY([direccion])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[plantas] CHECK CONSTRAINT [FK_puntosEntrega_direcciones]
GO
ALTER TABLE [dbo].[preciosProXPais]  WITH CHECK ADD  CONSTRAINT [FK_preciosProXPais_productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[preciosProXPais] CHECK CONSTRAINT [FK_preciosProXPais_productos]
GO
ALTER TABLE [dbo].[preciosTratamientoXPais]  WITH CHECK ADD  CONSTRAINT [FK_preciosTratamientoXPais_paises] FOREIGN KEY([paisId])
REFERENCES [dbo].[paises] ([paisId])
GO
ALTER TABLE [dbo].[preciosTratamientoXPais] CHECK CONSTRAINT [FK_preciosTratamientoXPais_paises]
GO
ALTER TABLE [dbo].[preciosTratamientoXPais]  WITH CHECK ADD  CONSTRAINT [FK_preciosTratamientoXPais_tratamientos] FOREIGN KEY([tratamientoId])
REFERENCES [dbo].[tratamientos] ([tratamientoId])
GO
ALTER TABLE [dbo].[preciosTratamientoXPais] CHECK CONSTRAINT [FK_preciosTratamientoXPais_tratamientos]
GO
ALTER TABLE [dbo].[productores]  WITH CHECK ADD  CONSTRAINT [FK_productores_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[productores] CHECK CONSTRAINT [FK_productores_direcciones]
GO
ALTER TABLE [dbo].[productosXventa]  WITH CHECK ADD  CONSTRAINT [FK_productosXventa_logVentas] FOREIGN KEY([ventaId])
REFERENCES [dbo].[logVentas] ([ventaId])
GO
ALTER TABLE [dbo].[productosXventa] CHECK CONSTRAINT [FK_productosXventa_logVentas]
GO
ALTER TABLE [dbo].[productosXventa]  WITH CHECK ADD  CONSTRAINT [FK_productosXventa_productos] FOREIGN KEY([productoId])
REFERENCES [dbo].[productos] ([productoId])
GO
ALTER TABLE [dbo].[productosXventa] CHECK CONSTRAINT [FK_productosXventa_productos]
GO
ALTER TABLE [dbo].[recolectoras]  WITH CHECK ADD  CONSTRAINT [FK_recolectoras_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[recolectoras] CHECK CONSTRAINT [FK_recolectoras_direcciones]
GO
ALTER TABLE [dbo].[recolectoras]  WITH CHECK ADD  CONSTRAINT [FK_recolectoras_regiones] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[recolectoras] CHECK CONSTRAINT [FK_recolectoras_regiones]
GO
ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD  CONSTRAINT [FK_sponsors_contratos] FOREIGN KEY([contratoId])
REFERENCES [dbo].[contratos] ([contratoId])
GO
ALTER TABLE [dbo].[sponsors] CHECK CONSTRAINT [FK_sponsors_contratos]
GO
ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD  CONSTRAINT [FK_sponsors_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[sponsors] CHECK CONSTRAINT [FK_sponsors_productores]
GO
ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD  CONSTRAINT [FK_sponsors_regiones] FOREIGN KEY([regionId])
REFERENCES [dbo].[regiones] ([regionId])
GO
ALTER TABLE [dbo].[sponsors] CHECK CONSTRAINT [FK_sponsors_regiones]
GO
ALTER TABLE [dbo].[subproductores]  WITH CHECK ADD  CONSTRAINT [FK_productorXlocalidades_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[subproductores] CHECK CONSTRAINT [FK_productorXlocalidades_direcciones]
GO
ALTER TABLE [dbo].[subproductores]  WITH CHECK ADD  CONSTRAINT [FK_productorXlocalidades_productores] FOREIGN KEY([productorId])
REFERENCES [dbo].[productores] ([productorId])
GO
ALTER TABLE [dbo].[subproductores] CHECK CONSTRAINT [FK_productorXlocalidades_productores]
GO
ALTER TABLE [dbo].[tiposRecipiente]  WITH CHECK ADD  CONSTRAINT [FK_tiposRecipiente_modelosRecipiente] FOREIGN KEY([modeloId])
REFERENCES [dbo].[modelosRecipiente] ([modeloId])
GO
ALTER TABLE [dbo].[tiposRecipiente] CHECK CONSTRAINT [FK_tiposRecipiente_modelosRecipiente]
GO
ALTER TABLE [dbo].[traducciones]  WITH CHECK ADD  CONSTRAINT [FK_traducciones_idiomas1] FOREIGN KEY([idiomaTraducido])
REFERENCES [dbo].[idiomas] ([idiomaId])
GO
ALTER TABLE [dbo].[traducciones] CHECK CONSTRAINT [FK_traducciones_idiomas1]
GO
ALTER TABLE [dbo].[traducciones]  WITH CHECK ADD  CONSTRAINT [FK_traducciones_objectTypes] FOREIGN KEY([objectTypeId])
REFERENCES [dbo].[objectTypes] ([objectTypeId])
GO
ALTER TABLE [dbo].[traducciones] CHECK CONSTRAINT [FK_traducciones_objectTypes]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_contratos] FOREIGN KEY([contratoId])
REFERENCES [dbo].[contratos] ([contratoId])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_contratos]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_logExchanges] FOREIGN KEY([exchangeId])
REFERENCES [dbo].[logExchanges] ([exchangeId])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_logExchanges]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_logVentas] FOREIGN KEY([ventaId])
REFERENCES [dbo].[logVentas] ([ventaId])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_logVentas]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_monedas] FOREIGN KEY([monedaId])
REFERENCES [dbo].[monedas] ([monedaId])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_monedas]
GO
ALTER TABLE [dbo].[transacciones]  WITH CHECK ADD  CONSTRAINT [FK_transacciones_transactionType] FOREIGN KEY([transactionType])
REFERENCES [dbo].[transactionType] ([transactionTypeId])
GO
ALTER TABLE [dbo].[transacciones] CHECK CONSTRAINT [FK_transacciones_transactionType]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_direcciones]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:por día, 1:por semana, 2:por mes, 3: trimestre, 4: bimestre, 5: semestre, 6:cuatrimestre, 7: anual' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contratos', @level2type=N'COLUMN',@level2name=N'tipoRecurrencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'x dia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'contratos', @level2type=N'COLUMN',@level2name=N'gobiernoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'moneda1 a moneda2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'logExchanges', @level2type=N'COLUMN',@level2name=N'cambio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'paises', @level2type=N'COLUMN',@level2name=N'paisId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Formato ISO' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'paises', @level2type=N'COLUMN',@level2name=N'nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Detallista 1:Cadenas 2:Industria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'productores', @level2type=N'COLUMN',@level2name=N'categoria'
GO
