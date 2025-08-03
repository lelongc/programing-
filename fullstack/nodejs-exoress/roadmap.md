# Lộ trình học Node.js và Express.js đầy đủ

## 📋 Mục lục

1. [Kiến thức nền tảng](#kiến-thức-nền-tảng)
2. [Node.js cơ bản](#nodejs-cơ-bản)
3. [Node.js nâng cao](#nodejs-nâng-cao)
4. [Express.js cơ bản](#expressjs-cơ-bản)
5. [Express.js nâng cao](#expressjs-nâng-cao)
6. [Database & ORM](#database--orm)
7. [Authentication & Authorization](#authentication--authorization)
8. [Testing](#testing)
9. [Deployment & DevOps](#deployment--devops)
10. [Best Practices & Architecture](#best-practices--architecture)

---

## 🎯 Kiến thức nền tảng

### JavaScript ES6+

- [ ] **Arrow Functions**
- [ ] **Destructuring Assignment**
- [ ] **Template Literals**
- [ ] **Promises & Async/Await**
- [ ] **Modules (import/export)**
- [ ] **Classes**
- [ ] **Spread/Rest Operators**
- [ ] **Map, Set, WeakMap, WeakSet**

### HTTP Protocol

- [ ] **HTTP Methods** (GET, POST, PUT, DELETE, PATCH)
- [ ] **Status Codes** (2xx, 3xx, 4xx, 5xx)
- [ ] **Headers**
- [ ] **Request/Response Cycle**
- [ ] **CORS (Cross-Origin Resource Sharing)**

### Package Managers

- [ ] **npm** (Node Package Manager)
- [ ] **yarn**
- [ ] **package.json** configuration
- [ ] **Semantic Versioning**
- [ ] **Lock files** (package-lock.json, yarn.lock)

---

## 🟢 Node.js cơ bản

### 1. Giới thiệu Node.js

- [ ] **Node.js là gì?**
- [ ] **V8 JavaScript Engine**
- [ ] **Event Loop**
- [ ] **Single-threaded vs Multi-threaded**
- [ ] **Blocking vs Non-blocking**

### 2. Environment Setup

- [ ] **Cài đặt Node.js**
- [ ] **Node Version Manager (nvm)**
- [ ] **IDE Setup** (VS Code, WebStorm)
- [ ] **Debugging tools**

### 3. Core Modules

```javascript
// File System (fs)
const fs = require("fs");
fs.readFile("file.txt", "utf8", callback);
fs.promises.readFile("file.txt", "utf8");

// Path
const path = require("path");
path.join(__dirname, "files", "data.txt");

// URL
const url = require("url");
const querystring = require("querystring");

// Crypto
const crypto = require("crypto");
crypto.randomBytes(16);

// Util
const util = require("util");
util.promisify(fs.readFile);
```

- [ ] **File System (fs)**
  - Synchronous vs Asynchronous operations
  - Reading/Writing files
  - Directory operations
  - File streams
- [ ] **Path Module**
- [ ] **URL Module**
- [ ] **Query String**
- [ ] **Crypto Module**
- [ ] **Util Module**

### 4. Global Objects

- [ ] **`__dirname` và `__filename`**
- [ ] **`process` object**
- [ ] **`console` object**
- [ ] **`global` object**
- [ ] **`Buffer`**

### 5. Modules System

```javascript
// CommonJS
const module = require("./module");
module.exports = { function1, function2 };

// ES Modules (với type: "module" trong package.json)
import { function1 } from "./module.js";
export { function1, function2 };
```

- [ ] **CommonJS vs ES Modules**
- [ ] **Requiring modules**
- [ ] **Creating custom modules**
- [ ] **Module caching**
- [ ] **Module resolution**

### 6. Events

```javascript
const EventEmitter = require("events");

class MyEmitter extends EventEmitter {}
const myEmitter = new MyEmitter();

myEmitter.on("event", () => {
  console.log("An event occurred!");
});

myEmitter.emit("event");
```

- [ ] **EventEmitter class**
- [ ] **Event-driven architecture**
- [ ] **Custom events**
- [ ] **Event listeners**

### 7. Streams

```javascript
const fs = require("fs");

// Readable Stream
const readStream = fs.createReadStream("input.txt");
readStream.on("data", (chunk) => console.log(chunk));

// Writable Stream
const writeStream = fs.createWriteStream("output.txt");
writeStream.write("Hello World");

// Pipe
readStream.pipe(writeStream);
```

- [ ] **Readable Streams**
- [ ] **Writable Streams**
- [ ] **Transform Streams**
- [ ] **Duplex Streams**
- [ ] **Pipe method**
- [ ] **Stream events**

### 8. HTTP Module

```javascript
const http = require("http");

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Hello World");
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});
```

- [ ] **Creating HTTP server**
- [ ] **Request/Response objects**
- [ ] **Handling different HTTP methods**
- [ ] **URL parsing**
- [ ] **HTTP client requests**

---

## 🟡 Node.js nâng cao

### 1. Asynchronous Programming

```javascript
// Callbacks
fs.readFile("file.txt", (err, data) => {
  if (err) throw err;
  console.log(data);
});

// Promises
const readFilePromise = util.promisify(fs.readFile);
readFilePromise("file.txt")
  .then((data) => console.log(data))
  .catch((err) => console.error(err));

// Async/Await
async function readFile() {
  try {
    const data = await readFilePromise("file.txt");
    console.log(data);
  } catch (err) {
    console.error(err);
  }
}
```

- [ ] **Callback Pattern**
- [ ] **Callback Hell**
- [ ] **Promises**
- [ ] **Async/Await**
- [ ] **Promise.all(), Promise.race()**
- [ ] **Error handling in async code**

### 2. Error Handling

```javascript
// Synchronous errors
try {
  const data = JSON.parse(invalidJson);
} catch (err) {
  console.error("Parse error:", err.message);
}

// Asynchronous errors
process.on("uncaughtException", (err) => {
  console.error("Uncaught Exception:", err);
  process.exit(1);
});

process.on("unhandledRejection", (reason, promise) => {
  console.error("Unhandled Rejection:", reason);
});
```

- [ ] **Try/Catch blocks**
- [ ] **Error-first callbacks**
- [ ] **Custom Error classes**
- [ ] **Uncaught exceptions**
- [ ] **Unhandled promise rejections**

### 3. Performance & Memory

- [ ] **Memory management**
- [ ] **Garbage collection**
- [ ] **Memory leaks detection**
- [ ] **CPU profiling**
- [ ] **Event loop monitoring**
- [ ] **Clustering**

### 4. Worker Threads

```javascript
const { Worker, isMainThread, parentPort } = require("worker_threads");

if (isMainThread) {
  const worker = new Worker(__filename);
  worker.postMessage("Hello Worker");
  worker.on("message", (data) => {
    console.log("Received:", data);
  });
} else {
  parentPort.on("message", (data) => {
    parentPort.postMessage(`Echo: ${data}`);
  });
}
```

- [ ] **Creating worker threads**
- [ ] **Message passing**
- [ ] **Shared memory**
- [ ] **CPU-intensive tasks**

### 5. Child Processes

```javascript
const { spawn, exec, fork } = require("child_process");

// Spawn
const ls = spawn("ls", ["-lh"]);
ls.stdout.on("data", (data) => {
  console.log(`stdout: ${data}`);
});

// Exec
exec("ls -lh", (error, stdout, stderr) => {
  if (error) throw error;
  console.log(stdout);
});

// Fork
const child = fork("child.js");
child.send({ hello: "world" });
```

- [ ] **spawn(), exec(), fork()**
- [ ] **Inter-process communication**
- [ ] **Process management**

---

## 🔵 Express.js cơ bản

### 1. Giới thiệu Express.js

- [ ] **Express.js là gì?**
- [ ] **Cài đặt Express**
- [ ] **Tạo ứng dụng đầu tiên**

### 2. Basic Server Setup

```javascript
const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Hello Express!");
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

### 3. Routing

```javascript
// Basic routes
app.get("/users", (req, res) => {
  res.json({ users: [] });
});

app.post("/users", (req, res) => {
  res.status(201).json({ message: "User created" });
});

// Route parameters
app.get("/users/:id", (req, res) => {
  const userId = req.params.id;
  res.json({ userId });
});

// Query parameters
app.get("/search", (req, res) => {
  const { q, limit } = req.query;
  res.json({ query: q, limit });
});

// Route handlers
app.get("/users/:id", getUserById, sendUserResponse);

function getUserById(req, res, next) {
  // Logic to get user
  req.user = { id: req.params.id, name: "John" };
  next();
}

function sendUserResponse(req, res) {
  res.json(req.user);
}
```

- [ ] **Basic routing** (GET, POST, PUT, DELETE)
- [ ] **Route parameters**
- [ ] **Query parameters**
- [ ] **Route handlers**
- [ ] **Router module**

### 4. Middleware

```javascript
// Built-in middleware
app.use(express.json()); // Parse JSON bodies
app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies
app.use(express.static("public")); // Serve static files

// Custom middleware
const logger = (req, res, next) => {
  console.log(`${req.method} ${req.url} - ${new Date().toISOString()}`);
  next();
};

app.use(logger);

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});
```

- [ ] **Built-in middleware**
- [ ] **Third-party middleware**
- [ ] **Custom middleware**
- [ ] **Application-level middleware**
- [ ] **Router-level middleware**
- [ ] **Error-handling middleware**

### 5. Request & Response Objects

```javascript
app.get("/demo", (req, res) => {
  // Request object
  console.log(req.method); // HTTP method
  console.log(req.url); // URL
  console.log(req.headers); // Headers
  console.log(req.body); // Body (with body parser)
  console.log(req.params); // Route parameters
  console.log(req.query); // Query parameters
  console.log(req.cookies); // Cookies

  // Response object
  res.status(200); // Set status code
  res.set("X-Custom", "value"); // Set headers
  res.cookie("session", "abc123"); // Set cookies
  res.json({ message: "OK" }); // Send JSON response
  res.send("Plain text"); // Send text response
  res.render("template"); // Render template
  res.redirect("/login"); // Redirect
});
```

### 6. Static Files

```javascript
// Serve static files from 'public' directory
app.use(express.static("public"));

// Multiple static directories
app.use("/static", express.static("public"));
app.use("/assets", express.static("assets"));

// Static file options
app.use(
  "/static",
  express.static("public", {
    maxAge: "1d",
    etag: false,
  })
);
```

### 7. Template Engines

```javascript
// EJS
app.set("view engine", "ejs");
app.set("views", "./views");

app.get("/profile", (req, res) => {
  res.render("profile", {
    user: { name: "John", email: "john@email.com" },
  });
});

// Handlebars
const exphbs = require("express-handlebars");
app.engine("handlebars", exphbs());
app.set("view engine", "handlebars");
```

- [ ] **EJS (Embedded JavaScript)**
- [ ] **Handlebars**
- [ ] **Pug**
- [ ] **Template configuration**
- [ ] **Passing data to templates**

---

## 🟠 Express.js nâng cao

### 1. Advanced Routing

```javascript
const express = require("express");
const router = express.Router();

// Router module
router.get("/", (req, res) => {
  res.send("Users home page");
});

router.get("/:id", (req, res) => {
  res.send(`User ${req.params.id}`);
});

// Route with multiple handlers
router.get("/:id", validateUser, checkPermissions, getUser);

// Route patterns
app.get("/ab?cd", handler); // Matches 'acd' and 'abcd'
app.get("/ab+cd", handler); // Matches 'abcd', 'abbcd', etc.
app.get("/ab*cd", handler); // Matches 'abcd', 'abxcd', etc.
app.get("/ab(cd)?e", handler); // Matches 'abe' and 'abcde'

// Using router
app.use("/users", router);
```

- [ ] **Express Router**
- [ ] **Route patterns**
- [ ] **Route parameters validation**
- [ ] **Nested routes**
- [ ] **Route-specific middleware**

### 2. Error Handling

```javascript
// Custom error class
class AppError extends Error {
  constructor(message, statusCode) {
    super(message);
    this.statusCode = statusCode;
    this.isOperational = true;
    Error.captureStackTrace(this, this.constructor);
  }
}

// Async error wrapper
const asyncHandler = (fn) => (req, res, next) => {
  Promise.resolve(fn(req, res, next)).catch(next);
};

// Usage
app.get(
  "/users/:id",
  asyncHandler(async (req, res, next) => {
    const user = await User.findById(req.params.id);
    if (!user) {
      return next(new AppError("User not found", 404));
    }
    res.json(user);
  })
);

// Global error handler
app.use((err, req, res, next) => {
  err.statusCode = err.statusCode || 500;
  err.status = err.status || "error";

  if (process.env.NODE_ENV === "development") {
    res.status(err.statusCode).json({
      status: err.status,
      error: err,
      message: err.message,
      stack: err.stack,
    });
  } else {
    res.status(err.statusCode).json({
      status: err.status,
      message: err.message,
    });
  }
});
```

### 3. Validation & Sanitization

```javascript
const { body, validationResult } = require("express-validator");

// Validation middleware
const validateUser = [
  body("email").isEmail().normalizeEmail(),
  body("password").isLength({ min: 6 }),
  body("name").trim().escape(),
  (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    next();
  },
];

app.post("/users", validateUser, (req, res) => {
  // Process valid data
});
```

### 4. Security Best Practices

```javascript
const helmet = require("helmet");
const rateLimit = require("express-rate-limit");
const hpp = require("hpp");
const cors = require("cors");

// Security headers
app.use(helmet());

// Rate limiting
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per windowMs
});
app.use("/api/", limiter);

// Prevent HTTP Parameter Pollution
app.use(hpp());

// CORS
app.use(
  cors({
    origin: "http://localhost:3000",
    credentials: true,
  })
);
```

- [ ] **Helmet.js** (Security headers)
- [ ] **Rate limiting**
- [ ] **CORS configuration**
- [ ] **Input sanitization**
- [ ] **SQL injection prevention**
- [ ] **XSS protection**

### 5. File Upload

```javascript
const multer = require("multer");

// Configure storage
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/");
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + "-" + file.originalname);
  },
});

const upload = multer({
  storage,
  limits: { fileSize: 5 * 1024 * 1024 }, // 5MB limit
  fileFilter: (req, file, cb) => {
    if (file.mimetype.startsWith("image/")) {
      cb(null, true);
    } else {
      cb(new Error("Only image files allowed!"), false);
    }
  },
});

// Single file upload
app.post("/upload", upload.single("avatar"), (req, res) => {
  res.json({ file: req.file });
});

// Multiple files upload
app.post("/gallery", upload.array("photos", 5), (req, res) => {
  res.json({ files: req.files });
});
```

### 6. Session Management

```javascript
const session = require("express-session");
const MongoStore = require("connect-mongo");

app.use(
  session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
    store: MongoStore.create({
      mongoUrl: process.env.MONGODB_URI,
    }),
    cookie: {
      secure: process.env.NODE_ENV === "production",
      httpOnly: true,
      maxAge: 24 * 60 * 60 * 1000, // 24 hours
    },
  })
);
```

---

## 🗄️ Database & ORM

### 1. MongoDB & Mongoose

```javascript
const mongoose = require("mongoose");

