const axios = require("axios");
const config = require('../configs/api.json');

const { results, seed, page, baseURL } = config;

const http = axios.create({
  baseURL
});

module.exports.loadUsers = async () => {
  const result = await http.get(`?results=${results}&seed=${seed}&page=${page}`);
  const { data: { results: users } } = result;

  return users;
}