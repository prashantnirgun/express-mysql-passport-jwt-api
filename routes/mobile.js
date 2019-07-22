const { parseResultSet, readBody } = require("../helpers");
//const isAuthenticated = require("../../policies/isAutheticated");
//const model = require("../models/index");
const pool = require("../database");

module.exports = app => {
  app.get("/mobile/customer", (req, res) => {
    let sql =
      "select id, customer_name1 as name, case market when 'v' then 'Veg' when 'f' then 'Fruit' when 'O' then 'Onion' else 'Retail' end as market, concat(wing,' ', gala_no) as gala_no from tss_bpp_customer where deleted_by_user_id = 0";
    pool.query(sql).then(result => {
      res.send(result);
    });
  });

  app.get("/mobile/customer/:id", (req, res) => {
    let sql =
      "select customer_name1, customer_name2, owner_name, contact_person, contact_no1, contact_no2, email, no_of_company, market, wing, gala_no, sms, backup, mobile from tss_bpp_customer where id = " +
      req.params.id;
    let output = {};
    pool.query(sql).then(result => {
      output.customer = result[0];
      sql =
        "select co_id, company_name, starting_year, current_year from tss_bpp_company where customer_id = " +
        req.params.id;
      pool.query(sql).then(result => {
        output.company = result;
        res.send(output);
      });
    });
  });

  app.post("/mobile/customerSearch/", (req, res) => {
    const { customerName, galaNo, apmc, wing } = req.body;
    let nameWhere = `${
      customerName.length > 1
        ? "customer_name1 like '%" + customerName + "%'"
        : ""
    }`;

    let galaNoWhere = `${
      galaNo.length > 1 ? "gala_no like '%" + galaNo + "%'" : ""
    }`;

    let apmcWhere = "";
    switch (apmc) {
      case "Veg":
        apmcWhere = 'market = "V"';
        break;
      case "Fruit":
        apmcWhere = 'market = "F"';
        break;
      case "Retail":
        apmcWhere = 'market = "R"';
        break;
      default:
        apmcWhere = "";
        break;
    }

    let wingWhere = `${
      wing.length > 0 && wing !== "All" ? "wing like '%" + wing + "%'" : ""
    }`;

    let whereCondition = `${nameWhere.length > 1 ? nameWhere : ""}${
      nameWhere.length > 1 && galaNoWhere.length > 1 ? " AND " : ""
    }${galaNoWhere.length > 1 ? galaNoWhere : ""}`;

    whereCondition += `${
      whereCondition.length > 1 && apmcWhere.length > 1 ? " AND " : ""
    }${apmcWhere.length > 1 ? apmcWhere : ""}`;

    whereCondition += `${
      whereCondition.length > 1 && wingWhere.length > 1 ? " AND " : ""
    }${wingWhere.length > 1 ? wingWhere : ""}`;

    whereCondition += `${
      whereCondition.length > 1 ? " AND " : ""
    }deleted_by_user_id = 0`;

    //res.send({ whereCondition, nameWhere, galaNoWhere, apmcWhere, wingWhere });

    let sql =
      "select id, customer_name1 as name, case market when 'v' then 'Veg' when 'f' then 'Fruit' when 'O' then 'Onion' else 'Retail' end as market, concat(wing,' ', gala_no) as gala_no from tss_bpp_customer WHERE " +
      whereCondition;
    console.log(sql);
    pool
      .query(sql)
      .then(result => {
        res.send(result);
      })
      .catch(err => {
        console.log("error", err);
      });
  });
};