// Connection
mongoose.connect("mongodb://localhost:27017/myapp", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Schema
const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  createdAt: { type: Date, default: Date.now },
});

// Model
const User = mongoose.model("User", userSchema);

// CRUD operations
const createUser = async (userData) => {
  const user = new User(userData);
  return await user.save();
};

const getUsers = async () => {
  return await User.find();
};

const getUserById = async (id) => {
  return await User.findById(id);
};

const updateUser = async (id, updates) => {
  return await User.findByIdAndUpdate(id, updates, { new: true });
};

const deleteUser = async (id) => {
  return await User.findByIdAndDelete(id);
};
```

- [ ] **MongoDB connection**
- [ ] **Mongoose schemas**
- [ ] **Models and collections**
- [ ] **CRUD operations**
- [ ] **Query methods**
- [ ] **Population**
- [ ] **Middleware (pre/post hooks)**
- [ ] **Validation**
- [ ] **Indexes**

### 2. SQL Databases (PostgreSQL/MySQL)

```javascript
// Sequelize ORM
const { Sequelize, DataTypes } = require("sequelize");

const sequelize = new Sequelize("database", "username", "password", {
  host: "localhost",
  dialect: "postgres",
});

// Model definition
const User = sequelize.define("User", {
  firstName: DataTypes.STRING,
  lastName: DataTypes.STRING,
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
});

