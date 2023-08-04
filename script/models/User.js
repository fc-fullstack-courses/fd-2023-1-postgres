const { generateUsersSql } = require("../utils/users");

module.exports = class User {
  static _client;
  static _tableName = 'users';

  static async bulkCreate(users) {

    const userInsertString = generateUsersSql(users);

    const { rows: insertedUsers } = await User._client.query(`
      INSERT INTO ${User._tableName} (
        first_name, 
        last_name, 
        email,
        is_male,
        current_balance,
        height,
        weight,
        birthday
      )
      VALUES
      ${userInsertString}
      RETURNING *
      ;
    `);

    return insertedUsers;
  }

  static async findAll() {
    const { rows: users } = await User._client.query(`SELECT * FROM ${User._tableName};`)

    return users;
  }

  static async findByPk (id) {
    const { rows: users } = await User._client.query(`
    SELECT * FROM ${User._tableName}
    WHERE id = ${id};`)

    return users[0];
  }
}