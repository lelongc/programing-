# 🚀 Lộ trình tạo lại dự án Node.js + TypeScript + Prisma + EJS

## **📋 Tổng quan dự án**

- **Backend:** Node.js + TypeScript + Express
- **Database:** MySQL + Prisma ORM
- **Template Engine:** EJS
- **Tính năng:** CRUD User Management

---

## **🛠️ Bước 1: Khởi tạo dự án**

### **1.1 Tạo thư mục và khởi tạo npm**

```bash
mkdir nodejs-project
cd nodejs-project
npm init -y
```

### **1.2 Cài đặt dependencies**

```bash
# Production dependencies
npm install express @prisma/client dotenv ejs mysql2

# Development dependencies
npm install -D @types/ejs @types/express @types/node nodemon prisma ts-node tsconfig-paths typescript
```

---

## **🔧 Bước 2: Cấu hình TypeScript**

### **2.1 Tạo tsconfig.json**

```json
{
  "compilerOptions": {
    "target": "es6",
    "module": "commonjs",
    "esModuleInterop": true,
    "skipLibCheck": true,
    "outDir": "./dist",
    "sourceMap": true,
    "rootDir": "./src",
    "baseUrl": ".",
    "paths": {
      "@config/*": ["./src/config/*"],
      "@module/*": ["./src/module/*"],
      "@controllers/*": ["./src/controllers/*"],
      "@services/*": ["./src/services/*"],
      "@routers/*": ["./src/routers/*"]
    }
  }
}
```

### **2.2 Cập nhật package.json**

```json
{
  "main": "dist/app.js",
  "scripts": {
    "start": "tsc && node dist/app.js",
    "dev": "nodemon",
    "build": "tsc",
    "watch": "tsc --watch",
    "clean": "rm -rf dist",
    "start:debug": "nodemon --inspect=9229 -e ts,tsx --exec node -r ts-node/register -r tsconfig-paths/register ./src/app.ts"
  },
  "nodemonConfig": {
    "watch": ["src"],
    "ext": "ts",
    "exec": "ts-node -r tsconfig-paths/register src/app.ts",
    "ignore": ["dist", "node_modules"]
  }
}
```

---

## **🗂️ Bước 3: Tạo cấu trúc thư mục**

```
src/
├── app.ts
├── config/
│   ├── client.ts
│   └── database.ts
├── controllers/
│   └── users.controller.ts
├── routers/
│   └── web.ts
├── services/
│   └── user-service.ts
├── views/
│   ├── home.ejs
│   ├── create-user.ejs
│   └── view-user.ejs
└── module/

prisma/
├── schema.prisma
└── migrations/

public/
├── css/
├── images/
└── javascript/
```

---

## **🔌 Bước 4: Cấu hình Database**

### **4.1 Tạo file .env**

```env
NODE_ENV=development
DB_PORT=3306
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_DATABASE=nodejshit
DATABASE_URL="mysql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_DATABASE}?connection_limit=1&sslmode=prefer"
```

### **4.2 Tạo prisma/schema.prisma**

```prisma
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "mysql"
  url      = env("DATABASE_URL")
}

model User {
  id        Int      @id @default(autoincrement())
  name      String?  @db.VarChar(255)
  email     String?  @db.VarChar(255)
  address   String?  @db.VarChar(255)
}
```

### **4.3 Khởi tạo và migrate database**

```bash
npx prisma migrate dev --name init
npx prisma generate
```

---

## **⚙️ Bước 5: Tạo config files**

### **5.1 src/config/client.ts**

```typescript
import { PrismaClient } from "@prisma/client";

export const prisma = new PrismaClient();
```

### **5.2 src/config/database.ts**

```typescript
import mysql from "mysql2/promise";
import "dotenv/config";

const getConnection = async () => {
  const connection = await mysql.createConnection({
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT),
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
  });
  return connection;
};

export default getConnection;
```

---

## **📊 Bước 6: Tạo Services**

### **6.1 user-service.ts**