// Associations
User.hasMany(Post);
Post.belongsTo(User);

// Queries
const users = await User.findAll({
  include: Post,
  where: { active: true },
  order: [["createdAt", "DESC"]],
});
```

- [ ] **Sequelize ORM**
- [ ] **Model definitions**
- [ ] **Associations**
- [ ] **Migrations**
- [ ] **Seeders**
- [ ] **Transactions**
- [ ] **Raw queries**

### 3. Redis

```javascript
const redis = require("redis");
const client = redis.createClient();

// Caching
app.get("/users/:id", async (req, res) => {
  const cacheKey = `user:${req.params.id}`;

  // Try cache first
  const cached = await client.get(cacheKey);
  if (cached) {
    return res.json(JSON.parse(cached));
  }

  // Fetch from database
  const user = await User.findById(req.params.id);

  // Cache the result
  await client.setex(cacheKey, 3600, JSON.stringify(user));

  res.json(user);
});
```

- [ ] **Redis setup**
- [ ] **Caching strategies**
- [ ] **Session storage**
- [ ] **Pub/Sub**

---

## 🔐 Authentication & Authorization

### 1. JWT Authentication

```javascript
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");

// Register
app.post("/register", async (req, res) => {
  const { email, password } = req.body;

  // Hash password
  const hashedPassword = await bcrypt.hash(password, 12);

  // Create user
  const user = await User.create({
    email,
    password: hashedPassword,
  });

  // Generate token
  const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET, {
    expiresIn: "7d",
  });

  res.status(201).json({ token, user: { id: user._id, email } });
});

