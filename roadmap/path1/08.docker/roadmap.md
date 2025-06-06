# 🚀 ROADMAP DOCKER - Path 1 Foundation

## 🎯 Thông tin cơ bản

- **Timeline:** 3 tuần (21 ngày)
- **Prerequisites:** Next.js mastery, basic Linux commands
- **Goal:** Master Docker để ready cho AWS deployment và containerization

---

## 📅 Giai đoạn 1: Docker Fundamentals & Concepts (Tuần 1)

### **1. Docker Introduction & Concepts:**

    - 1.1. Tìm hiểu Docker là gì và tại sao sử dụng.
    - 1.2. Containers vs Virtual Machines.
    - 1.3. Docker architecture: Client, Daemon, Registry.
    - 1.4. Images, Containers, và Volumes concepts.
    - 1.5. Benefits: consistency, scalability, isolation.

### **2. Docker Installation & Setup:**

    - 2.1. Docker Desktop installation (Windows/Mac).
    - 2.2. Docker Engine setup (Linux).
    - 2.3. Verification: `docker --version`, `docker run hello-world`.
    - 2.4. Docker Hub account creation.
    - 2.5. VS Code Docker extension setup.

### **3. Basic Docker Commands:**

    - 3.1. Image commands: `docker pull`, `docker images`, `docker rmi`.
    - 3.2. Container commands: `docker run`, `docker ps`, `docker stop`.
    - 3.3. Container lifecycle: create, start, stop, remove.
    - 3.4. Interactive containers: `docker run -it`.
    - 3.5. Container logs: `docker logs`.

### **4. Working với Images:**

    - 4.1. Pulling images từ Docker Hub.
    - 4.2. Running containers từ images.
    - 4.3. Image tags và versioning.
    - 4.4. Searching images: `docker search`.
    - 4.5. Image inspection: `docker inspect`.

### **5. Container Management:**

    - 5.1. Container naming: `--name` flag.
    - 5.2. Port mapping: `-p` flag.
    - 5.3. Environment variables: `-e` flag.
    - 5.4. Running containers trong background: `-d` flag.
    - 5.5. Executing commands trong running containers: `docker exec`.

### **6. Data Management với Volumes:**

    - 6.1. Volume concepts và persistence.
    - 6.2. Named volumes vs anonymous volumes.
    - 6.3. Bind mounts vs volumes.
    - 6.4. Volume commands: `docker volume create`, `docker volume ls`.
    - 6.5. Volume mounting: `-v` và `--mount` flags.

### **7. Dockerfile Basics:**

    - 7.1. Dockerfile concepts và structure.
    - 7.2. Basic instructions: `FROM`, `RUN`, `COPY`, `CMD`.
    - 7.3. Building images: `docker build`.
    - 7.4. Build context và .dockerignore.
    - 7.5. Image layers và caching.

---

## 📅 Giai đoạn 2: Advanced Docker Features (Tuần 2)

### **8. Advanced Dockerfile Instructions:**

    - 8.1. `WORKDIR`: setting working directory.
    - 8.2. `EXPOSE`: documenting ports.
    - 8.3. `ENV`: environment variables.
    - 8.4. `ARG`: build-time arguments.
    - 8.5. `USER`: running as non-root user.

### **9. Multi-stage Builds:**

    - 9.1. Multi-stage build concepts.
    - 9.2. Reducing image size.
    - 9.3. Build optimization strategies.
    - 9.4. Production vs development builds.
    - 9.5. Copying artifacts between stages.

### **10. Docker Networks:**

    - 10.1. Network concepts trong Docker.
    - 10.2. Default networks: bridge, host, none.
    - 10.3. Custom networks: `docker network create`.
    - 10.4. Container communication.
    - 10.5. Network inspection và troubleshooting.

### **11. Docker Registry & Image Management:**

    - 11.1. Docker Hub usage.
    - 11.2. Pushing images: `docker push`.
    - 11.3. Image tagging strategies.
    - 11.4. Private registries setup.
    - 11.5. Image security scanning.

### **12. Containerizing Node.js Applications:**

    - 12.1. Node.js Dockerfile best practices.
    - 12.2. Package.json và npm install optimization.
    - 12.3. Development vs production configurations.
    - 12.4. Hot reloading trong development.
    - 12.5. Environment variable management.

### **13. Containerizing React/Next.js Applications:**

    - 13.1. Frontend application containerization.
    - 13.2. Multi-stage builds for React apps.
    - 13.3. Static file serving với Nginx.
    - 13.4. Build optimization strategies.
    - 13.5. Environment configuration.

### **14. Database Containers:**

    - 14.1. Running MySQL containers.
    - 14.2. Database persistence với volumes.
    - 14.3. Initial data seeding.
    - 14.4. Database connection từ applications.
    - 14.5. Database backup strategies.

---

## 📅 Giai đoạn 3: Docker Compose & Production (Tuần 3)

### **15. Docker Compose Introduction:**

    - 15.1. Docker Compose concepts và benefits.
    - 15.2. YAML syntax basics.
    - 15.3. `docker-compose.yml` structure.
    - 15.4. Services, networks, volumes definition.
    - 15.5. Compose commands: `up`, `down`, `build`.

### **16. Multi-service Applications:**

    - 16.1. Frontend + Backend + Database setup.
    - 16.2. Service dependencies: `depends_on`.
    - 16.3. Inter-service communication.
    - 16.4. Load balancing considerations.
    - 16.5. Service scaling: `docker-compose scale`.

