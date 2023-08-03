-- @block insert user in table
INSERT INTO users
VALUES
('user@mail.com', 'User', 'Userenko', '1995-03-23', true, 54648.59);
-- @block custom order user insert
INSERT INTO users
(first_name, last_name, email, is_male, current_balance ,birthday)
VALUES 
('John', 'Doe', 'johnDoe@mail.com', true, 9999.99, '1985-05-17');
-- @block inserting multiple entries
INSERT INTO users
(first_name, last_name, email, is_male, current_balance)
VALUES
('User3', 'Surname3', 'mail3@mail.com', false, 5000),
('User4', 'Surname4', 'mail4@mail.com', NULL, 15000);
-- @block interesting insert
-- INSERT INTO users
-- (first_name, last_name, email, is_male, current_balance ,birthday)
-- VALUES 
-- ('Test', 'Testovich', 'test@test.test', true, 100 ,'1994-08-10'),
-- ('Test', 'Testovich', '', true, 10000 ,'1995-08-10'),
-- ('', '', 'test2@test.test', true, 100 ,'1994-08-10'),
-- ('Test 0', 'Testovich 0', 'test@test.test', true, 100 ,'1994-08-10'),
-- ('Test 1', 'Testovich 1', 'test3@test.test', true, 10000 ,'1004-08-10'),
-- ('Test 2', 'Testovich 2', 'test3@test.test', true, -10000 ,'3004-08-10'),
-- (NULL, NULL, NULL, NULL, NULL ,NULL);
INSERT INTO users
(first_name, last_name, email, is_male, current_balance ,birthday)
VALUES 
('Test', 'Testovich', 'test@test.test', true, 100 ,'1994-08-10'),
('Test', 'Testovich', 'dsadssadadsa@test.test', true, 10000 ,'1995-08-10'),
('teafs', '', 'test22@test.test', true, 100 ,'1994-08-10'),
('Test 0', 'Testovich 0', 'test100@test.test', true, 100 ,'1994-08-10'),
('Test 1', 'Testovich 1', 'test31@test.test', true, 10000 ,'1904-08-10'),
('Test 2', 'Testovich 2', 'test32@test.test', true, 0 ,'2023-08-01'),
('asdsad', 'asdsadsa', 'asdsadsa@test.test', NULL, 0 ,NULL);
-- @block key example
INSERT INTO users
(first_name, last_name, email, is_male, current_balance ,birthday)
VALUES 
('Test', 'Testovich', 'test1@test.test', true, 100 ,'1994-08-10'),
('Test', 'Testovich', 'test2@test.test', true, 100 ,'1994-08-10'),
('Test', 'Testovich', 'test3@test.test', true, 100 ,'1994-08-10'),
('Test', 'Testovich', 'test4@test.test', true, 100 ,'1994-08-10'),
('Test', 'Testovich', 'test5@test.test', true, 100 ,'1994-08-10'),
('Test', 'Testovich', 'test6@test.test', true, 100 ,'1994-08-10'),
('Test', 'Testovich', 'test7@test.test', true, 100 ,'1994-08-10'),
('Test', 'Testovich', 'test8@test.test', true, 100 ,'1994-08-10'),
('Test', 'Testovich', 'test9@test.test', true, 100 ,'1994-08-10');
-- @block update data in table
UPDATE users SET mass = 50; -- обновляет значения каждой записи
-- поставить всем юзерам с id 7 дату рождния 1996-11-11
UPDATE users SET birthday = '1996-11-11' WHERE id = 7; 
-- поставить всем мужчинам вес 120
UPDATE users SET mass = 120 WHERE is_male;
-- апдейт нескольки полей одновременно
UPDATE users SET first_name = 'Anton', last_name = 'Bogun' WHERE id = 1;
-- при обновлении доступны старые значения
UPDATE users SET mass = mass + 5 WHERE is_male;
-- @block delete data in table
-- удаление всех записей в таблице
DELETE FROM users;
-- удаление конкретной записи
DELETE FROM users WHERE id = 7;