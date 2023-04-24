CREATE SCHEMA IF NOT EXISTS `InventarioGeneral3` DEFAULT CHARACTER SET utf8 ;
USE `InventarioGeneral3` ;
CREATE TABLE IF NOT EXISTS tbl_Marcas (
	marCodigo integer,
	marNombre VARCHAR(60),
	marExistencias integer,
    marPrecios double,
	PRIMARY KEY (marCodigo) )
ENGINE = InnoDB CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS tbl_Lineas (
	linCodigo integer,
	linNombre VARCHAR(60),
    linPrecios double,
	PRIMARY KEY (linCodigo) )
ENGINE = InnoDB CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS tbl_Productos (
	proCodigo integer,
	linCodigo integer,
    marCodigo integer,
	proNombre VARCHAR(60),
    proPrecios double,
    proEstatus VARCHAR(60),
	PRIMARY KEY (proCodigo),
    foreign key (linCodigo) REFERENCES tbl_Lineas (linCodigo),
    foreign key (marCodigo) REFERENCES tbl_Marcas (marCodigo))
ENGINE = InnoDB CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS tbl_Bodegas (
	bodCodigo integer,
    marCodigo integer,
    linCodigo integer,
	bodNombre VARCHAR(60),
	bodExistencias integer,
    bodProductoDefectuoso integer,
    bodFechaIngreso integer,
    bodFechaSalida integer,
	PRIMARY KEY (bodCodigo),
    foreign key (marCodigo) REFERENCES tbl_Marcas (marCodigo),
    foreign key (linCodigo) references tbl_Lineas (linCodigo))
ENGINE = InnoDB CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS tbl_Existencias (
	exiCodigo integer,
    proCodigo integer,
    bodCodigo integer,
    exiNombre varchar(60),
    exiEstatus varchar(60),
    primary key (exiCodiGo),
    foreign key (proCodigo) REFERENCES tbl_Productos (proCodigo),
    foreign key (bodCodigo) REFERENCES tbl_Bodegas (bodCodigo))
ENGINE = InnoDB CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS tbl_Movimientos (
	movCodigo integer,
    bodCodigo integer,
	movNombre VARCHAR(60),
    movCantidades integer,
	PRIMARY KEY (movCodigo),
    foreign key (bodCodigo) REFERENCES tbl_Bodegas (bodCodigo))
ENGINE = InnoDB CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS tbl_tipousuario (
	tipuid INT NOT NULL AUTO_INCREMENT,
	tipunombre VARCHAR(60) NOT NULL,
	tipuestatus VARCHAR(60) NOT NULL,
	PRIMARY KEY (tipuid) )
ENGINE = InnoDB CHARACTER SET = latin1;

CREATE TABLE IF NOT EXISTS tbl_usuario (
	usuid INT NOT NULL AUTO_INCREMENT,
	usunombre VARCHAR(45) NOT NULL,
	usucontrasena VARCHAR(25) NOT NULL,
	usuultimasesion DATE,
	usuestatus VARCHAR(1) NOT NULL,
	usunombrereal VARCHAR(60),
	usucorreoe VARCHAR(60),
	usutelefono VARCHAR(25),
	usudireccion VARCHAR(80),
    tipuid INT NOT NULL,
	PRIMARY KEY (usuid),
    FOREIGN KEY (tipuid) REFERENCES tbl_tipousuario (tipuid)
    )
ENGINE = InnoDB CHARACTER SET = latin1;