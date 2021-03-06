-- MySQL Script generated by MySQL Workbench
-- Fri Mar 27 14:29:50 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tienda_de_carros
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tienda_de_carros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tienda_de_carros` DEFAULT CHARACTER SET utf8 ;
USE `tienda_de_carros` ;

-- -----------------------------------------------------
-- Table `tienda_de_carros`.`carros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tienda_de_carros`.`carros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregaryeditarcarros` (IN `_id` INT, IN `_marca` VARCHAR(45), IN `_modelo` VARCHAR(45), IN `_color` VARCHAR(45))  BEGIN
	IF _id = 0 THEN
		INSERT INTO carros(marca,modelo,color)
		VALUES (_marca, _modelo, _color);
		SET _id= LAST_INSERT_ID();
    ELSE
		UPDATE carros
        SET
			marca = _marca,
            modelo = _modelo,
            color = _color
			WHERE id = _id;
   END IF;
   
   SELECT _id AS id;
END$$

DELIMITER ;

-- --------------------------------------------------------


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
