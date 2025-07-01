import { prisma } from '@config/client';
const initializeDatabase = async () => {
      // Tạo bảng người dùng nếu chưa tồn tại
      const count = await prisma.user.count();
      if (count === 0) {
            await prisma.user.createMany({
                  data: [
                        {
                              username: 'admin',
                              email: 'admin@example.com',
                              address: '123 Admin St',
                              password: 'hashed_password',
                              fullName: 'Admin User',
                              phone: '123456789',
                              accountType: 'admin',
                              avatar: 'default-avatar.png'
                        },
                        {
                              username: 'user1',
                              email: 'user1@example.com',
                              address: '123 User St',
                              password: 'hashed_password',
                              fullName: 'User One',
                              phone: '123456789',
                              accountType: 'user',
                              avatar: 'default-avatar.png'
                        },
                        {
                              username: 'user2',
                              email: 'user2@example.com',
                              address: '456 User St',
                              password: 'hashed_password',
                              fullName: 'User Two',
                              phone: '987654321',
                              accountType: 'user',
                              avatar: 'default-avatar.png'
                        },
                        {
                              username: 'user3',
                              email: 'user3@example.com',
                              address: '789 User St',
                              password: 'hashed_password',
                              fullName: 'User Three',
                              phone: '456789123',
                              accountType: 'user',
                              avatar: 'default-avatar.png'
                        }

                  ]
            });
      }
      else {
            console.log('Database already initialized with users.');
      }
}
export default initializeDatabase;
