DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.Planos(
    plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plano VARCHAR(45) NOT NULL,
    valor_plano DECIMAL(5,2) NOT NULL
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.Planos (plano, valor_plano)
  VALUES
    ('gratuito', 0),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);
    

  CREATE TABLE SpotifyClone.Artistas(
      artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      artista VARCHAR(100) NOT NULL
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.Artistas (artista)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');


  CREATE TABLE IF NOT EXISTS SpotifyClone.`Usuarios` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `nome_user` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  `data_assinatura` DATE NOT NULL,
  PRIMARY KEY (`usuario_id`),
    FOREIGN KEY (`plano_id`)
    REFERENCES SpotifyClone.`Planos` (`plano_id`)
) ENGINE = InnoDB;

  INSERT INTO SpotifyClone.`Usuarios` (nome_user, idade, plano_id, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

CREATE TABLE IF NOT EXISTS SpotifyClone.`Albuns` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(100) NOT NULL,
  `artista_id` INT NOT NULL,
  `ano_lancamento` YEAR NOT NULL,
  PRIMARY KEY (`album_id`),
    FOREIGN KEY (`artista_id`)
    REFERENCES SpotifyClone.`Artistas` (`artista_id`)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Albuns (album, artista_id, ano_lancamento)
  VALUES
    ('Renaissance',	1,	2022),
    ('Jazz',	2,	1978),
    ('Hot Space',	2,	1982),
    ('Falso Brilhante',	3,	1998),
    ('Vento de Maio',	3,	2001),
    ('QVVJFA?',	4,	2003),
    ('Somewhere Far Beyond',	5,	2007),
    ('I Put A Spell On You',	6,	2012);

CREATE TABLE IF NOT EXISTS SpotifyClone.`Musicas` (
  `musica_id` INT NOT NULL AUTO_INCREMENT,
  `album_id` INT NOT NULL,
  `musica` VARCHAR(100) NOT NULL,
  `duracao_segundos` INT NOT NULL,
  PRIMARY KEY (`musica_id`),
    FOREIGN KEY (`album_id`)
    REFERENCES SpotifyClone.`Albuns` (`album_id`)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.Musicas (album_id, musica, duracao_segundos)
  VALUES
    (1, "BREAK MY SOUL", 279),
    (1, "VIRGO’S GROOVE", 369),
    (1, "ALIEN SUPERSTAR", 116),
    (2, "Don’t Stop Me Now", 203),
    (3, "Under Pressure", 152),
    (4, "Como Nossos Pais", 105),
    (5, "O Medo de Amar é o Medo de Ser Livre", 207),
    (6, "Samba em Paris", 267),
    (7, "The Bard’s Song", 244),
    (8, "Feeling Good", 100);

CREATE TABLE IF NOT EXISTS SpotifyClone.`historico_de_reproducoes` (
  `usuario_id` INT NOT NULL,
  `musica_id` INT NOT NULL,
  `data_reproducao` DATETIME NOT NULL,
  PRIMARY KEY (`usuario_id`, `musica_id`),
    FOREIGN KEY (`usuario_id`)
    REFERENCES SpotifyClone.`Usuarios` (`usuario_id`),
    FOREIGN KEY (`musica_id`)
    REFERENCES SpotifyClone.`Musicas` (`musica_id`)
) ENGINE = InnoDB;

 INSERT INTO SpotifyClone.historico_de_reproducoes (data_reproducao, musica_id, usuario_id)
  VALUES
    ("2022-02-28 10:45:55", 8, 1),
    ("2020-05-02 05:30:35", 2, 1),
    ("2020-03-06 11:22:33", 10, 1),
    ("2022-08-05 08:05:17", 10, 2),
    ("2020-01-02 07:40:33", 7, 2),
    ("2020-11-13 16:55:13", 10, 3),
    ("2020-12-05 18:38:30", 2, 3),
    ("2021-08-15 17:10:10", 8, 4),
    ("2022-01-09 01:44:33", 8, 5),
    ("2020-08-06 15:23:43", 5, 5),
    ("2017-01-24 00:31:17", 7, 6),
    ("2017-10-12 12:35:20", 1, 6),
    ("2011-12-15 22:30:49", 4, 7),
    ("2012-03-17 14:56:41", 4, 8),
    ("2022-02-24 21:14:22", 9, 9),
    ("2015-12-13 08:30:22", 3, 10);

CREATE TABLE IF NOT EXISTS SpotifyClone.`Seguindo` (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `artista_id`),
    FOREIGN KEY (`usuario_id`)
    REFERENCES SpotifyClone.`Usuarios` (`usuario_id`),
    FOREIGN KEY (`artista_id`)
    REFERENCES SpotifyClone.`Artistas` (`artista_id`)
) ENGINE = InnoDB;

  INSERT INTO SpotifyClone.Seguindo (usuario_id, artista_id)
  VALUES
    (1, 1), (1, 2), (1, 3),
    (2, 1), (2, 3), (3, 2),
    (4, 4), (5, 5), (5, 6),
    (6, 1), (6, 6), (7, 6),
    (9, 3), (10, 2);
  


