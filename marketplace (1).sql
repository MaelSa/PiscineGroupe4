-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 11 nov. 2018 à 16:01
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `marketplace`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartenir`
--

DROP TABLE IF EXISTS `appartenir`;
CREATE TABLE IF NOT EXISTS `appartenir` (
  `Num_Siret` varchar(14) NOT NULL,
  `Num_Commercant` int(11) NOT NULL,
  PRIMARY KEY (`Num_Siret`,`Num_Commercant`),
  KEY `Num_Siret` (`Num_Siret`),
  KEY `Num_Commercant` (`Num_Commercant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `appartenir`
--

INSERT INTO `appartenir` (`Num_Siret`, `Num_Commercant`) VALUES
('41040946002521', 1),
('41040946002521', 2);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `Num_Client` int(11) NOT NULL,
  `Nom_Client` varchar(20) NOT NULL,
  `Prenom_Client` varchar(20) NOT NULL,
  `NumTel_Client` varchar(10) NOT NULL,
  `NbPointsFidelite_Client` int(11) NOT NULL,
  `AdresseMail_Client` varchar(30) NOT NULL,
  `MDPCrypte_Client` varchar(30) NOT NULL,
  PRIMARY KEY (`Num_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`Num_Client`, `Nom_Client`, `Prenom_Client`, `NumTel_Client`, `NbPointsFidelite_Client`, `AdresseMail_Client`, `MDPCrypte_Client`) VALUES
(1, 'Partinico', 'Pierre', '0641568635', 134, 'pierre.partinico@gmail.com', '');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `Num_Commande` int(11) NOT NULL,
  `Date_Commande` date NOT NULL,
  `Montant_Remise_Commande` float NOT NULL,
  PRIMARY KEY (`Num_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`Num_Commande`, `Date_Commande`, `Montant_Remise_Commande`) VALUES
(1, '2018-11-01', 0);

-- --------------------------------------------------------

--
-- Structure de la table `commercant`
--

