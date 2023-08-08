const { generateOrders } = require("../utils/orders");

module.exports = class Order {
  static _client;
  static _tableName = 'orders';

  static async bulkCreate(users) {

    const { rows: orders } = await Order._client.query(`
      INSERT INTO ${Order._tableName} (
        user_id
      )
      VALUES
      ${generateOrders(users)}
      RETURNING *
      ;
    `);

    return orders;
  }

}