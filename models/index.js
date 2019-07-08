const pool = require("../database");
const schema = require("./schema.model");
const { parseResultSet, readBody } = require("../helpers");

module.exports = {
  schema,
  get(params, callback) {
    let sql = queryBuilder(params);
    let rows = 0;
    //console.log("inside model/index/get params", params);
    if (params.total_rows) {
      let sql_new = `SELECT COUNT(${
        schema[params.table].allFields[0]
      }) as total_rows FROM ${params.table}${
        params.where ? " WHERE " + params.where : ""
      }${
        typeof params.soft_delete === "undefined" || params.soft_delete
          ? (params.where ? " AND" : " WHERE") + " deleted_by_user_id = 0"
          : ""
      }`;

      pool.query(sql_new).then(result => {
        rows = parseResultSet(result)[0].total_rows;
        pool
          .query(sql)
          .then(result => {
            let output = params.verbose
              ? { data: result, meta: { sql, total_rows: rows } }
              : { data: result, meta: { total_rows: rows } };

            callback(null, output);
          })
          .catch(error => {
            sqlErrorHandler(error);
            callback(error);
          });
      });
    } else {
      pool
        .query(sql)
        .then(result => {
          let output = params.verbose
            ? { data: result, meta: { sql, total_rows: result.length } }
            : { data: result, meta: { total_rows: result.length } };

          callback(null, output);
        })
        .catch(error => {
          sqlErrorHandler(error);
          callback(error);
        });
    }
  },
  insert(params, callback) {
    let rows = [];

    if (!Array.isArray(params.fields)) {
      rows.push(params.fields);
    } else {
      //its a array
      rows = params.fields;
    }

    params.columns = [];
    specialFields = Object.values(schema[params.table].specialFields);
    specialFields.concat(schema[params.table].protectedFields);
    let fields = schema[params.table].fields;
    //console.log("TCL: insert -> fields", fields);
    let error = [];
    let rowIndex = 0;
    rows.map(row => {
      rowIndex++;
      let keys = Object.keys(row);
      keys.map(key => {
        //Step 01: remove protected columns
        let index = specialFields.indexOf(key);
        if (index >= 0) {
          delete row[key];
          error.push({
            msg: "Column : '" + key + "' is not allowed in row : " + rowIndex,
            code: 400
          });
        } else {
          //Step 02: allow only fields from table
          let found = false;
          found = fields.some(field => {
            if (key === field.name) {
              return true;
            }
          });
          if (!found) {
            delete row[key];
            error.push({
              msg: "Column : '" + key + "' is not allowed row : " + rowIndex,
              code: 400
            });
          }
        }
      });

      //Step 03 : find required columns missing or not
      fields.map(field => {
        if (keys.indexOf(field.name) == -1 && field.required) {
          error.push({
            msg: "Column : '" + field.name + "' is not found row : " + rowIndex,
            code: 400
          });
        }
      });
    });

    let sql = "";
    let created_at_field = "";
    let created_by_field = "";
    //Report validation eror if found
    if (error.length > 0) {
      callback(error, null);
    } else {
      let specialFields = schema[params.table].specialFields;
      if (specialFields.created_at_field) {
        created_at_field = specialFields.created_at_field;
      }

      if (specialFields.created_by_field) {
        created_by_field = specialFields.created_by_field;
      }

      rows.map(row => {
        let columns = Object.keys(row).join(",");
        //adding special columns
        columns += created_by_field.length > 0 ? "," + created_by_field : "";
        columns += created_at_field.length > 0 ? "," + created_at_field : "";

        let values = "'" + Object.values(row).join("','") + "'";
        //addding special columns values
        values += created_by_field.length > 0 ? "," + params.user_id : "";
        values += created_at_field.length > 0 ? ",now()" : "";

        sql = `INSERT INTO ${params.table} (${columns}) VALUES(${values})`;
        //console.log(params);
        console.log(sql);
        rowIndex++;
        //sql = `insert into test values(${rowIndex},'${rowIndex}')`;
        pool
          .query(sql)
          .then(result => {
            if (result.insertId > 0) {
              row.item_id = result.insertId;
            }
            console.log(row);
            //callback(null, { sql});
          })
          .catch(error => {
            sqlErrorHandler(error);
            //callback(error);
          });
      });

      callback(null, { sql });
    }
  },

  delete(params, callback) {
    sql = `UPDATE ${
      params.table
    } SET deleted_at = now(), deleted_by_user_id = ${params.user_id} WHERE ${
      params.where
    }`;
    pool
      .query(sql)
      .then(result => {
        let output = params.verbose
          ? { ...result, sql }
          : { affectedRows: result.affectedRows, message: result.message };

        callback(null, { meta: output });
      })
      .catch(error => {
        sqlErrorHandler(error);
        callback(error);
      });
  },
  update(params, callback) {
    let columns = `updated_at = now(), updated_by_user_id = ${params.user_id}`;
    // filter only valid coumns
    let allColumns = schema[params.table].allFields;
    //getColumnsList(params.table, "all");
    allColumns.map(column => {
      columns = params.fields[column]
        ? `${columns}, ${column} = "${params.fields[column]}"`
        : columns;
    });

    sql = `UPDATE ${params.table} SET ${columns} WHERE ${params.where}`;
    pool
      .query(sql)
      .then(result => {
        let output = params.verbose
          ? { ...result, sql }
          : { affectedRows: result.affectedRows, message: result.message };

        callback(null, { meta: output });
      })
      .catch(error => {
        sqlErrorHandler(error);
        callback(error);
      });
  }
};

