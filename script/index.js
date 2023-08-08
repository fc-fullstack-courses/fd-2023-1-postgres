const fs = require('fs/promises');
const { loadUsers } = require('./api/index');
const { client, User, Product } = require('./models');

async function generateData() {
  const resetDbString = await fs.readFile(`./script/reset_db.sql`, { encoding: 'utf-8' });

  await client.connect();

  await client.query(resetDbString);

  const users = await loadUsers();

  await User.bulkCreate(users);

  await Product.bulkCreate();

  await client.end();
}

generateData();