# 🚀 ROADMAP AWS BASICS - Path 1 Foundation

## 🎯 Thông tin cơ bản

- **Timeline:** 4 tuần (28 ngày)
- **Prerequisites:** Docker mastery, Linux basics, networking concepts
- **Goal:** Master AWS fundamentals để deploy và scale applications professionally

---

## 📅 Giai đoạn 1: AWS Fundamentals & Core Services (Tuần 1)

### **1. AWS Introduction & Account Setup:**

    - 1.1. Cloud computing concepts: IaaS, PaaS, SaaS.
    - 1.2. AWS overview và global infrastructure.
    - 1.3. AWS Free Tier account creation.
    - 1.4. AWS Management Console navigation.
    - 1.5. Billing và cost management setup.

### **2. AWS Identity & Access Management (IAM):**

    - 2.1. IAM concepts: users, groups, roles, policies.
    - 2.2. Root account security best practices.
    - 2.3. Creating IAM users và groups.
    - 2.4. Policy management và permissions.
    - 2.5. MFA (Multi-Factor Authentication) setup.

### **3. AWS CLI & SDK Setup:**

    - 3.1. AWS CLI installation và configuration.
    - 3.2. Access keys và security credentials.
    - 3.3. AWS profiles management.
    - 3.4. Basic CLI commands practice.
    - 3.5. AWS SDK for JavaScript introduction.

### **4. EC2 (Elastic Compute Cloud) Basics:**

    - 4.1. EC2 concepts: instances, AMIs, instance types.
    - 4.2. Launching first EC2 instance.
    - 4.3. Security groups configuration.
    - 4.4. Key pairs for SSH access.
    - 4.5. Connecting to instances via SSH.

### **5. EC2 Instance Management:**

    - 5.1. Instance lifecycle: start, stop, terminate.
    - 5.2. Instance monitoring với CloudWatch.
    - 5.3. Elastic IP addresses.
    - 5.4. Instance metadata service.
    - 5.5. User data scripts for automation.

### **6. Elastic Block Store (EBS):**

    - 6.1. EBS volume types và use cases.
    - 6.2. Creating và attaching EBS volumes.
    - 6.3. EBS snapshots for backup.
    - 6.4. Volume encryption.
    - 6.5. Performance optimization.

### **7. Virtual Private Cloud (VPC) Introduction:**

    - 7.1. VPC concepts và components.
    - 7.2. Subnets: public vs private.
    - 7.3. Internet gateways và NAT gateways.
    - 7.4. Route tables configuration.
    - 7.5. Network Access Control Lists (NACLs).

---

## 📅 Giai đoạn 2: Storage, Databases & Networking (Tuần 2)

### **8. Simple Storage Service (S3):**

    - 8.1. S3 concepts: buckets, objects, keys.
    - 8.2. Creating buckets và uploading objects.
    - 8.3. Bucket policies và access control.
    - 8.4. Storage classes optimization.
    - 8.5. Static website hosting.

### **9. S3 Advanced Features:**

    - 9.1. Versioning và lifecycle policies.
    - 9.2. Cross-Region Replication (CRR).
    - 9.3. S3 Transfer Acceleration.
    - 9.4. Multipart uploads.
    - 9.5. Pre-signed URLs for secure access.

### **10. Amazon RDS (Relational Database Service):**

    - 10.1. RDS concepts và supported engines.
    - 10.2. Creating MySQL RDS instance.
    - 10.3. Database connectivity và security groups.
    - 10.4. Automated backups và snapshots.
    - 10.5. Multi-AZ deployments.

### **11. RDS Management & Scaling:**

    - 11.1. Read replicas for performance.
    - 11.2. Parameter groups customization.
    - 11.3. Monitoring với CloudWatch.
    - 11.4. Maintenance windows.
    - 11.5. Database migration strategies.

### **12. Application Load Balancer (ALB):**

    - 12.1. Load balancer concepts và types.
    - 12.2. Creating Application Load Balancer.
    - 12.3. Target groups configuration.
    - 12.4. Health checks setup.
    - 12.5. SSL/TLS certificate management.

### **13. Auto Scaling Groups:**

    - 13.1. Auto Scaling concepts và benefits.
    - 13.2. Launch templates creation.
    - 13.3. Scaling policies configuration.
    - 13.4. CloudWatch alarms integration.
    - 13.5. Instance replacement strategies.

### **14. Route 53 (DNS Service):**

    - 14.1. DNS concepts và Route 53 features.
    - 14.2. Domain registration (optional).
    - 14.3. Hosted zones configuration.
    - 14.4. Record types: A, CNAME, MX, etc.
    - 14.5. Health checks và failover routing.

---

## 📅 Giai đoạn 3: Container Services & Deployment (Tuần 3)