// Login
app.post("/login", async (req, res) => {
  const { email, password } = req.body;

  // Find user
  const user = await User.findOne({ email });
  if (!user) {
    return res.status(401).json({ message: "Invalid credentials" });
  }

  // Check password
  const isPasswordValid = await bcrypt.compare(password, user.password);
  if (!isPasswordValid) {
    return res.status(401).json({ message: "Invalid credentials" });
  }

  // Generate token
  const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET, {
    expiresIn: "7d",
  });

  res.json({ token, user: { id: user._id, email } });
});

// Authentication middleware
const authenticate = (req, res, next) => {
  const token = req.header("Authorization")?.replace("Bearer ", "");

  if (!token) {
    return res.status(401).json({ message: "No token provided" });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.userId = decoded.userId;
    next();
  } catch (error) {
    res.status(401).json({ message: "Invalid token" });
  }
};

// Protected route
app.get("/profile", authenticate, async (req, res) => {
  const user = await User.findById(req.userId);
  res.json(user);
});
```

### 2. Passport.js

```javascript
const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;
const GoogleStrategy = require("passport-google-oauth20").Strategy;

// Local strategy
passport.use(
  new LocalStrategy(
    { usernameField: "email" },
    async (email, password, done) => {
      try {
        const user = await User.findOne({ email });
        if (!user) {
          return done(null, false, { message: "User not found" });
        }

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
          return done(null, false, { message: "Invalid password" });
        }

        return done(null, user);
      } catch (error) {
        return done(error);
      }
    }
  )
);

