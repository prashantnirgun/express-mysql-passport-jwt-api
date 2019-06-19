const isAuthenticated = require("../policies/isAutheticated");

module.exports = app => {
  require("./authentication")(app),
    require("./member")(app),
    app.post("/api/posts", isAuthenticated, (req, res) => {
      res.send({ msg: "post created" });
    });
  app.get("/", (req, res) => {
    res.send("welcome to server");
  });
};