```typescript
import { prisma } from "@config/client";

const handleCreateUser = async (
  username: string,
  email: string,
  address: string
) => {
  const newUser = await prisma.user.create({
    data: {
      name: username,
      email: email,
      address: address,
    },
  });
  return newUser;
};

const getAllUsers = async () => {
  const users = await prisma.user.findMany();
  return users;
};

const handleDeleteUser = async (userId: string) => {
  const deletedUser = await prisma.user.delete({
    where: {
      id: Number(userId),
    },
  });
  return deletedUser;
};

const handleViewUser = async (userId: string) => {
  const user = await prisma.user.findUnique({
    where: {
      id: Number(userId),
    },
  });
  return user;
};

const handleUpdateUser = async (
  userId: string,
  username: string,
  email: string,
  address: string
) => {
  const user = await prisma.user.update({
    where: {
      id: Number(userId),
    },
    data: {
      name: username,
      email: email,
      address: address,
    },
  });
  return user;
};

export {
  handleCreateUser,
  getAllUsers,
  handleDeleteUser,
  handleViewUser,
  handleUpdateUser,
};
```

---

## **🎮 Bước 7: Tạo Controllers**

### **7.1 users.controller.ts**

```typescript
import { Request, Response } from "express";
import {
  handleCreateUser,
  getAllUsers,
  handleDeleteUser,
  handleViewUser,
  handleUpdateUser,
} from "@services/user-service";

interface HomePageData {
  title: string;
}

const getHomepage = async (req: Request, res: Response): Promise<void> => {
  const users = await getAllUsers();
  return res.render("home", {
    title: "User Management",
    users: users,
  } as HomePageData);
};

const getCreateUserPage = (req: Request, res: Response): void => {
  return res.render("create-user", {
    title: "Create User",
  } as HomePageData);
};

const postCreateUserPage = async (
  req: Request,
  res: Response
): Promise<void> => {
  const { username, email, address } = req.body;
  await handleCreateUser(username, email, address);
  return res.redirect("/");
};

const postDelUserPage = async (req: Request, res: Response): Promise<void> => {
  const userId = req.params.id;
  await handleDeleteUser(userId);
  return res.redirect("/");
};

const getviewUserPage = async (req: Request, res: Response): Promise<void> => {
  const userId = req.params.id;
  const user = await handleViewUser(userId);

  if (!user) {
    return res.status(404).send("User not found");
  }

  return res.render("view-user", {
    title: "View User",
    user: user,
  });
};

const postUpdateUserPage = async (
  req: Request,
  res: Response
): Promise<void> => {
  const { id, username, email, address } = req.body;
  await handleUpdateUser(id, username, email, address);
  return res.redirect("/");
};

export {
  getHomepage,
  getCreateUserPage,
  postCreateUserPage,
  postDelUserPage,
  getviewUserPage,
  postUpdateUserPage,
};
```

---

## **🛣️ Bước 8: Tạo Routes**

### **8.1 src/routers/web.ts**

```typescript
import express from "express";
import {
  getHomepage,
  getCreateUserPage,
  postCreateUserPage,
  postDelUserPage,
  getviewUserPage,
  postUpdateUserPage,
} from "@controllers/users.controller";

const router = express.Router();

// Home route
router.get("/", getHomepage);

// User routes
router.get("/create-user", getCreateUserPage);
router.post("/create-user", postCreateUserPage);
router.get("/view-user/:id", getviewUserPage);
router.post("/update-user", postUpdateUserPage);
router.get("/delete-user/:id", postDelUserPage);

export default router;
```

---

## **🌐 Bước 9: Tạo Views (EJS Templates)**

