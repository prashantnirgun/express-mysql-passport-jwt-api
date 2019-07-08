const { parseResultSet, readBody } = require("../helpers");
//const isAuthenticated = require("../../policies/isAutheticated");
//const model = require("../models/index");
const pool = require("../database");

module.exports = app => {
  app.get("/mobile/item", (req, res) => {
    let sql = "select item_id,item_name, item_group_id, hsn from item";
    pool.query(sql).then(result => {
      res.send(result);
    });
  });
};
