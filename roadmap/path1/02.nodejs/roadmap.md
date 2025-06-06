# 🚀 ROADMAP NODE.JS - Path 1 Foundation

## 🎯 Thông tin cơ bản

- **Timeline:** 4 tuần (28 ngày)
- **Prerequisites:** JavaScript ES6+ mastery
- **Goal:** Master Node.js để ready cho Express.js

---

## 📅 Giai đoạn 1: Node.js Fundamentals (Tuần 1)

### **1. Node.js Introduction & Environment:**

    - 1.1. Tìm hiểu Node.js là gì và tại sao sử dụng.
    - 1.2. Cài đặt Node.js và NPM.
    - 1.3. Hiểu về V8 engine và Event Loop.
    - 1.4. Chạy chương trình Node.js đầu tiên.
    - 1.5. So sánh Node.js với browser JavaScript.

### **2. Node.js Runtime Environment:**

    - 2.1. Global objects:`global`, `process`, `__dirname`, `__filename`.
    - 2.2. Process object: `process.argv`, `process.env`, `process.exit()`.
    - 2.3. Command line arguments và environment variables.
    - 2.4. Buffer object và console object.

### **3. Module System (CommonJS):**

    - 3.1. Hiểu về modules trong Node.js.
    - 3.2.`require()` function và cách hoạt động.
    - 3.3. `module.exports` và `exports` object.
    - 3.4. Tạo và sử dụng custom modules.
    - 3.5. Local modules vs global modules.

### **4. Built-in Modules:**

    - 4.1. Path module:`path.join()`, `path.resolve()`, `path.dirname()`.
    - 4.2. OS module: `os.platform()`, `os.arch()`, `os.cpus()`.
    - 4.3. Crypto module: hashing, random generation.
    - 4.4. Util module: `util.promisify()`, `util.callbackify()`.

### **5. File System Operations:**

    - 5.1. Reading files:`fs.readFile()`, `fs.readFileSync()`.
    - 5.2. Writing files: `fs.writeFile()`, `fs.appendFile()`.
    - 5.3. File information: `fs.stat()`, `fs.exists()`.
    - 5.4. Directory operations: `fs.mkdir()`, `fs.readdir()`, `fs.rmdir()`.
    - 5.5. File watching: `fs.watch()`, `fs.watchFile()`.

### **6. Streams Introduction:**

    - 6.1. Hiểu về streams và lợi ích.
    - 6.2. Readable streams:`fs.createReadStream()`.
    - 6.3. Writable streams: `fs.createWriteStream()`.
    - 6.4. Stream events: data, end, error.
    - 6.5. Piping streams.

---

## 📅 Giai đoạn 2: HTTP & Networking (Tuần 2)

### **7. HTTP Module:**

    - 7.1. Creating HTTP server với`http.createServer()`.
    - 7.2. Request object: URL, method, headers.
    - 7.3. Response object: headers, status codes, content.
    - 7.4. Handling different HTTP methods.
    - 7.5. Query parameters và request body.

### **8. Advanced HTTP Features:**

    - 8.1. Manual routing implementation.
    - 8.2. Serving static files (HTML, CSS, JS, images).
    - 8.3. MIME type detection và setting.
    - 8.4. Error handling và 404 responses.
    - 8.5. Basic authentication patterns.

### **9. Working with JSON Data:**

    - 9.1. Parsing JSON từ request body.
    - 9.2. Validating JSON data.
    - 9.3. Sending JSON responses.
    - 9.4. Handling malformed JSON.
    - 9.5. Data transformation và manipulation.

### **10. HTTP Client (Making Requests):**

    - 10.1. Making GET requests với built-in http module.
    - 10.2. POST requests với data.
    - 10.3. Headers và authentication.
    - 10.4. Promise-based request handling.
    - 10.5. Error handling và timeouts.

### **11. Event System:**

    - 11.1. EventEmitter class và cách sử dụng.
    - 11.2. Creating custom events.
    - 11.3. Event listeners:`on()`, `once()`, `off()`.
    - 11.4. Error events và handling.
    - 11.5. Event-driven architecture patterns.

### **12. Async Control Flow:**

    - 12.1. Callback patterns và error-first callbacks.
    - 12.2. Promise patterns trong Node.js.
    - 12.3. Async/await best practices.
    - 12.4. Parallel vs sequential execution.
    - 12.5. Converting callbacks to promises.

---

## 📅 Giai đoạn 3: Packages & Ecosystem (Tuần 3)

