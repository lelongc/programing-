
import getConnection from '@config/database';

import { prisma } from '@config/client'; // Import Prisma client instance

const handleCreateUser = async (username: string, email: string, address: string) => {
      // Tạo kết nối đến cơ sở dữ liệu


      const newUser = await prisma.user.create({
            data: {
                  name: username,
                  email: email,
                  address: address
            }
      });
      return newUser; // trả về người dùng mới được tạo

};
const getAllUsers = async () => {
      //  lấy dữ liệu người dùng từ cơ sở dữ liệu
      const users = await prisma.user.findMany();
      return users;
};

const handleDeleteUser = async (userId: string) => {
      const connection = await getConnection();
      try {
            const sql = 'DELETE FROM `user` WHERE id = ?';
            const values = [userId];
            const [results, fields] = await connection.query(sql, values);
            // Xóa người dùng khỏi cơ sở dữ liệu
            // console.log(results);
            // return results; // trả về kết quả xóa người dùng
      } catch (err) {
            console.log(err);
      }
};
const handleViewUser = async (userId: string) => {
      const connection = await getConnection();
      try {
            const sql = 'SELECT * FROM `user` WHERE id = ?';
            const values = [userId];
            const [results, fields] = await connection.query(sql, values);
            // Lấy thông tin người dùng từ cơ sở dữ liệu
            // console.log(results);
            return results; // trả về thông tin người dùng
      } catch (err) {
            console.log(err);
      }
};
const handleUpdateUser = async (userId: string, username: string, email: string, address: string) => {
      const connection = await getConnection();
      try {
            const sql = 'UPDATE `user` SET name = ?, email = ?, address = ? WHERE id = ?';
            const values = [username, email, address, userId];
            const [results, fields] = await connection.query(sql, values);
            // Cập nhật thông tin người dùng trong cơ sở dữ liệu
            // console.log(results);
            return results; // trả về kết quả cập nhật người dùng
      } catch (err) {
            console.log(err);
      }
};


export { handleCreateUser, getAllUsers, handleDeleteUser, handleViewUser, handleUpdateUser };