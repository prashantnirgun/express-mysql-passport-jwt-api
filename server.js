const express = require("express");
const app = express();
const port = 5000;
const morgan = require("morgan");
const path = require("path");
const cors = require("cors");

app.use(express.static(path.join(__dirname, "public")));

app.use(morgan("short"));
//app.use(morgan("combined"));

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

require("./passport");
require("./routes/api")(app);

app.get("*", (req, res) => {
  console.log("unhandled GET request");
  res.status(403).send("unhandled GET request");
});

app.post("*", (req, res) => {
  console.log("unhandled POST request");
  res.status(403).send("unhandled POST request");
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
