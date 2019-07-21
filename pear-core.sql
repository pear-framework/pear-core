USE `pear`;

-- Dumpar struktur för tabell pear.users
CREATE TABLE IF NOT EXISTS `users` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `identifier` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `ip` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `discord` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `timeCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastLogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