### **15. Elastic Container Service (ECS):**

    - 15.1. Container orchestration concepts.
    - 15.2. ECS vs EKS vs Fargate comparison.
    - 15.3. Task definitions creation.
    - 15.4. ECS clusters setup.
    - 15.5. Service configuration và deployment.

### **16. AWS Fargate:**

    - 16.1. Serverless container concepts.
    - 16.2. Fargate vs EC2 launch types.
    - 16.3. Running containers on Fargate.
    - 16.4. Networking configuration.
    - 16.5. Cost optimization strategies.

### **17. Elastic Container Registry (ECR):**

    - 17.1. Container registry concepts.
    - 17.2. Creating ECR repositories.
    - 17.3. Docker image pushing/pulling.
    - 17.4. Image scanning for vulnerabilities.
    - 17.5. Lifecycle policies.

### **18. Application Deployment Strategies:**

    - 18.1. Blue/Green deployments.
    - 18.2. Rolling deployments.
    - 18.3. Canary deployments.
    - 18.4. Deployment automation.
    - 18.5. Rollback strategies.

### **19. Lambda Functions Introduction:**

    - 19.1. Serverless computing concepts.
    - 19.2. Creating Lambda functions.
    - 19.3. Event sources và triggers.
    - 19.4. Environment variables.
    - 19.5. Basic monitoring và logging.

### **20. API Gateway:**

    - 20.1. API Gateway concepts và benefits.
    - 20.2. REST API creation.
    - 20.3. Integration với Lambda functions.
    - 20.4. Authentication và authorization.
    - 20.5. Rate limiting và throttling.

### **21. CloudFront (CDN):**

    - 21.1. Content Delivery Network concepts.
    - 21.2. CloudFront distributions setup.
    - 21.3. Origin configuration.
    - 21.4. Caching strategies.
    - 21.5. SSL certificates integration.

---

## 📅 Giai đoạn 4: Monitoring, Security & Best Practices (Tuần 4)

### **22. CloudWatch Monitoring:**

    - 22.1. CloudWatch metrics và namespaces.
    - 22.2. Custom metrics creation.
    - 22.3. CloudWatch alarms setup.
    - 22.4. CloudWatch Logs management.
    - 22.5. CloudWatch Dashboards.

### **23. CloudTrail & Security:**

    - 23.1. CloudTrail for API logging.
    - 23.2. Security best practices.
    - 23.3. AWS Config for compliance.
    - 23.4. Security groups vs NACLs.
    - 23.5. Encryption at rest và in transit.

### **24. Infrastructure as Code (IaC):**

    - 24.1. CloudFormation concepts.
    - 24.2. Template creation basics.
    - 24.3. Stack management.
    - 24.4. Parameters và outputs.
    - 24.5. Stack updates và rollbacks.

### **25. Cost Optimization:**

    - 25.1. AWS pricing models understanding.
    - 25.2. Cost monitoring tools.
    - 25.3. Resource tagging strategies.
    - 25.4. Reserved instances planning.
    - 25.5. Cost optimization recommendations.

### **26. Backup & Disaster Recovery:**

    - 26.1. Backup strategies across services.
    - 26.2. Cross-region replication.
    - 26.3. Disaster recovery planning.
    - 26.4. RTO/RPO considerations.
    - 26.5. Automated backup solutions.

### **27. CI/CD với AWS:**

    - 27.1. CodeCommit for source control.
    - 27.2. CodeBuild for compilation.
    - 27.3. CodeDeploy for deployment.
    - 27.4. CodePipeline orchestration.
    - 27.5. Integration với GitHub Actions.

### **28. Production Deployment Project:**

    - 28.1. Full-stack application architecture.
    - 28.2. Multi-tier deployment setup.
    - 28.3. Security configuration.
    - 28.4. Monitoring implementation.
    - 28.5. Cost optimization application.

---

## 📅 Project milestones

### **Week 1 Project:** Basic Web Server Deployment

- EC2 instance launch
- Security groups configuration
- Elastic IP setup
- Basic web application hosting

### **Week 2 Project:** Database-Driven Application

- RDS MySQL setup
- S3 static asset hosting
- Load balancer configuration
- Domain name integration

### **Week 3 Project:** Containerized Application

- Docker image to ECR
- ECS/Fargate deployment
- CloudFront CDN setup
- Lambda function integration

### **Week 4 Project:** Production-Ready Architecture

- Auto-scaling setup
- Monitoring dashboards
- Backup strategies
- CI/CD pipeline
- Cost optimization

---

## 🎯 Mastery Checklist

### **Core AWS Services:**

- [ ] EC2 instance management
- [ ] S3 bucket operations
- [ ] RDS database setup
- [ ] VPC networking basics
- [ ] IAM security configuration

### **Networking & Load Balancing:**

- [ ] VPC subnets configuration
- [ ] Security groups management
- [ ] Load balancer setup
- [ ] Route 53 DNS management
- [ ] CloudFront CDN implementation

