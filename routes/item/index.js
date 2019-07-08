const { parseResultSet, readBody } = require("../../helpers");
//const isAuthenticated = require("../../policies/isAutheticated");
const model = require("../../models/index");
const pool = require("../../database");

module.exports = app => {
  app.get("/api/item", (req, res) => {
    let opt = readBody(req);
    opt.table = "item";
    console.log("inside GET api/item");
    model.get(opt, (error, result) => {
      if (error) {
        res.status(401).send("error in endpoint");
      } else {
        res.send(result);
      }
    });
  });

  app.get("/api/item/:id", (req, res) => {
    let opt = readBody(req);
    opt.table = "item";
    opt.where = `id = ${parseInt(req.params.id)}`;

    model.get(opt, (error, result) => {
      if (error) {
        res.status(401).send("error in endpoint");
      } else {
        res.send(result);
      }
    });
  });

  app.delete("/api/item/:id", (req, res) => {
    let opt = readBody(req);
    opt.table = "item";
    opt.where = `id = ${parseInt(req.params.id)}`;
    model.delete(opt, (error, result) => {
      if (error) {
        res.status(401).send("error in endpoint");
      } else {
        res.send(result);
      }
    });
  });

  app.put("/api/item/:id", (req, res) => {
    let opt = readBody(req);
    opt.table = "item";
    opt.where = `id = ${parseInt(req.params.id)}`;

    model.update(opt, (error, result) => {
      if (error) {
        res.status(401).send("error in endpoint");
      } else {
        res.send(result);
      }
    });
  });

  app.post("/api/item", (req, res) => {
    //let opt = readBody(req);
    let opt = {};
    opt.fields = req.body;
    opt.table = "item";
    //Please remove this
    if (req.user) {
      opt.user_id = req.user.user_id;
    } else {
      opt.user_id = 1;
    }
    //opt.where = `id = ${parseInt(req.params.id)}`;

    model.insert(opt, (error, result) => {
      if (error) {
        console.log(error);
        res.status(401).send({ error });
      } else {
        res.send(result);
      }
    });
  });
};
