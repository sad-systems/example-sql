-- Исходные данные

CREATE TABLE `partitions` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(64) NOT NULL
) DEFAULT CHARSET=utf8 COMMENT = 'Разделы форума';

CREATE TABLE `topics` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `partition_id` int(11) NOT NULL DEFAULT '1' COMMENT 'Идентификатор раздела'
) DEFAULT CHARSET=utf8 COMMENT = 'Темы форума';

CREATE TABLE `users` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT 'Аноним'
) DEFAULT CHARSET=utf8 COMMENT = 'Пользователи форума';

CREATE TABLE `posts` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `ts` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата/Время создания',
  `text` text NOT NULL COMMENT 'Текст сообщния',
  `topic_id` int(11) NOT NULL COMMENT 'Идентификатор темы',
  `user_id` int(11) NOT NULL COMMENT 'Идентификатор пользователя'
) DEFAULT CHARSET=utf8 COMMENT = 'Сообщения форума';

INSERT INTO `partitions` (`id`, `title`) VALUES
(1, 'Раздел 1');

INSERT INTO `topics` (`id`, `title`, `partition_id`) VALUES
(1, 'Тема 1', 1),
(2, 'Тема 2', 1),
(3, 'Тема 3', 1),
(4, 'Тема 4', 1),
(5, 'Тема 5', 1),
(6, 'Тема 6', 1),
(7, 'Тема 7', 1),
(8, 'Тема 8', 1),
(9, 'Тема 9', 1),
(10, 'Тема 10', 1);

INSERT INTO `users` (`id`, `name`) VALUES
(1, 'Пользователь 1'),
(2, 'Пользователь 2'),
(3, 'Пользователь 3'),
(4, 'Пользователь 4'),
(5, 'Пользователь 5'),
(6, 'Пользователь 6'),
(7, 'Пользователь 7'),
(8, 'Пользователь 8'),
(9, 'Пользователь 9'),
(10, 'Пользователь 10');

INSERT INTO `posts` (`id`, `ts`, `text`, `topic_id`, `user_id`) VALUES
(1, '2018-10-01 09:51:29', 'some text 1', 1, 1),
(3, '2018-10-02 09:00:00', 'some text 2', 1, 3),
(4, '2018-10-02 09:53:56', 'some text 3', 2, 4),
(5, '2018-10-02 09:55:56', 'some text 4', 2, 5),
(6, '2018-10-03 05:00:56', 'some text 5', 3, 6),
(7, '2018-10-03 09:00:56', 'some text 6', 4, 7),
(8, '2018-10-03 11:53:56', 'some text 7', 4, 8),
(9, '2018-10-04 09:00:56', 'some text 8', 5, 9),
(10, '2018-10-04 10:00:56', 'some text 9', 5, 7),
(11, '2018-10-05 09:00:56', 'some text 10', 5, 8),
(12, '2018-10-01 19:59:29', 'some text 11', 1, 1),
(13, '2018-10-01 13:00:29', 'some text 12', 4, 1),
(14, '2018-10-01 19:59:29', 'some text 13', 5, 10),
(15, '2018-10-01 13:00:29', 'some text 14', 4, 10);