### **Container Services:**

- [ ] ECR repository management
- [ ] ECS/Fargate deployments
- [ ] Container orchestration
- [ ] Service discovery
- [ ] Auto-scaling configuration

### **Serverless & APIs:**

- [ ] Lambda function development
- [ ] API Gateway setup
- [ ] Event-driven architecture
- [ ] Serverless patterns
- [ ] Cost optimization

### **Operations & Monitoring:**

- [ ] CloudWatch monitoring
- [ ] CloudTrail logging
- [ ] Security best practices
- [ ] Backup strategies
- [ ] Cost management

### **Infrastructure as Code:**

- [ ] CloudFormation templates
- [ ] Infrastructure automation
- [ ] Version control
- [ ] Environment management
- [ ] Deployment pipelines

**🎉 Ready for production AWS deployments và enterprise-grade applications! 🎉**

---

## 💡 Next Steps

After mastering AWS Basics:

1. **Advanced AWS services** (EKS, SQS, SNS)
2. **Multi-region deployments**
3. **Advanced security** (WAF, Shield)
4. **Big data services** (Redshift, EMR)
5. **Machine learning** integration (SageMaker)

**AWS provides infinite scalability cho modern applications! 🎯**

---

## 🔧 Essential AWS CLI Commands

### **EC2 Commands:**

```bash
# List instances
aws ec2 describe-instances

# Start instance
aws ec2 start-instances --instance-ids i-1234567890abcdef0

# Stop instance
aws ec2 stop-instances --instance-ids i-1234567890abcdef0

# Create security group
aws ec2 create-security-group --group-name MySecurityGroup --description "My security group"
```

### **S3 Commands:**

```bash
# List buckets
aws s3 ls

# Create bucket
aws s3 mb s3://my-bucket-name

# Upload file
aws s3 cp file.txt s3://my-bucket-name/

# Download file
aws s3 cp s3://my-bucket-name/file.txt ./

# Sync directory
aws s3 sync ./local-folder s3://my-bucket-name/folder/
```

### **RDS Commands:**

```bash
# List DB instances
aws rds describe-db-instances

# Create DB instance
aws rds create-db-instance --db-instance-identifier mydbinstance --db-instance-class db.t3.micro --engine mysql

# Create snapshot
aws rds create-db-snapshot --db-instance-identifier mydbinstance --db-snapshot-identifier mydbsnapshot
```

### **ECS Commands:**

```bash
# List clusters
aws ecs list-clusters

# List services
aws ecs list-services --cluster my-cluster

# Update service
aws ecs update-service --cluster my-cluster --service my-service --desired-count 2
```

### **CloudFormation Commands:**

```bash
# Create stack
aws cloudformation create-stack --stack-name my-stack --template-body file://template.json

# Update stack
aws cloudformation update-stack --stack-name my-stack --template-body file://template.json

# Delete stack
aws cloudformation delete-stack --stack-name my-stack
```

**Master these commands for efficient AWS management! 🚀**

---

## 📋 Sample Architecture Patterns

### **Simple Web Application:**

```
Internet → Route 53 → CloudFront → ALB → EC2 (Auto Scaling) → RDS
                                                ↓
                                              S3 (Static Assets)
```

### **Containerized Application:**

```
Internet → Route 53 → ALB → ECS Fargate (Auto Scaling) → RDS
                              ↓
                          ECR (Container Images)
                              ↓
                         CloudWatch (Monitoring)
```

### **Serverless Application:**

```
Internet → Route 53 → CloudFront → API Gateway → Lambda → RDS/DynamoDB
                                      ↓
                                   S3 (Static Assets)
                                      ↓
                               CloudWatch (Monitoring)
```

### **Microservices Architecture:**

```
Internet → Route 53 → ALB → ECS Services (Multiple) → RDS/ElastiCache
                              ↓
                         Service Discovery
                              ↓
                          CloudWatch
                              ↓
                         CloudTrail
```

**Use these patterns as blueprints for your applications! 🎯**

---

## 💰 Cost Optimization Tips

### **EC2 Cost Optimization:**

- Use appropriate instance types
- Implement auto-scaling
- Use Spot instances for non-critical workloads
- Schedule start/stop for development environments
- Right-size instances based on utilization

### **S3 Cost Optimization:**

- Use appropriate storage classes
- Implement lifecycle policies
- Enable S3 Intelligent Tiering
- Delete incomplete multipart uploads
- Monitor access patterns

### **RDS Cost Optimization:**

- Use appropriate instance types
- Implement read replicas wisely
- Use Reserved instances for production
- Optimize backup retention
- Monitor database performance

### **General Best Practices:**

- Tag all resources for cost tracking
- Set up billing alerts
- Use AWS Cost Explorer
- Review and delete unused resources
- Consider Reserved instances for steady workloads

**Cost optimization is crucial for sustainable AWS usage! 💡**
