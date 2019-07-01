-- Решение:

SELECT

-- Выводим только требуемые нам поля с заданными названиями:
-- topic_id,
topics.title as `Тема`,
posts.text   as `Сообщение`,
users.name   as `Автор`,
posts.ts     as `Дата`

-- Получаем требуемые данные:

FROM (

    -- Подсчитываем количество уникальных пользователей в топиках и фильтруем по условию:

    SELECT topic_id, count(topic_id) as user_count
    FROM (

        -- Выбираем всех уникальных пользователей по темам:

        SELECT DISTINCT topic_id, user_id FROM `posts` -- ORDER BY ts DESC

    ) as tmp
    GROUP BY topic_id HAVING user_count > 3

) as found_topics

-- Собираем все необходимые данные вместе:

JOIN posts  USING (topic_id) -- ON found_topics.topic_id = posts.topic_id
JOIN users  ON posts.user_id  = users.id
JOIN topics ON topic_id       = topics.id

-- Оставляем только самые последние (по времени) сообщения полученных тем:

WHERE posts.ts = ( SELECT max(ts) FROM `posts` WHERE posts.topic_id = found_topics.topic_id )

-- Сортируем по времени (сначала самые свежие):

ORDER BY posts.ts DESC

-- Ограничиваем вывод:

LIMIT 10
