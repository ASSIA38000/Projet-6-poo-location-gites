-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 24 avr. 2022 à 17:30
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `location_gite`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateurs`
--

DROP TABLE IF EXISTS `administrateurs`;
CREATE TABLE IF NOT EXISTS `administrateurs` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `email_admin` varchar(255) NOT NULL,
  `password_admin` varchar(255) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `type_gite` varchar(255) NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id_categorie`, `type_gite`) VALUES
(1, 'APPARTEMENT'),
(2, 'VILLA'),
(3, 'MAISON DE CAMPAGNE'),
(4, 'MAISON D\'HOTES'),
(5, 'MAS'),
(6, 'CAMPING'),
(7, 'CHALET'),
(8, 'HOTEL'),
(9, 'CABANE'),
(10, 'BATEAU'),
(11, 'PENICHE'),
(12, 'ROULOTTE'),
(13, 'TIPI'),
(14, 'YOURTE'),
(15, 'BULLE');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `id_commentaire` int(11) NOT NULL AUTO_INCREMENT,
  `auteur_commentaire` varchar(255) NOT NULL,
  `contenu-commentaire` text NOT NULL,
  `gite_id` int(11) NOT NULL,
  PRIMARY KEY (`id_commentaire`),
  KEY `gite_id` (`gite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `gites`
--

DROP TABLE IF EXISTS `gites`;
CREATE TABLE IF NOT EXISTS `gites` (
  `id_gite` int(11) NOT NULL AUTO_INCREMENT,
  `nom_gite` varchar(255) NOT NULL,
  `description_gite` text NOT NULL,
  `img_gite` varchar(255) NOT NULL,
  `date_arrivee` datetime NOT NULL,
  `date-depart` datetime NOT NULL,
  `prix_gite` float NOT NULL,
  `nbr_chambres` int(11) NOT NULL,
  `nbr_sdb` int(11) NOT NULL,
  `disponible` tinyint(1) NOT NULL,
  `zone_geo` int(11) NOT NULL,
  `gite_categorie` int(11) NOT NULL,
  `commentaire_id` int(11) NOT NULL,
  PRIMARY KEY (`id_gite`),
  KEY `zone_geo` (`zone_geo`),
  KEY `gite_categorie` (`gite_categorie`),
  KEY `commentaire_id` (`commentaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `regions`
--

DROP TABLE IF EXISTS `regions`;
CREATE TABLE IF NOT EXISTS `regions` (
  `id_region` int(11) NOT NULL AUTO_INCREMENT,
  `code_region` int(3) NOT NULL,
  `nom_region` varchar(255) NOT NULL,
  `obs` varchar(255) NOT NULL,
  PRIMARY KEY (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id_util` int(11) NOT NULL AUTO_INCREMENT,
  `email_util` varchar(255) NOT NULL,
  `password_util` varchar(255) NOT NULL,
  PRIMARY KEY (`id_util`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gites`
--
ALTER TABLE `gites`
  ADD CONSTRAINT `gites_ibfk_1` FOREIGN KEY (`zone_geo`) REFERENCES `regions` (`id_region`),
  ADD CONSTRAINT `gites_ibfk_2` FOREIGN KEY (`gite_categorie`) REFERENCES `categories` (`id_categorie`),
  ADD CONSTRAINT `gites_ibfk_3` FOREIGN KEY (`commentaire_id`) REFERENCES `commentaires` (`id_commentaire`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
