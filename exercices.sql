-- Exercices SQL --> Correction de MAEVA
--
-- Toutes les commandes devront être testées sur phpMyAdmin et centralisées dans un fichier .sql
-- Notes : Les noms de Base de Données (bdd), de tables et de champs sont écrits entre `magic quotes` (altGR+ 7) ; Les noms de données (data) sont écrits entre 'simples quotes'
-- Le CRUD : Create + Read + Update + Delete (ne concernent que les données).
--
-- Partie 1 : Création et suppression de bases de données
--
-- Exercice 1 : Créer une base de données languages.
CREATE DATABASE `languages`;
-- Exercice 2 : Créer une base de données webDevelopment avec l’encodage UTF-8.
CREATE DATABASE `languages` CHARACTER SET 'utf8';
-- Exercice 3 : Créer une base de données frameworks avec l’encodage UTF-8 si elle n’existe pas.
CREATE DATABASE IF NOT EXISTS `frameworks` CHARACTER SET 'utf8';
-- Exercice 4 : Supprimer la base de données languages.
DROP DATABASE `languages`;
-- Exercice 5 : Supprimer la base de données frameworks si elle existe.
DROP DATABASE IF EXISTS `frameworks`;
--
-- Partie 2 : Création de tables
--
-- Exercice 1 : Dans la base de données webDevelopment, créer la table languages avec les colonnes :
-- • id (type INT, auto-incrémenté, clé primaire)
-- • languages (type VARCHAR)
USE `webDevelopment`;
CREATE TABLE `languages`(
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `language` VARCHAR(100)
);
-- Exercice 2 : Dans la base de données webDevelopment, créer la table tools avec les colonnes :
-- • id (type INT, auto-incrémenté, clé primaire)
-- • tool (type VARCHAR)
USE `webDevelopment`;
CREATE TABLE `tools`(
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `tool` VARCHAR(40)
);
-- Exercice 3 : Dans la base de données webDevelopment, créer, si elle n’existe pas, la table frameworks.
-- • id (type INT, auto-incrémenté, clé primaire)
-- • name (type VARCHAR (100))
USE `webDevelopment`;
CREATE TABLE IF NOT EXISTS `frameworks`(
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100)
);
-- Exercice 4 : Supprimer la table tools si elle existe.
USE `webDevelopment`;
DROP TABLE IF EXISTS `tools`;
-- Exercice 5 : Dans la base de données webDevelopment, créer une table clients avec les colonnes suivantes :
-- Colonnes Types Attributs
-- id INT Auto-increment, clé primaire
-- lastname VARCHAR (50)
-- firstname VARCHAR (50)
-- birthdate DATE
-- address VARCHAR (100)
-- phone INT
-- mail VARCHAR (150)
USE `webDevelopment`;
CREATE TABLE IF NOT EXISTS `clients`(
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `lastname` VARCHAR(50),
  `firstname` VARCHAR(50),
  `date` DATE,
  `address` VARCHAR(100),
  `phone` INT,
  `mail` VARCHAR(150)
);
--
-- Partie 3 : Modification de tables
--
-- Exercice 1 : Dans la base de données webDevelopment, ajouter à la table languages une colonne versions (type VARCHAR 15).
USE `webDevelopment`;
ALTER TABLE `languages` ADD COLUMN `versions` VARCHAR(15);
-- Exercice 2 : Dans la base de données webDevelopment, ajouter à la table frameworks une colonne version (type VARCHAR(10)).
USE `webDevelopment`;
ALTER TABLE `frameworks` ADD COLUMN `version` VARCHAR(10);
-- Exercice 3 : Dans la base de données webDevelopment, dans la table languages renommer la colonne versions en version.
USE `webDevelopment`;
ALTER TABLE `languages` CHANGE `versions` `version` VARCHAR(15);
-- Exercice 4 : Dans la base de données webDevelopment, dans la table languages changer le type de la colonne version en VARCHAR(10).

-- Partie 5 : Sélection de données
-- Exercice 1
-- Dans la table languages, afficher toutes les données de la table, par ordre alphabétique.
USE `webDevelopment`;
SELECT * FROM `languages` ORDER BY `language` ASC;
-- autre façon de faire en listant les colonnes que l'on souhaite afficher
SELECT `id`, `language`, `version` FROM `languages` ORDER BY `language` ASC;
-- Exercice 2
-- Dans la table languages, afficher toutes les versions de PHP.
USE `webDevelopment`;
SELECT `version` AS `version de PHP` FROM `languages` WHERE `language`='PHP';
-- AS permet de créer un ALIAS et de renommer temporairement une colonne
-- Exercice 3
-- Dans la table languages, afficher toutes les lignes qui ne sont pas du PHP.
USE `webDevelopment`;
SELECT * FROM `languages` WHERE NOT `language`='PHP';
-- autre façon avec "différent de"
SELECT * FROM `languages` WHERE `language` != 'PHP';
-- Exercice 4
-- Dans la table languages, afficher toutes les versions de PHP et de JavaScript.
USE `webDevelopment`;
SELECT * FROM `languages` WHERE `language`='PHP' OR `language`='JavaScript';
-- Autre façon de l'écrire :
SELECT * FROM `languages` WHERE `language` IN ('JavaScript', 'PHP');
-- Exercice 5
-- Dans la table frameworks, afficher toutes les données de la table ayant une version 2.x (x étant un numéro quelconque).
USE `webDevelopment`;
SELECT * FROM `frameworks` WHERE `version` LIKE '2.%';
-- Exercice 6
-- Dans la table frameworks, afficher toutes les lignes ayant pour id 1 et 3.
USE `webDevelopment`;
SELECT * FROM `frameworks` WHERE `id` = 1 OR `id` = 3;
-- Autre façon de l'écrire :
SELECT * FROM `frameworks` WHERE `id` IN (1,3);
-- Partie 6 : Suppression et modification de données
-- Exercice 1
-- Dans la table languages, supprimer toutes les lignes parlant du HTML.
USE `webDevelopment`;
DELETE FROM `languages` WHERE `language`='HTML';
-- La suppression d'une ligne ne ré-incrémente pas l'ID !!
-- Exercice 2
-- Dans la table frameworks, modifier toutes les lignes ayant le framework Symfony par Symfony2.
USE `webDevelopment`;
UPDATE `frameworks` SET `name` = 'Symfony2' WHERE `name`='Symfony';
-- Exercice 3
-- Dans la table languages, modifier la ligne du languages JavaScript version 5 par la version 5.1.
USE `webDevelopment`;
UPDATE `languages` SET `version` = '5.1' WHERE `language`='JavaScript' AND `version`='5';
