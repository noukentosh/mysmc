--
-- База данных: `mysmc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `mysmc_articles`
--

CREATE TABLE `mysmc_articles` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `date` date NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mysmc_articles`
--

INSERT INTO `mysmc_articles` (`id`, `title`, `date`, `content`) VALUES
(1, 'Добро пожаловать!', '2016-05-30', '<div style="text-align: center;">\r\n  <h1>Добро пожаловать в MYSMC!</h1>\r\n  <p style="text-align: center;">Если вы сдесь впервые, то рекомендуем вам ознакомится с документацией на сайте <a href="http://noukentosh.xyz/mysmc/docs">тут</a>.</p>\r\n</div>');

-- --------------------------------------------------------

--
-- Структура таблицы `mysmc_comments`
--

CREATE TABLE `mysmc_comments` (
  `id` int(11) NOT NULL,
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `email` text NOT NULL,
  `subject` text NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mysmc_manage`
--

CREATE TABLE `mysmc_manage` (
  `id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  `content` int(11) NOT NULL,
  `module` text NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mysmc_manage`
--

INSERT INTO `mysmc_manage` (`id`, `position`, `page`, `content`, `module`, `title`) VALUES
(1, 1, 2, 1, 'slider', 'Слайдер'),
(2, 2, 2, 1, 'article', 'Добро пожаловать!');

-- --------------------------------------------------------

--
-- Структура таблицы `mysmc_menu`
--

CREATE TABLE `mysmc_menu` (
  `id` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `name` text NOT NULL,
  `title` text NOT NULL,
  `link` text NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mysmc_menu`
--

INSERT INTO `mysmc_menu` (`id`, `parent`, `name`, `title`, `link`, `position`) VALUES
(1, -1, 'Главная', 'Главная', '##page_2', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `mysmc_news`
--

CREATE TABLE `mysmc_news` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mysmc_pages`
--

CREATE TABLE `mysmc_pages` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `module` text NOT NULL,
  `title` text NOT NULL,
  `alias` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mysmc_pages`
--

INSERT INTO `mysmc_pages` (`id`, `name`, `module`, `title`, `alias`) VALUES
(1, 'Панель управления', 'control_panel', 'Панель управления', 'admin'),
(2, 'Главная', 'mainpage', 'Главная', '/');

-- --------------------------------------------------------

--
-- Структура таблицы `mysmc_slider`
--

CREATE TABLE `mysmc_slider` (
  `id` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `image` text NOT NULL,
  `caption` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mysmc_slider`
--

INSERT INTO `mysmc_slider` (`id`, `parent`, `image`, `caption`, `description`) VALUES
(1, 1, 'http://profmuseum.ru/wp-content/themes/empire/functions/thumb.php?src=wp-content/uploads/2013/08/1.jpg&w=936&h=400&zc=1&q=90?1464637613774', 'Санкт-Петербургский', 'Музей профессионального образования'),
(2, 1, 'http://profmuseum.ru/wp-content/themes/empire/functions/thumb.php?src=wp-content/uploads/2013/08/DSC07305d-1024x685.jpg&w=936&h=400&zc=1&q=90', 'Санкт-Петербургский', 'Музей профессионального образования'),
(3, 1, 'http://profmuseum.ru/wp-content/themes/empire/functions/thumb.php?src=wp-content/uploads/2013/10/DSC07216d.jpg&w=936&h=400&zc=1&q=90', 'Санкт-Петербургский', 'Музей профессионального образования'),
(4, 1, 'http://profmuseum.ru/wp-content/themes/empire/functions/thumb.php?src=wp-content/uploads/2013/08/5.jpg&w=936&h=400&zc=1&q=90', 'Санкт-Петербургский', 'Музей профессионального образования'),
(5, 1, 'http://profmuseum.ru/wp-content/themes/empire/functions/thumb.php?src=wp-content/uploads/2013/08/41.jpg&w=936&h=400&zc=1&q=90', 'Санкт-Петербургский', 'Музей профессионального образования'),
(6, 1, 'http://profmuseum.ru/wp-content/themes/empire/functions/thumb.php?src=wp-content/uploads/2013/08/31.jpg&w=936&h=400&zc=1&q=90', 'Санкт-Петербургский', 'Музей профессионального образования');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `mysmc_articles`
--
ALTER TABLE `mysmc_articles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mysmc_comments`
--
ALTER TABLE `mysmc_comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mysmc_manage`
--
ALTER TABLE `mysmc_manage`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mysmc_menu`
--
ALTER TABLE `mysmc_menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mysmc_news`
--
ALTER TABLE `mysmc_news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mysmc_pages`
--
ALTER TABLE `mysmc_pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mysmc_slider`
--
ALTER TABLE `mysmc_slider`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `mysmc_articles`
--
ALTER TABLE `mysmc_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `mysmc_comments`
--
ALTER TABLE `mysmc_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `mysmc_manage`
--
ALTER TABLE `mysmc_manage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `mysmc_menu`
--
ALTER TABLE `mysmc_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `mysmc_news`
--
ALTER TABLE `mysmc_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `mysmc_pages`
--
ALTER TABLE `mysmc_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `mysmc_slider`
--
ALTER TABLE `mysmc_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
