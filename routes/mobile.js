const { parseResultSet } = require("../helpers");
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
    let sql = `select id,general_ledger_id,customer_name1,customer_name2,owner_name,
    contact_person,contact_no1,contact_no2,email,
    no_of_company,sms,backup,mobile,market,wing,gala_no,market,wing,gala_no,
    office_address1,office_address2,office_address3,
    residence_address1,residence_address2,residence_address3 
      from tss_bpp_customer where id = ${
        req.params.id
      } AND deleted_by_user_id = 0`;

    pool.query(sql).then(result => {
      res.send(result[0]);
    });
  });

  app.post("/mobile/customer/:id", (req, res) => {
    let {
      general_ledger_id,
      customer_name1,
      customer_name2,
      owner_name,
      contact_person,
      contact_no1,
      contact_no2,
      email,
      no_of_company,
      sms,
      backup,
      mobile,
      market,
      wing,
      gala_no,
      office_address1,
      office_address2,
      office_address3,
      residence_address1,
      residence_address2,
      residence_address3
    } = req.body;
    let id = req.params.id;
    let sql = "";
    if (parseInt(id) === 0) {
      sql = `INSERT tss_bpp_customer
      (id, general_ledger_id, customer_name1, customer_name2, owner_name,
      contact_person, contact_no1, contact_no2, email,
      no_of_company, sms, backup, mobile, market, wing, gala_no,
      office_address1, office_address2, office_address3,
      residence_address1, residence_address2, residence_address3,
      created_at, created_by_user_id, updated_at, updated_by_user_at, deleted_at, deleted_by_user_id)
      VALUES(${id}, ${general_ledger_id}, '${customer_name1}', '${customer_name2}', '${owner_name}',
      '${contact_person}', '${contact_no1}', '${contact_no2}', '${email}',
      ${no_of_company}, '${sms}', '${backup}', '${mobile}', '${market}', '${wing}', '${gala_no}',
      '${office_address1}', '${office_address2}', '${office_address3}',
      '${residence_address1}', '${residence_address2}', '${residence_address3}',
      now(),1, null,null, null, 0)`;
    } else {
      sql = `UPDATE tss_bpp_customer
      SET general_ledger_id = ${general_ledger_id},
      customer_name1 = '${customer_name1}',
      customer_name2 = '${customer_name2}',
      owner_name = '${owner_name}',
      contact_person = '${contact_person}',
      contact_no1 = '${contact_no1}',
      contact_no2 = '${contact_no2}',
      email = '${email}',
      no_of_company = ${no_of_company},
      sms = '${sms}',
      backup = '${backup}',
      mobile = '${mobile}',
      market = '${market}',
      wing = '${wing}',
      gala_no = '${gala_no}',
      office_address1 = '${office_address1}',
      office_address2 = '${office_address2}',
      office_address3 = '${office_address3}',
      residence_address1 = '${residence_address1}',
      residence_address2 = '${residence_address2}',
      residence_address3 = '${residence_address3}', updated_at = now()
      where id = ${id} `;
    }

    pool.query(sql).then(result => {
      //console.log(result);
      res.send(result);
    });
  });

  app.get("/mobile/customer-company-list/:customer_id", (req, res) => {
    let sql = `select id, co_id, company_name, starting_year, current_year, company_status 
      from tss_bpp_company 
      where customer_id = ${req.params.customer_id} AND deleted_by_user_id = 0`;

    pool.query(sql).then(result => {
      res.send(result);
    });
  });

  app.get("/mobile/company/:id", (req, res) => {
    let sql = `select id, branch_id, co_id, current_year, 
      company_name, starting_year, patti_dw, patti_format_dw, memo_dw, memo_format_dw,
      sale_bill, sale_challan, font, language, company_status 
      from tss_bpp_company 
      where id = ${req.params.id} AND deleted_by_user_id = 0`;

    pool.query(sql).then(result => {
      res.send(result);
    });
  });

  app.post("/mobile/company", (req, res) => {
    let {
      id,
      co_id,
      branch_id,
      current_year,
      company_name,
      starting_year,
      patti_dw,
      patti_format_dw,
      memo_dw,
      memo_format_dw,
      sale_bill,
      sale_challan,
      font,
      language,
      company_status
    } = req.body;
    let sql = "";

    if (parseInt(id) === 0) {
      sql = `INSERT tss_bpp_company 
      (id, co_id, branch_id, current_year, company_name, starting_year, 
      patti_dw, patti_format_dw, memo_dw, memo_format_dw, 
      sale_bill, sale_challan, font, language, company_status,
      created_at, created_by_user_id, updated_at, updated_by_user_at, deleted_at, deleted_by_user_id)
      VALUES(${id}, ${co_id}, 1, ${current_year}, '${company_name}', '${starting_year}',
      '${patti_dw}', '${patti_format_dw}', '${memo_dw}', '${memo_format_dw}',
      '${sale_bill}', '${sale_challan}', '${font}', '${language}', '${company_status}),
      now(),1, null,null, null, 0)`;
    } else {
      sql = `UPDATE tss_bpp_company 
      SET co_id = ${co_id}, current_year = ${current_year}, company_name = '${company_name}', 
      starting_year = '${starting_year}', patti_dw = '${patti_dw}', patti_format_dw = '${patti_format_dw}', 
      memo_dw = '${memo_dw}', memo_format_dw = '${memo_format_dw}', sale_bill = '${sale_bill}', 
      sale_challan = '${sale_challan}', font = '${font}', language = '${language}', 
      company_status = '${company_status}', updated_at = now()
      where id = ${id} `;
    }
    //console.log(sql);

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

    pool
      .query(sql)
      .then(result => {
        res.send(result);
      })
      .catch(err => {
        console.log("error", err);
      });
  });

  app.post("/mobile/attendance", (req, res) => {
    let {
      employee_id,
      attendance_date,
      time,
      latitude,
      longitude,
      method,
      day_status
    } = req.body;
    let sql = "";

    sql = `SELECT check_in, check_out, day_status FROM attendance WHERE employee_id = ${employee_id} AND attendance_date = '${attendance_date}'`;

    pool.query(sql).then(result => {
      let data = parseResultSet(result);

      if (result.length === 0) {
        sql = `INSERT attendance
        (id, employee_id, attendance_date, check_in, check_out, check_in_latitude, check_in_longitude,
        check_out_latitude, check_out_longitude, hours, day_status)
        VALUES(0, ${employee_id}, '${attendance_date}', 
        ${method === "I" ? "'" + time + "'" : null}, 
        ${method === "O" ? "'" + time + "'" : null}, 
        ${method === "I" ? latitude : null},
        ${method === "I" ? longitude : null},
        ${method === "O" ? latitude : null},
        ${method === "O" ? longitude : null},
        0, '${day_status}')`;

        pool
          .query(sql)
          .then(result => {
            res.send(result);
          })
          .catch(error => {
            res.status(400).send({ error: "server side error" });
          });
      } else {
        if (
          (method === "I" && !isNaN(parseFloat(data[0].check_in))) ||
          (method === "O" && !isNaN(parseFloat(data[0].check_out)))
        ) {
          console.log("already check out", data[0].check_out);
          res.send("one");
          return;
        } else {
          console.log("else");
          sql = `UPDATE attendance
        SET ${method === "I" ? "check_in" : "check_out"} = '${time}', 
        ${
          method === "I" ? "check_in_latitude" : "check_out_latitude"
        } = ${latitude},
        ${
          method === "I" ? "check_in_longitude" : "check_out_longitude"
        } = ${longitude}
        WHERE employee_id = ${employee_id} AND attendance_date = '${attendance_date}'`;
        }
        console.log("sql", sql);

        pool
          .query(sql)
          .then(result => {
            res.send(result);
          })
          .catch(error => {
            res.status(400).send({ error: "server side error" });
          });
      }
    });
  });

  app.get("/mobile/attendance", (req, res) => {
    let { employee_id, start_date, end_date, day_status } = req.query;

    console.log("query param", employee_id, start_date, end_date, day_status);
    let sql = `SELECT id, DATE_FORMAT(attendance_date,'%d %M %Y') AS date, TIME_FORMAT(check_in, '%h:%i %p') as check_in, 
    TIME_FORMAT(check_out,'%h:%i %p') as check_out, TIME_FORMAT(hours, '%h:%i') as hours, day_status,
    check_in_latitude, check_in_longitude, check_out_latitude, check_out_longitude
    FROM attendance 
    WHERE employee_id = ${employee_id}  AND attendance_date BETWEEN '${start_date}' AND '${end_date}' 
    ${
      day_status === "X" ? "" : ' AND day_status = "' + day_status + '"'
    } ORDER BY attendance_date desc, id`;

    console.log(sql);
    pool.query(sql).then(result => {
      //console.log("=======data=======");
      //console.log(result);
      res.send(result);
    });
  });

  app.get("/mobile/attendance-summary", (req, res) => {
    let { employee_id, start_date, end_date } = req.query;

    console.log("query param", employee_id, start_date, end_date);
    let sql = `SELECT DATE_FORMAT(attendance_date, '%M-%Y') as month, COUNT(id) AS total,
    SUM(if(day_status = 'A',1,0)) AS Absent, SUM(if(day_status = 'S',1,0)) AS Sunday,
    SUM(if(day_status = 'P',1,0)) AS Present, SUM(if(day_status = 'H',1,0)) AS Holiday
    FROM attendance 
    WHERE employee_id = ${employee_id}  AND attendance_date BETWEEN '${start_date}' AND '${end_date}'
    GROUP BY year(attendance_date), month(attendance_date) 
    ORDER BY attendance_date desc`;

    //console.log(sql);
    pool.query(sql).then(result => {
      res.send(result);
    });
  });
  08246614102;
};
