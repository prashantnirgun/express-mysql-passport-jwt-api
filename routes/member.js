const jwt = require("jsonwebtoken");
const config = require("../config/config");
const { parseResultSet, readBody } = require("../helpers");
const AuthControllerPolicy = require("../policies/AuthenticationControllerPolicy");
const isAuthenticated = require("../policies/isAutheticated");
const model = require("../models/index");
const pool = require("../database");

module.exports = app => {
  app.get("/api/members/", isAuthenticated, (req, res) => {
    let opt = readBody(req);
    opt.table = "member";

    model.get(opt, (error, result) => {
      if (error) {
        res.status(401).send("error in endpoint");
      } else {
        res.send(result);
      }
    });
  });
  app.get("/api/item/", isAuthenticated, (req, res) => {
    let opt = readBody(req);
    opt.table = "item";

    model.get(opt, (error, result) => {
      if (error) {
        res.status(401).send("error in endpoint");
      } else {
        res.send(result);
      }
    });
  });

  app.get("/api/member_view/", isAuthenticated, (req, res) => {
    let opt = readBody(req);
    opt.table = "member_view";

    model.get(opt, (error, result) => {
      if (error) {
        res.status(401).send("error in endpoint");
      } else {
        res.send(result);
      }
    });
  });

  app.get("/api/member/:id", isAuthenticated, (req, res) => {
    let opt = readBody(req);
    opt.table = "member";
    opt.where = `id = ${parseInt(req.params.id)}`;

    model.get(opt, (error, result) => {
      if (error) {
        res.status(401).send("error in endpoint");
      } else {
        res.send(result);
      }
    });
  });

  app.delete("/api/member/:id", isAuthenticated, (req, res) => {
    let opt = readBody(req);
    opt.table = "member";
    opt.where = `id = ${parseInt(req.params.id)}`;
    model.delete(opt, (error, result) => {
      if (error) {
        res.status(401).send("error in endpoint");
      } else {
        res.send(result);
      }
    });
  });

  app.put("/api/member/:id", isAuthenticated, (req, res) => {
    let opt = readBody(req);
    opt.table = "member";
    opt.where = `id = ${parseInt(req.params.id)}`;

    model.update(opt, (error, result) => {
      if (error) {
        res.status(401).send("error in endpoint");
      } else {
        res.send(result);
      }
    });
  });
};
