# Node.js Course Project

Dự án học Node.js với TypeScript, Express và MySQL.

## Yêu cầu hệ thống

- Node.js >= 14.x
- npm >= 6.x
- MySQL >= 8.x (nếu sử dụng database)

## Cài đặt

### 1. Clone dự án và cài đặt dependencies

```bash
npm install
```

### 2. Cài đặt nhanh dependencies (nếu cần)

```bash
npm run installdp
```

## Cấu hình môi trường

### 1. Tạo file `.env`

Tạo file `.env` trong thư mục gốc với nội dung:

```env
PORT=3000
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=your_database
```

### 2. Cấu hình TypeScript

Dự án sử dụng TypeScript với các path mapping:

- `@config/*` → `./src/config/*`
- `@module/*` → `./src/module/*`
- `@controllers/*` → `./src/controllers/*`
- `@services/*` → `./src/services/*`
- `@routers/*` → `./src/routers/*`

## Scripts có sẵn

### Development

```bash
# Chạy ở chế độ development với nodemon
npm run dev

# Chạy với debug mode
npm run start:debug
```

### Production

```bash
# Build và chạy
npm start

# Chỉ build
npm run build

# Chạy sau khi đã build
node dist/app.js
```

### Utility

```bash
# Watch mode (tự động compile khi có thay đổi)
npm run watch

# Xóa thư mục dist
npm run clean

# Gỡ cài đặt dependencies
npm run uninstall
```

## Cấu trúc thư mục

```
src/
├── config/         # Cấu hình ứng dụng
├── controllers/    # Controllers
├── services/       # Business logic
├── routers/        # Route definitions
├── module/         # Modules
└── app.ts          # Entry point
```

## Debug

Để debug ứng dụng:

1. Chạy với debug mode:

```bash
npm run start:debug
```

2. Kết nối debugger tại port `9229`

## Lưu ý

- File được compile vào thư mục `dist/`
- Source maps được bật để debug dễ dàng
- Nodemon tự động restart khi có thay đổi file `.ts`
- Sử dụng EJS làm template engine
