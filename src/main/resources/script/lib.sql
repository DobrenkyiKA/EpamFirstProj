-- MySQL Script generated by MySQL Workbench
-- Sun 14 Apr 2019 01:58:32 PM MSK
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8 ;
USE `library` ;

-- -----------------------------------------------------
-- Table `library`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`role` (
                                              `idrole` INT NOT NULL AUTO_INCREMENT,
                                              `role_name` VARCHAR(45) NOT NULL,
                                              PRIMARY KEY (`idrole`))
  ENGINE = InnoDB;

insert into role (role_name) values ('READER');
insert into role (role_name) values ('LIBRARIAN');
insert into role (role_name) values ('ADMINISTATOR');

-- -----------------------------------------------------
-- Table `library`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`user` (
                                              `id` INT NOT NULL AUTO_INCREMENT,
                                              `name` VARCHAR(100) NOT NULL,
                                              `role` INT NOT NULL DEFAULT 1,
                                              `login` VARCHAR(100) NOT NULL,
                                              `password` VARCHAR(100) NOT NULL,
                                              PRIMARY KEY (`id`),
                                              INDEX `role_idx` (`role` ASC),
                                              CONSTRAINT `role`
                                                FOREIGN KEY (`role`)
                                                  REFERENCES `library`.`role` (`idrole`)
                                                  ON DELETE NO ACTION
                                                  ON UPDATE NO ACTION)
  ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `library`.`book_state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`book_state` (
                                                    `id` INT NOT NULL AUTO_INCREMENT,
                                                    `book_state_name` VARCHAR(45) NOT NULL,
                                                    PRIMARY KEY (`id`))
  ENGINE = InnoDB;

insert into book_state (book_state_name) values ('FREE');
insert into book_state (book_state_name) values ('ORDERED');
insert into book_state (book_state_name) values ('ON_HANDS');
-- -----------------------------------------------------
-- Table `library`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`book` (
                                              `idbook` INT NOT NULL AUTO_INCREMENT,
                                              `author` VARCHAR(100) NOT NULL,
                                              `title` VARCHAR(100) NOT NULL,
                                              `book_state_id` INT NOT NULL DEFAULT 1,
                                              `description` VARCHAR(200) NOT NULL DEFAULT 'no description',
                                              PRIMARY KEY (`idbook`),
                                              INDEX `book_state_idx` (`book_state_id` ASC),
                                              CONSTRAINT `book_state`
                                                FOREIGN KEY (`book_state_id`)
                                                  REFERENCES `library`.`book_state` (`id`)
                                                  ON DELETE NO ACTION
                                                  ON UPDATE NO ACTION)
  ENGINE = InnoDB;


INSERT INTO book (title, description, author) VALUES ('The Pilgrim’s Progress', 'A story of a man in search of truth told with the simple clarity and beauty of Bunyan’s prose make this the ultimate English classic.', 'John Bunyan');
INSERT INTO book (title, description, author) VALUES ('Robinson Crusoe', 'By the end of the 19th century, no book in English literary history had enjoyed more editions, spin-offs and translations. Crusoe’s world-famous novel is a complex literary confection, and it’s irresistible.', 'Daniel Defoe');
INSERT INTO book (title, description, author) VALUES ('Gulliver’s Travels', 'A satirical masterpiece that’s never been out of print, Jonathan Swift’s Gulliver’s Travels comes third in our list of the best novels written in English', 'Jonathan Swift');
INSERT INTO book (title, description, author) VALUES ('Clarissa', 'Clarissa is a tragic heroine, pressured by her unscrupulous nouveau-riche family to marry a wealthy man she detests, in the book that Samuel Johnson described as “the first book in the world for the knowledge it displays of the human heart.”', 'Samuel Richardson');
INSERT INTO book (title, description, author) VALUES ('Tom Jones', 'Tom Jones is a classic English novel that captures the spirit of its age and whose famous characters have come to represent Augustan society in all its loquacious, turbulent, comic variety.', 'Henry Fielding');
INSERT INTO book (title, description, author) VALUES ('The Life and Opinions of Tristram Shandy, Gentleman', 'Laurence Sterne’s vivid novel caused delight and consternation when it first appeared and has lost little of its original bite.', 'Laurence Sterne');
INSERT INTO book (title, description, author) VALUES ('Emma', 'Jane Austen’s Emma is her masterpiece, mixing the sparkle of her early books with a deep sensibility.', 'Jane Austen');
INSERT INTO book (title, description, author) VALUES ('Frankenstein', 'Mary Shelley’s first novel has been hailed as a masterpiece of horror and the macabre.', 'Mary Shelley');
INSERT INTO book (title, description, author) VALUES ('Nightmare Abbey', 'The great pleasure of Nightmare Abbey, which was inspired by Thomas Love Peacock’s friendship with Shelley, lies in the delight the author takes in poking fun at the romantic movement.', 'Thomas Love Peacock');
INSERT INTO book (title, description, author) VALUES ('The Narrative', 'Edgar Allan Poe’s only novel – a classic adventure story with supernatural elements – has fascinated and influenced generations of writers.', 'Edgar Allan Poe');
INSERT INTO book (title, description, author) VALUES ('Sybil', 'The future prime minister displayed flashes of brilliance that equalled the greatest Victorian novelists.', 'Benjamin Disraeli');
INSERT INTO book (title, description, author) VALUES ('Jane Eyre', 'Charlotte Brontë’s erotic, gothic masterpiece became the sensation of Victorian England. Its great breakthrough was its intimate dialogue with the reader.', 'Charlotte Brontë');
INSERT INTO book (title, description, author) VALUES ('Wuthering Heights', 'Emily Brontë’s windswept masterpiece is notable not just for its wild beauty but for its daring reinvention of the novel form itself.', 'Emily Brontë');
INSERT INTO book (title, description, author) VALUES ('Vanity Fair', 'William Thackeray’s masterpiece, set in Regency England, is a bravura performance by a writer at the top of his game.', 'William Thackeray');
INSERT INTO book (title, description, author) VALUES ('David Copperfield', 'David Copperfield marked the point at which Dickens became the great entertainer and also laid the foundations for his later, darker masterpieces.', 'Charles Dickens');
INSERT INTO book (title, description, author) VALUES ('The Scarlet Letter', 'Nathaniel Hawthorne’s astounding book is full of intense symbolism and as haunting as anything by Edgar Allan Poe.', 'Nathaniel Hawthorne');
INSERT INTO book (title, description, author) VALUES ('The Pilgrim’s Progress', 'A story of a man in search of truth told with the simple clarity and beauty of Bunyan’s prose make this the ultimate English classic.', 'John Bunyan');
INSERT INTO book (title, description, author) VALUES ('Robinson Crusoe', 'By the end of the 19th century, no book in English literary history had enjoyed more editions, spin-offs and translations. Crusoe’s world-famous novel is a complex literary confection, and it’s irresistible.', 'Daniel Defoe');
INSERT INTO book (title, description, author) VALUES ('Gulliver’s Travels', 'A satirical masterpiece that’s never been out of print, Jonathan Swift’s Gulliver’s Travels comes third in our list of the best novels written in English', 'Jonathan Swift');
INSERT INTO book (title, description, author) VALUES ('Clarissa', 'Clarissa is a tragic heroine, pressured by her unscrupulous nouveau-riche family to marry a wealthy man she detests, in the book that Samuel Johnson described as “the first book in the world for the knowledge it displays of the human heart.”', 'Samuel Richardson');
INSERT INTO book (title, description, author) VALUES ('Tom Jones', 'Tom Jones is a classic English novel that captures the spirit of its age and whose famous characters have come to represent Augustan society in all its loquacious, turbulent, comic variety.', 'Henry Fielding');
INSERT INTO book (title, description, author) VALUES ('The Life and Opinions of Tristram Shandy, Gentleman', 'Laurence Sterne’s vivid novel caused delight and consternation when it first appeared and has lost little of its original bite.', 'Laurence Sterne');
INSERT INTO book (title, description, author) VALUES ('Emma', 'Jane Austen’s Emma is her masterpiece, mixing the sparkle of her early books with a deep sensibility.', 'Jane Austen');
INSERT INTO book (title, description, author) VALUES ('Frankenstein', 'Mary Shelley’s first novel has been hailed as a masterpiece of horror and the macabre.', 'Mary Shelley');
INSERT INTO book (title, description, author) VALUES ('Nightmare Abbey', 'The great pleasure of Nightmare Abbey, which was inspired by Thomas Love Peacock’s friendship with Shelley, lies in the delight the author takes in poking fun at the romantic movement.', 'Thomas Love Peacock');
INSERT INTO book (title, description, author) VALUES ('The Narrative', 'Edgar Allan Poe’s only novel – a classic adventure story with supernatural elements – has fascinated and influenced generations of writers.', 'Edgar Allan Poe');
INSERT INTO book (title, description, author) VALUES ('Sybil', 'The future prime minister displayed flashes of brilliance that equalled the greatest Victorian novelists.', 'Benjamin Disraeli');
INSERT INTO book (title, description, author) VALUES ('Jane Eyre', 'Charlotte Brontë’s erotic, gothic masterpiece became the sensation of Victorian England. Its great breakthrough was its intimate dialogue with the reader.', 'Charlotte Brontë');
INSERT INTO book (title, description, author) VALUES ('Wuthering Heights', 'Emily Brontë’s windswept masterpiece is notable not just for its wild beauty but for its daring reinvention of the novel form itself.', 'Emily Brontë');
INSERT INTO book (title, description, author) VALUES ('Vanity Fair', 'William Thackeray’s masterpiece, set in Regency England, is a bravura performance by a writer at the top of his game.', 'William Thackeray');
INSERT INTO book (title, description, author) VALUES ('David Copperfield', 'David Copperfield marked the point at which Dickens became the great entertainer and also laid the foundations for his later, darker masterpieces.', 'Charles Dickens');
INSERT INTO book (title, description, author) VALUES ('The Scarlet Letter', 'Nathaniel Hawthorne’s astounding book is full of intense symbolism and as haunting as anything by Edgar Allan Poe.', 'Nathaniel Hawthorne');
-- -----------------------------------------------------
-- Table `library`.`card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library`.`card` (
                                              `idhome_card` INT NOT NULL AUTO_INCREMENT,
                                              `book` INT NOT NULL,
                                              `user` INT NOT NULL,
                                              `start_date` DATE NOT NULL,
                                              `end_date` DATE NOT NULL,
                                              `is_return` TINYINT(1) NOT NULL DEFAULT 0,
                                              PRIMARY KEY (`idhome_card`),
                                              INDEX `idreader_idx` (`user` ASC),
                                              INDEX `book_idx` (`book` ASC),
                                              CONSTRAINT `reader`
                                                FOREIGN KEY (`user`)
                                                  REFERENCES `library`.`user` (`id`)
                                                  ON DELETE NO ACTION
                                                  ON UPDATE NO ACTION,
                                              CONSTRAINT `book`
                                                FOREIGN KEY (`book`)
                                                  REFERENCES `library`.`book` (`idbook`)
                                                  ON DELETE NO ACTION
                                                  ON UPDATE NO ACTION)
  ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;