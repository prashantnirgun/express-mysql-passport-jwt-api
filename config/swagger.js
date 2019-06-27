const swaggerJSDoc = require("swagger-jsdoc");

const swaggerDefinition = {
  openapi: "3.0.0",
  info: {
    title: "TSS API Documentation",
    description:
      "This is API Documentation for developer it allows develper to better understanding of API",
    contact: {
      name: "Prashant Nirgun",
      email: "prashant.nirgun@gmail.com"
    },
    version: "Draft"
  },
  servers: [
    {
      url: "http://localhost:5000"
    },
    {
      url: "https://express-mysql-passport-jwt-api.herokuapp.com/"
    }
  ]
};

// options for the swagger docs
const options = {
  // import swaggerDefinitions
  swaggerDefinition,
  // path to the API docs
  apis: ["./docs/**/*.yaml"]
};
// initialize swagger-jsdoc
module.exports = swaggerJSDoc(options);
