# 🚀 Hướng dẫn cài đặt và chạy dự án trên Local & Docker

## **📋 Yêu cầu hệ thống**

### **Minimum Requirements:**

- **Node.js:** >= 18.0.0
- **npm:** >= 8.0.0 (hoặc yarn >= 1.22.0)
- **MySQL:** >= 8.0
- **Git:** Latest version
- **Docker:** >= 20.10 (nếu chạy với Docker)
- **Docker Compose:** >= 2.0

---

## **💻 Cách 1: Chạy trên Local Machine**

### **🔧 Bước 1: Cài đặt Dependencies**

#### **1.1 Cài đặt Node.js**

```bash
# Kiểm tra version hiện tại
node --version
npm --version

# Nếu chưa có, download từ: https://nodejs.org/
# Hoặc sử dụng Node Version Manager (NVM)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install 18
nvm use 18
```

#### **1.2 Cài đặt MySQL**

**Windows:**

```bash
# Download MySQL Installer từ: https://dev.mysql.com/downloads/installer/
# Hoặc sử dụng Chocolatey
choco install mysql

# Khởi động MySQL service
net start mysql
```

**macOS:**

```bash
# Sử dụng Homebrew
brew install mysql
brew services start mysql

# Secure installation
mysql_secure_installation
```

**Linux (Ubuntu/Debian):**

```bash
sudo apt update
sudo apt install mysql-server
sudo systemctl start mysql
sudo systemctl enable mysql
sudo mysql_secure_installation
```

### **🗂️ Bước 2: Clone và Setup Project**

```bash
# Clone repository
git clone <your-repo-url>
cd nodejs-project

# Cài đặt packages
npm install

# Hoặc nếu dùng yarn
yarn install
```

### **⚙️ Bước 3: Cấu hình Environment**

#### **3.1 Tạo file .env**

```bash
cp .env.example .env
```

#### **3.2 Cập nhật .env file**

```env
# Environment
NODE_ENV=development

# Database Configuration
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_DATABASE=nodejshit

# Prisma Database URL
DATABASE_URL="mysql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_DATABASE}?connection_limit=1&sslmode=prefer"

# Server
PORT=3000
```

### **🗄️ Bước 4: Setup Database**

#### **4.1 Tạo Database**

```bash
# Đăng nhập MySQL
mysql -u root -p

# Tạo database
CREATE DATABASE nodejshit;
EXIT;
```

#### **4.2 Chạy Prisma Migrations**

```bash
# Generate Prisma client
npx prisma generate

# Run database migrations
npx prisma migrate dev --name init

# (Optional) Seed data
npx prisma db seed
```

### **🚀 Bước 5: Chạy Application**

#### **5.1 Development Mode**

```bash
# Chạy với hot-reload
npm run dev

# Hoặc
yarn dev
```

#### **5.2 Production Mode**

```bash
# Build project
npm run build

# Start production server
npm start
```

#### **5.3 Debug Mode**

```bash
# Chạy với debugger
npm run start:debug

# Sau đó attach debugger từ VS Code hoặc Chrome DevTools
```

### **📱 Bước 6: Truy cập Application**

- **Local URL:** http://localhost:3000
- **API Health Check:** http://localhost:3000/health (nếu có)
- **Prisma Studio:** `npx prisma studio` → http://localhost:5555

---

## **🐳 Cách 2: Chạy với Docker**

### **📦 Bước 1: Tạo Dockerfile**

#### **1.1 Dockerfile cho Node.js app**

```dockerfile
# Multi-stage build for production optimization
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./
COPY tsconfig.json ./

# Install dependencies
RUN npm ci --only=production && npm cache clean --force

# Copy source code
COPY src/ ./src/
COPY prisma/ ./prisma/

# Generate Prisma client
RUN npx prisma generate

# Build application
RUN npm run build

# Production stage
FROM node:18-alpine AS production

WORKDIR /app

# Create non-root user
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nextjs -u 1001

# Copy built application
COPY --from=builder --chown=nextjs:nodejs /app/dist ./dist
COPY --from=builder --chown=nextjs:nodejs /app/node_modules ./node_modules
COPY --from=builder --chown=nextjs:nodejs /app/package*.json ./
COPY --from=builder --chown=nextjs:nodejs /app/prisma ./prisma

# Copy views and public assets
COPY --chown=nextjs:nodejs src/views ./src/views
COPY --chown=nextjs:nodejs public ./public

USER nextjs

EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

CMD ["node", "dist/app.js"]
```

