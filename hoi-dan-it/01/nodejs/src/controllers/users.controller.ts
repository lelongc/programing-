import { Request, Response } from "express";
import { handleCreateUser, getAllUsers } from "../services/user-service";
interface HomePageData {
  title: string;
}

const getHomepage = async (req: Request, res: Response): Promise<void> => {

  const users = await getAllUsers();
  // Hàm getAllUsers được gọi để lấy danh sách người dùng từ dịch vụ user-service.


  return res.render("home", {
    title: "meo",
    users: users,
  } as HomePageData);
  // Hàm getHomepage nhận vào hai tham số req và res, đại diện cho yêu cầu và phản hồi HTTP.

  // Hàm này sẽ trả về một trang web với tiêu đề "meo" bằng cách sử dụng phương thức render của đối tượng res.
};
// Hàm getHomepage sẽ được sử dụng trong file web.ts để xử lý yêu cầu GET đến trang chủ.
const getCreateUserPage = (req: Request, res: Response): void => {
  return res.render("create-user", {
    title: " User",
  } as HomePageData);
};

const postCreateUserPage = async (req: Request, res: Response): Promise<void> => {
  // Lấy dữ liệu từ form gửi lên
  const { username, email, address } = req.body;
  await handleCreateUser(username, email, address);
  return res.redirect("/");
};
export { getHomepage, getCreateUserPage, postCreateUserPage };
