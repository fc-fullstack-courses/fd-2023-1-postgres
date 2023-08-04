const _ = require('lodash');
const generationConfig = require('../configs/generation.json');

const { users: { minBalance, maxBalance, isBalanceFloating, minHeight, maxHeight, isHeightFloating, minWeight, maxWeight, isWeightFloating } } = generationConfig;

function generateUserInsert(user) {

  const { name: { first, last }, email, gender, dob: { date } } = user;

  const currentBalance = _.random(minBalance, maxBalance, isBalanceFloating);
  const height = _.random(minHeight, maxHeight, isHeightFloating);
  const weight = _.random(minWeight, maxWeight, isWeightFloating);

  return `('${first}' ,'${last}','${email}', ${gender === 'male'}, ${currentBalance}, ${height}, ${weight}, '${date}')`
}

const generateUsersSql = (users) => users.map((user) => generateUserInsert(user)).join(',');

module.exports.generateUserInsert = generateUserInsert;
module.exports.generateUsersSql = generateUsersSql;