// Google OAuth strategy
passport.use(
  new GoogleStrategy(
    {
      clientID: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
      callbackURL: "/auth/google/callback",
    },
    async (accessToken, refreshToken, profile, done) => {
      try {
        let user = await User.findOne({ googleId: profile.id });

        if (!user) {
          user = await User.create({
            googleId: profile.id,
            name: profile.displayName,
            email: profile.emails[0].value,
          });
        }

        return done(null, user);
      } catch (error) {
        return done(error);
      }
    }
  )
);

// Serialize/Deserialize
passport.serializeUser((user, done) => {
  done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
  try {
    const user = await User.findById(id);
    done(null, user);
  } catch (error) {
    done(error);
  }
});
```

### 3. Role-based Authorization

```javascript
// Role middleware
const authorize = (...roles) => {
  return (req, res, next) => {
    if (!req.user) {
      return res.status(401).json({ message: "Unauthorized" });
    }

    if (!roles.includes(req.user.role)) {
      return res.status(403).json({ message: "Forbidden" });
    }

    next();
  };
};

// Usage
app.get("/admin", authenticate, authorize("admin"), (req, res) => {
  res.json({ message: "Admin only content" });
});

app.delete(
  "/users/:id",
  authenticate,
  authorize("admin", "moderator"),
  (req, res) => {
    // Delete user logic
  }
);
```

---

## 🧪 Testing

### 1. Unit Testing with Jest

```javascript
// user.test.js
const User = require("../models/User");

