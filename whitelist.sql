
CREATE TABLE `whitelist` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`identifier`);

