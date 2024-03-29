-- MySQL Script generated by MySQL Workbench
-- Sun Sep 11 00:46:16 2022
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
  `point` INT NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`travel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`travel` (
  `travel_id` INT NOT NULL,
  `travel_name` VARCHAR(45) NOT NULL,
  `travel_price` INT NOT NULL,
  `travel_energy` INT NOT NULL,
  `travel_happy` INT NOT NULL,
  `travel_time` INT NOT NULL,
  `travel_vehicle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`travel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`conveniencestore`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`conveniencestore` (
  `goods_id` INT NOT NULL,
  `goods_name` VARCHAR(45) NOT NULL,
  `goods_price` INT NOT NULL,
  `goods_energy` INT NOT NULL,
  `goods_happy` INT NOT NULL,
  PRIMARY KEY (`goods_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`restaurant` (
  `menu_id` INT NOT NULL,
  `menu_name` VARCHAR(45) NOT NULL,
  `menu_price` INT NOT NULL,
  `menu_energy` INT NOT NULL,
  `menu_happy` INT NOT NULL,
  `menu_time` INT NOT NULL,
  `menu_image` VARCHAR(45) NOT NULL,
  `pay_catergory` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`menu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`player` (
  `player_id` INT NOT NULL,
  `player_name` VARCHAR(45) NOT NULL,
  `status_money` INT NOT NULL,
  `status_energy` INT NOT NULL,
  `status_happy` INT NOT NULL,
  `bank_money` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`player_id`),
  INDEX `fk_Player_USER1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Player_USER1`
    FOREIGN KEY (`user_id`)
    REFERENCES `civilife`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`characters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`characters` (
  `char_id` INT NOT NULL,
  `char_name` VARCHAR(45) NOT NULL,
  `char_energy` INT NOT NULL,
  `char_happy` INT NOT NULL,
  `char_images` VARCHAR(45) NOT NULL,
  `player_id` INT NOT NULL,
  PRIMARY KEY (`char_id`, `player_id`),
  INDEX `fk_character_player1_idx` (`player_id` ASC) VISIBLE,
  CONSTRAINT `fk_character_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `civilife`.`player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`restaurantEvents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`restaurantEvents` (
  `event_id` INT NOT NULL,
  `event_name` VARCHAR(45) NOT NULL,
  `event_description` VARCHAR(500) NOT NULL,
  `menu_id` INT NOT NULL,
  PRIMARY KEY (`event_id`),
  INDEX `fk_EVENTMENU_MENU1_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `fk_EVENTMENU_MENU1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `civilife`.`restaurant` (`menu_id`)
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
-- Table `civilife`.`missions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`missions` (
  `mission_id` INT NOT NULL,
  `mission_name` VARCHAR(45) NOT NULL,
  `mission_description` VARCHAR(200) NOT NULL,
  `mission_point` INT NOT NULL,
  PRIMARY KEY (`mission_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`supermarket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`supermarket` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(45) NOT NULL,
  `product_price` INT NOT NULL,
  `product_energy` INT NOT NULL,
  `product_happy` INT NOT NULL,
  `product_time` INT NOT NULL,
  `product_image` VARCHAR(45) NOT NULL,
  `pay_catergory` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`careers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`careers` (
  `career_id` INT NOT NULL,
  `career_name` VARCHAR(45) NOT NULL,
  `career_salary` INT NOT NULL,
  `char_id` INT NOT NULL,
  PRIMARY KEY (`career_id`, `char_id`),
  INDEX `fk_careers_characters1_idx` (`char_id` ASC) VISIBLE,
  CONSTRAINT `fk_careers_characters1`
    FOREIGN KEY (`char_id`)
    REFERENCES `civilife`.`characters` (`char_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`office`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`office` (
  `work_id` INT NOT NULL,
  `work_name` VARCHAR(45) NOT NULL,
  `work_price` VARCHAR(45) NOT NULL,
  `work_energy` VARCHAR(45) NOT NULL,
  `work_happy` VARCHAR(45) NOT NULL,
  `work_time` VARCHAR(45) NOT NULL,
  `work_image` VARCHAR(45) NOT NULL,
  `pay_catergory` VARCHAR(45) NOT NULL,
  `careers_career_id` INT NOT NULL,
  `careers_char_id` INT NOT NULL,
  PRIMARY KEY (`work_id`, `careers_career_id`, `careers_char_id`),
  INDEX `fk_office_careers1_idx` (`careers_career_id` ASC, `careers_char_id` ASC) VISIBLE,
  CONSTRAINT `fk_office_careers1`
    FOREIGN KEY (`careers_career_id` , `careers_char_id`)
    REFERENCES `civilife`.`careers` (`career_id` , `char_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`activities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`activities` (
  `activity_id` INT NOT NULL,
  `activity_name` VARCHAR(45) NOT NULL,
  `activity_price` VARCHAR(45) NOT NULL,
  `activity_energy` VARCHAR(45) NOT NULL,
  `activity_happy` VARCHAR(45) NOT NULL,
  `activity_time` VARCHAR(45) NOT NULL,
  `activity_image` VARCHAR(45) NOT NULL,
  `pay_catergory` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`activity_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`todayEvents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`todayEvents` (
  `todayevent_id` INT NOT NULL,
  `todayevent_name` VARCHAR(45) NOT NULL,
  `todayevent_description` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`todayevent_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`playerAction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`playerAction` (
  `action_id` INT NOT NULL,
  `action_name` VARCHAR(45) NOT NULL,
  `number_action` VARCHAR(45) NOT NULL,
  `menu_id` INT NOT NULL,
  `con_id` INT NOT NULL,
  `veh_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `work_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  `todayevent_id` INT NOT NULL,
  `mission_id` INT NULL,
  PRIMARY KEY (`action_id`, `todayevent_id`),
  INDEX `fk_Player_has_MENU_MENU1_idx` (`menu_id` ASC) VISIBLE,
  INDEX `fk_Player_has_MENU_Player1_idx` (`action_id` ASC) VISIBLE,
  INDEX `fk_Player_has_MENU_CONVENIENCESTORE1_idx` (`con_id` ASC) VISIBLE,
  INDEX `fk_Player_has_MENU_VEHICLE1_idx` (`veh_id` ASC) VISIBLE,
  INDEX `fk_playerAction_missions1_idx` (`mission_id` ASC) VISIBLE,
  INDEX `fk_playerAction_supermarket1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_playerAction_office1_idx` (`work_id` ASC) VISIBLE,
  INDEX `fk_playerAction_activities1_idx` (`activity_id` ASC) VISIBLE,
  INDEX `fk_playerAction_todayEvents1_idx` (`todayevent_id` ASC) VISIBLE,
  CONSTRAINT `fk_Player_has_MENU_Player1`
    FOREIGN KEY (`action_id`)
    REFERENCES `civilife`.`player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Player_has_MENU_MENU1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `civilife`.`restaurant` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Player_has_MENU_CONVENIENCESTORE1`
    FOREIGN KEY (`con_id`)
    REFERENCES `civilife`.`conveniencestore` (`goods_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Player_has_MENU_VEHICLE1`
    FOREIGN KEY (`veh_id`)
    REFERENCES `civilife`.`travel` (`travel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playerAction_missions1`
    FOREIGN KEY (`mission_id`)
    REFERENCES `civilife`.`missions` (`mission_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playerAction_supermarket1`
    FOREIGN KEY (`product_id`)
    REFERENCES `civilife`.`supermarket` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playerAction_office1`
    FOREIGN KEY (`work_id`)
    REFERENCES `civilife`.`office` (`work_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playerAction_activities1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `civilife`.`activities` (`activity_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playerAction_todayEvents1`
    FOREIGN KEY (`todayevent_id`)
    REFERENCES `civilife`.`todayEvents` (`todayevent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`convenienceEvents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`convenienceEvents` (
  `event_id` INT NOT NULL,
  `event_name` VARCHAR(45) NOT NULL,
  ` event_description` VARCHAR(500) NOT NULL,
  `goods_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `goods_id`),
  INDEX `fk_convenienceEvents_conveniencestore1_idx` (`goods_id` ASC) VISIBLE,
  CONSTRAINT `fk_convenienceEvents_conveniencestore1`
    FOREIGN KEY (`goods_id`)
    REFERENCES `civilife`.`conveniencestore` (`goods_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`travelEvents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`travelEvents` (
  `event_id` INT NOT NULL,
  `event_name` VARCHAR(45) NOT NULL,
  `event_description` VARCHAR(500) NOT NULL,
  `travel_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `travel_id`),
  INDEX `fk_travelEvents_travel1_idx` (`travel_id` ASC) VISIBLE,
  CONSTRAINT `fk_travelEvents_travel1`
    FOREIGN KEY (`travel_id`)
    REFERENCES `civilife`.`travel` (`travel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`result`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`result` (
  `result_id` INT NOT NULL,
  `result_name` VARCHAR(45) NOT NULL,
  `result_description` VARCHAR(200) NOT NULL,
  `player_id` INT NOT NULL,
  PRIMARY KEY (`result_id`),
  INDEX `fk_result_player1_idx` (`player_id` ASC) VISIBLE,
  CONSTRAINT `fk_result_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `civilife`.`player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`resultBoard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`resultBoard` (
  `resultboard_id` INT NOT NULL,
  `resultboard_name` VARCHAR(45) NOT NULL,
  `char_name` VARCHAR(45) NOT NULL,
  `play_date` DATE NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `user_id` INT NOT NULL,
  `result_id` INT NOT NULL,
  PRIMARY KEY (`resultboard_id`, `user_id`),
  INDEX `fk_resultBoard_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_resultBoard_result1_idx` (`result_id` ASC) VISIBLE,
  CONSTRAINT `fk_resultBoard_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `civilife`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultBoard_result1`
    FOREIGN KEY (`result_id`)
    REFERENCES `civilife`.`result` (`result_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`goals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`goals` (
  `goal_id` INT NOT NULL,
  `goal_name` VARCHAR(45) NOT NULL,
  `goal_money` INT NOT NULL,
  `char_id` INT NOT NULL,
  PRIMARY KEY (`goal_id`, `char_id`),
  INDEX `fk_goals_characters1_idx` (`char_id` ASC) VISIBLE,
  CONSTRAINT `fk_goals_characters1`
    FOREIGN KEY (`char_id`)
    REFERENCES `civilife`.`characters` (`char_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`supermarketEvents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`supermarketEvents` (
  `event_id` INT NOT NULL,
  `event_name` VARCHAR(45) NOT NULL,
  ` event_description` VARCHAR(500) NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `product_id`),
  INDEX `fk_supermarketEvents_supermarket1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_supermarketEvents_supermarket1`
    FOREIGN KEY (`product_id`)
    REFERENCES `civilife`.`supermarket` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`officeEvents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`officeEvents` (
  `event_id` INT NOT NULL,
  `event_name` VARCHAR(45) NOT NULL,
  ` event_description` VARCHAR(500) NOT NULL,
  `work_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `work_id`),
  INDEX `fk_officeEvents_office1_idx` (`work_id` ASC) VISIBLE,
  CONSTRAINT `fk_officeEvents_office1`
    FOREIGN KEY (`work_id`)
    REFERENCES `civilife`.`office` (`work_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `civilife`.`activityEvents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `civilife`.`activityEvents` (
  `event_id` INT NOT NULL,
  `event_name` VARCHAR(45) NOT NULL,
  ` event_description` VARCHAR(500) NOT NULL,
  `activity_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `activity_id`),
  INDEX `fk_activityEvents_activities1_idx` (`activity_id` ASC) VISIBLE,
  CONSTRAINT `fk_activityEvents_activities1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `civilife`.`activities` (`activity_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
