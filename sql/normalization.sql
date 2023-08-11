/*

  Нормальные формы:
    - 1
    - 2
    - 3
    - Бойса-Кодда
    - 4
    - 5
    - Доменно-ключевая
    - 6
*/
-- @block 1 NF
-- отношение не в 1 NF
CREATE TABLE workers (
  id INT,
  name TEXT
);
-- отношение в 1 NF
CREATE TABLE workers (
  id INT PRIMARY KEY,
  name TEXT
);
-- @block 2 NF
-- отношение не в 2 NF
CREATE TABLE teachers_to_course (
  teacher_id INT,
  course TEXT,
  teachers_birthday DATE,
  PRIMARY KEY (teacher_id, course)
);
--  отношение в 2 NF
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    teachers_birthday DATE
);
--
CREATE TABLE teachers_to_course (
  teacher_id INT REFERENCES teachers,
  course TEXT,
  PRIMARY KEY (teacher_id, course)
);
-- @block 3 NF
/*
  потенциальный ключ - столбец / группа столбцов по которой можно найти запись (огр. UNIQUE, PRIMARY KEY)

  транзитивная функциональная зависимость - зависимость не только от ключа но и от промежуточного аттрибута

  хорошо:
    id > attr1 
    id > attr2 

  плохо:
    id > attr1 > attr2
    id > attr2
*/
-- отношение не в 3 NF
CREATE TABLE workers (
  id INT PRIMARY KEY,
  name TEXT,
  department TEXT,
  department_phone_number TEXT
);
--
INSERT INTO workers
(name, department, department_phone_number) VALUES
('W1', 'IT', '123-456-789'),
('W2', 'IT', '123-456-789'),
('W3', 'HR', '124-555-777'),
('W4', 'DevOps', '987-321-654'),
('W5', 'HR', '987-321-654');
-- отношение в 3 NF
CREATE TABLE workers (
  id INT PRIMARY KEY,
  department_id INT,
  name TEXT
);
--
CREATE TABLE departments (
  id INT PRIMARY KEY,
  name TEXT,
  department_phone_number TEXT
);