DROP TABLE IF EXISTS `commercant`;
CREATE TABLE IF NOT EXISTS `commercant` (
  `Num_Commercant` int(10) NOT NULL,
  `Nom_Commercant` varchar(20) NOT NULL,
  `Prenom_Commercant` varchar(20) NOT NULL,
  `NumRue_Commercant` int(11) NOT NULL,
  `NomRue_Commercant` varchar(30) NOT NULL,
  `Ville_Commercant` varchar(20) NOT NULL,
  `CodePostal_Commercant` int(5) NOT NULL,
  `AdresseMail_Commercant` varchar(30) NOT NULL,
  `NumTel_Commercant` varchar(10) NOT NULL,
  PRIMARY KEY (`Num_Commercant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commercant`
--

INSERT INTO `commercant` (`Num_Commercant`, `Nom_Commercant`, `Prenom_Commercant`, `NumRue_Commercant`, `NomRue_Commercant`, `Ville_Commercant`, `CodePostal_Commercant`, `AdresseMail_Commercant`, `NumTel_Commercant`) VALUES
(1, 'Albert', 'François', 16, 'rue Victor Hugo', 'Montpellier', 34090, 'af@gmail.com', '0489653484'),
(2, 'Robert', 'Didier', 54, 'impasse des fleurs', 'Sète', 34200, 'didier@gmail.com', '0451976834');

-- --------------------------------------------------------

--
-- Structure de la table `concerner`
--

DROP TABLE IF EXISTS `concerner`;
CREATE TABLE IF NOT EXISTS `concerner` (
  `Num_Sous_Commande` int(11) NOT NULL,
  `Num_Produit` int(11) NOT NULL,
  `Qté_Commandee` int(11) NOT NULL,
  PRIMARY KEY (`Num_Sous_Commande`,`Num_Produit`),
  KEY `Num_Sous_Commande` (`Num_Sous_Commande`),
  KEY `Num_Produit` (`Num_Produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `concerner`
--

INSERT INTO `concerner` (`Num_Sous_Commande`, `Num_Produit`, `Qté_Commandee`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `donner`
--

DROP TABLE IF EXISTS `donner`;
CREATE TABLE IF NOT EXISTS `donner` (
  `Num_Produit` int(11) NOT NULL,
  `Num_Client` int(11) NOT NULL,
  `Avis` varchar(200) NOT NULL,
  `note` int(11) NOT NULL,
  PRIMARY KEY (`Num_Produit`,`Num_Client`),
  KEY `Num_Produit` (`Num_Produit`),
  KEY `Num_Client` (`Num_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `donner`
--

INSERT INTO `donner` (`Num_Produit`, `Num_Client`, `Avis`, `note`) VALUES
(1, 1, 'Bon produit', 0);

-- --------------------------------------------------------

--
-- Structure de la table `emettre`
--

DROP TABLE IF EXISTS `emettre`;
CREATE TABLE IF NOT EXISTS `emettre` (
  `Num_Client` int(11) NOT NULL,
  `Num_Commande` int(11) NOT NULL,
  PRIMARY KEY (`Num_Client`,`Num_Commande`),
  KEY `Num_Client` (`Num_Client`),
  KEY `Num_Commande` (`Num_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `emettre`
--

INSERT INTO `emettre` (`Num_Client`, `Num_Commande`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `magasin`
--

DROP TABLE IF EXISTS `magasin`;
CREATE TABLE IF NOT EXISTS `magasin` (
  `Num_Siret` varchar(14) NOT NULL,
  `Nom_Magasin` varchar(20) NOT NULL,
  `NumRue_Magasin` int(11) NOT NULL,
  `NomRue_Magasin` varchar(20) NOT NULL,
  `CodePostal_Magasin` int(5) NOT NULL,
  `Ville_Magasin` varchar(20) NOT NULL,
  `NumTel_Magasin` varchar(10) NOT NULL,
  `Email_Magasin` varchar(30) NOT NULL,
  `Livraion oui/non` tinyint(1) NOT NULL,
  `HoraireOuverture_Magasin` varchar(500) NOT NULL,
  PRIMARY KEY (`Num_Siret`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `magasin`
--

INSERT INTO `magasin` (`Num_Siret`, `Nom_Magasin`, `NumRue_Magasin`, `NomRue_Magasin`, `CodePostal_Magasin`, `Ville_Magasin`, `NumTel_Magasin`, `Email_Magasin`, `Livraion oui/non`, `HoraireOuverture_Magasin`) VALUES
('41040946002521', 'Auchan Sète', 34, 'boulevard de Verdun', 34200, 'Sète', '0451635498', 'auchansete@gmail.com', 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `Num_Produit` int(11) NOT NULL,
  `Nom_Produit` varchar(40) NOT NULL,
  `Description_Produit` text NOT NULL,
  `Prix_Produit` float NOT NULL,
  `PointsFidelite_Produit` int(11) NOT NULL,
  `Code_Type` varchar(10) NOT NULL,
  PRIMARY KEY (`Num_Produit`),
  KEY `Code_Type` (`Code_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`Num_Produit`, `Nom_Produit`, `Description_Produit`, `Prix_Produit`, `PointsFidelite_Produit`, `Code_Type`) VALUES
(1, 'iPad', '', 400, 15, '1');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `Num_Reservation` int(11) NOT NULL,
  `Reservation_Payee_oui/non` tinyint(1) NOT NULL,
  `DateLimiteRetrait` date NOT NULL,
  `Num_Commande` int(11) NOT NULL,
  PRIMARY KEY (`Num_Reservation`),
  KEY `Num_Commande` (`Num_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`Num_Reservation`, `Reservation_Payee_oui/non`, `DateLimiteRetrait`, `Num_Commande`) VALUES
(1, 1, '2018-11-08', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sous_commande`
--

DROP TABLE IF EXISTS `sous_commande`;
CREATE TABLE IF NOT EXISTS `sous_commande` (
  `Num_Sous_Commande` int(11) NOT NULL,
  `Montant_Sous_Commande` float NOT NULL,
  `Num_Commande` int(11) NOT NULL,
  PRIMARY KEY (`Num_Sous_Commande`),
  KEY `Num_Commande` (`Num_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sous_commande`
--

INSERT INTO `sous_commande` (`Num_Sous_Commande`, `Montant_Sous_Commande`, `Num_Commande`) VALUES
(1, 400, 1);

-- --------------------------------------------------------

--
-- Structure de la table `type_produit`
--

DROP TABLE IF EXISTS `type_produit`;
CREATE TABLE IF NOT EXISTS `type_produit` (
  `Code_Type` varchar(10) NOT NULL,
  `Libelle_Type` varchar(20) NOT NULL,
  PRIMARY KEY (`Code_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type_produit`
--

INSERT INTO `type_produit` (`Code_Type`, `Libelle_Type`) VALUES
('1', 'Tablettes');

-- --------------------------------------------------------

--
-- Structure de la table `vendre`
--

DROP TABLE IF EXISTS `vendre`;
CREATE TABLE IF NOT EXISTS `vendre` (
  `Num_Produit` int(11) NOT NULL,
  `Num_Siret` varchar(14) NOT NULL,
  `Qté_Stock` int(11) NOT NULL,
  `Qté_Disponible` int(11) NOT NULL,
  PRIMARY KEY (`Num_Produit`,`Num_Siret`),
  KEY `Num_Produit` (`Num_Produit`),
  KEY `Num_Siret` (`Num_Siret`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vendre`
--

INSERT INTO `vendre` (`Num_Produit`, `Num_Siret`, `Qté_Stock`, `Qté_Disponible`) VALUES
(1, '41040946002521', 40, 36);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD CONSTRAINT `appartenir_ibfk_1` FOREIGN KEY (`Num_Commercant`) REFERENCES `commercant` (`Num_Commercant`) ON UPDATE CASCADE,
  ADD CONSTRAINT `appartenir_ibfk_2` FOREIGN KEY (`Num_Siret`) REFERENCES `magasin` (`Num_Siret`);

--
-- Contraintes pour la table `concerner`
--
ALTER TABLE `concerner`
  ADD CONSTRAINT `concerner_ibfk_1` FOREIGN KEY (`Num_Produit`) REFERENCES `produit` (`Num_Produit`) ON UPDATE CASCADE,
  ADD CONSTRAINT `concerner_ibfk_2` FOREIGN KEY (`Num_Sous_Commande`) REFERENCES `sous_commande` (`Num_Sous_Commande`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `donner`
--
ALTER TABLE `donner`
  ADD CONSTRAINT `donner_ibfk_1` FOREIGN KEY (`Num_Client`) REFERENCES `client` (`Num_Client`) ON UPDATE CASCADE,
  ADD CONSTRAINT `donner_ibfk_2` FOREIGN KEY (`Num_Produit`) REFERENCES `produit` (`Num_Produit`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `emettre`
--
ALTER TABLE `emettre`
  ADD CONSTRAINT `emettre_ibfk_1` FOREIGN KEY (`Num_Client`) REFERENCES `client` (`Num_Client`) ON UPDATE CASCADE,
  ADD CONSTRAINT `emettre_ibfk_2` FOREIGN KEY (`Num_Commande`) REFERENCES `commande` (`Num_Commande`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`Code_Type`) REFERENCES `type_produit` (`Code_Type`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`Num_Commande`) REFERENCES `commande` (`Num_Commande`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `sous_commande`
--
ALTER TABLE `sous_commande`
  ADD CONSTRAINT `sous_commande_ibfk_1` FOREIGN KEY (`Num_Commande`) REFERENCES `commande` (`Num_Commande`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `vendre`
--
ALTER TABLE `vendre`
  ADD CONSTRAINT `vendre_ibfk_1` FOREIGN KEY (`Num_Produit`) REFERENCES `produit` (`Num_Produit`) ON UPDATE CASCADE,
  ADD CONSTRAINT `vendre_ibfk_2` FOREIGN KEY (`Num_Siret`) REFERENCES `magasin` (`Num_Siret`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
