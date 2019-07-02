-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Jul 2019 um 15:13
-- Server-Version: 10.1.40-MariaDB
-- PHP-Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `airport`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airports`
--

CREATE TABLE `airports` (
  `id` int(11) NOT NULL,
  `str_id` varchar(3) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `airports`
--

INSERT INTO `airports` (`id`, `str_id`, `city`, `country`) VALUES
(1, 'SAL', 'Salzburg', 'Austria'),
(2, 'VAL', 'Vienna', 'Austria');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flights`
--

CREATE TABLE `flights` (
  `id` int(11) NOT NULL,
  `origin` int(11) DEFAULT NULL,
  `destination` int(11) DEFAULT NULL,
  `plane_reg_nr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `flights`
--

INSERT INTO `flights` (`id`, `origin`, `destination`, `plane_reg_nr`) VALUES
(1, 2, 1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `planes`
--

CREATE TABLE `planes` (
  `reg_nr` int(11) NOT NULL,
  `assignment` varchar(55) DEFAULT NULL,
  `manufacturer` varchar(55) DEFAULT NULL,
  `model` varchar(55) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `flight_range` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `planes`
--

INSERT INTO `planes` (`reg_nr`, `assignment`, `manufacturer`, `model`, `capacity`, `flight_range`) VALUES
(1, 'I dont know', 'Someone', 'AAXYZ', 400, 1000);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plane_reg_nr` (`plane_reg_nr`),
  ADD KEY `origin` (`origin`),
  ADD KEY `destination` (`destination`);

--
-- Indizes für die Tabelle `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`reg_nr`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `airports`
--
ALTER TABLE `airports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `flights`
--
ALTER TABLE `flights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `planes`
--
ALTER TABLE `planes`
  MODIFY `reg_nr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`plane_reg_nr`) REFERENCES `planes` (`reg_nr`),
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`origin`) REFERENCES `airports` (`id`),
  ADD CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`destination`) REFERENCES `airports` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