### **13. NPM Fundamentals:**

    - 13.1. Package.json file structure và configuration.
    - 13.2. Installing packages: local vs global.
    - 13.3. Dependencies vs devDependencies.
    - 13.4. Package-lock.json và version management.
    - 13.5. NPM commands: install, update, uninstall.

### **14. NPM Scripts & Workflow:**

    - 14.1. Defining scripts trong package.json.
    - 14.2. Pre và post hooks.
    - 14.3. Environment variables với dotenv.
    - 14.4. Development vs production workflows.
    - 14.5. NPM configuration và .npmrc.

### **15. Essential Node.js Packages:**

    - 15.1. Lodash: utility functions cho arrays và objects.
    - 15.2. Moment.js/Day.js: date và time manipulation.
    - 15.3. UUID: unique identifier generation.
    - 15.4. Nodemon: auto-restart development server.
    - 15.5. Chalk: colored console output.

### **16. File Processing & Validation:**

    - 16.1. CSV parsing với csv-parser.
    - 16.2. File validation và type checking.
    - 16.3. Joi: schema validation.
    - 16.4. Image processing basics với Sharp.
    - 16.5. Configuration management.

### **17. Error Handling & Debugging:**

    - 17.1. Custom error classes.
    - 17.2. Error propagation patterns.
    - 17.3. Logging với Winston.
    - 17.4. Debugging techniques: VS Code, console.
    - 17.5. Performance profiling basics.

### **18. Security & Performance:**

    - 18.1. Input sanitization và validation.
    - 18.2. Environment variable security.
    - 18.3. Basic security headers.
    - 18.4. Performance monitoring.
    - 18.5. Memory usage optimization.

---

## 📅 Giai đoạn 4: Advanced Topics & Mastery (Tuần 4)

### **19. Advanced Streams:**

    - 19.1. Transform streams và custom transformations.
    - 19.2. Stream piping và error handling.
    - 19.3. Backpressure handling.
    - 19.4. Object mode streams.
    - 19.5. Stream performance optimization.

### **20. Child Processes:**

    - 20.1. Spawn, exec, execFile, fork differences.
    - 20.2. Inter-process communication (IPC).
    - 20.3. Running shell commands.
    - 20.4. CPU-intensive task handling.
    - 20.5. Process monitoring và error handling.

### **21. Clustering & Scaling:**

    - 21.1. Cluster module và worker processes.
    - 21.2. Load balancing requests.
    - 21.3. Graceful restarts và health monitoring.
    - 21.4. PM2 process manager.
    - 21.5. Scaling strategies.

### **22. Database Integration Preparation:**

    - 22.1. Database connection patterns.
    - 22.2. Connection pooling concepts.
    - 22.3. SQL vs NoSQL considerations.
    - 22.4. Transaction basics.
    - 22.5. Data modeling preparation.

### **23. Production Readiness:**

    - 23.1. Environment configuration management.
    - 23.2. Application structure patterns.
    - 23.3. Health check endpoints.
    - 23.4. Graceful shutdown handling.
    - 23.5. Container preparation.

### **24. Testing Introduction:**

    - 24.1. Testing concepts: unit, integration, e2e.
    - 24.2. Built-in assert module.
    - 24.3. Test organization và structure.
    - 24.4. Mocking concepts.
    - 24.5. Basic test automation.

---

## 📅 Project milestones

### **Week 1 Project:** CLI File Manager

- File CRUD operations
- Directory navigation
- Stream-based file processing

### **Week 2 Project:** HTTP API Server

- RESTful endpoints
- JSON data handling
- Static file serving
- Error handling

### **Week 3 Project:** Package-based Application

- NPM workflow setup
- Third-party package integration
- Logging và validation
- Development automation

### **Week 4 Project:** Production-Ready API

- Complete REST API
- Worker processes
- Health monitoring
- Testing setup
- Documentation

---

## 🎯 Mastery Checklist

### **Core Node.js:**

- [ ] Runtime environment understanding
- [ ] Module system mastery
- [ ] File system operations
- [ ] Stream processing
- [ ] Event-driven programming

### **HTTP & Networking:**

- [x] HTTP server creation
- [x] Request/response handling
- [ ] API development
- [ ] Client-side requests
- [ ] Error handling

### **Ecosystem:**

- [ ] NPM package management
- [ ] Development workflow
- [ ] Popular packages usage
- [ ] Security awareness
- [ ] Performance basics

### **Advanced Concepts:**

- [ ] Child processes
- [ ] Clustering
- [ ] Production preparation
- [ ] Testing foundations
- [ ] Architecture patterns

**🎉 Ready for Express.js development! 🎉**
