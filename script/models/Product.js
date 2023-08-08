const { generateProducts } = require("../utils/products");

module.exports = class Product {
  static _client;
  static _tableName = 'products';

  static async bulkCreate(amount) {

    const { rows: insertedProducts } = await Product._client.query(`
      INSERT INTO ${Product._tableName} (
        name, 
        category, 
        description,
        manufacturer,
        price,
        quantity
      )
      VALUES
      ${generateProducts(amount)}
      RETURNING *
      ;
    `);

    return insertedProducts;
  }

}