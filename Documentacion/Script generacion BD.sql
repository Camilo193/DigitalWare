CREATE DATABASE Facturacion
GO
USE Facturacion
GO
CREATE TABLE [dbo].[CLIENTES](
	[Identificacion] [varchar](10) NOT NULL,
	[PrimerNombre] [varchar](30) NOT NULL,
	[SegundoNombre] [varchar](30) NULL,
	[PrimerApellido] [varchar](30) NOT NULL,
	[SegundoApellido] [varchar](30) NULL,
	[FechaNacimiento] [date] NOT NULL,
 CONSTRAINT [CLIENTES_PK] PRIMARY KEY CLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLES]    Script Date: 21/06/2021 1:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLES](
	[Codigo] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Factura] [int] NOT NULL,
	[Producto] [int] NOT NULL,
 CONSTRAINT [PK_DETALLES] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTURAS]    Script Date: 21/06/2021 1:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURAS](
	[Codigo] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[Descripcion] [varchar](100) NULL,
	[Cliente] [varchar](10) NOT NULL,
 CONSTRAINT [FACTURAS_PK] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 21/06/2021 1:22:05 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[Codigo] [int] NOT NULL,
	[Nombre] [varchar](40) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PRODUCTOS_PK] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CLIENTES] ([Identificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [FechaNacimiento]) VALUES (N'1040752310', N'Juan', N'Camilo', N'Urrego', N'Serna', CAST(N'1996-02-04' AS Date))
INSERT [dbo].[CLIENTES] ([Identificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [FechaNacimiento]) VALUES (N'10512065', N'Sidny', N'Yuliana', N'Hoyos', N'Zapata', CAST(N'1999-08-16' AS Date))
INSERT [dbo].[CLIENTES] ([Identificacion], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [FechaNacimiento]) VALUES (N'41896155', N'Martha', N'Cecilia', N'Urrego', N'Serna', CAST(N'1956-04-30' AS Date))
GO
INSERT [dbo].[DETALLES] ([Codigo], [Cantidad], [Precio], [Factura], [Producto]) VALUES (1, 3, CAST(36000.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[DETALLES] ([Codigo], [Cantidad], [Precio], [Factura], [Producto]) VALUES (2, 2, CAST(20000.00 AS Decimal(10, 2)), 2, 2)
INSERT [dbo].[DETALLES] ([Codigo], [Cantidad], [Precio], [Factura], [Producto]) VALUES (3, 1, CAST(10000.00 AS Decimal(10, 2)), 3, 2)
INSERT [dbo].[DETALLES] ([Codigo], [Cantidad], [Precio], [Factura], [Producto]) VALUES (4, 1, CAST(20000.00 AS Decimal(10, 2)), 4, 5)
INSERT [dbo].[DETALLES] ([Codigo], [Cantidad], [Precio], [Factura], [Producto]) VALUES (5, 1, CAST(27000.00 AS Decimal(10, 2)), 4, 3)
INSERT [dbo].[DETALLES] ([Codigo], [Cantidad], [Precio], [Factura], [Producto]) VALUES (6, 2, CAST(24000.00 AS Decimal(10, 2)), 4, 4)
INSERT [dbo].[DETALLES] ([Codigo], [Cantidad], [Precio], [Factura], [Producto]) VALUES (7, 1, CAST(12000.00 AS Decimal(10, 2)), 4, 1)
INSERT [dbo].[DETALLES] ([Codigo], [Cantidad], [Precio], [Factura], [Producto]) VALUES (8, 1, CAST(12000.00 AS Decimal(10, 2)), 3, 1)
INSERT [dbo].[DETALLES] ([Codigo], [Cantidad], [Precio], [Factura], [Producto]) VALUES (9, 1, CAST(12000.00 AS Decimal(10, 2)), 5, 1)
INSERT [dbo].[DETALLES] ([Codigo], [Cantidad], [Precio], [Factura], [Producto]) VALUES (10, 1, CAST(10000.00 AS Decimal(10, 2)), 6, 2)
GO
INSERT [dbo].[FACTURAS] ([Codigo], [Fecha], [Descripcion], [Cliente]) VALUES (1, CAST(N'2021-04-14T00:00:00.000' AS DateTime), N'Venta', N'1040752310')
INSERT [dbo].[FACTURAS] ([Codigo], [Fecha], [Descripcion], [Cliente]) VALUES (2, CAST(N'2021-04-20T00:00:00.000' AS DateTime), N'Venta', N'10512065')
INSERT [dbo].[FACTURAS] ([Codigo], [Fecha], [Descripcion], [Cliente]) VALUES (3, CAST(N'2000-04-14T00:00:00.000' AS DateTime), N'Venta', N'1040752310')
INSERT [dbo].[FACTURAS] ([Codigo], [Fecha], [Descripcion], [Cliente]) VALUES (4, CAST(N'2000-04-20T00:00:00.000' AS DateTime), N'Venta', N'10512065')
INSERT [dbo].[FACTURAS] ([Codigo], [Fecha], [Descripcion], [Cliente]) VALUES (5, CAST(N'2015-06-06T00:00:00.000' AS DateTime), N'Venta', N'41896155')
INSERT [dbo].[FACTURAS] ([Codigo], [Fecha], [Descripcion], [Cliente]) VALUES (6, CAST(N'2020-06-06T00:00:00.000' AS DateTime), N'Venta', N'41896155')
INSERT [dbo].[FACTURAS] ([Codigo], [Fecha], [Descripcion], [Cliente]) VALUES (7, CAST(N'2017-04-20T00:00:00.000' AS DateTime), N'Venta', N'10512065')
INSERT [dbo].[FACTURAS] ([Codigo], [Fecha], [Descripcion], [Cliente]) VALUES (8, CAST(N'2019-04-20T00:00:00.000' AS DateTime), N'Venta', N'10512065')
INSERT [dbo].[FACTURAS] ([Codigo], [Fecha], [Descripcion], [Cliente]) VALUES (9, CAST(N'2010-06-06T00:00:00.000' AS DateTime), N'Venta', N'41896155')
GO
INSERT [dbo].[PRODUCTOS] ([Codigo], [Nombre], [Precio], [Stock]) VALUES (1, N'Cubo Rubik 3 x 3', CAST(12000.00 AS Decimal(10, 2)), 10)
INSERT [dbo].[PRODUCTOS] ([Codigo], [Nombre], [Precio], [Stock]) VALUES (2, N'Ajedrez madera pequeno', CAST(10000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[PRODUCTOS] ([Codigo], [Nombre], [Precio], [Stock]) VALUES (3, N'Ajedrez profesional', CAST(27000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[PRODUCTOS] ([Codigo], [Nombre], [Precio], [Stock]) VALUES (4, N'Parques 4 posiciones', CAST(12000.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[PRODUCTOS] ([Codigo], [Nombre], [Precio], [Stock]) VALUES (5, N'Parques 6 posiciones', CAST(20000.00 AS Decimal(10, 2)), 6)
GO
ALTER TABLE [dbo].[FACTURAS] ADD  CONSTRAINT [DF_FACTURAS_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[DETALLES]  WITH CHECK ADD  CONSTRAINT [DETALLES_FACTURAS_FK] FOREIGN KEY([Factura])
REFERENCES [dbo].[FACTURAS] ([Codigo])
GO
ALTER TABLE [dbo].[DETALLES] CHECK CONSTRAINT [DETALLES_FACTURAS_FK]
GO
ALTER TABLE [dbo].[DETALLES]  WITH CHECK ADD  CONSTRAINT [DETALLES_PRODUCTOS_FK] FOREIGN KEY([Producto])
REFERENCES [dbo].[PRODUCTOS] ([Codigo])
GO
ALTER TABLE [dbo].[DETALLES] CHECK CONSTRAINT [DETALLES_PRODUCTOS_FK]
GO
ALTER TABLE [dbo].[FACTURAS]  WITH CHECK ADD  CONSTRAINT [FACTURAS_CLIENTES_FK] FOREIGN KEY([Cliente])
REFERENCES [dbo].[CLIENTES] ([Identificacion])
GO
ALTER TABLE [dbo].[FACTURAS] CHECK CONSTRAINT [FACTURAS_CLIENTES_FK]
GO
/****** Object:  StoredProcedure [dbo].[UspActualizarClientes]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspActualizarClientes]
         @Identificacion varchar(10),  @PrimerNombre varchar(30),  @SegundoNombre varchar(30),  @PrimerApellido varchar(30),  @SegundoApellido varchar(30),  @FechaNacimiento date
AS
    UPDATE CLIENTES
    SET CLIENTES.Identificacion = @Identificacion, CLIENTES.PrimerNombre = @PrimerNombre, CLIENTES.SegundoNombre = @SegundoNombre, CLIENTES.PrimerApellido = @PrimerApellido, CLIENTES.SegundoApellido = @SegundoApellido, CLIENTES.FechaNacimiento = @FechaNacimiento
    WHERE CLIENTES.Identificacion = @Identificacion;
GO
/****** Object:  StoredProcedure [dbo].[UspActualizarDetalles]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspActualizarDetalles]
         @Codigo int,  @Cantidad int,  @Precio decimal,  @Factura int,  @Producto int
AS
    UPDATE DETALLES
    SET DETALLES.Codigo = @Codigo, DETALLES.Cantidad = @Cantidad, DETALLES.Precio = @Precio, DETALLES.Factura = @Factura, DETALLES.Producto = @Producto
    WHERE DETALLES.Codigo = @Codigo;
GO
/****** Object:  StoredProcedure [dbo].[UspActualizarFacturas]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspActualizarFacturas]
         @Codigo int,  @Fecha datetime,  @Descripcion varchar(100),  @Cliente varchar(10)
AS
    UPDATE FACTURAS
    SET FACTURAS.Codigo = @Codigo, FACTURAS.Fecha = @Fecha, FACTURAS.Descripcion = @Descripcion, FACTURAS.Cliente = @Cliente
    WHERE FACTURAS.Codigo = @Codigo;
GO
/****** Object:  StoredProcedure [dbo].[UspActualizarProductos]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspActualizarProductos]
         @Codigo int,  @Nombre varchar(40),  @Precio decimal,  @Stock int
AS
    UPDATE PRODUCTOS
    SET PRODUCTOS.Codigo = @Codigo, PRODUCTOS.Nombre = @Nombre, PRODUCTOS.Precio = @Precio, PRODUCTOS.Stock = @Stock
    WHERE PRODUCTOS.Codigo = @Codigo;
GO
/****** Object:  StoredProcedure [dbo].[UspEliminarClientes]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspEliminarClientes]
        @Identificacion varchar(10)
AS
    DELETE FROM CLIENTES
    WHERE CLIENTES.Identificacion = @Identificacion;
GO
/****** Object:  StoredProcedure [dbo].[UspEliminarDetalles]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspEliminarDetalles]
        @Codigo int
AS
    DELETE FROM DETALLES
    WHERE DETALLES.Codigo = @Codigo;
GO
/****** Object:  StoredProcedure [dbo].[UspEliminarFacturas]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspEliminarFacturas]
        @Codigo int
AS
    DELETE FROM FACTURAS
    WHERE FACTURAS.Codigo = @Codigo;
GO
/****** Object:  StoredProcedure [dbo].[UspEliminarProductos]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspEliminarProductos]
        @Codigo int
AS
    DELETE FROM PRODUCTOS
    WHERE PRODUCTOS.Codigo = @Codigo;
GO
/****** Object:  StoredProcedure [dbo].[UspInsertarClientes]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspInsertarClientes]
         @Identificacion varchar(10),  @PrimerNombre varchar(30),  @SegundoNombre varchar(30),  @PrimerApellido varchar(30),  @SegundoApellido varchar(30),  @FechaNacimiento date
        
AS
    INSERT INTO CLIENTES ( CLIENTES.Identificacion, CLIENTES.PrimerNombre, CLIENTES.SegundoNombre, CLIENTES.PrimerApellido, CLIENTES.SegundoApellido, CLIENTES.FechaNacimiento )
    VALUES ( @Identificacion, @PrimerNombre, @SegundoNombre, @PrimerApellido, @SegundoApellido, @FechaNacimiento);
GO
/****** Object:  StoredProcedure [dbo].[UspInsertarDetalles]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspInsertarDetalles]
          @Cantidad int,  @Precio decimal,  @Factura int,  @Producto int
        
AS
    INSERT INTO DETALLES ( DETALLES.Cantidad, DETALLES.Precio, DETALLES.Factura, DETALLES.Producto )
    VALUES (  @Cantidad, @Precio, @Factura, @Producto);
GO
/****** Object:  StoredProcedure [dbo].[UspInsertarFacturas]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspInsertarFacturas]
          @Fecha datetime,  @Descripcion varchar(100),  @Cliente varchar(10)
        
AS
    INSERT INTO FACTURAS (  FACTURAS.Fecha, FACTURAS.Descripcion, FACTURAS.Cliente )
    VALUES ( @Fecha, @Descripcion, @Cliente);
GO
/****** Object:  StoredProcedure [dbo].[UspInsertarInformacionFacturas]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UspInsertarInformacionFacturas]
         @Codigo int,  @Fecha datetime,  @Descripcion varchar(100),  @Cliente varchar(10), 
		 @CodigoDetalle int,  @Cantidad int,  @Precio decimal,  @Factura int,  @Producto int
        
AS
    INSERT INTO FACTURAS ( FACTURAS.Codigo, FACTURAS.Fecha, FACTURAS.Descripcion, FACTURAS.Cliente )
    VALUES ( @Codigo, @Fecha, @Descripcion, @Cliente);
	INSERT INTO DETALLES ( DETALLES.Codigo, DETALLES.Cantidad, DETALLES.Precio, DETALLES.Factura, DETALLES.Producto )
    VALUES ( @CodigoDetalle, @Cantidad, @Precio, @Factura, @Producto);
GO
/****** Object:  StoredProcedure [dbo].[UspInsertarProductos]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspInsertarProductos]
         @Codigo int,  @Nombre varchar(40),  @Precio decimal,  @Stock int
        
AS
    INSERT INTO PRODUCTOS ( PRODUCTOS.Codigo, PRODUCTOS.Nombre, PRODUCTOS.Precio, PRODUCTOS.Stock )
    VALUES ( @Codigo, @Nombre, @Precio, @Stock);
GO
/****** Object:  StoredProcedure [dbo].[UspObtenerClientes]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspObtenerClientes]
AS
	SELECT * FROM CLIENTES;
GO
/****** Object:  StoredProcedure [dbo].[UspObtenerClientesPorIdentificacion]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspObtenerClientesPorIdentificacion]
         @Identificacion varchar(10)
AS
	SELECT * FROM CLIENTES WHERE CLIENTES.Identificacion = @Identificacion;
GO
/****** Object:  StoredProcedure [dbo].[UspObtenerDetalles]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspObtenerDetalles]
AS
	SELECT * FROM DETALLES;
GO
/****** Object:  StoredProcedure [dbo].[UspObtenerDetallesPorCodigo]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspObtenerDetallesPorCodigo]
         @Codigo int
AS
	SELECT * FROM DETALLES WHERE DETALLES.Codigo = @Codigo;
GO
/****** Object:  StoredProcedure [dbo].[UspObtenerFacturas]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspObtenerFacturas]
AS
	SELECT * FROM FACTURAS;
GO
/****** Object:  StoredProcedure [dbo].[UspObtenerFacturasPorCodigo]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspObtenerFacturasPorCodigo]
         @Codigo int
AS
	SELECT * FROM FACTURAS WHERE FACTURAS.Codigo = @Codigo;
GO
/****** Object:  StoredProcedure [dbo].[UspObtenerProductos]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspObtenerProductos]
AS
	SELECT * FROM PRODUCTOS;
GO
/****** Object:  StoredProcedure [dbo].[UspObtenerProductosPorCodigo]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspObtenerProductosPorCodigo]
         @Codigo int
AS
	SELECT * FROM PRODUCTOS WHERE PRODUCTOS.Codigo = @Codigo;
GO
/****** Object:  StoredProcedure [dbo].[UspVerificarStock]    Script Date: 21/06/2021 1:22:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UspVerificarStock]
@Producto int, @Cantidad int
AS
SELECT CASE WHEN EXISTS (
    SELECT *
    FROM Productos
WHERE Codigo = @Producto AND Stock >= @Cantidad
)
THEN CAST(1 AS INT)
ELSE CAST(0 AS INT) END
GO

GO
ALTER DATABASE [Facturacion] SET  READ_WRITE 
GO
