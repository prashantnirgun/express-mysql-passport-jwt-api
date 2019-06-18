const express = require("express");
const api = express.Router();
const authController = require("../Controllers/authController");
const pool = require("../database");
const jwt = require("jsonwebtoken");
const config = require("../config/config");
const util = require("util");
const { parseResultSet } = require("../helpers");

function jwtSignUser(user) {
  try {
    const ONE_WEEK = 60 * 60 * 24 * 7;
    return jwt.sign(user, config.authentication.jwtSecret, {
      expiresIn: ONE_WEEK
    });
  } catch (error) {
    console.log("token sign error", error);
  }
}

api.post("register", (req, res) => {
  console.log("inside register route");
  res.send(`Your ${req.body.username} is registered`);
});

api.post("login", (req, res) => {
  let sql =
    "SELECT IFNULL(id,0) as id, name, email_id, mobile, password, user_group_id, user_status_id, login_attempt + 1 FROM user  WHERE name =?";

  let password = req.body.password;
  let username = req.body.username;
  pool
    .query(sql, [username])
    .then(result => {
      let data = parseResultSet(result);
      let user = { ...data[0] };
      delete user.password;
      delete user["login_attempt + 1"];

      let db_encrypt_passowrd = data[0].password;
      if (!user.id) {
        res.status(402).send("invalid credentials");
      } else {
        pool
          .query("select encrypt_password_f(?,?) as password", [
            user.id,
            password
          ])
          .then(result => {
            let user_encrypted_password = parseResultSet(result);
            if (user_encrypted_password[0].password === db_encrypt_passowrd) {
              //console.log("password matching");
              res.send({ user, token: jwtSignUser(user) });
            } else {
              //console.log("password not matching");
              res.status(402).send("password not matching");
            }
          })
          .catch(err => {
            throw err;
          });
      }
    })
    .catch(err => console.log("error in query", err));
});

module.exports = api;

module.exports = authController;
