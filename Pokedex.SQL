/*
Created: 14/9/2022
Modified: 14/9/2022
Model: Microsoft SQL Server 2019
Database: MS SQL Server 2019
*/


-- Create tables section -------------------------------------------------

-- Table Pokemon

CREATE TABLE [Pokemon]
(
 [n_pokedex] Int IDENTITY(1,1) NOT NULL,
 [pk_nombre] Varchar(20) NOT NULL,
 [pk_altura] Float NOT NULL,
 [pk_peso] Float NOT NULL,
 [pk_descripcion] Varchar(100) NOT NULL,
 [pk_foto] Image NOT NULL,
 [pk_genero] Varchar(10) NOT NULL
)
go

-- Add keys for table Pokemon

ALTER TABLE [Pokemon] ADD CONSTRAINT [PK_Pokemon] PRIMARY KEY ([n_pokedex])
go

ALTER TABLE [Pokemon] ADD CONSTRAINT [pk_nombre] UNIQUE ([pk_nombre])
go

-- Table Tipo

CREATE TABLE [Tipo]
(
 [ti_id] Int IDENTITY(1,1) NOT NULL,
 [ti_nombre] Varchar(20) NOT NULL
)
go

-- Add keys for table Tipo

ALTER TABLE [Tipo] ADD CONSTRAINT [PK_Tipo] PRIMARY KEY ([ti_id])
go

-- Table Tipo_pokemon

CREATE TABLE [Tipo_pokemon]
(
 [n_pokedex] Int NOT NULL,
 [ti_id] Int NOT NULL
)
go

-- Add keys for table Tipo_pokemon

ALTER TABLE [Tipo_pokemon] ADD CONSTRAINT [PK_Tipo_pokemon] PRIMARY KEY ([n_pokedex],[ti_id])
go

-- Table Habilidades

CREATE TABLE [Habilidades]
(
 [ha_id] Int IDENTITY(1,1) NOT NULL,
 [ha_nombre] Varchar(20) NOT NULL
)
go

-- Add keys for table Habilidades

ALTER TABLE [Habilidades] ADD CONSTRAINT [PK_Habilidades] PRIMARY KEY ([ha_id])
go

-- Table Habilidades_pokemon

CREATE TABLE [Habilidades_pokemon]
(
 [n_pokedex] Int NOT NULL,
 [ha_id] Int NOT NULL
)
go

-- Add keys for table Habilidades_pokemon

ALTER TABLE [Habilidades_pokemon] ADD CONSTRAINT [PK_Habilidades_pokemon] PRIMARY KEY ([n_pokedex],[ha_id])
go

-- Table Categorias

CREATE TABLE [Categorias]
(
 [ca_id] Int IDENTITY(1,1) NOT NULL,
 [ca_nombre] Varchar(20) NOT NULL
)
go

-- Add keys for table Categorias

ALTER TABLE [Categorias] ADD CONSTRAINT [PK_Categorias] PRIMARY KEY ([ca_id])
go

-- Table Categorias_pokemon

CREATE TABLE [Categorias_pokemon]
(
 [n_pokedex] Int NOT NULL,
 [ca_id] Int NOT NULL
)
go

-- Add keys for table Categorias_pokemon

ALTER TABLE [Categorias_pokemon] ADD CONSTRAINT [PK_Categorias_pokemon] PRIMARY KEY ([n_pokedex],[ca_id])
go

-- Table Entrenador

CREATE TABLE [Entrenador]
(
 [en_id] Int IDENTITY(1,1) NOT NULL,
 [en_usuario] Varchar(20) NOT NULL,
 [en_clave] Varchar(10) NOT NULL,
 [en_nombre] Varchar(50) NOT NULL,
 [en_edad] Int NOT NULL,
 [en_genero] Varchar(10) NOT NULL
)
go

-- Add keys for table Entrenador

ALTER TABLE [Entrenador] ADD CONSTRAINT [PK_Entrenador] PRIMARY KEY ([en_id])
go

