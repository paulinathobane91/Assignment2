-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`course` ;

CREATE TABLE IF NOT EXISTS `mydb`.`course` (
  `course_id` INT(11) NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(45) NOT NULL,
  `course_duration` VARCHAR(10) NOT NULL,
  `course_cost` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`teachers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`teachers` ;

CREATE TABLE IF NOT EXISTS `mydb`.`teachers` (
  `teacher_id` INT(11) NOT NULL AUTO_INCREMENT,
  `course_id` INT(11) NOT NULL,
  `teacher_name` VARCHAR(45) NOT NULL,
  `teacher_lastname` VARCHAR(45) NOT NULL,
  `teacher_address` TEXT NOT NULL,
  PRIMARY KEY (`teacher_id`),
  INDEX `course_id_idx` (`course_id` ASC),
  CONSTRAINT `course_ids`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`students` ;

CREATE TABLE IF NOT EXISTS `mydb`.`students` (
  `stud_id` INT(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` INT(11) NOT NULL,
  `stud_name` VARCHAR(45) NOT NULL,
  `stud_lastname` VARCHAR(45) NOT NULL,
  `stud_address` TEXT NOT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`stud_id`),
  INDEX `teacher_id_idx` (`teacher_id` ASC),
  INDEX `course_id_idx` (`course_id` ASC),
  CONSTRAINT `teacher_ids`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `mydb`.`teachers` (`teacher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `course_idm`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `mydb`.`enrollment` (
  `enroll_id` INT NOT NULL AUTO_INCREMENT,
  `stud_id` INT NOT NULL,
  `teacher_id` INT NOT NULL,
  `exam_marks` INT NOT NULL,
  PRIMARY KEY (`enroll_id`),
  INDEX `stud_id_idx` (`stud_id` ASC),
  INDEX `teacher_id_idx` (`teacher_id` ASC),
  CONSTRAINT `stud_idt`
    FOREIGN KEY (`stud_id`)
    REFERENCES `mydb`.`students` (`stud_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `teacher_idd`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `mydb`.`teachers` (`teacher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
