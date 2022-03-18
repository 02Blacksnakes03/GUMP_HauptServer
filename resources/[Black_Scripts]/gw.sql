CREATE TABLE `gangwar` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `owner` longtext NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `gangwar`
--

INSERT INTO `gangwar` (`id`, `name`, `owner`) VALUES
(1, 'EKZ', 'MG13'),
(2, 'Mirror Park', 'MG13'),
(3, 'Pier', 'MG13');


ALTER TABLE `gangwar`
  ADD PRIMARY KEY (`id`);