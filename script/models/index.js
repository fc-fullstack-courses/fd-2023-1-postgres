const { Client } = require('pg');
const config = require('../configs/db.json');
const User = require('./User');
const Product = require('./Product');
const Order = require('./Order');

const client = new Client(config);

User._client = client;
Product._client = client;
Order._client = client;

module.exports = {
  client,
  User,
  Product,
  Order
}