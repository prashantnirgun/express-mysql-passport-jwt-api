const { parseResultSet, readBody } = require("../helpers");
//const isAuthenticated = require("../../policies/isAutheticated");
//const model = require("../models/index");
const pool = require("../database");

module.exports = app => {
  app.get("/mobile/customer", (req, res) => {
    let sql =
      "select id, customer_name1 as name, case market when 'v' then 'Veg' when 'f' then 'Fruit' when 'O' then 'Onion' else 'Retail' end as market, concat(wing,' ', gala_no) as gala_no from tss_bpp_customer";
    pool.query(sql).then(result => {
      res.send(result);
    });
  });
};
