const passport = require("passport");

module.exports = function(req, res, next) {
  passport.authenticate("jwt", function(err, user) {
    // things to do : removed user object condition kindly implement it soon
    if (err) {
      res.status(403).send({
        error: "You do not have access to this resource."
      });
    } else {
      //console.log("user object inside isAutenticated", user);
      req.user = user;
      next();
    }
  })(req, res, next);
};