### **17. Environment & Configuration Management:**

    - 17.1. Environment files: `.env`.
    - 17.2. Multiple environment setups.
    - 17.3. Config file mounting.
    - 17.4. Secrets management.
    - 17.5. Development vs production configs.

### **18. Docker Development Workflow:**

    - 18.1. Development environment setup.
    - 18.2. Hot reloading configuration.
    - 18.3. Debugging containerized applications.
    - 18.4. Testing strategies.
    - 18.5. CI/CD integration preparation.

### **19. Production Considerations:**

    - 19.1. Security best practices.
    - 19.2. Image optimization strategies.
    - 19.3. Resource limits: memory, CPU.
    - 19.4. Health checks implementation.
    - 19.5. Logging strategies.

### **20. Monitoring & Troubleshooting:**

    - 20.1. Container monitoring: `docker stats`.
    - 20.2. Log management: `docker logs`.
    - 20.3. Container inspection: `docker inspect`.
    - 20.4. Debugging network issues.
    - 20.5. Performance optimization.

### **21. Container Orchestration Preparation:**

    - 21.1. Docker Swarm basics.
    - 21.2. Kubernetes preparation concepts.
    - 21.3. Service discovery patterns.
    - 21.4. Load balancing strategies.
    - 21.5. High availability considerations.

---

## 📅 Project milestones

### **Week 1 Project:** Basic Application Containerization

- Containerize Node.js API
- Containerize React frontend
- Basic volume management
- Port mapping và networking

### **Week 2 Project:** Multi-tier Application

- Full-stack application với database
- Custom networks setup
- Image optimization
- Security implementation

### **Week 3 Project:** Production-Ready Setup

- Docker Compose multi-service
- Environment management
- Health checks
- Monitoring setup
- Deployment preparation

---

## 🎯 Mastery Checklist

### **Docker Fundamentals:**

- [ ] Container concepts understanding
- [ ] Basic Docker commands mastery
- [ ] Image management
- [ ] Volume và data persistence
- [ ] Network configuration

### **Dockerfile Skills:**

- [ ] Dockerfile writing
- [ ] Multi-stage builds
- [ ] Build optimization
- [ ] Security best practices
- [ ] Layer caching strategies

### **Application Containerization:**

- [ ] Node.js application containerization
- [ ] Frontend application containerization
- [ ] Database containerization
- [ ] Multi-service setups
- [ ] Development workflow

### **Docker Compose:**

- [ ] Compose file writing
- [ ] Multi-service orchestration
- [ ] Environment management
- [ ] Service dependencies
- [ ] Scaling strategies

### **Production Ready:**

- [ ] Security implementation
- [ ] Performance optimization
- [ ] Monitoring setup
- [ ] Troubleshooting skills
- [ ] Deployment preparation

**🎉 Ready for AWS deployment và cloud containerization! 🎉**

---

## 💡 Next Steps

After mastering Docker:

1. **AWS deployment** với ECS/EKS
2. **Kubernetes** orchestration
3. **CI/CD pipelines** với Docker
4. **Container monitoring** và observability
5. **Microservices** architecture

**Docker provides consistent deployment environment across all platforms! 🎯**

---

## 🔧 Essential Docker Commands

### **Image Management:**

```bash
docker pull <image>          # Download image
docker build -t <name> .     # Build image
docker images               # List images
docker rmi <image>          # Remove image
docker tag <src> <target>   # Tag image
```

### **Container Management:**

```bash
docker run <image>          # Run container
docker ps                   # List running containers
docker ps -a               # List all containers
docker stop <container>     # Stop container
docker rm <container>       # Remove container
```

### **Advanced Operations:**

```bash
docker exec -it <container> /bin/bash  # Access container
docker logs <container>                # View logs
docker inspect <container>             # Inspect container
docker cp <src> <dest>                # Copy files
docker stats                          # Monitor resources
```

### **Volume Management:**

```bash
docker volume create <name>   # Create volume
docker volume ls             # List volumes
docker volume inspect <name> # Inspect volume
docker volume rm <name>      # Remove volume
```

### **Network Management:**

```bash
docker network create <name>   # Create network
docker network ls             # List networks
docker network inspect <name> # Inspect network
docker network rm <name>      # Remove network
```

### **Docker Compose:**

```bash
docker-compose up            # Start services
docker-compose up -d         # Start in background
docker-compose down          # Stop services
docker-compose build         # Build services
docker-compose logs          # View logs
```

**Master these commands for efficient Docker workflow! 🚀**

---

## 📋 Sample Dockerfiles

### **Node.js API Dockerfile:**

```dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
EXPOSE 3000
USER node
CMD ["npm", "start"]
```

### **Next.js Application Dockerfile:**

```dockerfile
FROM node:18-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

FROM node:18-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

FROM node:18-alpine AS runner
WORKDIR /app
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static
EXPOSE 3000
CMD ["node", "server.js"]
```

### **Docker Compose Example:**

```yaml
version: "3.8"
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
    depends_on:
      - db
    networks:
      - app-network

  db:
    image: mysql:8.0
    environment:
      - MYSQL_ROOT_PASSWORD=password
      - MYSQL_DATABASE=myapp
    volumes:
      - db-data:/var/lib/mysql
    networks:
      - app-network

volumes:
  db-data:

networks:
  app-network:
    driver: bridge
```

**Use these templates as starting points for your projects! 🎯**
