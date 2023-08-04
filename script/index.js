import pg from 'pg';
import fs from 'fs/promises';
const { Client } = pg;

const config = {
  user: 'postgres', // default process.env.PGUSER || process.env.USER
  password: 'postgres', //default process.env.PGPASSWORD
  host: 'localhost', // default process.env.PGHOST
  port: 5432, // default process.env.PGPORT
  database: 'fd_2023_1_first_pg_db_1', // default process.env.PGDATABASE || user
}

const client = new Client(config);

const resetDbString = await fs.readFile(`./script/reset_db.sql`, { encoding: 'utf-8' });

await client.connect();

await client.query(resetDbString);

const { rows } = await client.query(`
  SELECT * FROM users;
`);

console.log(rows);

await client.end();