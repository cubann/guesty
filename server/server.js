// "use strict";

// const express = require("express");

// // Constants
// const PORT = 3000;
// const HOST = "0.0.0.0";
// const IDENTITY = process.env.IDENTITY;

// // App
// const app = express();
// app.get("/hello", (req, res) => {
//   res.send(`Running on server with identity ${IDENTITY}`);
// });

// app.listen(PORT, HOST);
// console.log(`Running on server with identity ${IDENTITY}`);

const express = require("express");
const app = express();
app.get("/hello", (req, res) => {
  res.send("Hello world from a Node.js app!");
});
app.listen(3000, () => {
  console.log("Server is up on 3000");
});
