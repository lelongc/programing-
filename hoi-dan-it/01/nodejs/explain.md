# 📚 Giải thích chi tiết các công cụ và thư viện trong dự án

## **🎯 Tổng quan Architecture**

Dự án này sử dụng mô hình **MVC (Model-View-Controller)** với **TypeScript** và **Prisma ORM**:

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│     VIEW        │    │   CONTROLLER    │    │     MODEL       │
│   (EJS Files)   │◄──►│  (Controllers)  │◄──►│   (Services +   │
│                 │    │                 │    │    Prisma)      │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         ▲                       ▲                       ▲
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 ▼
                        ┌─────────────────┐
                        │     ROUTES      │
                        │  (Express.js)   │
                        └─────────────────┘
```

## **🛠️ Backend Technologies**

### **1. Node.js**

```javascript
// Runtime Environment cho JavaScript
```

- **Là gì:** JavaScript runtime được xây dựng trên Chrome V8 engine
- **Tại sao dùng:** Cho phép chạy JavaScript ở server-side
- **Vai trò:** Nền tảng chạy toàn bộ ứng dụng backend
- **Ưu điểm:**
  - Single-threaded với event loop (hiệu suất cao)
  - NPM ecosystem khổng lồ
  - Cùng ngôn ngữ với frontend (JavaScript/TypeScript)

### **2. TypeScript**

```typescript
// Superset của JavaScript với static typing
interface User {
  id: number;
  name: string;
  email: string;
}
```

- **Là gì:** Ngôn ngữ lập trình mở rộng của JavaScript với type system
- **Tại sao dùng:** Giúp catch lỗi sớm, code dễ maintain, IntelliSense tốt hơn
- **Vai trò:** Ngôn ngữ chính của dự án
- **Config:** `tsconfig.json` định nghĩa cách compile TypeScript → JavaScript
- **Ưu điểm:**
  - Type safety (tránh runtime errors)
  - Better IDE support
  - Easier refactoring và debugging

### **3. Express.js**

```typescript
import express from "express";
const app = express();
app.get("/", (req, res) => res.send("Hello World"));
```

- **Là gì:** Web framework nhẹ nhất cho Node.js
- **Tại sao dùng:** Dễ setup, flexible, ecosystem mạnh
- **Vai trò:**
  - HTTP server
  - Routing system
  - Middleware management
  - Request/Response handling
- **Các tính năng sử dụng:**
  - `express.json()`: Parse JSON requests
  - `express.urlencoded()`: Parse form data
  - `express.static()`: Serve static files
  - Router system

---

## **🗄️ Database & ORM**

### **4. MySQL**

```sql
-- Relational Database Management System
CREATE TABLE User (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  email VARCHAR(255),
  address VARCHAR(255)
);
```

- **Là gì:** Hệ quản trị cơ sở dữ liệu quan hệ (RDBMS)
- **Tại sao dùng:**
  - Stable, mature
  - ACID compliance
  - Excellent performance
  - Wide industry adoption
- **Vai trò:** Lưu trữ dữ liệu persistent
- **Connection:** Qua `mysql2` package với connection pooling

### **5. Prisma ORM**

```typescript
// Modern Database Toolkit
const user = await prisma.user.create({
  data: { name: "John", email: "john@example.com" },
});
```

- **Là gì:** Next-generation ORM cho Node.js & TypeScript
- **Tại sao dùng thay vì raw SQL:**
  - Type-safe database queries
  - Auto-generated client
  - Database migrations
  - Introspection
  - Better developer experience
- **Các components:**
  - **Prisma Schema:** Định nghĩa data model
  - **Prisma Client:** Auto-generated query builder
  - **Prisma Migrate:** Database migration tool
  - **Prisma Studio:** Database GUI

#### **Prisma Schema Deep Dive:**

```prisma
// File: prisma/schema.prisma

generator client {
  provider = "prisma-client-js"  // Tạo JavaScript/TypeScript client
}

datasource db {
  provider = "mysql"             // Database provider
  url      = env("DATABASE_URL") // Connection string từ .env
}

