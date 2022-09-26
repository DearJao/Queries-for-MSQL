DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plan (
  plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  plan_category VARCHAR(45) NOT NULL,
  price DECIMAL(5, 2) NOT NULL
) ENGINE = InnoDB;


CREATE TABLE SpotifyClone.user (
  user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(45) NOT NULL,
  plan_id INT NOT NULL,
  signature_date DATE NOT NULL,
  FOREIGN KEY (plan_id)
  REFERENCES SpotifyClone.plan (plan_id)
) ENGINE = InnoDB;


CREATE TABLE SpotifyClone.artist (
  artist_id INT NOT NULL AUTO_INCREMENT,
  artist VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE = InnoDB;


CREATE TABLE SpotifyClone.albums (
  albums_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  album VARCHAR(45) NOT NULL,
  artist_id INT NOT NULL,
  release_date YEAR(4) NOT NULL,
  FOREIGN KEY (artist_id)
  REFERENCES SpotifyClone.artist (artist_id)
) ENGINE = InnoDB;


CREATE TABLE SpotifyClone.music (
  music_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  music VARCHAR(45) NOT NULL,
  duration_seconds INT NOT NULL,
  albums_id INT NOT NULL,
  FOREIGN KEY (albums_id)
  REFERENCES SpotifyClone.albums (albums_id)
) ENGINE = InnoDB;


CREATE TABLE SpotifyClone.reproduction_history (
  user_id INT NOT NULL,
  music_id INT NOT NULL,
  reproduction_date DATETIME NOT NULL,
  PRIMARY KEY (user_id, music_id),
  FOREIGN KEY (user_id)
  REFERENCES SpotifyClone.user (user_id),
  FOREIGN KEY (music_id)
  REFERENCES SpotifyClone.music (music_id)
) ENGINE = InnoDB;


CREATE TABLE SpotifyClone.followed_artist (
  artist_id INT NOT NULL,
  user_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY(user_id, artist_id),
  FOREIGN KEY (artist_id)
  REFERENCES SpotifyClone.artist (artist_id),
  FOREIGN KEY (user_id)
  REFERENCES SpotifyClone.user (user_id)
) ENGINE = InnoDB;


INSERT INTO
  SpotifyClone.artist(artist)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO
  SpotifyClone.plan(plan_category, price)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO
  SpotifyClone.albums(album, artist_id, release_date)
VALUES
  ('Renaissance', 1, 2022),
  ('Jazz', 2, 1978),
  ('Hot Space', 2, 1982),
  ('Falso Brilhante', 3, 1998),
  ('Vento de Maio', 3, 2001),
  ('QVVJFA?', 4, 2003),
  ('Somewhere Far Beyond', 5, 2007),
  ('I Put A Spell On You', 6, 2012);

INSERT INTO
  SpotifyClone.user(user_name, plan_id, signature_date)
VALUES
  ('Barbara Liskov', 1, '2019-10-20'),
  ('Robert Cecil Martin', 1, '2017-01-06'),
  ('Ada Lovelace', 2, '2017-12-30'),
  ('Martin Fowler', 2, '2017-01-17'),
  ('Sandi Metz', 2, '2018-04-29'),
  ('Paulo Freire', 3, '2018-02-14'),
  ('Bell Hooks', 3, '2018-01-05'),
  ('Christopher Alexander', 4, '2019-06-05'),
  ('Judith Butler', 4, '2020-05-13'),
  ('Jorge Amado', 4, '2017-02-17');


INSERT INTO
  SpotifyClone.music(music, duration_seconds, albums_id)
VALUES
  ('BREAK MY SOUL', 279, 1),
  ('VIRGO’S GROOVE', 369, 1),
  ('ALIEN SUPERSTAR', 116, 1),
  ('Don’t Stop Me Now', 203, 2),
  ('Under Pressure', 152, 3),
  ('Como Nossos Pais', 105, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
  ('Samba em Paris', 267, 6),
  ('The Bard’s Song', 244, 7),
  ('Feeling Good', 100, 8);

INSERT INTO
  SpotifyClone.followed_artist(artist_id, user_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (1, 2),
  (3, 2),
  (2, 3),
  (4, 4),
  (5, 5),
  (6, 5),
  (6, 6),
  (1, 6),
  (6, 7),
  (3, 9),
  (2, 10);

INSERT INTO
  SpotifyClone.reproduction_history(user_id, music_id, reproduction_date)
VALUES
  (1, 8, '2022-02-28 10:45:55'),
  (1, 2, '2020-05-02 05:30:35'),
  (1, 10,'2020-03-06 11:22:33'),
  (2, 10,'2022-08-05 08:05:17'),
  (2, 7, '2020-01-02 07:40:33'),
  (3, 10,'2020-11-13 16:55:13'),
  (3, 2, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 8, '2022-01-09 01:44:33'),
  (5, 5, '2022-08-06 15:23:43'),
  (6, 7, '2017-01-24 00:31:17'),
  (6, 1, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-12-13 21:14:22'),
  (10, 3, '2015-12-13 08:20:22');