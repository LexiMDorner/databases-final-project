DROP DATABASE IF EXISTS finalProject;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema finalProject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema finalProject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `finalProject` DEFAULT CHARACTER SET utf8 ;
USE `finalProject` ;

-- -----------------------------------------------------
-- Table `finalProject`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalProject`.`teacher` (
  `teacher_id` INT NOT NULL AUTO_INCREMENT,
  `teacher_name` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finalProject`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalProject`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `student_name` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finalProject`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalProject`.`course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NULL,
  `section` INT NOT NULL,
  PRIMARY KEY (`course_id`, `section`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finalProject`.`teaches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalProject`.`teaches` (
  `teacher_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `section` INT NOT NULL,
  PRIMARY KEY (`teacher_id`, `course_id`, `section`),
  INDEX `course_fk_3_idx` (`course_id` ASC, `section` ASC) VISIBLE,
  CONSTRAINT `teacher_fk_1`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `finalProject`.`teacher` (`teacher_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `course_fk_1`
    FOREIGN KEY (`course_id` , `section`)
    REFERENCES `finalProject`.`course` (`course_id` , `section`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finalProject`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalProject`.`enrollment` (
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `section` INT NOT NULL,
  PRIMARY KEY (`student_id`, `course_id`, `section`),
  INDEX `course_fk_3_idx` (`course_id` ASC, `section` ASC) VISIBLE,
  CONSTRAINT `student_fk_1`
    FOREIGN KEY (`student_id`)
    REFERENCES `finalProject`.`student` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `course_fk_2`
    FOREIGN KEY (`course_id` , `section`)
    REFERENCES `finalProject`.`course` (`course_id` , `section`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finalProject`.`quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalProject`.`quiz` (
  `quiz_id` INT NOT NULL AUTO_INCREMENT,
  `quiz_name` VARCHAR(100) NULL,
  PRIMARY KEY (`quiz_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finalProject`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalProject`.`question` (
  `question_id` INT NOT NULL AUTO_INCREMENT,
  `quiz_id` INT NULL,
  `question_text` VARCHAR(300) NULL,
  PRIMARY KEY (`question_id`),
  INDEX `quiz_fk_1_idx` (`quiz_id` ASC) VISIBLE,
  CONSTRAINT `quiz_fk_2`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `finalProject`.`quiz` (`quiz_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finalProject`.`answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalProject`.`answer` (
  `answer_id` INT NOT NULL AUTO_INCREMENT,
  `question_id` INT NULL,
  `answer_text` VARCHAR(300) NULL,
  `isCorrect` TINYINT NULL,
  PRIMARY KEY (`answer_id`),
  INDEX `question_fk_1_idx` (`question_id` ASC) VISIBLE,
  CONSTRAINT `question_fk_1`
    FOREIGN KEY (`question_id`)
    REFERENCES `finalProject`.`question` (`question_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finalProject`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalProject`.`group` (
  `group_id` INT NOT NULL AUTO_INCREMENT,
  `group_name` VARCHAR(100) NULL,
  `course_id` INT NULL,
  `section` INT NULL,
  PRIMARY KEY (`group_id`),
  INDEX `course_fk_2_idx` (`course_id` ASC, `section` ASC) VISIBLE,
  CONSTRAINT `course_fk_3`
    FOREIGN KEY (`course_id` , `section`)
    REFERENCES `finalProject`.`course` (`course_id` , `section`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finalProject`.`group_quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalProject`.`group_quiz` (
  `group_id` INT NOT NULL,
  `quiz_id` INT NOT NULL,
  `score` INT NULL,
  PRIMARY KEY (`group_id`, `quiz_id`),
  INDEX `group_quiz_quiz_idx` (`quiz_id` ASC) VISIBLE,
  CONSTRAINT `group_quiz_quiz_fk`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `finalProject`.`quiz` (`quiz_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `group_quiz_group_fk`
    FOREIGN KEY (`group_id`)
    REFERENCES `finalProject`.`group` (`group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finalProject`.`class_quiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalProject`.`class_quiz` (
  `course_id` INT NOT NULL,
  `quiz_id` INT NOT NULL,
  `section` INT NOT NULL,
  PRIMARY KEY (`course_id`, `quiz_id`, `section`),
  INDEX `class_quiz_quiz_idx` (`quiz_id` ASC) VISIBLE,
  INDEX `course_fk_4_idx` (`course_id` ASC, `section` ASC) VISIBLE,
  CONSTRAINT `course_fk_4`
    FOREIGN KEY (`course_id` , `section`)
    REFERENCES `finalProject`.`course` (`course_id` , `section`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `class_quiz_quiz_fk`
    FOREIGN KEY (`quiz_id`)
    REFERENCES `finalProject`.`quiz` (`quiz_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `finalProject`.`student_group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `finalProject`.`student_group` (
  `group_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `end_date` DATETIME NULL,
  PRIMARY KEY (`group_id`, `student_id`),
  INDEX `student_fk_1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `student_group_group_fk`
    FOREIGN KEY (`group_id`)
    REFERENCES `finalProject`.`group` (`group_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `student_fk_2`
    FOREIGN KEY (`student_id`)
    REFERENCES `finalProject`.`student` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