model User {
  id        Int      @id @default(autoincrement()) // Primary key
  name      String?  @db.VarChar(255)              // Nullable field
  email     String?  @db.VarChar(255)
  address   String?  @db.VarChar(255)
}
```

### **6. mysql2**

```typescript
import mysql from "mysql2/promise";
const connection = await mysql.createConnection({
  host: "localhost",
  port: 3306, // MySQL connection config
});
```

- **Là gì:** MySQL client cho Node.js (successor của mysql package)
- **Tại sao dùng:** Promise support, better performance, maintained actively
- **Vai trò:** Low-level database connection (backup cho Prisma)
- **Features:**
  - Promise-based API
  - Connection pooling
  - Prepared statements
  - Better security

---

## **🎨 Frontend & Templating**

### **7. EJS (Embedded JavaScript)**

```html
<!-- Server-side templating -->
<h1>Hello <%= user.name %>!</h1>
<% if (users.length > 0) { %> <% users.forEach(user => { %>
<p><%= user.email %></p>
<% }) %> <% } %>
```

- **Là gì:** Template engine cho Node.js
- **Tại sao dùng:**
  - Simple syntax (giống HTML + JavaScript)
  - Server-side rendering
  - SEO friendly
  - No complex build process
- **Vai trò:** Generate dynamic HTML pages
- **Syntax:**
  - `<%= %>`: Output escaped value
  - `<%- %>`: Output unescaped value
  - `<% %>`: Control flow (if, for, etc.)

### **8. Bootstrap 5**

```html
<!-- CSS Framework -->
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
  rel="stylesheet"
/>
<div class="container mt-5">
  <button class="btn btn-primary">Click me</button>
</div>
```

- **Là gì:** CSS framework cho responsive design
- **Tại sao dùng:**
  - Rapid prototyping
  - Responsive grid system
  - Pre-built components
  - Consistent design
- **Vai trò:** Styling và layout cho UI
- **Components sử dụng:**
  - Grid system (`container`, `row`, `col`)
  - Forms (`form-control`, `form-label`)
  - Buttons (`btn`, `btn-primary`)
  - Tables (`table`, `table-striped`)

---

## **⚙️ Development Tools**

### **9. Nodemon**

```json
// Auto-restart server khi code thay đổi
{
  "nodemonConfig": {
    "watch": ["src"],
    "ext": "ts",
    "exec": "ts-node -r tsconfig-paths/register src/app.ts"
  }
}
```

- **Là gì:** Utility tự động restart Node.js application
- **Tại sao dùng:** Tăng productivity trong development
- **Vai trò:** Development server với hot-reload
- **Config:** Watch `src` folder, restart khi `.ts` files thay đổi

### **10. ts-node**

```bash
# Chạy TypeScript trực tiếp mà không cần compile
ts-node src/app.ts
```

- **Là gì:** TypeScript execution engine cho Node.js
- **Tại sao dùng:** Run TypeScript code trực tiếp, không cần build step
- **Vai trò:** Development runtime cho TypeScript
- **Features:**
  - JIT compilation
  - Source map support
  - REPL support

### **11. tsconfig-paths**

```typescript
// Cho phép sử dụng path mapping
import { getUsers } from "@services/user-service";
// Thay vì: import { getUsers } from '../../../services/user-service';
```

- **Là gì:** Resolve TypeScript path mapping tại runtime
- **Tại sao dùng:** Clean imports, easier refactoring
- **Vai trò:** Module resolution với custom paths
- **Config trong tsconfig.json:**

```json
{
  "baseUrl": ".",
  "paths": {
    "@services/*": ["./src/services/*"],
    "@controllers/*": ["./src/controllers/*"]
  }
}
```

---

## **🔧 Environment & Configuration**

### **12. dotenv**

```typescript
// Load environment variables từ .env file
import "dotenv/config";
const dbUrl = process.env.DATABASE_URL;
```

- **Là gì:** Load environment variables từ `.env` file
- **Tại sao dùng:**
  - Keep secrets out of code
  - Different configs cho different environments
  - Security best practice
- **Vai trò:** Configuration management
- **Usage:**

```env
NODE_ENV=development
DATABASE_URL=mysql://user:pass@localhost:3306/db
```

### **13. Environment Variables**

```env
# .env file structure
NODE_ENV=development          # Environment type
DB_HOST=localhost            # Database host
DB_PORT=3306                 # Database port
DB_USER=root                 # Database username
DB_PASSWORD=your_password    # Database password
DB_DATABASE=nodejshit        # Database name
DATABASE_URL=mysql://...     # Full connection string
```

- **NODE_ENV:** Xác định environment (development/production/test)
- **DB\_\* variables:** Database connection parameters
- **DATABASE_URL:** Prisma connection string

---

## **📁 Project Structure Deep Dive**

```
src/
├── app.ts                 # Entry point - Express server setup
├── config/               # Configuration files
│   ├── client.ts         # Prisma client singleton
│   └── database.ts       # MySQL connection (fallback)
├── controllers/          # Route handlers (Controller layer)
│   └── users.controller.ts
├── routers/             # Route definitions
│   └── web.ts           # Web routes
├── services/            # Business logic (Model layer)
│   └── user-service.ts  # User CRUD operations
└── views/               # EJS templates (View layer)
    ├── home.ejs
    ├── create-user.ejs
    └── view-user.ejs