describe("User Model", () => {
  test("should create a new user", async () => {
    const userData = {
      name: "John Doe",
      email: "john@example.com",
      password: "password123",
    };

    const user = new User(userData);
    const savedUser = await user.save();

    expect(savedUser._id).toBeDefined();
    expect(savedUser.email).toBe(userData.email);
  });

  test("should hash password before saving", async () => {
    const user = new User({
      name: "Jane Doe",
      email: "jane@example.com",
      password: "plaintext",
    });

    await user.save();
    expect(user.password).not.toBe("plaintext");
  });
});
```

### 2. Integration Testing with Supertest

```javascript
// app.test.js
const request = require("supertest");
const app = require("../app");

describe("User API", () => {
  test("POST /api/users should create a user", async () => {
    const userData = {
      name: "Test User",
      email: "test@example.com",
      password: "password123",
    };

    const response = await request(app)
      .post("/api/users")
      .send(userData)
      .expect(201);

    expect(response.body.user.email).toBe(userData.email);
    expect(response.body.token).toBeDefined();
  });

  test("GET /api/users should require authentication", async () => {
    await request(app).get("/api/users").expect(401);
  });

  test("GET /api/users should return users when authenticated", async () => {
    const token = "valid-jwt-token";

    const response = await request(app)
      .get("/api/users")
      .set("Authorization", `Bearer ${token}`)
      .expect(200);

    expect(Array.isArray(response.body)).toBe(true);
  });
});
```

### 3. Test Configuration

```javascript
// jest.config.js
module.exports = {
  testEnvironment: "node",
  setupFilesAfterEnv: ["<rootDir>/tests/setup.js"],
  testMatch: ["**/__tests__/**/*.js", "**/?(*.)+(spec|test).js"],
  collectCoverageFrom: ["src/**/*.js", "!src/config/**", "!src/migrations/**"],
  coverageThreshold: {
    global: {
      branches: 80,
      functions: 80,
      lines: 80,
      statements: 80,
    },
  },
};

// tests/setup.js
const mongoose = require("mongoose");

beforeAll(async () => {
  await mongoose.connect("mongodb://localhost:27017/test_db");
});

afterEach(async () => {
  await mongoose.connection.db.dropDatabase();
});

