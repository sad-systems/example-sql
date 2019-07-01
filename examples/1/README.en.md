# Find intervals of a sequence of numbers

> Сменить язык: [![Русский](../../docs/assets/images/ru.gif)](README.md) [![English](../../docs/assets/images/en.gif)](README.en.md)

## The task

Table test1 was filled with consecutive positive integers (from 1 to n),
and then some of them are deleted randomly.
It is necessary to write a SQL query that would display the intervals in which the numbers are missing.

Source schema and data:

```
CREATE TABLE test1 (
  id INT NOT NULL PRIMARY KEY
);

INSERT INTO test1 (id) VALUES (1), (2), (3), (6), (8), (9), (12);
```

The result must be like this:

```
FROM | TO
3    | 6
6    | 8
9    | 12
```

## Solution

  1. Find all the numbers (id) after which the sequence is broken
  2. Create a table of intervals (from two columns): id, next_id (from, to)
  3. Join the table 1 and 2

[SQL query](solution.sql)

[To try in action](https://www.db-fiddle.com/f/cR9JumAswjAyZpgYgerJiE/0)