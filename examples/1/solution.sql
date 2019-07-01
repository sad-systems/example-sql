-- Решение:

-- 1. Находим все числа (id) после которых разрывается последовательность:
-- SELECT id as `FROM` FROM test1 WHERE id NOT IN ( SELECT t1.id FROM test1 as t1, test1 as t2 WHERE t1.id = (t2.id - 1) )

-- 2. Создаём таблицу интервалов (из двух столбцов): id, next_id (from, to)
-- SELECT t1.id as `id`, min(t2.id) as next_id FROM test1 as t1, test1 as t2 WHERE t2.id > t1.id GROUP BY t1.id

-- 3. Соединяем таблицу 1 и 2:

SELECT id AS `FROM`, next_id AS `TO`
FROM (
        -- Таблица интервалов:
        SELECT t1.id as `id`, min(t2.id) as next_id FROM test1 as t1, test1 as t2 WHERE t2.id > t1.id GROUP BY t1.id

     ) AS IntervalTable

WHERE  id IN (

    -- Числа после которых происходит разрыв последовательности:
    SELECT id as `FROM`
    FROM   test1
    WHERE  id NOT IN (

        -- Числа после которых последовательность не прерывается:
        SELECT t1.id FROM test1 as t1, test1 as t2 WHERE t1.id = (t2.id - 1)

    )

)