afterAll(async () => {
  await mongoose.connection.close();
});
```

---

## 🚀 Deployment & DevOps

### 1. Environment Configuration

```javascript
// config/config.js
const config = {
  development: {
    port: process.env.PORT || 3000,
    database: {
      uri: process.env.MONGODB_URI || "mongodb://localhost:27017/myapp_dev",
    },
    jwt: {
      secret: process.env.JWT_SECRET || "dev-secret",
    },
  },
  production: {
    port: process.env.PORT,
    database: {
      uri: process.env.MONGODB_URI,
    },
    jwt: {
      secret: process.env.JWT_SECRET,
    },
  },
};

module.exports = config[process.env.NODE_ENV || "development"];
```

### 2. Process Management with PM2

```javascript
// ecosystem.config.js
module.exports = {
  apps: [
    {
      name: "myapp",
      script: "./app.js",
      instances: "max",
      exec_mode: "cluster",
      env: {
        NODE_ENV: "development",
      },
      env_production: {
        NODE_ENV: "production",
        PORT: 3000,
      },
      error_file: "./logs/err.log",
      out_file: "./logs/out.log",
      log_file: "./logs/combined.log",
    },
  ],
};
```

### 3. Docker

```dockerfile
# Dockerfile
FROM node:16-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY . .

EXPOSE 3000

USER node

CMD ["npm", "start"]
```

```yaml
# docker-compose.yml
version: "3.8"

services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
      - MONGODB_URI=mongodb://mongo:27017/myapp
    depends_on:
      - mongo
    restart: unless-stopped

  mongo:
    image: mongo:5
    volumes:
      - mongo_data:/data/db
    restart: unless-stopped

volumes:
  mongo_data:
```

### 4. Logging

```javascript
const winston = require("winston");

const logger = winston.createLogger({
  level: "info",
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.errors({ stack: true }),
    winston.format.json()
  ),
  defaultMeta: { service: "myapp" },
  transports: [
    new winston.transports.File({ filename: "logs/error.log", level: "error" }),
    new winston.transports.File({ filename: "logs/combined.log" }),
  ],
});

if (process.env.NODE_ENV !== "production") {
  logger.add(
    new winston.transports.Console({
      format: winston.format.simple(),
    })
  );
}

// Usage
logger.info("Server started", { port: 3000 });
logger.error("Database connection failed", { error: error.message });
```

### 5. Monitoring & Health Checks

```javascript
// Health check endpoint
app.get("/health", async (req, res) => {
  const health = {
    uptime: process.uptime(),
    message: "OK",
    timestamp: new Date().toISOString(),
    checks: {
      database: "OK",
      redis: "OK",
    },
  };

  try {
    // Check database connection
    await mongoose.connection.db.admin().ping();

    // Check Redis connection
    await redisClient.ping();

    res.status(200).json(health);
  } catch (error) {
    health.message = "ERROR";
    health.checks.database = error.message;
    res.status(503).json(health);
  }
});
```

---

## 📋 Best Practices & Architecture

### 1. Project Structure

```
project/
├── src/
│   ├── controllers/
│   ├── models/
│   ├── routes/
│   ├── middleware/
│   ├── services/
│   ├── utils/
│   └── config/
├── tests/
├── docs/
├── scripts/
└── package.json
```

### 2. Clean Architecture

```javascript
// controllers/userController.js
const userService = require("../services/userService");

const createUser = async (req, res, next) => {
  try {
    const user = await userService.createUser(req.body);
    res.status(201).json(user);
  } catch (error) {
    next(error);
  }
};

// services/userService.js
const User = require("../models/User");

const createUser = async (userData) => {
  // Business logic
  const existingUser = await User.findOne({ email: userData.email });
  if (existingUser) {
    throw new Error("User already exists");
  }

  return await User.create(userData);
};

// routes/userRoutes.js
const express = require("express");
const userController = require("../controllers/userController");
const { validateUser } = require("../middleware/validation");

const router = express.Router();

router.post("/", validateUser, userController.createUser);

