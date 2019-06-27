//const isAuthenticated = require("../policies/isAutheticated");
const list = require("../models/schema.model");
module.exports = app => {
  require("./authentication")(app),
    require("./member")(app),
    require("./item")(app),
    // app.post("/api/posts", isAuthenticated, (req, res) => {
    //   res.send({ msg: "post created" });
    // });
    app.get("/", (req, res) => {
      //res.send("welcome to server");
      res.render("index", {
        title: "Cool, huh!",
        table: list,
        anyArray: [1, 2, 3]
      });
    });
};
