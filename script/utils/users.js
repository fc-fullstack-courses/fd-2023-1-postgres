const _ = require('lodash');

function generateUserInsert(user) {

  const { name: { first, last }, email, gender, dob: { date } } = user;

  const currentBalance = _.random(100, 50000);
  const height = _.random(0.3, 3, true);
  const weight = _.random(50, 160, true);

  return `('${first}' ,'${last}','${email}', ${gender === 'male'}, ${currentBalance}, ${height}, ${weight}, '${date}')`
}

const generateUsersSql = (users) => users.map((user) => generateUserInsert(user)).join(',');

module.exports.generateUserInsert = generateUserInsert;
module.exports.generateUsersSql = generateUsersSql;