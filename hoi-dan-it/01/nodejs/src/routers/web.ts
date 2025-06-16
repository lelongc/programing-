import express, { Express } from "express";
// Nhập express và kiểu Express từ thư viện express.
// express là một framework web phổ biến cho Node.js, cung cấp các tính năng để xây dựng ứng dụng web.

import { getHomepage, getCreateUserPage, postCreateUserPage, postDelUserPage, getviewUserPage, postUpdateUserPage } from "@controllers/users.controller";
// Nhập các hàm getHomepage và getCreateUserPage từ file users.controller.ts.



const router = express.Router();
// Tạo một router mới từ express.Router() để định nghĩa các route cho ứng dụng web.
// Định nghĩa các route cho ứng dụng web



// Các hàm này sẽ được sử dụng để xử lý các yêu cầu GET đến trang chủ và trang tạo người dùng.
const webRoutes = (app: Express) => {
      // Trang chủ
      router.get("/", getHomepage);
      // tham chiếu đến hàm getHomepage trong file users.controller.ts để xử lý yêu cầu GET đến trang chủ.
      router.get("/create-user", getCreateUserPage);
      router.post("/handler-create-user", postCreateUserPage);
      // tham chiếu đến hàm getCreateUserPage trong file users.controller.ts để xử lý yêu cầu GET đến trang tạo người dùng.
      // tham chiếu đến hàm postCreateUserPage trong file users.controller.ts để xử lý yêu cầu POST đến trang tạo người dùng.
      router.post("/delete-user/:id", postDelUserPage);
      // id là tham số động trong URL, được sử dụng để xác định người dùng cần xóa.
      // tham chiếu đến hàm postDelUserPage trong file users.controller.ts để xử lý yêu cầu POST đến trang xóa người dùng.
      router.get("/view-user/:id", getviewUserPage);

      // tham chiếu đến hàm getviewUserPage trong file users.controller.ts để xử lý yêu cầu GET đến trang xem thông tin người dùng.
      router.post("/update-user", postUpdateUserPage);
      // Thêm route để xử lý yêu cầu POST cập nhật người dùng, sử dụng lại hàm postCreateUserPage để xử lý logic cập nhật.


      app.use("/", router);
      // Đăng ký router với ứng dụng Express
      // Sử dụng app.use để đăng ký router với ứng dụng Express.
}
// Hàm webRoutes nhận vào một đối tượng Express và định nghĩa các route cho ứng dụng web.
// Hàm này sẽ được sử dụng trong file app.ts để đăng ký các route cho ứng dụng.

export default webRoutes;