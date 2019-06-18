const passport = require("passport");
const pool = require("./database");
const config = require("./config/config");
const { parseResultSet } = require("./helpers");

const JwtStrategy = require("passport-jwt").Strategy,
  ExtractJwt = require("passport-jwt").ExtractJwt;
var opts = {};
opts.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
opts.secretOrKey = config.authentication.jwtSecret;

passport.use(
  new JwtStrategy(opts, async function(jwtPayload, done) {
    try {
      //console.log("jwtPayload is ", jwtPayload);

      let sql = "SELECT id FROM user  WHERE id =?";
      pool.query(sql, [jwtPayload.id]).then(result => {
        let data = parseResultSet(result);
        let user = { ...data[0] };
        //console.log("user object from query is ", user);
        if (!user) {
          return done(new Error(), false);
        } else if (jwtPayload.id === user.id) {
          //console.log("user match");
          return done(null, user);
        } else {
          console.log("user not match");
          return done(new Error(), false);
        }
      });
    } catch (err) {
      console.log("error in passport.use()", err);
      return done(new Error(), false);
    }
  })
);

module.exports = null;
