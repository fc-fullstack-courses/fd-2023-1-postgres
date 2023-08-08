const fs = require('fs/promises');
const _ = require('lodash');
const { loadUsers } = require('./api/index');
const { orders: { chanceToMakeOrder } } = require('./configs/generation.json');
const { client, User, Product, Order } = require('./models');
const { generateProductsToOrders } = require('./utils/orders');
const { generateReviewsMap, generateReviews, generateRatings } = require('./utils/reviewsRatings');

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

  const reviewsMap = generateReviewsMap(orders, productsToOrdersResult);

  await client.query(`
  BEGIN;
  
  INSERT INTO reviews
  (user_id, product_id, rating_id, body)
  VALUES ${generateReviews(reviewsMap)};
  
  INSERT INTO ratings
  (review_id, rating)
  VALUES ${generateRatings(reviewsMap)};
  
  COMMIT;
  `);

  await client.end();
}

generateData();