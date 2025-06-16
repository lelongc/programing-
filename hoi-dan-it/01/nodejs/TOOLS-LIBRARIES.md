# Công cụ và Thư viện sử dụng trong dự án

Tài liệu này mô tả chi tiết về công dụng của từng công cụ và thư viện được sử dụng trong dự án Node.js.

## Dependencies (Thư viện Production)

### 1. Express.js

**Công dụng**: Web framework cho Node.js

- Tạo web server và API endpoints
- Xử lý HTTP requests/responses
- Middleware support
- Routing system

```javascript
const express = require("express");
const app = express();
app.get("/", (req, res) => res.send("Hello World"));
```

### 2. EJS (Embedded JavaScript)

**Công dụng**: Template engine

- Render dynamic HTML pages
- Embed JavaScript trong HTML
- Truyền data từ server sang view

```html
<h1>Hello <%= name %></h1>
<% users.forEach(user => { %>
<p><%= user.name %></p>
<% }) %>
```

### 3. MySQL2

**Công dụng**: MySQL database driver

- Kết nối và thao tác với MySQL database
- Hỗ trợ prepared statements
- Promise-based API
- Connection pooling

```javascript
const mysql = require("mysql2/promise");
const connection = await mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "password",
  database: "mydb",
});
```

### 4. Dotenv

**Công dụng**: Quản lý environment variables

- Load biến môi trường từ file `.env`
- Bảo mật thông tin nhạy cảm
- Cấu hình khác nhau cho từng môi trường

```javascript
require("dotenv").config();
const port = process.env.PORT || 3000;
```

## DevDependencies (Thư viện Development)

### 1. TypeScript

**Công dụng**: Superset của JavaScript

- Type checking tại compile time
- Modern JavaScript features
- Better IDE support
- Code documentation thông qua types

```typescript
interface User {
  id: number;
  name: string;
  email: string;
}

function createUser(userData: User): User {
  return userData;
}
```

### 2. @types/express, @types/node, @types/ejs

**Công dụng**: Type definitions cho TypeScript

- Cung cấp type information cho các thư viện JavaScript
- IntelliSense và autocomplete trong IDE
- Type safety khi sử dụng thư viện external

### 3. ts-node

**Công dụng**: TypeScript execution engine

- Chạy TypeScript trực tiếp mà không cần compile trước
- Development workflow nhanh hơn
- JIT compilation

```bash
ts-node src/app.ts
```

### 4. Nodemon

**Công dụng**: Development utility

- Tự động restart server khi file thay đổi
- Watch file changes
- Tăng productivity trong development

```json
{
  "nodemonConfig": {
    "watch": ["src"],
    "ext": "ts",
    "exec": "ts-node src/app.ts"
  }
}
```

### 5. tsconfig-paths

**Công dụng**: TypeScript path mapping support

- Resolve custom paths trong runtime
- Làm việc với baseUrl và paths trong tsconfig.json
- Import modules với absolute paths

```typescript
// Thay vì: import config from '../../../config/database'
import config from "@config/database";
```

## Công cụ Build và Configuration

### 1. TSConfig (tsconfig.json)

**Công dụng**: Cấu hình TypeScript compiler

- Compiler options
- Path mapping
- Source và output directories
- Target JavaScript version

### 2. Package.json Scripts

**Công dụng**: Automation và workflow management

#### Development Scripts:

- `npm run dev`: Chạy development server với hot reload
- `npm run start:debug`: Chạy với debugger enabled
- `npm run watch`: Compile TypeScript trong watch mode

#### Production Scripts:

- `npm start`: Build và chạy production server
- `npm run build`: Compile TypeScript thành JavaScript
- `npm run clean`: Xóa thư mục dist

#### Utility Scripts:

- `npm run installdp`: Cài đặt nhanh các dependencies chính
- `npm run uninstall`: Gỡ bỏ các packages không cần thiết

## Workflow Tools

### 1. Source Maps

**Công dụng**: Debug support

- Map compiled JavaScript về TypeScript source
- Debug trực tiếp trên TypeScript code
- Better error stack traces

### 2. Path Mapping

**Công dụng**: Clean imports

- Tránh relative paths phức tạp (../../../)
- Tổ chức code structure rõ ràng
- Easy refactoring

```typescript
// Config trong tsconfig.json
"paths": {
  "@config/*": ["./src/config/*"],
  "@controllers/*": ["./src/controllers/*"]
}
```

## Best Practices được áp dụng

1. **Separation of Concerns**: Tách biệt dependencies và devDependencies
2. **Type Safety**: Sử dụng TypeScript và type definitions
3. **Environment Configuration**: Sử dụng dotenv cho configuration
4. **Development Efficiency**: Nodemon và ts-node cho fast development
5. **Build Optimization**: Proper compilation và source maps
6. **Code Organization**: Path mapping cho clean imports

## Lợi ích của stack này

- **Development Speed**: Hot reload, TypeScript support
- **Code Quality**: Type checking, modern JavaScript features
- **Maintainability**: Clean architecture, proper tooling
- **Production Ready**: Compiled output, environment configuration
- **Database Integration**: MySQL support với connection pooling
- **Template Rendering**: EJS cho dynamic content