### **9.1 src/views/home.ejs**

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%= title %></title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="container mt-5">
      <h1><%= title %></h1>
      <a href="/create-user" class="btn btn-primary mb-3">Create New User</a>

      <table class="table table-striped">
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Address</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <% users.forEach(user => { %>
          <tr>
            <td><%= user.id %></td>
            <td><%= user.name %></td>
            <td><%= user.email %></td>
            <td><%= user.address %></td>
            <td>
              <a href="/view-user/<%= user.id %>" class="btn btn-info btn-sm"
                >View</a
              >
              <a
                href="/delete-user/<%= user.id %>"
                class="btn btn-danger btn-sm"
                >Delete</a
              >
            </td>
          </tr>
          <% }) %>
        </tbody>
      </table>
    </div>
  </body>
</html>
```

### **9.2 src/views/create-user.ejs**

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%= title %></title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="container mt-5">
      <h1><%= title %></h1>

      <form action="/create-user" method="POST">
        <div class="mb-3">
          <label for="username" class="form-label">Username</label>
          <input
            type="text"
            class="form-control"
            id="username"
            name="username"
            required
          />
        </div>
        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input
            type="email"
            class="form-control"
            id="email"
            name="email"
            required
          />
        </div>
        <div class="mb-3">
          <label for="address" class="form-label">Address</label>
          <textarea
            class="form-control"
            id="address"
            name="address"
            required
          ></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Create User</button>
        <a href="/" class="btn btn-secondary">Back</a>
      </form>
    </div>
  </body>
</html>
```

### **9.3 view-user.ejs**

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%= title %></title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="container mt-5">
      <h3>View detail User <%= user.name %> with id <%= user.id %></h3>

      <form action="/update-user" method="POST">
        <input type="hidden" name="id" value="<%= user.id %>" />
        <div class="mb-3">
          <label for="username" class="form-label">Username</label>
          <input
            type="text"
            class="form-control"
            id="username"
            name="username"
            required
            value="<%= user.name %>"
          />
        </div>
        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input
            type="email"
            class="form-control"
            id="email"
            name="email"
            required
            value="<%= user.email %>"
          />
        </div>
        <div class="mb-3">
          <label for="address" class="form-label">Address</label>
          <textarea class="form-control" id="address" name="address" required>
<%= user.address %></textarea
          >
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="/" class="btn btn-secondary">Back</a>
      </form>
    </div>
  </body>
</html>
```

---

## **🚀 Bước 10: Tạo file chính**

### **10.1 src/app.ts**

```typescript
import express, { Express } from "express";
import path from "path";
import "dotenv/config";
import webRoutes from "@routers/web";

const app: Express = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Static files
app.use(express.static(path.join(__dirname, "../public")));

// View engine
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// Routes
app.use("/", webRoutes);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
```

---

## **🎯 Bước 11: Chạy dự án**

### **11.1 Tạo database và chạy migration**

```bash
# Tạo database MySQL trước
npx prisma migrate dev --name init
npx prisma generate
```

### **11.2 Chạy development server**

```bash
npm run dev
```

### **11.3 Truy cập ứng dụng**

- Mở browser và truy cập: `http://localhost:3000`

---

## **📝 Checklist hoàn thành**

- [ ] ✅ Khởi tạo npm project
- [ ] ✅ Cài đặt dependencies
- [ ] ✅ Cấu hình TypeScript
- [ ] ✅ Tạo cấu trúc thư mục
- [ ] ✅ Cấu hình database (.env + schema.prisma)
- [ ] ✅ Tạo config files
- [ ] ✅ Tạo services (user-service.ts)
- [ ] ✅ Tạo controllers (users.controller.ts)
- [ ] ✅ Tạo routes (web.ts)
- [ ] ✅ Tạo views (EJS templates)
- [ ] ✅ Tạo app.ts
- [ ] ✅ Chạy migration database
- [ ] ✅ Test ứng dụng

---

## **🔧 Lệnh hữu ích**

```bash
# Development
npm run dev

# Production build
npm run build
npm start

# Database
npx prisma migrate dev
npx prisma generate
npx prisma studio

# Debug
npm run start:debug
```

**🎉 Hoàn thành! Bạn đã có một ứng dụng Node.js + TypeScript + Prisma + EJS hoàn chỉnh!**

Similar code found with 4 license types
