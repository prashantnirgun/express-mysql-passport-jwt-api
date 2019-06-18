const express = require("express");
const router = express.Router();
const testController = require("../Controllers/testController");

/*
router.post("/profile", function(req, res, next) {
  console.log("body ", req.body.name);
  res.send(req.body.name);
});
*/

router.post("/profile", testController.profile);
// router.get("/api/test", (req, res) => {
//   res.send("test sucessfull");
// });
module.exports = router;
