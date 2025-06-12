// const express = require("express");
import express from "express";
// require("dotenv").config();
import 'dotenv/config';
// The dotenv package is used to load environment variables from a .env file into process.env 
// This allows you to use environment variables in your application, such as PORT or DATABASE_URL
// The express package is a web framework for Node.js that simplifies the process of building web applications and APIs
const app = express();
const port = process.env.PORT || 3000;
app.get("/", (req, res) => {
  res.send("Hello, World! ");
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);

});
// To run this application, make sure you have Node.js and Express installed.