prisma/
├── schema.prisma        # Database schema definition
└── migrations/          # Database migration files

public/                  # Static assets
├── css/
├── images/
└── javascript/

dist/                   # Compiled JavaScript output
```

### **Layer Responsibilities:**

1. **Controllers:** Handle HTTP requests/responses
2. **Services:** Business logic và database operations
3. **Views:** HTML templates với dynamic content
4. **Routes:** URL mapping tới controllers
5. **Config:** Database connections và app configuration

---

## **🔄 Request Flow**

```
Browser Request
      ↓
Express Router (web.ts)
      ↓
Controller (users.controller.ts)
      ↓
Service (user-service.ts)
      ↓
Prisma Client
      ↓
MySQL Database
      ↓
Response back through same chain
      ↓
EJS Template Rendering
      ↓
HTML Response to Browser
```

### **Example Flow - Tạo User:**

1. **Browser:** POST `/create-user` với form data
2. **Router:** Route tới `postCreateUserPage` controller
3. **Controller:** Extract data từ `req.body`
4. **Service:** `handleCreateUser()` gọi Prisma
5. **Prisma:** Generate SQL INSERT query
6. **MySQL:** Execute query, return new user
7. **Response:** Redirect về homepage
8. **Homepage:** Load users và render với EJS

---

## **🚀 Build & Deployment Process**

### **Development:**

```bash
npm run dev
# 1. Nodemon watches src/
# 2. ts-node compiles TypeScript on-the-fly
# 3. Server starts với hot-reload
```

### **Production:**

```bash
npm run build  # TypeScript → JavaScript (dist/)
npm start      # Run compiled JavaScript
```

### **Database Operations:**

```bash
npx prisma migrate dev    # Apply schema changes
npx prisma generate      # Regenerate Prisma client
npx prisma studio        # Open database GUI
```

---

## **💡 Key Benefits của Tech Stack này**

### **Type Safety:**

- TypeScript + Prisma = End-to-end type safety
- Database schema → TypeScript types tự động

### **Developer Experience:**

- Hot reload với nodemon
- IntelliSense với TypeScript
- Path mapping cho clean imports
- Database GUI với Prisma Studio

### **Performance:**

- Prisma query optimization
- Connection pooling
- Single-threaded Node.js event loop

### **Maintainability:**

- Clear separation of concerns (MVC)
- Type safety giảm bugs
- Database migrations cho consistency
- Environment-based configuration

---

## **🔍 Debugging & Monitoring**

### **Debug Configuration:**

```json
// VS Code launch.json
{
  "name": "debug-nodejshd",
  "type": "node",
  "request": "launch",
  "runtimeExecutable": "npm",
  "runtimeArgs": ["run", "start:debug"]
}
```

### **Debug Features:**

- **Breakpoints:** Set trong VS Code
- **Inspector:** `--inspect=9229` flag
- **Source Maps:** TypeScript debugging trong browser
- **Console logging:** `console.log()` statements

---

**🎯 Kết luận:** Đây là tech stack modern, type-safe, developer-friendly cho web applications. Mỗi tool được chọn có lý do cụ thể và work together tạo nên development experience tuyệt vời.
