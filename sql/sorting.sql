/*
  ORDER BY - сортировка

  ASC - восходящая (от меньшего к большему)
  DESC - нисходящая (от большего к меньшему)
*/

-- @block показать пользователей сортируя по их балансу
SELECT * FROM users
ORDER BY current_balance DESC;

-- @block сортиуем росту восходящий, по дате рождения нисходящая
SELECT * FROM users
ORDER BY height ASC, birthday DESC;
