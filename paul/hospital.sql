-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Jul 2019 um 15:39
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
-- Datenbank: `hospital`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `speciality` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `speciality`) VALUES
(1, 'Dummy1', 'smth1'),
(2, 'Dummy2', 'smth2');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `patients`
--

CREATE TABLE `patients` (
  `social_nr` int(11) NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `admission_date` datetime DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `patients`
--

INSERT INTO `patients` (`social_nr`, `unit_id`, `admission_date`, `name`) VALUES
(0, 1, '2003-04-06 00:00:00', 'Patient1'),
(5234, 2, '2005-11-30 00:00:00', 'Patient2');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `treatment`
--

CREATE TABLE `treatment` (
  `id` int(11) NOT NULL,
  `social_nr` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `symptom` varchar(55) DEFAULT NULL,
  `medicine` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `treatment`
--

INSERT INTO `treatment` (`id`, `social_nr`, `start_date`, `symptom`, `medicine`) VALUES
(1, 0, '2018-02-02 00:00:00', 'Symptom1', 'medicine1'),
(2, 5234, '2011-02-02 00:00:00', 'Symptom2', 'medicine2');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `floor` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `unit`
--

INSERT INTO `unit` (`id`, `doctor_id`, `name`, `floor`) VALUES
(1, 1, 'First Unit', 1),
(2, 2, 'Second Unit', 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`social_nr`),
  ADD KEY `unit_id` (`unit_id`);

--
-- Indizes für die Tabelle `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_nr` (`social_nr`);

--
-- Indizes für die Tabelle `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `treatment`
--
ALTER TABLE `treatment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`);

--
-- Constraints der Tabelle `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`social_nr`) REFERENCES `patients` (`social_nr`);

--
-- Constraints der Tabelle `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
