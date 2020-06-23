-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema vidly
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vidly
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vidly` DEFAULT CHARACTER SET utf8 ;
USE `vidly` ;

-- -----------------------------------------------------
-- Table `vidly`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vidly`.`Role` (
  `role_id` INT NOT NULL,
  `name` VARCHAR(50) NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vidly`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vidly`.`User` (
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  `user_Name` VARCHAR(50) NULL,
  `password` VARCHAR(255) NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_User_Role_idx` (`role_id` ASC),
  CONSTRAINT `fk_User_Role`
    FOREIGN KEY (`role_id`)
    REFERENCES `vidly`.`Role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vidly`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vidly`.`Customer` (
  `customer_id` INT NOT NULL,
  `first_Name` VARCHAR(50) NOT NULL,
  `last_Name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vidly`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vidly`.`Movie` (
  `movie_id` INT NOT NULL,
  `barcode` VARCHAR(255) NOT NULL,
  `daily_Rental_Rate` FLOAT NOT NULL,
  `number_In_Stock` TINYINT(2) NOT NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vidly`.`Coupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vidly`.`Coupon` (
  `coupon_id` INT NOT NULL,
  `code` VARCHAR(50) NULL,
  `description` VARCHAR(50) NULL,
  `discount` VARCHAR(50) NULL,
  PRIMARY KEY (`coupon_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vidly`.`Rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vidly`.`Rental` (
  `rental_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  `coupon_id` INT NOT NULL,
  `rent_Date` DATE NOT NULL,
  `return_Date` DATE NOT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `fk_Rental_Customer1_idx` (`customer_id` ASC),
  INDEX `fk_Rental_Movie1_idx` (`movie_id` ASC),
  INDEX `fk_Rental_Coupon1_idx` (`coupon_id` ASC),
  CONSTRAINT `fk_Rental_Customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `vidly`.`Customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Rental_Movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `vidly`.`Movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Rental_Coupon1`
    FOREIGN KEY (`coupon_id`)
    REFERENCES `vidly`.`Coupon` (`coupon_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
