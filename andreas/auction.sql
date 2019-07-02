-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Jul 2019 um 15:32
-- Server-Version: 10.3.16-MariaDB
-- PHP-Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `auction`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bidding`
--

CREATE TABLE `bidding` (
  `bidID` int(11) NOT NULL,
  `custID` int(11) NOT NULL,
  `catNo` int(11) NOT NULL,
  `amount` float NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `bidding`
--

INSERT INTO `bidding` (`bidID`, `custID`, `catNo`, `amount`, `datetime`) VALUES
(1, 2, 2, 3200, '2019-07-02 11:39:07'),
(2, 3, 4, 20000, '2019-07-02 11:40:06');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `custID` int(11) NOT NULL,
  `unName` char(12) NOT NULL,
  `pw` char(12) NOT NULL,
  `email` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`custID`, `unName`, `pw`, `email`) VALUES
(1, 'andreas', 'wasined', 'ich@codefactory.wien'),
(2, 'diana', 'whatif', 'diana@codefactory.wien'),
(3, 'zoran', 'hungry', 'zoran@codefactory.wien'),
(4, 'peter', 'gusch', 'peter@codefactory.wien'),
(5, 'martin', 'henka', 'martin@codefactory.wien');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product`
--

CREATE TABLE `product` (
  `prodCode` int(11) NOT NULL,
  `catNo` int(11) NOT NULL,
  `name` char(25) DEFAULT NULL,
  `briefDescription` tinytext DEFAULT NULL,
  `photo` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `product`
--

INSERT INTO `product` (`prodCode`, `catNo`, `name`, `briefDescription`, `photo`) VALUES
(1, 2, 'Collier', 'necklet with diamonds', 'img/necklet.png'),
(2, 1, 'ring', 'golden ring with a Saphire', 'img/ring.png'),
(3, 2, 'Bracelet', 'bracelet with rubins', 'img/bracelet'),
(4, 3, 'Cupboard', 'Biedermeier Cupboard', 'img/cupboard.png'),
(5, 1, 'Foteuille', 'grandma\'s 1 person couch', 'img/foteuille.png'),
(6, 3, 'Phonebooth', 'old London phone booth', 'img/phoneBooth.png'),
(7, 5, 'Spiderman\'s Suite', 'It\'s the original suite of Spiderman', 'img/sp-suite.png'),
(8, 5, 'Superman\'s Suite', 'the original suite of Superman', 'img/superman.png');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sets`
--

CREATE TABLE `sets` (
  `catNo` int(11) NOT NULL,
  `startPrice` float NOT NULL,
  `highestBid` float NOT NULL,
  `remTime` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sets`
--

INSERT INTO `sets` (`catNo`, `startPrice`, `highestBid`, `remTime`) VALUES
(1, 500, 2000, '00:00:00'),
(2, 300, 5000, '00:00:00'),
(3, 1500, 11680, '00:00:00'),
(4, 1000, 6300, '00:00:00'),
(5, 7300, 32000, '00:00:00');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bidding`
--
ALTER TABLE `bidding`
  ADD PRIMARY KEY (`bidID`),
  ADD KEY `custID` (`custID`),
  ADD KEY `catNo` (`catNo`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`custID`);

--
-- Indizes für die Tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prodCode`),
  ADD KEY `catNo` (`catNo`);

--
-- Indizes für die Tabelle `sets`
--
ALTER TABLE `sets`
  ADD PRIMARY KEY (`catNo`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `bidding`
--
ALTER TABLE `bidding`
  MODIFY `bidID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `custID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `product`
--
ALTER TABLE `product`
  MODIFY `prodCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `sets`
--
ALTER TABLE `sets`
  MODIFY `catNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bidding`
--
ALTER TABLE `bidding`
  ADD CONSTRAINT `bidding_ibfk_1` FOREIGN KEY (`custID`) REFERENCES `customer` (`custID`),
  ADD CONSTRAINT `bidding_ibfk_2` FOREIGN KEY (`catNo`) REFERENCES `sets` (`catNo`);

--
-- Constraints der Tabelle `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`catNo`) REFERENCES `sets` (`catNo`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