ALTER TABLE [Entrenador] ADD CONSTRAINT [en_usuario] UNIQUE  ([en_usuario])
go

-- Table Capturas

CREATE TABLE [Capturas]
(
 [n_pokedex] Int NOT NULL,
 [en_id] Int NOT NULL,
 [fecha] Date NOT NULL
)
go

-- Add keys for table Capturas

ALTER TABLE [Capturas] ADD CONSTRAINT [PK_Capturas] PRIMARY KEY ([n_pokedex],[en_id])
go

-- Table Medallas

CREATE TABLE [Medallas]
(
 [me_id] Int IDENTITY(1,1) NOT NULL,
 [me_nombre] Varchar(20) NOT NULL,
 [me_foto] Image NOT NULL
)
go

-- Add keys for table Medallas

ALTER TABLE [Medallas] ADD CONSTRAINT [PK_Medallas] PRIMARY KEY ([me_id])
go

ALTER TABLE [Medallas] ADD CONSTRAINT [me_nombre] UNIQUE  ([me_nombre])
go

-- Table Entrenador_medallas

CREATE TABLE [Entrenador_medallas]
(
 [en_id] Int NOT NULL,
 [me_id] Int NOT NULL,
 [fecha] Date NOT NULL
)
go

-- Add keys for table Entrenador_medallas

ALTER TABLE [Entrenador_medallas] ADD CONSTRAINT [PK_Entrenador_medallas] PRIMARY KEY ([en_id],[me_id])
go

-- Table Debilidad

CREATE TABLE [Debilidad]
(
 [de_id] Int IDENTITY(1,1) NOT NULL,
 [id_tipo1] Int NOT NULL,
 [id_tipo2] Int NOT NULL
)
go

-- Add keys for table Debilidad

ALTER TABLE [Debilidad] ADD CONSTRAINT [PK_Debilidad] PRIMARY KEY ([de_id])
go

-- Table Evoluciones

CREATE TABLE [Evoluciones]
(
 [ev_id] Int IDENTITY(1,1) NOT NULL,
 [ev_codigos] Varchar(20) NOT NULL
)
go

-- Add keys for table Evoluciones

ALTER TABLE [Evoluciones] ADD CONSTRAINT [PK_Evoluciones] PRIMARY KEY ([ev_id])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Tipo_pokemon] ADD CONSTRAINT [fk_pokemon_tipo] FOREIGN KEY ([n_pokedex]) REFERENCES [Pokemon] ([n_pokedex]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Tipo_pokemon] ADD CONSTRAINT [fk_tipo_pokemon] FOREIGN KEY ([ti_id]) REFERENCES [Tipo] ([ti_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Habilidades_pokemon] ADD CONSTRAINT [fk_pokemon_habilidades] FOREIGN KEY ([n_pokedex]) REFERENCES [Pokemon] ([n_pokedex]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Habilidades_pokemon] ADD CONSTRAINT [fk_habilidades_pokemon] FOREIGN KEY ([ha_id]) REFERENCES [Habilidades] ([ha_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Categorias_pokemon] ADD CONSTRAINT [fk_pokemon_categorias] FOREIGN KEY ([n_pokedex]) REFERENCES [Pokemon] ([n_pokedex]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Categorias_pokemon] ADD CONSTRAINT [fk_categorias_pokemon] FOREIGN KEY ([ca_id]) REFERENCES [Categorias] ([ca_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Capturas] ADD CONSTRAINT [fk_pokemon_capturas] FOREIGN KEY ([n_pokedex]) REFERENCES [Pokemon] ([n_pokedex]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Capturas] ADD CONSTRAINT [fk_entrenador_capturas] FOREIGN KEY ([en_id]) REFERENCES [Entrenador] ([en_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Entrenador_medallas] ADD CONSTRAINT [fk_entrenador_medallas] FOREIGN KEY ([en_id]) REFERENCES [Entrenador] ([en_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Entrenador_medallas] ADD CONSTRAINT [fk_medallas_entrenador] FOREIGN KEY ([me_id]) REFERENCES [Medallas] ([me_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




