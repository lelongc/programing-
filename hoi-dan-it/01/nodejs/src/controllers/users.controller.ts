import { Request, Response } from "express";
import { handleCreateUser, getAllUsers, handleDeleteUser, handleViewUser, handleUpdateUser } from "@services/user-service";
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
  const a = await handleCreateUser(username, email, address);
  return res.redirect("/");
};
const postDelUserPage = async (req: Request, res: Response): Promise<void> => {
  const userId = req.params.id;
  // Lấy ID người dùng từ tham số URL
  await handleDeleteUser(userId);
  // Gọi hàm handleDeleteUser để xóa người dùng khỏi cơ sở dữ liệu
  // Hàm này sẽ nhận vào ID người dùng và thực hiện xóa người dùng khỏi cơ sở dữ liệu.
  return res.redirect("/");
};
const getviewUserPage = async (req: Request, res: Response): Promise<void> => {
  const userId = req.params.id;
  // Lấy ID người dùng từ tham số URL
  const user = await handleViewUser(userId);
  // Gọi hàm handleViewUser để lấy thông tin người dùng từ cơ sở dữ liệu
  return res.render("view-user", {
    title: "View User",
    user: user[0],
  });
};
const postUpdateUserPage = async (req: Request, res: Response): Promise<void> => {

  const { id, username, email, address } = req.body;
  // Lấy dữ liệu từ form gửi lên
  const user = await handleUpdateUser(id, username, email, address);
  // Gọi hàm handleUpdateUser để cập nhật thông tin người dùng
  return res.redirect("/");
};
export { getHomepage, getCreateUserPage, postCreateUserPage, postDelUserPage, getviewUserPage, postUpdateUserPage };
