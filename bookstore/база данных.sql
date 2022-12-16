-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 26 2022 г., 11:54
-- Версия сервера: 10.4.25-MariaDB
-- Версия PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bookstore`
--

-- --------------------------------------------------------

--
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `BookID` varchar(50) NOT NULL,
  `BookTitle` varchar(200) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `Price` double(12,2) DEFAULT NULL,
  `Author` varchar(128) DEFAULT NULL,
  `Type` varchar(128) DEFAULT NULL,
  `Image` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`BookID`, `BookTitle`, `ISBN`, `Price`, `Author`, `Type`, `Image`) VALUES
('B-001', 'Стил-Болл-Ран', '123-456-789-1', 799.00, 'ARAKI Hirohiko', 'Манга', 'image/travel.jpg'),
('B-002', 'Человек-Паук', '123-456-789-2', 599.00, 'Dan Slott', 'Комикс', 'image/technical.jpg'),
('B-003', 'Шрек', '123-456-789-3', 329.00, 'Эндрю Адамсон', 'Комикс', 'image/technology.jpg'),
('B-004', 'Дороро\r\n', '123-456-789-4', 495.00, 'Akita Shoten Kodansha ', 'Манга', 'image/food.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `CartID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `BookID` varchar(50) DEFAULT NULL,
  `Price` double(12,2) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TotalPrice` double(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(128) DEFAULT NULL,
  `CustomerPhone` varchar(12) DEFAULT NULL,
  `CustomerIC` varchar(14) DEFAULT NULL,
  `CustomerEmail` varchar(200) DEFAULT NULL,
  `CustomerAddress` varchar(200) DEFAULT NULL,
  `CustomerGender` varchar(10) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerName`, `CustomerPhone`, `CustomerIC`, `CustomerEmail`, `CustomerAddress`, `CustomerGender`, `UserID`) VALUES
(1, 'Дархаев Леонид', '123123123', '123123123', '2424@mail.ru', '123456789', 'Male', NULL),
(3, 'Казанов Егор', '123123123', '123123123', 'test@mail.ru', '123123', 'Male', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `BookID` varchar(50) DEFAULT NULL,
  `DatePurchase` datetime DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TotalPrice` double(12,2) DEFAULT NULL,
  `Status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`OrderID`, `CustomerID`, `BookID`, `DatePurchase`, `Quantity`, `TotalPrice`, `Status`) VALUES
(1, 1, 'B-002', '2022-11-23 18:10:11', 1, 599.00, 'y'),
(2, 1, 'B-003', '2022-11-23 18:10:11', 1, 329.00, 'y'),
(3, 1, 'B-004', '2022-11-23 18:10:11', 1, 75.90, 'y'),
(4, 1, 'B-001', '2022-11-23 18:10:11', 1, 136.00, 'y'),
(5, 1, 'B-004', '2022-11-26 02:22:08', 1, 75.90, 'y'),
(6, 1, 'B-003', '2022-11-26 02:22:08', 1, 329.00, 'y'),
(7, 1, 'B-002', '2022-11-26 02:22:08', 1, 599.00, 'y'),
(8, 1, 'B-001', '2022-11-26 02:22:08', 1, 136.00, 'y'),
(9, NULL, 'B-001', '2022-11-26 16:26:04', 1, 136.00, 'y'),
(10, NULL, 'B-002', '2022-11-26 16:26:04', 1, 599.00, 'y'),
(11, NULL, 'B-003', '2022-11-26 16:26:04', 1, 329.00, 'y'),
(12, NULL, 'B-004', '2022-11-26 16:26:04', 1, 75.90, 'y'),
(13, NULL, 'B-004', '2022-11-26 17:10:10', 1, 75.90, 'y'),
(14, NULL, 'B-003', '2022-11-26 17:10:10', 1, 329.00, 'y'),
(15, NULL, 'B-002', '2022-11-26 17:10:10', 1, 599.00, 'y'),
(16, NULL, 'B-001', '2022-11-26 17:10:10', 1, 136.00, 'y'),
(17, NULL, 'B-001', '2022-11-26 17:10:10', 1, 136.00, 'y'),
(18, NULL, 'B-004', '2022-11-26 17:10:44', 1, 75.90, 'y'),
(19, NULL, 'B-004', '2022-11-26 17:10:54', 1, 75.90, 'y'),
(20, NULL, 'B-004', '2022-11-26 17:11:45', 1, 75.90, 'y'),
(21, NULL, 'B-004', '2022-11-26 17:13:44', 1, 75.90, 'y'),
(22, NULL, 'B-004', '2022-11-26 17:15:59', 1, 75.90, 'y'),
(23, NULL, 'B-004', '2022-11-26 17:17:15', 1, 75.90, 'y'),
(24, NULL, 'B-003', '2022-11-26 17:19:03', 1, 329.00, 'y'),
(25, NULL, 'B-003', '2022-11-26 17:19:28', 9, 2961.00, 'y'),
(26, NULL, 'B-004', '2022-11-26 17:20:18', 1, 75.90, 'y'),
(27, NULL, 'B-002', '2022-11-26 17:20:42', 1, 599.00, 'y'),
(28, NULL, 'B-004', '2022-11-26 17:22:04', 1, 75.90, 'y'),
(29, NULL, 'B-004', '2022-11-26 17:22:37', 1, 75.90, 'y'),
(30, NULL, 'B-004', '2022-11-26 17:23:02', 1, 75.90, 'y'),
(31, NULL, 'B-004', '2022-11-26 17:24:03', 1, 75.90, 'y'),
(32, NULL, 'B-004', '2022-11-26 17:48:00', 1, 75.90, 'y'),
(33, NULL, 'B-004', '2022-11-26 17:48:00', 1, 75.90, 'y'),
(34, NULL, 'B-004', '2022-11-26 17:48:00', 1, 75.90, 'y'),
(35, NULL, 'B-004', '2022-11-26 17:56:23', 1, 495.00, 'y'),
(36, NULL, 'B-004', '2022-11-26 18:00:28', 1, 495.00, 'y'),
(37, NULL, 'B-004', '2022-11-26 18:00:28', 3, 1485.00, 'y'),
(38, NULL, 'B-004', '2022-11-26 18:12:31', 1, 495.00, 'y'),
(39, NULL, 'B-004', '2022-11-26 18:13:17', 1, 495.00, 'y'),
(40, NULL, 'B-004', '2022-11-26 18:13:27', 1, 495.00, 'y'),
(41, NULL, 'B-004', '2022-11-26 18:14:03', 1, 495.00, 'y'),
(42, NULL, 'B-004', '2022-11-26 18:15:33', 1, 495.00, 'y'),
(43, NULL, 'B-004', '2022-11-26 18:18:52', 3, 1485.00, 'y'),
(44, NULL, 'B-004', '2022-11-26 18:20:19', 1, 495.00, 'y'),
(45, 3, 'B-004', '2022-11-26 18:50:26', 1, 495.00, 'y');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(128) DEFAULT NULL,
  `Password` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `Password`) VALUES
(3, 'test', 'test');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BookID`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`CartID`),
  ADD KEY `BookID` (`BookID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `UserID` (`UserID`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `BookID` (`BookID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `CartID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблицы `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
