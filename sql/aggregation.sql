/*
  функции, которые на основании множества записей получают единственный результат

    - avg - ищет среднее арифметическое
    - min
    - max
    - sum () - максимально приближена к arr.reduce в js при работе с числами
    - count  - количество строк (кортежей)
*/

-- @block min height
SELECT min( height ) AS "Min height"
FROM users;

-- @block max height
SELECT max( height ) AS "Max height"
FROM users;

-- @block avg height
SELECT avg( height ) AS "Average height"
FROM users;

-- @block count users
SELECT count(*) FROM users
WHERE height = 0.32;