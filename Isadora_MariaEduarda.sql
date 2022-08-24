-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE tipo_usuario (
cod_tipuser int PRIMARY KEY,
desc_tipuser varchar(250)
);

CREATE TABLE curtir (
cod_postagem int,
cod_usuario int,
dathora_curtir timestamp
);

CREATE TABLE midia (
titulo_midia varchar(100),
caminho_midia varchar(250),
cod_midia int PRIMARY KEY,
cod_postagem int
);

CREATE TABLE postagem (
titulo_postagem varchar(100),
categoria varchar(100),
cod_postagem int PRIMARY KEY,
texto_postagem varchar(1000),
cod_usuario int,
cod_ong int
);

CREATE TABLE voluntario (
cod_ong int,
cod_usuario int,
dt_voluntario date
);

CREATE TABLE doacao (
cod_ong int,
cod_usuario int,
dt_doacao date,
valor_doacao decimal(10,2)
);

CREATE TABLE ong (
email_ong varchar(250) not null,
telefone_ong varchar(14),
nome_ong varchar(100),
cod_ong int PRIMARY KEY
);

CREATE TABLE comenta (
cod_postagem int,
cod_usuario int,
dathora_coment timestamp,
texto_coment varchar(250),
FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem)
);

CREATE TABLE usuario (
idade int,
nome varchar(250),
email varchar(250) unique,
cod_usuario int PRIMARY KEY,
telefone varchar(14),
cod_tipuser int,
FOREIGN KEY(cod_tipuser) REFERENCES tipo_usuario (cod_tipuser)
);

ALTER TABLE curtir ADD FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem);
ALTER TABLE curtir ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE midia ADD FOREIGN KEY(cod_postagem) REFERENCES postagem (cod_postagem);
ALTER TABLE postagem ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE postagem ADD FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong);
ALTER TABLE voluntario ADD FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong);
ALTER TABLE voluntario ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE doacao ADD FOREIGN KEY(cod_ong) REFERENCES ong (cod_ong);
ALTER TABLE doacao ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE comenta ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
