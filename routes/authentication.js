const jwt = require("jsonwebtoken");
const config = require("../config/config");
const { parseResultSet } = require("../helpers");
const AuthControllerPolicy = require("../policies/AuthenticationControllerPolicy");
const isAuthenticated = require("../policies/isAutheticated");
const model = require("../models/index");
const pool = require("../database");

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

module.exports = app => {
  app.post("/api/register", AuthControllerPolicy.register, (req, res) => {
    console.log("inside register route");
    res.send(`Your ${req.body.username} is registered`);
  });

  app.post("/api/login", (req, res) => {
    let sql =
      "SELECT IFNULL(id,0) as id, name, email_id, mobile, password, user_group_id, user_status_id, login_attempt + 1 FROM user  WHERE name =?";
    //const { username, password } = req.body;
    let password = req.body.password;
    let username = req.body.username;
    console.log("inside login");
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
              const isPasswordMatch =
                user_encrypted_password[0].password === db_encrypt_passowrd;
              if (isPasswordMatch) {
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
};