### **🗄️ Bước 2: Tạo Docker Compose**

#### **2.1 docker-compose.yml**

```yaml
version: "3.8"

services:
  # MySQL Database
  mysql:
    image: mysql:8.0
    container_name: nodejs-mysql
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: nodejshit
      MYSQL_USER: appuser
      MYSQL_PASSWORD: apppassword
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql:ro
    networks:
      - app-network
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      timeout: 20s
      retries: 10

  # Node.js Application
  app:
    build:
      context: .
      dockerfile: Dockerfile
      target: production
    container_name: nodejs-app
    restart: unless-stopped
    ports:
      - "3000:3000"
    environment:
      NODE_ENV: production
      DB_HOST: mysql
      DB_PORT: 3306
      DB_USER: appuser
      DB_PASSWORD: apppassword
      DB_DATABASE: nodejshit
      DATABASE_URL: "mysql://appuser:apppassword@mysql:3306/nodejshit?connection_limit=1&sslmode=prefer"
    depends_on:
      mysql:
        condition: service_healthy
    networks:
      - app-network
    volumes:
      - ./uploads:/app/uploads # Nếu cần persist uploads

  # Prisma Studio (Optional - for development)
  prisma-studio:
    build:
      context: .
      dockerfile: Dockerfile.prisma-studio
    container_name: prisma-studio
    restart: unless-stopped
    ports:
      - "5555:5555"
    environment:
      DATABASE_URL: "mysql://appuser:apppassword@mysql:3306/nodejshit"
    depends_on:
      - mysql
    networks:
      - app-network
    profiles:
      - development

volumes:
  mysql_data:
    driver: local

networks:
  app-network:
    driver: bridge
```

#### **2.2 docker-compose.dev.yml (Development)**

```yaml
version: "3.8"

services:
  mysql:
    image: mysql:8.0
    container_name: nodejs-mysql-dev
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: nodejshit_dev
      MYSQL_USER: devuser
      MYSQL_PASSWORD: devpassword
    ports:
      - "3307:3306" # Different port to avoid conflict
    volumes:
      - mysql_dev_data:/var/lib/mysql
    networks:
      - dev-network

  app:
    build:
      context: .
      dockerfile: Dockerfile.dev
    container_name: nodejs-app-dev
    restart: unless-stopped
    ports:
      - "3001:3000"
      - "9229:9229" # Debug port
    environment:
      NODE_ENV: development
      DB_HOST: mysql
      DB_PORT: 3306
      DB_USER: devuser
      DB_PASSWORD: devpassword
      DB_DATABASE: nodejshit_dev
      DATABASE_URL: "mysql://devuser:devpassword@mysql:3306/nodejshit_dev"
    volumes:
      - .:/app
      - /app/node_modules
    depends_on:
      - mysql
    networks:
      - dev-network
    command: npm run dev

volumes:
  mysql_dev_data:

networks:
  dev-network:
    driver: bridge
```

#### **2.3 Dockerfile.dev (Development)**

```dockerfile
FROM node:18-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source
COPY . .

# Generate Prisma client
RUN npx prisma generate

EXPOSE 3000 9229

CMD ["npm", "run", "dev"]
```

### **🚀 Bước 3: Chạy với Docker Compose**

#### **3.1 Production Mode**

```bash
# Build và start tất cả services
docker-compose up -d --build

# Kiểm tra logs
docker-compose logs -f

# Chạy migrations
docker-compose exec app npx prisma migrate deploy

# Stop services
docker-compose down

# Stop và xóa volumes
docker-compose down -v
```

#### **3.2 Development Mode**

```bash
# Chạy development stack
docker-compose -f docker-compose.dev.yml up -d --build

# Attach to app logs
docker-compose -f docker-compose.dev.yml logs -f app

# Execute commands trong container
docker-compose -f docker-compose.dev.yml exec app npm run build
```

