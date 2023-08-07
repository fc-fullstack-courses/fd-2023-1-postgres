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

-- @block bad aggregation usage
SELECT is_male, avg(height) AS "Average height"
FROM users;

-- @block average female height
SELECT avg(height) "Average height"
FROM users
WHERE NOT is_male;

-- @block average male height
SELECT avg(height) "Average height"
FROM users
WHERE is_male;

-- @block average height for both genders
SELECT is_male, avg(height) "Average height"
FROM users
GROUP BY is_male;