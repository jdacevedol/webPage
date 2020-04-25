-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`TipoUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoUsuario` (
  `idTipoU` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipoU` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idTipoU`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `username` VARCHAR(200) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  `fechaUAct` DATE NOT NULL,
  `TipoUsuario_idTipoU` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE,
  INDEX `fk_Usuario_TipoUsuario_idx` (`TipoUsuario_idTipoU` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_TipoUsuario`
    FOREIGN KEY (`TipoUsuario_idTipoU`)
    REFERENCES `mydb`.`TipoUsuario` (`idTipoU`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `nombresU` VARCHAR(50) NOT NULL,
  `apellidosU` VARCHAR(60) NOT NULL,
  `celular` VARCHAR(20) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `Usuario_username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`Usuario_username`),
  CONSTRAINT `fk_Administrador_Usuario1`
    FOREIGN KEY (`Usuario_username`)
    REFERENCES `mydb`.`Usuario` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor` (
  `nombresU` VARCHAR(50) NOT NULL,
  `apellidosU` VARCHAR(60) NOT NULL,
  `celular` VARCHAR(20) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `Usuario_username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`Usuario_username`),
  CONSTRAINT `fk_Vendedor_Usuario1`
    FOREIGN KEY (`Usuario_username`)
    REFERENCES `mydb`.`Usuario` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paises` (
  `idPais` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombrePais` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ciudades` (
  `idCiudad` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombreCiudad` VARCHAR(500) NOT NULL,
  `Paises_idPais` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCiudad`),
  INDEX `fk_Ciudades_Paises1_idx` (`Paises_idPais` ASC) VISIBLE,
  CONSTRAINT `fk_Ciudades_Paises1`
    FOREIGN KEY (`Paises_idPais`)
    REFERENCES `mydb`.`Paises` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Direccion` (
  `idDireccion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(200) NOT NULL,
  `barrio` VARCHAR(100) NOT NULL,
  `codigoPostal` INT NULL,
  `Ciudades_idCiudad` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idDireccion`),
  INDEX `fk_Direccion_Ciudades1_idx` (`Ciudades_idCiudad` ASC) VISIBLE,
  CONSTRAINT `fk_Direccion_Ciudades1`
    FOREIGN KEY (`Ciudades_idCiudad`)
    REFERENCES `mydb`.`Ciudades` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `nombresU` VARCHAR(50) NOT NULL,
  `apellidosU` VARCHAR(60) NOT NULL,
  `celular` VARCHAR(20) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `documentoId` VARCHAR(50) NOT NULL,
  `Usuario_username` VARCHAR(200) NOT NULL,
  `Direccion_idDireccion` INT UNSIGNED NOT NULL,
  UNIQUE INDEX `documentoId_UNIQUE` (`documentoId` ASC) VISIBLE,
  PRIMARY KEY (`Usuario_username`),
  INDEX `fk_Cliente_Direccion1_idx` (`Direccion_idDireccion` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Usuario1`
    FOREIGN KEY (`Usuario_username`)
    REFERENCES `mydb`.`Usuario` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Direccion1`
    FOREIGN KEY (`Direccion_idDireccion`)
    REFERENCES `mydb`.`Direccion` (`idDireccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Compras` (
  `idCompras` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fechaC` DATE NOT NULL,
  `Cliente_Usuario_username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idCompras`),
  INDEX `fk_Compras_Cliente1_idx` (`Cliente_Usuario_username` ASC) VISIBLE,
  CONSTRAINT `fk_Compras_Cliente1`
    FOREIGN KEY (`Cliente_Usuario_username`)
    REFERENCES `mydb`.`Cliente` (`Usuario_username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Productos` (
  `idProductos` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `precioP` INT NOT NULL,
  `nombreP` VARCHAR(100) NOT NULL,
  `stock` INT NOT NULL,
  `categoria` VARCHAR(100) NULL,
  `Vendedor_Usuario_username` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idProductos`, `Vendedor_Usuario_username`),
  INDEX `fk_Productos_Vendedor1_idx` (`Vendedor_Usuario_username` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_Vendedor1`
    FOREIGN KEY (`Vendedor_Usuario_username`)
    REFERENCES `mydb`.`Vendedor` (`Usuario_username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DetalleCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DetalleCompra` (
  `Compras_idCompras` INT UNSIGNED NOT NULL,
  `Productos_idProductos` INT UNSIGNED NOT NULL,
  `cantidadP` INT NOT NULL,
  `valor` VARCHAR(45) GENERATED ALWAYS AS (Productos.precioP*cantidadP) VIRTUAL,
  PRIMARY KEY (`Compras_idCompras`, `Productos_idProductos`),
  INDEX `fk_Compras_has_Productos_Productos1_idx` (`Productos_idProductos` ASC) VISIBLE,
  INDEX `fk_Compras_has_Productos_Compras1_idx` (`Compras_idCompras` ASC) VISIBLE,
  CONSTRAINT `fk_Compras_has_Productos_Compras1`
    FOREIGN KEY (`Compras_idCompras`)
    REFERENCES `mydb`.`Compras` (`idCompras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compras_has_Productos_Productos1`
    FOREIGN KEY (`Productos_idProductos`)
    REFERENCES `mydb`.`Productos` (`idProductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
