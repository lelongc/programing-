
import getConnection from '@config/database';
const handleCreateUser = async (username: string, email: string, address: string) => {
      // Tạo kết nối đến cơ sở dữ liệu
      const connection = await getConnection();
      try {
            // Thực hiện truy vấn để thêm người dùng mới
            const sql = 'INSERT INTO `user` (name, email, address) VALUES (?, ?, ?)';
            const values = [username, email, address];
            // Sử dụng connection.query để thực hiện truy vấn
            const [results, fields] = await connection.query(sql, values);
            // console.log(results);
            // Trả về kết quả truy vấn
            // return results;
      } catch (err) {
            console.log(err);
      }
};
const getAllUsers = async () => {
      //  lấy dữ liệu người dùng từ cơ sở dữ liệu
      const connection = await getConnection();
      try {
            const [results, fields] = await connection.query(
                  'SELECT * FROM `user`'
            );
            return results; // trả về danh sách người dùng

      } catch (err) {
            console.log(err);
            return [];
      }
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
export { handleCreateUser, getAllUsers, handleDeleteUser, handleViewUser };