-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 25 avr. 2022 à 09:39
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `administrateurs`
--

INSERT INTO `administrateurs` (`id_admin`, `email_admin`, `password_admin`) VALUES
(1, 'asia@gmail.com', '123456');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commentaires`
--

INSERT INTO `commentaires` (`id_commentaire`, `auteur_commentaire`, `contenu-commentaire`, `gite_id`) VALUES
(1, 'Pierre', 'Très calme. Beau village. Propriétaire sympa.', 1),
(2, 'Mathilde', 'Bel accueil de la propriétaire avec vin du crû et jus de raisin. Des conseils de restaurations et un éventail de brochures pour visiter, marcher, se détendre... ', 1),
(3, 'Robin', 'Superbe hôtel typique et bien au dessus de ses concurrents .\r\npiscine superbe et spa magnifique\r\npersonnel d’un grand professionnalisme et d’une grande gentillesse', 4),
(4, 'Selena', 'Pas d\'internet -Piscine fermée (bien que incluse dans le prix) - Train bruyant (surtout dérangeant la nuit) - Ménage final très cher - Équipements médiocres', 5),
(5, 'stella', 'Tout était parfait ! Les chambres avec vue sont superbe . La literie est bonne , la clim, le frigo, la baignoire .', 6);

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
  `date_arrivee` datetime DEFAULT NULL,
  `date-depart` datetime DEFAULT NULL,
  `prix_gite` float DEFAULT NULL,
  `nbr_chambres` int(11) NOT NULL,
  `nbr_sdb` int(11) NOT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  `zone_geo` int(11) NOT NULL,
  `gite_categorie` int(11) NOT NULL,
  `commentaire_id` int(11) NOT NULL,
  PRIMARY KEY (`id_gite`),
  KEY `zone_geo` (`zone_geo`),
  KEY `gite_categorie` (`gite_categorie`),
  KEY `commentaire_id` (`commentaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `gites`
--

INSERT INTO `gites` (`id_gite`, `nom_gite`, `description_gite`, `img_gite`, `date_arrivee`, `date-depart`, `prix_gite`, `nbr_chambres`, `nbr_sdb`, `disponible`, `zone_geo`, `gite_categorie`, `commentaire_id`) VALUES
(2, 'Vignes et Garrigues', 'Gîte de type studio, au coeur d\'un village typique des Corbières et du Parc Naturel Régional de la Narbonnaise. Vous sejournerez dans un paysage composé de garrigues et de vignes, à 7 km des plages de Leucate, la Franqui, et Port-la-Nouvelle. Boucles de randonnées au départ du village. Gîte aménagé dans une maison située dans le village. Il comprend au 1e étage : Grand séjour mansardé avec une cuisine bar, coin nuit avec 1 lit en 140 cm pour 2 personnes, 1 salle d\'eau. Possibilité d\'un couchage supplémentaire pour 1 personne (canapé-convertible). En rez de chaussée : Hall d\'entrée et WC. Ménage obligatoire sur les locations week-end.', '../img/1.jpg', NULL, NULL, NULL, 2, 1, NULL, 1, 1, 2),
(3, 'Dégan', 'Le gite est un appartement situé proche des commerces et à 1 km du centre-ville. Situé dans un petit immeuble de 5 logements, il est aménagé au 2 ème et dernier étage (sans ascenseur). Il vous offre: une pièce de vie avec séjour et salon, une cuisine séparée, une chambre (1 lit en 140) avec salle d\'eau, puis un wc séparé. Vous disposerez d\'une place de parking à l\'arrière du bâtiment (parking commun aux 5 logements), l\'entrée à l\'immeuble est commune avec 3 autres logements.', '../img/2.jpg', NULL, NULL, NULL, 3, 2, NULL, 2, 3, 1),
(4, 'Royal Hotel Sanremo', 'Cet établissement est à 1 minute à pied de la plage. Installé sur un domaine de jardins tropicaux de plus de 16 000 m², le Royal Hotel Sanremo est un hôtel de luxe qui vous accueille sur la promenade du front de mer, à 5 minutes à pied du casino de Sanremo. Il dispose d\'un spa moderne et d\'une piscine extérieure avec une grande terrasse bien exposée.', '../img/3.jpg', NULL, NULL, NULL, 1, 1, NULL, 3, 8, 2),
(5, 'Holiday home Recco', 'Cet établissement est à 18 minutes à pied de la plage. Doté d\'une connexion Wi-Fi gratuite et offrant une vue sur la mer, le Holiday home Recco GE with Sea View 195 est situé à Recco, à seulement 400 mètres de la plage de Recco et à 650 mètres de la Spiaggia Libera. Cette maison de vacances dispose d\'une piscine privée, d\'un jardin et d\'un parking privé gratuit.\r\n\r\nCette maison de vacances comprend 3 chambres, une télévision ainsi qu\'une cuisine entièrement équipée avec un lave-vaisselle, un micro-ondes, un lave-linge, un réfrigérateur et des plaques de cuisson.\r\n\r\nLa plage de Ciappea se trouve à 750 mètres. L\'aéroport de Gênes-Christophe Colomb, le plus proche, est implanté à 33 km.', '../img/4.jpg', NULL, NULL, NULL, 3, 3, NULL, 3, 2, 3),
(6, 'Villa Hermosa', 'Dotée d\'un jardin, d\'une piscine extérieure, la Villa Hermosa est située à Begur et offre une vue sur la mer. Lors de votre séjour, vous disposerez d\'une connexion Wi-Fi gratuite, d\'un service de prêt de vélos et d\'un barbecue.\r\n\r\nCette villa climatisée comprend 5 chambres ainsi que 3 salles de bains avec baignoire et sèche-cheveux. Elle possède également un coin salon ainsi qu\'une cuisine équipée d\'un four et d\'un lave-vaisselle.\r\n\r\nVous profiterez également d\'une terrasse sur place. Vous pourrez pratiquer le vélo et la randonnée à proximité.', '../img/6.jpg', NULL, NULL, NULL, 6, 5, NULL, 4, 2, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `regions`
--

INSERT INTO `regions` (`id_region`, `code_region`, `nom_region`, `obs`) VALUES
(1, 1, 'PACA', '0'),
(2, 2, 'AURA\r\nAUvergne Rhône-Alpes', '0'),
(3, 3, 'Italie', '0'),
(4, 4, 'Espagne', '0'),
(5, 5, 'Grèce', '0'),
(6, 6, 'Pacifique', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_util`, `email_util`, `password_util`) VALUES
(1, 'math@gmail.com', '123456'),
(2, 'pierre@gmail.com', '234567'),
(3, 'robin@gmail.com', 'kdlsmqjk'),
(4, 'selena@gmail.com', 'dsqfdsq\r\n');

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