let sqlErrorHandler = function(error) {
  console.log("**************Database Errorr Stack Begin****************");
  console.log("error.code", error.code);
  console.log("error.errno", error.errno);
  console.log("error.sql", error.sql);
  console.log("error.sqlState", error.sqlState);
  console.log("error.sqlMessage", error.sqlMessage);
  console.log("**************Database Errorr Stack End****************");
};

/**
 * It remove the protected columns from the 'query' parameters
 * @params {string array} columns [aa,bb]
 * @return {string} valid list of columns
 */
let extractFilelds = function(columns, protectedFields) {
  protectedFields.map(field => {
    let index = columns.indexOf(field);
    if (index >= 0) {
      columns.splice(index, 1);
    }
  });

  return columns;
};

/**
 * It remove the protected columns from the 'query' parameters
 * @params {string array} columns [aa,bb]
 * @return {string} valid list of columns
 */
let allowedFilelds = function(column, allowedFields) {
  //console.log("TCL: allowedFilelds -> allowedFields", allowedFields);
  allowedFields.map(field => {
    console.log("column", column, "field", field.name);
  });

  //return column;
};

function queryBuilder(params) {
  //console.log("params", params.order_by);

  if (params.columns) {
    params.columns = extractFilelds(
      params.columns,
      schema[params.table].protectedFields
    );
  } else {
    //console.log("else", schema[params.table].allFields);
    params.columns = schema[params.table].allFields;
  }
  if (!schema[params.table].soft_delete) {
    params.soft_delete = false;
    //console.log("soft delete is trun off");
  }

  let sql = `SELECT ${params.columns} FROM ${params.table}${
    params.where ? " WHERE " + params.where : ""
  }${
    typeof params.soft_delete === "undefined" || params.soft_delete
      ? (params.where ? " AND" : " WHERE") + " deleted_by_user_id = 0"
      : ""
  }${params.group_by ? " GROUP BY " + params.group_by : ""}${
    params.order_by ? " ORDER BY " + params.order_by : ""
  }${
    params.limit > 0
      ? " LIMIT " +
        (!!params.offset && params.offset ? params.offset : params.limit)
      : ""
  }${params.limit > 0 && params.offset > 0 ? ", " + params.limit : ""}`;

  return sql;
}
