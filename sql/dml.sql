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