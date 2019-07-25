//const { parseResultSet, readBody } = require("../helpers");
//const isAuthenticated = require("../../policies/isAutheticated");
//const model = require("../models/index");
const pool = require("../database");

module.exports = app => {
  app.get("/mobile/customer", (req, res) => {
    let sql = `select id, customer_name1 as name, 
      case market when 'v' then 'Veg' when 'f' then 'Fruit' when 'O' then 'Onion' else 'Retail' end as market, 
      concat(wing,' ', gala_no) as gala_no 
      from tss_bpp_customer 
      where deleted_by_user_id = 0`;

    pool.query(sql).then(result => {
      res.send(result);
    });
  });

  app.get("/mobile/customer/:id", (req, res) => {
    let sql = `select customer_name1, customer_name2, owner_name, contact_person, contact_no1, 
      contact_no2, email, no_of_company, market, wing, gala_no, sms, backup, mobile 
      from tss_bpp_customer where id = ${
        req.params.id
      } AND deleted_by_user_id = 0`;

    pool.query(sql).then(result => {
      res.send(result[0]);
    });
  });

  app.get("/mobile/customer-company-list/:customer_id", (req, res) => {
    let sql = `select co_id, company_name, starting_year, current_year, company_status 
      from tss_bpp_company 
      where customer_id = ${req.params.customer_id} AND deleted_by_user_id = 0`;

    pool.query(sql).then(result => {
      res.send(result);
    });
  });

  9892173659;
  9867750798;
  9224171131;
  app.get("/mobile/customer-company/:customer_id/:co_id", (req, res) => {
    let sql = `select id, branch_id, co_id, current_year, 
      company_name, starting_year, patti_dw, patti_format_dw, memo_dw, memo_format_dw,
      sale_bill, sale_challan, font, language, company_status 
      from tss_bpp_company 
      where customer_id = ${req.params.customer_id} AND 
      co_id = ${req.params.co_id} AND deleted_by_user_id = 0`;

    pool.query(sql).then(result => {
      res.send(result);
    });
  });

  app.post("/mobile/customerSearch/", (req, res) => {
    const { customerName, galaNo, apmc, wing } = req.body;
    let nameWhere = "";
    let galaNoWhere = "";
    let apmcWhere = "";
    let wingWhere = "";

    if (customerName) {
      nameWhere = `${
        customerName.length > 1
          ? "customer_name1 like '%" + customerName + "%'"
          : ""
      }`;
    }

    if (galaNo) {
      galaNoWhere = `${
        galaNo.length > 1 ? "gala_no like '%" + galaNo + "%'" : ""
      }`;
    }

    if (apmc) {
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
    }

    if (wing) {
      wingWhere = `${
        wing.length > 0 && wing !== "All" ? "wing like '%" + wing + "%'" : ""
      }`;
    }

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