### **🔧 Bước 4: Database Management trong Docker**

#### **4.1 Chạy Prisma commands**

```bash
# Generate client
docker-compose exec app npx prisma generate

# Run migrations
docker-compose exec app npx prisma migrate deploy

# Reset database
docker-compose exec app npx prisma migrate reset

# Open Prisma Studio
docker-compose exec app npx prisma studio
```

#### **4.2 MySQL CLI access**

```bash
# Connect to MySQL container
docker-compose exec mysql mysql -u appuser -p nodejshit

# Backup database
docker-compose exec mysql mysqldump -u appuser -p nodejshit > backup.sql

# Restore database
docker-compose exec -i mysql mysql -u appuser -p nodejshit < backup.sql
```

---

## **🔍 Troubleshooting & Common Issues**

### **Local Development Issues:**

#### **1. Port already in use**

```bash
# Kiểm tra process sử dụng port 3000
lsof -i :3000
# Hoặc trên Windows
netstat -ano | findstr :3000

# Kill process
kill -9 <PID>
```

#### **2. MySQL connection refused**

```bash
# Kiểm tra MySQL service
# Windows
net start mysql

# macOS
brew services start mysql

# Linux
sudo systemctl start mysql
```

#### **3. Prisma Client not generated**

```bash
# Regenerate Prisma client
rm -rf node_modules/.prisma
npx prisma generate
```

### **Docker Issues:**

#### **1. Container fails to start**

```bash
# Check container logs
docker-compose logs app

# Check container status
docker-compose ps

# Restart specific service
docker-compose restart app
```

#### **2. Database connection issues**

```bash
# Check network connectivity
docker-compose exec app ping mysql

# Check environment variables
docker-compose exec app env | grep DB_
```

#### **3. Volume mount issues**

```bash
# Recreate volumes
docker-compose down -v
docker-compose up -d --build
```

---

## **📊 Monitoring & Health Checks**

### **Health Check Endpoints**

#### **Tạo health check route**

```typescript
import express from "express";
import { prisma } from "@config/client";

const router = express.Router();

router.get("/health", async (req, res) => {
  try {
    // Check database connection
    await prisma.$queryRaw`SELECT 1`;

    res.status(200).json({
      status: "healthy",
      timestamp: new Date().toISOString(),
      uptime: process.uptime(),
      environment: process.env.NODE_ENV,
      database: "connected",
    });
  } catch (error) {
    res.status(503).json({
      status: "unhealthy",
      timestamp: new Date().toISOString(),
      error: error.message,
    });
  }
});

export default router;
```

### **Docker Health Checks**

```bash
# Check container health
docker-compose ps

# Manual health check
curl http://localhost:3000/health
```

---

## **🚀 Production Deployment**

### **Environment Variables for Production**

```env
NODE_ENV=production
DB_HOST=your-production-db-host
DB_PORT=3306
DB_USER=production_user
DB_PASSWORD=secure_password
DB_DATABASE=production_db
DATABASE_URL="mysql://production_user:secure_password@your-production-db-host:3306/production_db"
```

### **Docker Production Optimizations**

```dockerfile
# Multi-stage build
# Security: non-root user
# Health checks
# Minimal dependencies
# Layer caching optimization
```

---

## **📝 Quick Start Commands**

### **Local Development:**

```bash
git clone <repo>
cd nodejs-project
npm install
cp .env.example .env
# Edit .env with your MySQL credentials
npx prisma migrate dev --name init
npm run dev
```

### **Docker Development:**

```bash
git clone <repo>
cd nodejs-project
docker-compose -f docker-compose.dev.yml up -d --build
docker-compose -f docker-compose.dev.yml exec app npx prisma migrate dev
```

### **Docker Production:**

```bash
git clone <repo>
cd nodejs-project
docker-compose up -d --build
docker-compose exec app npx prisma migrate deploy
```

**🎯 Lựa chọn approach:**

- **Local:** Faster development, easier debugging
- **Docker:** Consistent environment, easier deployment, team collaboration
