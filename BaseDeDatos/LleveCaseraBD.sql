-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lleve_casera
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lleve_casera
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lleve_casera` DEFAULT CHARACTER SET utf8 ;
USE `lleve_casera` ;

-- -----------------------------------------------------
-- Table `lleve_casera`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lleve_casera`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `dni_cliente` VARCHAR(8) NOT NULL,
  `nombre_cliente` VARCHAR(255) NOT NULL,
  `celular_cliente` VARCHAR(9) NOT NULL,
  `estado_cliente` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `dni_cliente_UNIQUE` (`dni_cliente` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lleve_casera`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lleve_casera`.`producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(255) NOT NULL,
  `precio_producto` DOUBLE NOT NULL,
  `stock_producto` INT NOT NULL,
  `estado_producto` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE INDEX `nombre_producto_UNIQUE` (`nombre_producto` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lleve_casera`.`vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lleve_casera`.`vendedor` (
  `id_vendedor` INT NOT NULL AUTO_INCREMENT,
  `dni_vendedor` VARCHAR(8) NOT NULL,
  `nombre_vendedor` VARCHAR(255) NOT NULL,
  `celular_vendedor` VARCHAR(9) NOT NULL,
  `estado_vendedor` VARCHAR(1) NOT NULL,
  `user_vendedor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_vendedor`),
  UNIQUE INDEX `dni_vendedor_UNIQUE` (`dni_vendedor` ASC) VISIBLE,
  UNIQUE INDEX `user_vendedor_UNIQUE` (`user_vendedor` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lleve_casera`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lleve_casera`.`venta` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `fecha_venta` DATE NOT NULL,
  `total_venta` DOUBLE NOT NULL,
  `estado_venta` VARCHAR(1) NOT NULL,
  `cliente_id_cliente` INT NOT NULL,
  `vendedor_id_vendedor` INT NOT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `fk_ventas_cliente_idx` (`cliente_id_cliente` ASC) VISIBLE,
  INDEX `fk_ventas_vendedor1_idx` (`vendedor_id_vendedor` ASC) VISIBLE,
  CONSTRAINT `fk_ventas_cliente`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `lleve_casera`.`cliente` (`id_cliente`),
  CONSTRAINT `fk_ventas_vendedor1`
    FOREIGN KEY (`vendedor_id_vendedor`)
    REFERENCES `lleve_casera`.`vendedor` (`id_vendedor`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lleve_casera`.`detalle_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lleve_casera`.`detalle_venta` (
  `id_detalle_venta` INT NOT NULL AUTO_INCREMENT,
  `cantidad_venta` INT NOT NULL,
  `subtotal_venta` DOUBLE NOT NULL,
  `venta_id_venta` INT NOT NULL,
  `producto_id_producto` INT NOT NULL,
  PRIMARY KEY (`id_detalle_venta`),
  INDEX `fk_detalle_venta_venta1_idx` (`venta_id_venta` ASC) VISIBLE,
  INDEX `fk_detalle_venta_producto1_idx` (`producto_id_producto` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_venta_producto1`
    FOREIGN KEY (`producto_id_producto`)
    REFERENCES `lleve_casera`.`producto` (`id_producto`),
  CONSTRAINT `fk_detalle_venta_venta1`
    FOREIGN KEY (`venta_id_venta`)
    REFERENCES `lleve_casera`.`venta` (`id_venta`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
