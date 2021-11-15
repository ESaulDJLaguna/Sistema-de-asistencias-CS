USE [master]
GO
/****** Object:  Database [ORUS369]    Script Date: 14/11/2021 11:30:53 p. m. ******/
CREATE DATABASE [ORUS369]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ORUS369', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ORUS369.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ORUS369_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ORUS369_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ORUS369] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ORUS369].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ORUS369] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ORUS369] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ORUS369] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ORUS369] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ORUS369] SET ARITHABORT OFF 
GO
ALTER DATABASE [ORUS369] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ORUS369] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ORUS369] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ORUS369] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ORUS369] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ORUS369] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ORUS369] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ORUS369] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ORUS369] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ORUS369] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ORUS369] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ORUS369] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ORUS369] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ORUS369] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ORUS369] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ORUS369] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ORUS369] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ORUS369] SET RECOVERY FULL 
GO
ALTER DATABASE [ORUS369] SET  MULTI_USER 
GO
ALTER DATABASE [ORUS369] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ORUS369] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ORUS369] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ORUS369] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ORUS369] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ORUS369] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ORUS369', N'ON'
GO
ALTER DATABASE [ORUS369] SET QUERY_STORE = OFF
GO
USE [ORUS369]
GO
/****** Object:  Table [dbo].[Asistencias]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistencias](
	[id_asistencias] [int] IDENTITY(1,1) NOT NULL,
	[id_personal] [int] NULL,
	[fecha_entrada] [datetime] NULL,
	[fecha_salida] [datetime] NULL,
	[estado] [varchar](50) NULL,
	[horas] [numeric](18, 2) NULL,
	[observación] [varchar](max) NULL,
 CONSTRAINT [PK_Asistencias] PRIMARY KEY CLUSTERED 
(
	[id_asistencias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[id_cargo] [int] IDENTITY(1,1) NOT NULL,
	[Cargo] [varchar](max) NULL,
	[SueldoPorHora] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED 
(
	[id_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modulos]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modulos](
	[IdModulo] [int] IDENTITY(1,1) NOT NULL,
	[Modulo] [varchar](max) NULL,
 CONSTRAINT [PK_Modulos] PRIMARY KEY CLUSTERED 
(
	[IdModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[idPermisos] [int] IDENTITY(1,1) NOT NULL,
	[idModulo] [int] NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[idPermisos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[id_personal] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](max) NULL,
	[Identificación] [varchar](max) NULL,
	[País] [varchar](max) NULL,
	[id_cargo] [int] NULL,
	[SueldoPorHora] [numeric](18, 2) NULL,
	[Estado] [varchar](max) NULL,
	[codigo] [varchar](max) NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[id_personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombresApellidos] [varchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Icono] [image] NULL,
	[Estado] [varchar](50) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asistencias]  WITH CHECK ADD  CONSTRAINT [FK_Asistencias_Personal] FOREIGN KEY([id_personal])
REFERENCES [dbo].[Personal] ([id_personal])
GO
ALTER TABLE [dbo].[Asistencias] CHECK CONSTRAINT [FK_Asistencias_Personal]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Modulos] FOREIGN KEY([idModulo])
REFERENCES [dbo].[Modulos] ([IdModulo])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Modulos]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Usuarios]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Cargo] FOREIGN KEY([id_cargo])
REFERENCES [dbo].[Cargo] ([id_cargo])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Cargo]
GO
/****** Object:  StoredProcedure [dbo].[BuscarAsistenciasPorId]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BuscarAsistenciasPorId]
	@id_personal INT
AS
SELECT * FROM Asistencias
WHERE id_personal = @id_personal AND Asistencias.estado = 'ENTRADA'
GO
/****** Object:  StoredProcedure [dbo].[BuscarCargos]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BuscarCargos]
@Buscador varchar(50)
AS
SELECT id_cargo, Cargo, SueldoPorHora AS [Sueldo Por Hora] FROM Cargo WHERE Cargo LIKE '%' + @Buscador + '%'
GO
/****** Object:  StoredProcedure [dbo].[BuscarPersonal]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BuscarPersonal]
	@Buscador varchar(50)
AS
SET Nocount ON;
SELECT
	id_personal,
	Nombres,
	Identificación,
	SueldoPorHora,
	Cargo,
	id_cargo,
	Estado,
	codigo,
	País
FROM
	(SELECT
		id_personal,
		Nombres,
		Identificación,
		Personal.SueldoPorHora,
		Cargo.Cargo,
		Personal.id_cargo,
		Estado,
		codigo,
		País
	FROM
		Personal
	INNER JOIN Cargo ON Cargo.id_cargo = Personal.id_cargo) AS Paginado
WHERE
	-- STR(). Convierte un tipo Numeric a varchar, de no hacerlo, marcará un error.
	(Nombres + Identificación + STR(SueldoPorHora) + Cargo + Estado + País LIKE '%' + @Buscador + '%')
GO
/****** Object:  StoredProcedure [dbo].[BuscarPersonalIdentidad]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BuscarPersonalIdentidad]
	@Buscador varchar(50)
AS
SELECT * FROM Personal WHERE Identificación = @Buscador
GO
/****** Object:  StoredProcedure [dbo].[ConfirmarSalida]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ConfirmarSalida]
	@id_personal INT,
	@fecha_salida DATETIME,
	@horas NUMERIC(18,2)
AS
UPDATE Asistencias SET
	fecha_salida = @fecha_salida,
	horas = @horas,
	estado = 'SALIDA'
WHERE id_personal = @id_personal AND estado = 'ENTRADA'
GO
/****** Object:  StoredProcedure [dbo].[EditarCargo]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditarCargo]
@id int,
@Cargo varchar(max),
@Sueldo numeric(18,2)
AS
IF EXISTS (SELECT Cargo FROM Cargo WHERE Cargo=@Cargo AND id_cargo<>@id)
	RAISERROR('YA EXISTE UN CARGO CON ESTE NOMBRE. INGRESE DE NUEVO', 16, 1)
ELSE
	UPDATE Cargo SET Cargo=@Cargo, SueldoPorHora=@Sueldo WHERE id_cargo=@id
GO
/****** Object:  StoredProcedure [dbo].[EditarPersonal]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditarPersonal]
@id_personal int,
@Nombres varchar(max),
@Identificación varchar(max),
@País varchar(max),
@id_cargo varchar(max),
@SueldoPorHora numeric(18,2)
AS
IF EXISTS(SELECT Identificación FROM Personal WHERE Identificación = @Identificación AND id_personal <> @id_personal)
	Raiserror('Ya existe un registro con esta identificación', 16, 1)
ELSE
	UPDATE Personal SET
		Nombres = @Nombres,
		Identificación = @Identificación,
		País = @País,
		id_cargo = @id_cargo,
		SueldoPorHora = @SueldoPorHora
	WHERE id_personal = @id_personal
GO
/****** Object:  StoredProcedure [dbo].[EditarUsuarios]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditarUsuarios]
	@Id INT,
	@Nombres VARCHAR(50),
	@Usuario VARCHAR(50),
	@Password VARCHAR(50),
	@Icono IMAGE,
	@Estado VARCHAR(50)
AS
UPDATE Usuarios SET
		NombresApellidos = @Nombres,
		Login = @Usuario,
		Password = @Password,
		Icono = @Icono,
		Estado = @Estado
WHERE IdUsuario = @Id
GO
/****** Object:  StoredProcedure [dbo].[EliminarPermisos]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EliminarPermisos]
	@IdUsuario INT
AS
DELETE FROM Permisos WHERE idUsuario = @IdUsuario
GO
/****** Object:  StoredProcedure [dbo].[EliminarPersonal]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EliminarPersonal]
	@id_personal int
AS
UPDATE Personal SET Estado = 'ELIMINADO'
WHERE id_personal = @id_personal
GO
/****** Object:  StoredProcedure [dbo].[InsertarAsistencias]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertarAsistencias]
	@id_personal INT,
	@fecha_entrada DATETIME,
	@fecha_salida DATETIME,
	@estado VARCHAR(50),
	@horas NUMERIC(18,2),
	@observación VARCHAR(MAX)
AS
INSERT INTO Asistencias VALUES(
	@id_personal,
	@fecha_entrada,
	@fecha_salida,
	@estado,
	@horas,
	@observación
)
GO
/****** Object:  StoredProcedure [dbo].[InsertarCargo]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertarCargo]
@Cargo varchar(max),
@SueldoPorHora numeric(18,2)
AS
IF EXISTS(SELECT Cargo FROM Cargo WHERE Cargo=@Cargo)
	RAISERROR('YA EXISTE UN CARGO CON ESTE NOMBRE. INGRESE DE NUEVO', 16, 1)
ELSE
	INSERT INTO Cargo VALUES(@Cargo, @SueldoPorHora)
GO
/****** Object:  StoredProcedure [dbo].[InsertarPermisos]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertarPermisos]
	@IdModulo INT,
	@IdUsuario INT
AS
INSERT INTO Permisos VALUES( @IdModulo, @IdUsuario)
GO
/****** Object:  StoredProcedure [dbo].[InsertarPersonal]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertarPersonal]
	@Nombres varchar(max),
	@Identificación varchar(max),
	@País varchar(max),
	@id_cargo int,
	@SueldoPorHora numeric(18,2)
AS

DECLARE @Estado varchar(max)
DECLARE @codigo varchar(max)
DECLARE @id_personal int

SET @Estado = 'ACTIVO'
SET @codigo = '-'

IF EXISTS (SELECT Identificación FROM Personal WHERE Identificación = @Identificación)
	Raiserror('Ya existe un registro con esta identificación', 16, 1)
ELSE
	INSERT INTO Personal VALUES(
		@Nombres,
		@Identificación,
		@País,
		@id_cargo,
		@SueldoPorHora,
		@Estado,
		@codigo )
	-- SCOPE_IDENTITY(). Devuelve el último ID creado en la misma conexión y el mismo contexto. En este caso el contexto se refiere a la consulta o procedimiento almacenado actual.
	-- https://www.campusmvp.es/recursos/post/sql-server-cuales-son-las-diferencias-entre-at-at-identity-y-scope-identity.aspx#:~:text=Scope_identity()%20%3A%20la%20que%20recomendamos,que%20haya%20en%20ese%20momento)
	SELECT @id_personal = SCOPE_IDENTITY()
	UPDATE Personal SET codigo = @id_personal WHERE id_personal = @id_personal
GO
/****** Object:  StoredProcedure [dbo].[InsertarUsuario]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertarUsuario]
	@Nombres VARCHAR(50),
	@Login VARCHAR(50),
	@Password VARCHAR(50),
	@Icono IMAGE,
	@Estado VARCHAR(50)
AS
IF EXISTS(SELECT Login FROM Usuarios WHERE Login = @Login)
	RAISERROR('YA EXISTE UN REGISTRO CON ESE USUARIO, POR FAVOR, INGRESE DE NUEVO', 16, 1)
ELSE
	INSERT INTO Usuarios VALUES(
		@Nombres,
		@Login,
		@Password,
		@Icono,
		@Estado)
GO
/****** Object:  StoredProcedure [dbo].[MostrarPermisos]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MostrarPermisos]
	@IdUsuario INT
AS
SELECT idModulo FROM Permisos WHERE idUsuario = @IdUsuario
GO
/****** Object:  StoredProcedure [dbo].[MostrarPersonal]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MostrarPersonal]
	@Desde int,
	@Hasta int
AS
SET Nocount ON;
SELECT
	id_personal,
	Nombres,
	Identificación,
	SueldoPorHora,
	Cargo,
	id_cargo,
	Estado,
	codigo,
	País
FROM
	(SELECT
		id_personal,
		Nombres,
		Identificación,
		Personal.SueldoPorHora,
		Cargo.Cargo,
		Personal.id_cargo,
		Estado,
		codigo,
		País,
		-- ROW_NUMBER(). Agrega e incluye un número incremental único a la cuadrícula de resultados. El orden de las filas está determinado por la expresión ORDER_BY. Crea un valor integral cada vez mayor y que siempre comienza en 1 y las filas posteriores obtienen el siguiente valor incremental más alto.
		-- OVER(). Esta cláusula define la ventana o el conjunto de filas en las que opera la función de ventana. ORDER BY() de esta cláusula se utiliza cuando las filas deben alinearse de cierta manera para que la función funcione.
		-- https://www.sqlshack.com/es/descripcion-general-de-la-funcion-sql-row_number/
		ROW_NUMBER() Over(ORDER BY id_personal) 'Numero_de_fila'
	FROM
		Personal
	INNER JOIN Cargo ON Cargo.id_cargo = Personal.id_cargo
) AS Paginado
WHERE
	(Paginado.Numero_de_fila >= @Desde)
	AND
	(Paginado.Numero_de_fila <= @Hasta)
GO
/****** Object:  StoredProcedure [dbo].[ObtenerIdUsuario]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ObtenerIdUsuario]
	@Login VARCHAR(50)
AS
SELECT IdUsuario FROM Usuarios WHERE Login = @Login
GO
/****** Object:  StoredProcedure [dbo].[RestaurarPersonal]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RestaurarPersonal]
	@id_personal int
AS
	UPDATE
		Personal SET Estado = 'ACTIVO'
	WHERE
		id_personal = @id_personal
GO
/****** Object:  StoredProcedure [dbo].[ValidarUsuario]    Script Date: 14/11/2021 11:30:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ValidarUsuario]
	@passwrd VARCHAR(50),
	@login VARCHAR(50)
AS
	SELECT * FROM Usuarios WHERE Password = @passwrd AND Login = @login and Estado = 'ACTIVO'
GO
USE [master]
GO
ALTER DATABASE [ORUS369] SET  READ_WRITE 
GO
