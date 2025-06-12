import { Request, Response } from 'express';


interface HomePageData {
                title: string;
}

const getHomepage = (req: Request, res: Response): void => {
                return res.render("home", {
                                title: "meo",
                } as HomePageData);
                // Hàm getHomepage nhận vào hai tham số req và res, đại diện cho yêu cầu và phản hồi HTTP.
                // Hàm này sẽ trả về một trang web với tiêu đề "meo" bằng cách sử dụng phương thức render của đối tượng res.

}
// Hàm getHomepage sẽ được sử dụng trong file web.ts để xử lý yêu cầu GET đến trang chủ.
const getCreateUserPage = (req: Request, res: Response): void => {
                return res.render("create-user", {
                                title: " User"
                } as HomePageData);
}

const postCreateUserPage = (req: Request, res: Response): void => {
                console.log('log: ', req.body);
                return res.redirect('/');
}
export { getHomepage, getCreateUserPage, postCreateUserPage };