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
    sql = `INSERT INTO ${
      params.table
    } SET deleted_at = now(), deleted_by_user_id = ${params.user_id}`;
    callback(null, { meta: { sql } });
    /*
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
      */
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

let extractFilelds = function(columns, extractedFields) {
  extractedFields.map(field => {
    let index = columns.indexOf(field);
    if (index >= 0) {
      columns.splice(index, 1);
    }
  });

  return columns;
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
