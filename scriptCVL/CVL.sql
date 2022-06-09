-- MySQL Script generated by MySQL Workbench
-- Thu Jun  9 23:06:59 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema civilife
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `civilife` ;

-- -----------------------------------------------------
-- Schema civilife
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `civilife` DEFAULT CHARACTER SET utf8 ;
USE `civilife` ;

-- -----------------------------------------------------
-- Table `civilife`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`user` (
  `user_id` INT NOT NULL,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `birthday` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`time` (
  `time_id` INT NOT NULL,
  `time` TIME NOT NULL,
  `time_speed` DECIMAL NOT NULL,
  PRIMARY KEY (`time_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`vehicle` (
  `veh_id` INT NOT NULL,
  `veh_name` VARCHAR(45) NOT NULL,
  `price_per_km` INT NOT NULL,
  `speed_per_km` FLOAT NOT NULL,
  `power` DECIMAL NOT NULL,
  `happy` DECIMAL NOT NULL,
  `time_id` INT NOT NULL,
  PRIMARY KEY (`veh_id`),
  INDEX `fk_VEHICLE_TIME1_idx` (`time_id` ASC) VISIBLE,
  CONSTRAINT `fk_VEHICLE_TIME1`
    FOREIGN KEY (`time_id`)
    REFERENCES `civilife`.`time` (`time_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`restaurant` (
  `res_id` INT NOT NULL,
  `res_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`res_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`conveniencestore`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`conveniencestore` (
  `con_id` INT NOT NULL,
  `product` VARCHAR(45) NOT NULL,
  `price_product` INT NOT NULL,
  `power` DECIMAL NOT NULL,
  `happy` DECIMAL NOT NULL,
  `time_id` INT NOT NULL,
  PRIMARY KEY (`con_id`),
  INDEX `fk_CONVENIENCESTORE_TIME1_idx` (`time_id` ASC) VISIBLE,
  CONSTRAINT `fk_CONVENIENCESTORE_TIME1`
    FOREIGN KEY (`time_id`)
    REFERENCES `civilife`.`time` (`time_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`landmark`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`landmark` (
  `land_id` INT NOT NULL,
  `land_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`land_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`road`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`road` (
  `road_id` INT NOT NULL,
  `road_name` VARCHAR(45) NOT NULL,
  `distance` FLOAT NOT NULL,
  `veh_id` INT NOT NULL,
  PRIMARY KEY (`road_id`),
  INDEX `fk_ROAD_VEHICLE1_idx` (`veh_id` ASC) VISIBLE,
  CONSTRAINT `fk_ROAD_VEHICLE1`
    FOREIGN KEY (`veh_id`)
    REFERENCES `civilife`.`vehicle` (`veh_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`menu` (
  `menu_id` INT NOT NULL,
  `menu_name` VARCHAR(45) NOT NULL,
  `menu_price` INT NOT NULL,
  `power` DECIMAL NOT NULL,
  `happy` DECIMAL NOT NULL,
  `res_id` INT NOT NULL,
  `time_id` INT NOT NULL,
  PRIMARY KEY (`menu_id`),
  INDEX `fk_MENU_RESTAURANT1_idx` (`res_id` ASC) VISIBLE,
  INDEX `fk_MENU_TIME1_idx` (`time_id` ASC) VISIBLE,
  CONSTRAINT `fk_MENU_RESTAURANT1`
    FOREIGN KEY (`res_id`)
    REFERENCES `civilife`.`restaurant` (`res_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MENU_TIME1`
    FOREIGN KEY (`time_id`)
    REFERENCES `civilife`.`time` (`time_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`gamecharacter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`gamecharacter` (
  `cha_id` INT NOT NULL,
  `cha_name` VARCHAR(45) NOT NULL,
  `career` VARCHAR(45) NOT NULL,
  `story` VARCHAR(500) NOT NULL,
  `salary` INT NOT NULL,
  `power_begin` INT NOT NULL,
  `happy_begin` INT NOT NULL,
  `images` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cha_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`eventmenu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`eventmenu` (
  `emenu_id` INT NOT NULL,
  `emenu_name` VARCHAR(45) NOT NULL,
  `emenu_details` VARCHAR(500) NOT NULL,
  `menu_id` INT NOT NULL,
  PRIMARY KEY (`emenu_id`),
  INDEX `fk_EVENTMENU_MENU1_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `fk_EVENTMENU_MENU1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `civilife`.`menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`token` (
  `token_id` INT NOT NULL,
  `token` VARCHAR(45) NOT NULL,
  `created_time` DATETIME NOT NULL,
  `expires_time` DATETIME NOT NULL,
  `confirmed_time` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`token_id`, `confirmed_time`),
  INDEX `fk_TOKEN_USER1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_TOKEN_USER1`
    FOREIGN KEY (`user_id`)
    REFERENCES `civilife`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`player` (
  `player_id` INT NOT NULL,
  `player_name` VARCHAR(45) NOT NULL,
  `money` INT NOT NULL,
  `power` INT NOT NULL,
  `happy` INT NOT NULL,
  `user_id` INT NOT NULL,
  `cha_id` INT NOT NULL,
  PRIMARY KEY (`player_id`),
  INDEX `fk_Player_USER1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_Player_CHARACTER1_idx` (`cha_id` ASC) VISIBLE,
  CONSTRAINT `fk_Player_USER1`
    FOREIGN KEY (`user_id`)
    REFERENCES `civilife`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Player_CHARACTER1`
    FOREIGN KEY (`cha_id`)
    REFERENCES `civilife`.`gamecharacter` (`cha_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`decision`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`decision` (
  `decision_id` INT NOT NULL,
  `menu_id` INT NOT NULL,
  `con_id` INT NOT NULL,
  `veh_id` INT NOT NULL,
  PRIMARY KEY (`decision_id`),
  INDEX `fk_Player_has_MENU_MENU1_idx` (`menu_id` ASC) VISIBLE,
  INDEX `fk_Player_has_MENU_Player1_idx` (`decision_id` ASC) VISIBLE,
  INDEX `fk_Player_has_MENU_CONVENIENCESTORE1_idx` (`con_id` ASC) VISIBLE,
  INDEX `fk_Player_has_MENU_VEHICLE1_idx` (`veh_id` ASC) VISIBLE,
  CONSTRAINT `fk_Player_has_MENU_Player1`
    FOREIGN KEY (`decision_id`)
    REFERENCES `civilife`.`player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Player_has_MENU_MENU1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `civilife`.`menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Player_has_MENU_CONVENIENCESTORE1`
    FOREIGN KEY (`con_id`)
    REFERENCES `civilife`.`conveniencestore` (`con_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Player_has_MENU_VEHICLE1`
    FOREIGN KEY (`veh_id`)
    REFERENCES `civilife`.`vehicle` (`veh_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`eventconvenience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`eventconvenience` (
  `econ_id` INT NOT NULL,
  `econ_name` VARCHAR(45) NOT NULL,
  `econ_details` VARCHAR(500) NOT NULL,
  `con_id` INT NOT NULL,
  PRIMARY KEY (`econ_id`),
  INDEX `fk_EVENTCONVENIENCE_CONVENIENCESTORE1_idx` (`con_id` ASC) VISIBLE,
  CONSTRAINT `fk_EVENTCONVENIENCE_CONVENIENCESTORE1`
    FOREIGN KEY (`con_id`)
    REFERENCES `civilife`.`conveniencestore` (`con_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`eventvehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`eventvehicle` (
  `eveh_id` INT NOT NULL,
  `eveh_name` VARCHAR(45) NOT NULL,
  `eveh_details` VARCHAR(500) NOT NULL,
  `veh_id` INT NOT NULL,
  PRIMARY KEY (`eveh_id`),
  INDEX `fk_EVENTVEHICLE_VEHICLE1_idx` (`veh_id` ASC) VISIBLE,
  CONSTRAINT `fk_EVENTVEHICLE_VEHICLE1`
    FOREIGN KEY (`veh_id`)
    REFERENCES `civilife`.`vehicle` (`veh_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
