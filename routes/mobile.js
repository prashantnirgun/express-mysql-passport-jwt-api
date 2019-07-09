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

  app.get("/mobile/customer/:id", (req, res) => {
    let sql =
      "select customer_name1, customer_name2, owner_name, contact_person, contact_no1, contact_no2, email, no_of_company, market, wing, gala_no, sms, backup, mobile from tss_bpp_customer where id = " +
      req.params.id;
    pool.query(sql).then(result => {
      res.send(result);
    });
  });
};
