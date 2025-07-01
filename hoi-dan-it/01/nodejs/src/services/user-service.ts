
import getConnection from '@config/database';

import { prisma } from '@config/client'; // Import Prisma client instance

const handleCreateUser = async (username: string, email: string, address: string) => {
      // Tạo kết nối đến cơ sở dữ liệu


      await prisma.user.createMany({
            data: {
                  username: username,
                  email: email,
                  address: address,

                  password: 'hashed_password',
                  fullName: 'Full Name',

                  phone: '123456789',
                  accountType: 'user',
                  avatar: 'default-avatar.png', // Giả sử bạn có một ảnh đại diện mặc định
            }
      });
      // trả về người dùng mới được tạo

};
const getAllUsers = async () => {
      //  lấy dữ liệu người dùng từ cơ sở dữ liệu
      const users = await prisma.user.findMany();
      return users;
};

const handleDeleteUser = async (userId: string) => {
      // Xóa người dùng khỏi cơ sở dữ liệu
      const deletedUser = await prisma.user.delete({
            where: {
                  id: Number(userId)
            }
      });
      return deletedUser; // trả về người dùng đã bị xóa
};
const handleViewUser = async (userId: string) => {
      const user = await prisma.user.findUnique({
            where: {
                  id: Number(userId)
            }
      });
      return user;
};
const handleUpdateUser = async (userId: string, username: string, email: string, address: string) => {
      const user = await prisma.user.update({
            where: {
                  id: Number(userId)
            },
            data: {
                  username: username,
                  email: email,
                  address: address,
                  // Thêm các trường khác nếu cần thiết
                  password: 'new_hashed_password', // Nếu bạn muốn cập nhật mật khẩu   
                  fullName: 'Updated Full Name', // Cập nhật tên đầy đủ
                  phone: '987654321', // Cập nhật số điện thoại
            }
      });
      return user;
};


export { handleCreateUser, getAllUsers, handleDeleteUser, handleViewUser, handleUpdateUser };