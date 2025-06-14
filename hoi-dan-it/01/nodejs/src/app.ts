// const express = require("express");
import express from "express";
// require("dotenv").config();
import 'dotenv/config';

import webRoutes from "./routers/web";
// import webRoutes from "./routers/web.js"; // nếu sử dụng CommonJS thì cần thêm .js vào cuối đường dẫn

import createConnection from "./config/database";
// import createConnection from "./config/database.js"; // nếu sử dụng CommonJS thì cần thêm .js vào cuối đường dẫn
const app = express();
const port = process.env.PORT || 3000;

app.set('view engine', 'ejs'); // dùng EJS làm template engine
// đuôi file là .ejs, có thể sử dụng các biến trong file .ejs để hiển thị dữ liệu
app.set('views', `${__dirname}/views`);  // thư mục chứa các file .ejs , dirname là thư mục hiện tại của file app.ts
// __dirname là biến toàn cục trong Node.js, chứa đường dẫn đến thư mục hiện tại của file đang chạy
app.use(express.static('public')) // sử dụng thư mục public để chứa các file tĩnh

app.use(express.urlencoded({ extended: true })); // middleware để parse dữ liệu từ form gửi lên, sử dụng body-parser
app.use(express.json()); // middleware để parse dữ liệu JSON gửi lên

webRoutes(app) // sử dụng router đã định nghĩa trong file web.ts

createConnection() // tạo kết nối đến database

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);

});