module.exports = router;
```

### 3. API Documentation with Swagger

```javascript
const swaggerJsdoc = require("swagger-jsdoc");
const swaggerUi = require("swagger-ui-express");

const options = {
  definition: {
    openapi: "3.0.0",
    info: {
      title: "My API",
      version: "1.0.0",
      description: "A simple Express API",
    },
    servers: [
      {
        url: "http://localhost:3000/api",
        description: "Development server",
      },
    ],
  },
  apis: ["./routes/*.js"],
};

const specs = swaggerJsdoc(options);
app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(specs));

/**
 * @swagger
 * /users:
 *   post:
 *     summary: Create a new user
 *     tags: [Users]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *               email:
 *                 type: string
 *     responses:
 *       201:
 *         description: User created successfully
 */
```

### 4. Performance Optimization

- [ ] **Caching strategies**
- [ ] **Database indexing**
- [ ] **Connection pooling**
- [ ] **Compression middleware**
- [ ] **CDN for static assets**
- [ ] **Rate limiting**
- [ ] **Memory leak detection**

### 5. Security Checklist

- [ ] **Input validation & sanitization**
- [ ] **SQL injection prevention**
- [ ] **XSS protection**
- [ ] **CSRF protection**
- [ ] **Secure headers (Helmet.js)**
- [ ] **Authentication & authorization**
- [ ] **Rate limiting**
- [ ] **Secure cookies**
- [ ] **HTTPS enforcement**
- [ ] **Environment variables for secrets**

---

## 📚 Tài liệu tham khảo

### Official Documentation

- [Node.js Documentation](https://nodejs.org/docs/)
- [Express.js Documentation](https://expressjs.com/)
- [NPM Documentation](https://docs.npmjs.com/)

### Useful Libraries

- **Web Framework**: Express.js, Fastify, Koa.js
- **Database**: Mongoose, Sequelize, Prisma
- **Authentication**: Passport.js, jsonwebtoken
- **Validation**: Joi, express-validator
- **Testing**: Jest, Mocha, Supertest
- **Security**: Helmet, bcrypt, express-rate-limit
- **Logging**: Winston, Morgan
- **Process Management**: PM2, Forever

### Learning Resources

- [The Node.js Handbook](https://nodejs.dev/)
- [Express.js Guide](https://expressjs.com/en/guide/)
- [Mozilla Developer Network](https://developer.mozilla.org/)
- [W3Schools Node.js Tutorial](https://www.w3schools.com/nodejs/)

---

## ✅ Checklist hoàn thành

### Beginner Level

- [ ] Hiểu về JavaScript ES6+ và asynchronous programming
- [ ] Thiết lập môi trường Node.js development
- [ ] Tạo HTTP server cơ bản với Node.js
- [ ] Sử dụng core modules (fs, path, http, etc.)
- [ ] Tạo và sử dụng custom modules
- [ ] Xây dựng REST API đơn giản với Express.js
- [ ] Implement routing và middleware
- [ ] Xử lý request/response objects
- [ ] Serve static files
- [ ] Basic error handling

### Intermediate Level

- [ ] Kết nối và thao tác với database (MongoDB/SQL)
- [ ] Implement authentication và authorization
- [ ] File upload handling
- [ ] Input validation và sanitization
- [ ] Session management
- [ ] Security best practices
- [ ] Basic testing (unit & integration)
- [ ] Environment configuration
- [ ] API documentation

### Advanced Level

- [ ] Advanced async programming patterns
- [ ] Performance optimization
- [ ] Caching strategies
- [ ] Microservices architecture
- [ ] Worker threads và child processes
- [ ] Real-time communication (WebSockets)
- [ ] Advanced testing strategies
- [ ] CI/CD implementation
- [ ] Monitoring và logging
- [ ] Production deployment

---

_Lộ trình này được thiết kế để học từ cơ bản đến nâng cao. Hãy thực hành thường xuyên và xây dựng projects thực tế để củng cố kiến thức!_
