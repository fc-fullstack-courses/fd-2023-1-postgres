const { Client } = require('pg');
const fs = require('fs/promises');
const { loadUsers } = require('./api/index');
const { generateUsersSql } = require('./utils/users');

const config = {
  user: 'postgres', // default process.env.PGUSER || process.env.USER
  password: 'postgres', //default process.env.PGPASSWORD
  host: 'localhost', // default process.env.PGHOST
  port: 5432, // default process.env.PGPORT
  database: 'fd_2023_1_first_pg_db_1', // default process.env.PGDATABASE || user
}

const client = new Client(config);

async function generateData() {
  const resetDbString = await fs.readFile(`./script/reset_db.sql`, { encoding: 'utf-8' });

  await client.connect();

  await client.query(resetDbString);

  const users = await loadUsers();

  const userInsertString = generateUsersSql(users);

  const { rows } = await client.query(`
    INSERT INTO users (
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

  await client.end();
}

generateData();