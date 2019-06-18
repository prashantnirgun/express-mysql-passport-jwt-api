const mysql = require("mysql");
const util = require("util");
require("dotenv").config();

var pool = mysql.createPool({
  connectionLimit: 100, //important
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  debug: false,
  multipleStatements: true,
  timezone: "+05:30"
});

pool.query = util.promisify(pool.query); // Magic happens here.

module.exports = pool;
