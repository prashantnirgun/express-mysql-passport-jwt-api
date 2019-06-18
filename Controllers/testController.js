//import models

const testController = {
  profile(req, res) {
    // Returns all manufacturers
    console.log("body ", req.body.name);
    res.send(req.body.name);
  }
};

module.exports = testController;
