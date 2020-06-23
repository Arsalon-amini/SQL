-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema flight_service
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema flight_service
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `flight_service` DEFAULT CHARACTER SET utf8 ;
USE `flight_service` ;

-- -----------------------------------------------------
-- Table `flight_service`.`Flight_Class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flight_service`.`Flight_Class` (
  `flight_class_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`flight_class_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flight_service`.`Passenger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flight_service`.`Passenger` (
  `passenger_id` INT NOT NULL,
  `first_Name` VARCHAR(50) NOT NULL,
  `last_Name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`passenger_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flight_service`.`Airport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flight_service`.`Airport` (
  `airport_id` INT NOT NULL,
  `IATA_code` VARCHAR(255) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`airport_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flight_service`.`Airline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flight_service`.`Airline` (
  `airline_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`airline_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flight_service`.`Flight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flight_service`.`Flight` (
  `flight_id` INT NOT NULL,
  `depart_airport_id` INT NOT NULL,
  `arrival_airport_id` INT NOT NULL,
  `airline_id` INT NOT NULL,
  `number` VARCHAR(50) NOT NULL,
  `departure_date` DATETIME NOT NULL,
  `arrival_date` DATETIME NOT NULL,
  `duration_In_Minutes` INT NOT NULL,
  `distance_In_Miles` INT NOT NULL,
  PRIMARY KEY (`flight_id`),
  INDEX `fk_Flight_Airport1_idx` (`depart_airport_id` ASC),
  INDEX `fk_Flight_Airport2_idx` (`arrival_airport_id` ASC),
  INDEX `fk_Flight_Airline1_idx` (`airline_id` ASC),
  CONSTRAINT `fk_Flight_Airport1`
    FOREIGN KEY (`depart_airport_id`)
    REFERENCES `flight_service`.`Airport` (`airport_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flight_Airport2`
    FOREIGN KEY (`arrival_airport_id`)
    REFERENCES `flight_service`.`Airport` (`airport_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Flight_Airline1`
    FOREIGN KEY (`airline_id`)
    REFERENCES `flight_service`.`Airline` (`airline_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `flight_service`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `flight_service`.`Ticket` (
  `ticket_id` INT NOT NULL,
  `flight_class_id` INT NOT NULL,
  `passenger_id` INT NOT NULL,
  `flight_id` INT NOT NULL,
  `ticket_Number` VARCHAR(255) NOT NULL,
  `price` FLOAT NOT NULL,
  `confirmation_Number` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ticket_id`),
  INDEX `fk_Ticket_Flight_Class_idx` (`flight_class_id` ASC),
  INDEX `fk_Ticket_Passenger1_idx` (`passenger_id` ASC),
  INDEX `fk_Ticket_Flight1_idx` (`flight_id` ASC),
  CONSTRAINT `fk_Ticket_Flight_Class`
    FOREIGN KEY (`flight_class_id`)
    REFERENCES `flight_service`.`Flight_Class` (`flight_class_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ticket_Passenger1`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `flight_service`.`Passenger` (`passenger_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ticket_Flight1`
    FOREIGN KEY (`flight_id`)
    REFERENCES `flight_service`.`Flight` (`flight_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
