-- DROP DATABASE IF EXISTS SpotifyClone;

--   CREATE DATABASE IF NOT EXISTS SpotifyClone;

-- CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plan` (
--   `plan_id` INT NOT NULL AUTO_INCREMENT,
--   `plan_category` VARCHAR(45) NOT NULL,
--   `value` INT NOT NULL,
--   `signature_date` DATE NOT NULL,
--   PRIMARY KEY (`plan_id`)
-- ) ENGINE = InnoDB;


-- CREATE TABLE IF NOT EXISTS `SpotifyClone`.`user` (
--   `user_id` INT NOT NULL AUTO_INCREMENT,
--   `user` VARCHAR(45) NOT NULL,
--   `reproduction_history_id` INT NOT NULL,
--   `plan_id` INT NOT NULL,
--   PRIMARY KEY (`user_id`),
--   CONSTRAINT `fk_user_plan1`
--     FOREIGN KEY (`plan_id`)
--     REFERENCES `SpotifyClone`.`plan` (`plan_id`)
-- ) ENGINE = InnoDB;


-- CREATE TABLE `SpotifyClone`.`artist` (
--   `artist_id` INT NOT NULL AUTO_INCREMENT,
--   `artist` VARCHAR(45) NOT NULL,
--   PRIMARY KEY (`artist_id`)
-- ) ENGINE = InnoDB;


-- CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albums` (
--   `albums_id` INT NOT NULL AUTO_INCREMENT,
--   `album` VARCHAR(45) NOT NULL,
--   `artist_id` INT NOT NULL,
--   `release_date` YEAR(4) NOT NULL,
--   `artist_artist_id` INT NOT NULL,
--   PRIMARY KEY (`albums_id`),
--   CONSTRAINT `fk_albums_artist1`
--     FOREIGN KEY (`artist_artist_id`)
--     REFERENCES `SpotifyClone`.`artist` (`artist_id`)
-- ) ENGINE = InnoDB;


-- CREATE TABLE IF NOT EXISTS `SpotifyClone`.`music` (
--   `music_id` INT NOT NULL AUTO_INCREMENT,
--   `music` VARCHAR(45) NOT NULL,
--   `duration_seconds` INT NOT NULL,
--   `albums_id` INT NOT NULL,
--   PRIMARY KEY (`music_id`),
--   CONSTRAINT `fk_music_albums1`
--     FOREIGN KEY (`albums_id`)
--     REFERENCES `SpotifyClone`.`albums` (`albums_id`)
-- ) ENGINE = InnoDB;


-- CREATE TABLE IF NOT EXISTS `SpotifyClone`.`reproduction_history` (
--   `user_id` INT NOT NULL,
--   `music_id` INT NOT NULL,
--   `reproduction_date` DATETIME NOT NULL,
--   PRIMARY KEY (`user_id`, `music_id`),
--   CONSTRAINT `fk_user_has_music_user`
--     FOREIGN KEY (`user_id`)
--     REFERENCES `SpotifyClone`.`user` (`user_id`),
--   CONSTRAINT `fk_user_has_music_music1`
--     FOREIGN KEY (`music_id`)
--     REFERENCES `SpotifyClone`.`music` (`music_id`)
-- ) ENGINE = InnoDB;


-- CREATE TABLE IF NOT EXISTS `SpotifyClone`.`followed_artist` (
--   `artist_id` INT NOT NULL,
--   `user_id` INT NOT NULL,
--   CONSTRAINT `fk_artist_has_user_artist1`
--     FOREIGN KEY (`artist_id`)
--     REFERENCES `SpotifyClone`.`artist` (`artist_id`),
--   CONSTRAINT `fk_artist_has_user_user1`
--     FOREIGN KEY (`user_id`)
--     REFERENCES `SpotifyClone`.`user` (`user_id`)
-- ) ENGINE = InnoDB;