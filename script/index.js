const { Client } = require('pg');
const fs = require('fs/promises');

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

  console.log(users);

  // const usersSqlInserts = users.map((user) => `('${user.firstName}' ,'${user.lastName}','${user.email}', ${user.isMale}, ${user.currentBalance}, ${user.height}, ${user.weight}, '${user.birthday}')`);

  // const userInsertString = usersSqlInserts.join(',');

  // console.log(userInsertString);

  // const { rows } = await client.query(`
  //   INSERT INTO users (
  //     first_name, 
  //     last_name, 
  //     email,
  //     is_male,
  //     current_balance,
  //     height,
  //     weight,
  //     birthday
  //   )
  //   VALUES
  //   ${userInsertString}
  //   RETURNING *
  //   ;
  // `);

  // console.log(rows);

  await client.end();
}

generateData();