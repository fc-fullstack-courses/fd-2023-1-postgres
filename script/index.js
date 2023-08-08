const fs = require('fs/promises');
const _ = require('lodash');
const { loadUsers } = require('./api/index');
const { orders: { chanceToMakeOrder } } = require('./configs/generation.json');
const { client, User, Product, Order } = require('./models');
const { generateProductsToOrders } = require('./utils/orders');

async function generateData() {
  const resetDbString = await fs.readFile(`./script/reset_db.sql`, { encoding: 'utf-8' });

  await client.connect();

  await client.query(resetDbString);

  const users = await loadUsers();

  const insertedUsers = await User.bulkCreate(users);

  const products = await Product.bulkCreate();

  const orderingUsers = insertedUsers.filter(
    () => _.random(0, 100) <= chanceToMakeOrder
  );

  const orders = await Order.bulkCreate(orderingUsers);

  const { rows: productsToOrdersResult } = await client.query(`
    INSERT INTO products_to_orders (
      product_id,
      order_id,
      quantity
    ) VALUES
    ${generateProductsToOrders({ orders, products })}
    RETURNING *
    ;
  `);

  await client.end();
}

generateData();