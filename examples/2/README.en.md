# Selection of a list of topics from the public forum

> Сменить язык: [![Русский](../../docs/assets/images/ru.gif)](README.md) [![English](../../docs/assets/images/en.gif)](README.en.md)

## Initial data

The database scheme for a simple public forum is given (without administration).
The forum can have sections, topics, text messages (each message belongs to some user).

DB structure:
```
(forum)
Разделы (partitions)
         - id
         - title
  Темы (topics)
         - id
         - title
         - partition_id
     Сообщения (posts)
        - id
        - text
        - topic_id
        - user_id
        - ts
     
Пользователи (users)
               - id
               - name
```

## The task

Write a SQL query that returns a list of the last 10 topics (by time)
with their latest post and its author, in which more than 3 users have written.
 
The result must contain: `тема | сообщение | автор | дата`

## Solution

[SQL query](solution.sql)

[To try in action](https://www.db-fiddle.com/f/inLW2mNdtD3bneUrCKkYAf/7)