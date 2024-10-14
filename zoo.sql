-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 14 oct. 2024 à 15:34
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `zoo`
--

-- --------------------------------------------------------

--
-- Structure de la table `animaux`
--

CREATE TABLE `animaux` (
  `id` int(11) NOT NULL,
  `nom_propre` varchar(20) NOT NULL,
  `tatuage` tinyint(4) NOT NULL,
  `signe_particulier` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `adresse` varchar(60) NOT NULL,
  `telephone` tinyint(4) NOT NULL,
  `poste_occupe` varchar(20) NOT NULL,
  `responsabilite_anim` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enclos`
--

CREATE TABLE `enclos` (
  `id` int(11) NOT NULL,
  `emplacement` varchar(20) NOT NULL,
  `numero` tinyint(4) NOT NULL,
  `description` varchar(60) NOT NULL,
  `superficie` tinyint(4) NOT NULL,
  `occupe_par_anim` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `espece_propre`
--

CREATE TABLE `espece_propre` (
  `id` int(11) NOT NULL,
  `nom_commun` varchar(20) NOT NULL,
  `nom_scientifique` varchar(50) NOT NULL,
  `origine` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `eclos_habitat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `regime_aliment_animal`
--

CREATE TABLE `regime_aliment_animal` (
  `id` int(11) NOT NULL,
  `regime` varchar(40) NOT NULL,
  `quantite` tinyint(4) NOT NULL,
  `frequence` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `regime_aliment_employe`
--

CREATE TABLE `regime_aliment_employe` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `composition` varchar(100) NOT NULL,
  `allergenes` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `traitement_medic_animal`
--

CREATE TABLE `traitement_medic_animal` (
  `id` int(11) NOT NULL,
  `medicament` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `posologie` varchar(100) NOT NULL,
  `duree` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `traitement_medic_employe`
--

CREATE TABLE `traitement_medic_employe` (
  `id` int(11) NOT NULL,
  `medicament` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `duree` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `enclos`
--
ALTER TABLE `enclos`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `espece_propre`
--
ALTER TABLE `espece_propre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `regime_aliment_animal`
--
ALTER TABLE `regime_aliment_animal`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `regime_aliment_employe`
--
ALTER TABLE `regime_aliment_employe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `traitement_medic_animal`
--
ALTER TABLE `traitement_medic_animal`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `traitement_medic_employe`
--
ALTER TABLE `traitement_medic_employe`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `animaux`
--
ALTER TABLE `animaux`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `enclos`
--
ALTER TABLE `enclos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `espece_propre`
--
ALTER TABLE `espece_propre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `regime_aliment_animal`
--
ALTER TABLE `regime_aliment_animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `regime_aliment_employe`
--
ALTER TABLE `regime_aliment_employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `traitement_medic_animal`
--
ALTER TABLE `traitement_medic_animal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `traitement_medic_employe`
--
ALTER TABLE `traitement_medic_employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animaux`
--
ALTER TABLE `animaux`
  ADD CONSTRAINT `id_employe` FOREIGN KEY (`id`) REFERENCES `employe` (`id`),
  ADD CONSTRAINT `id_enclos` FOREIGN KEY (`id`) REFERENCES `enclos` (`id`),
  ADD CONSTRAINT `id_espece_propre` FOREIGN KEY (`id`) REFERENCES `espece_propre` (`id`),
  ADD CONSTRAINT `id_regime_aliment` FOREIGN KEY (`id`) REFERENCES `regime_aliment_animal` (`id`),
  ADD CONSTRAINT `id_traitement_medic` FOREIGN KEY (`id`) REFERENCES `traitement_medic_animal` (`id`);

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `id_animaux` FOREIGN KEY (`id`) REFERENCES `animaux` (`id`),
  ADD CONSTRAINT `id_regime_aliment_employe` FOREIGN KEY (`id`) REFERENCES `regime_aliment_employe` (`id`),
  ADD CONSTRAINT `id_traitement_medic_employe` FOREIGN KEY (`id`) REFERENCES `traitement_medic_employe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
