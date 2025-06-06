# 🍃 ROADMAP MONGODB + MONGOOSE - Path 3 MERN Stack

## 🎯 Thông tin cơ bản

- **Timeline:** 4 tuần (28 ngày)
- **Prerequisites:** JavaScript ES6+, Node.js basics
- **Goal:** Master MongoDB + Mongoose để ready cho MERN Stack development

---

## 📅 Giai đoạn 1: MongoDB Fundamentals (Tuần 1)

### **1. MongoDB Introduction & NoSQL Concepts:**

    - 1.1. Tìm hiểu NoSQL là gì và tại sao sử dụng.
    - 1.2. MongoDB vs SQL databases: benefits và trade-offs.
    - 1.3. Document-based database concepts.
    - 1.4. BSON format và data structure.
    - 1.5. MongoDB ecosystem overview.

### **2. MongoDB Installation & Setup:**

    - 2.1. Local MongoDB installation (Windows/Mac/Linux).
    - 2.2. MongoDB Atlas cloud setup.
    - 2.3. MongoDB Compass GUI tool.
    - 2.4. MongoDB Shell (mongosh) basics.
    - 2.5. Connection strings và authentication.

### **3. Database & Collection Operations:**

    - 3.1. Database creation và switching.
    - 3.2. Collection creation và management.
    - 3.3. Document structure và validation.
    - 3.4. Data types trong MongoDB.
    - 3.5. Collection naming conventions.

### **4. Basic CRUD Operations:**

    - 4.1. Insert operations: insertOne, insertMany.
    - 4.2. Read operations: find, findOne với filters.
    - 4.3. Update operations: updateOne, updateMany.
    - 4.4. Delete operations: deleteOne, deleteMany.
    - 4.5. Bulk operations và performance.

### **5. Query Operators & Filtering:**

    - 5.1. Comparison operators: $eq, $ne, $gt, $lt.
    - 5.2. Logical operators: $and, $or, $not.
    - 5.3. Element operators: $exists, $type.
    - 5.4. Array operators: $in, $nin, $all.
    - 5.5. Regular expressions trong queries.

### **6. Projection & Sorting:**

    - 6.1. Field projection: include/exclude fields.
    - 6.2. Sorting documents: ascending/descending.
    - 6.3. Limiting và skipping results.
    - 6.4. Counting documents.
    - 6.5. Cursor methods chaining.

### **7. Schema Design Principles:**

    - 7.1. Document structure design patterns.
    - 7.2. Embedding vs referencing data.
    - 7.3. One-to-One relationships.
    - 7.4. One-to-Many relationships.
    - 7.5. Many-to-Many relationships.

---

## 📅 Giai đoạn 2: Advanced MongoDB & Indexing (Tuần 2)

### **8. Indexing & Performance:**

    - 8.1. Index concepts và benefits.
    - 8.2. Single field indexes.
    - 8.3. Compound indexes.
    - 8.4. Text indexes for search.
    - 8.5. Index performance analysis.

### **9. Aggregation Framework:**

    - 9.1. Aggregation pipeline concept.
    - 9.2. $match stage for filtering.
    - 9.3. $group stage for grouping.
    - 9.4. $project stage for shaping.
    - 9.5. $sort và $limit stages.

### **10. Advanced Aggregation:**

    - 10.1. $lookup for joins.
    - 10.2. $unwind for arrays.
    - 10.3. $addFields for computed fields.
    - 10.4. Conditional expressions: $cond, $switch.
    - 10.5. Date aggregation operators.

### **11. Data Validation & Schema:**

    - 11.1. JSON Schema validation.
    - 11.2. Validation rules và constraints.
    - 11.3. Custom validation functions.
    - 11.4. Error handling for validation.
    - 11.5. Schema evolution strategies.

### **12. Transactions & ACID:**

    - 12.1. Multi-document transactions.
    - 12.2. Transaction lifecycle.
    - 12.3. Read/write concerns.
    - 12.4. Error handling trong transactions.
    - 12.5. Transaction best practices.

### **13. Data Migration & Backup:**

    - 13.1. Data import/export tools.
    - 13.2. Database backup strategies.
    - 13.3. Data migration scripts.
    - 13.4. Schema migration patterns.
    - 13.5. Database restoration procedures.

### **14. Security & Authentication:**

    - 14.1. User management và roles.
    - 14.2. Authentication mechanisms.
    - 14.3. Connection security (TLS/SSL).
    - 14.4. Field-level security.
    - 14.5. Network security considerations.

---

## 📅 Giai đoạn 3: Mongoose ODM Integration (Tuần 3)

### **15. Mongoose Introduction & Setup:**

    - 15.1. Mongoose ODM concepts và benefits.
    - 15.2. Installation và connection setup.
    - 15.3. Connection management và pooling.
    - 15.4. Environment configuration.
    - 15.5. Error handling for connections.

### **16. Schema Definition & Models:**

    - 16.1. Mongoose schema creation.
    - 16.2. Schema types và options.
    - 16.3. Model compilation từ schemas.
    - 16.4. Schema methods và statics.
    - 16.5. Instance methods definition.

### **17. Schema Validation:**

    - 17.1. Built-in validators: required, min, max.
    - 17.2. Custom validation functions.
    - 17.3. Async validation patterns.
    - 17.4. Validation error handling.
    - 17.5. Conditional validation rules.

### **18. Mongoose Queries & CRUD:**

    - 18.1. Model query methods.
    - 18.2. Query builders và chaining.
    - 18.3. Population for references.
    - 18.4. Lean queries for performance.
    - 18.5. Aggregation với Mongoose.

### **19. Middleware & Hooks:**

    - 19.1. Pre middleware functions.
    - 19.2. Post middleware functions.
    - 19.3. Document middleware.
    - 19.4. Query middleware.
    - 19.5. Aggregate middleware.

### **20. Virtual Properties:**

    - 20.1. Virtual getters definition.
    - 20.2. Virtual setters implementation.
    - 20.3. Virtual populate for relationships.
    - 20.4. Transform functions.
    - 20.5. JSON serialization customization.

### **21. Relationships & Population:**

    - 21.1. Reference relationships.
    - 21.2. Population basics và options.
    - 21.3. Deep population patterns.
    - 21.4. Populate with select fields.
    - 21.5. Cross-database population.

---

## 📅 Giai đoạn 4: Advanced Patterns & Production (Tuần 4)

### **22. Advanced Schema Patterns:**

    - 22.1. Discriminators for inheritance.
    - 22.2. Mixed types và flexibility.
    - 22.3. Array subdocuments.
    - 22.4. Map types for dynamic keys.
    - 22.5. Schema composition patterns.

### **23. Performance Optimization:**

    - 23.1. Query optimization techniques.
    - 23.2. Index usage analysis.
    - 23.3. Connection pooling tuning.
    - 23.4. Memory usage optimization.
    - 23.5. Profiling và monitoring.

### **24. Error Handling & Debugging:**

    - 24.1. Mongoose error types.
    - 24.2. Validation error processing.
    - 24.3. Duplicate key error handling.
    - 24.4. Debugging techniques.
    - 24.5. Logging best practices.

### **25. Testing Strategies:**

    - 25.1. Unit testing Mongoose models.
    - 25.2. Integration testing patterns.
    - 25.3. Test database setup.
    - 25.4. Mocking strategies.
    - 25.5. Test data factories.

### **26. Production Deployment:**

    - 26.1. Environment configuration.
    - 26.2. Connection string management.
    - 26.3. Monitoring và alerting.
    - 26.4. Backup strategies.
    - 26.5. Performance monitoring.

### **27. Integration với Express.js:**

    - 27.1. Express + Mongoose setup.
    - 27.2. Route handlers với models.
    - 27.3. Middleware integration.
    - 27.4. Error handling middleware.
    - 27.5. API response patterns.

### **28. Real-World Project Integration:**

    - 28.1. E-commerce schema design.
    - 28.2. User authentication models.
    - 28.3. Product catalog implementation.
    - 28.4. Order management system.
    - 28.5. Full CRUD API development.

---

## 📅 Project Milestones

### **Week 1 Project:** Blog System Schema

- Database design
- Basic CRUD operations
- Query operations
- Index creation

### **Week 2 Project:** E-commerce Product Catalog

- Advanced aggregation
- Data validation
- Performance optimization
- Migration scripts

### **Week 3 Project:** Social Media API

- Mongoose integration
- Complex relationships
- Population strategies
- Middleware implementation

### **Week 4 Project:** Full MERN Stack Integration

- Express.js integration
- Authentication system
- Production deployment
- Performance monitoring

---

## 🎯 Mastery Checklist

### **MongoDB Fundamentals:**

- [ ] NoSQL concepts mastery
- [ ] CRUD operations proficiency
- [ ] Query operators usage
- [ ] Schema design principles
- [ ] Index optimization

### **Advanced MongoDB:**

- [ ] Aggregation framework
- [ ] Transaction handling
- [ ] Data validation
- [ ] Security implementation
- [ ] Performance tuning

### **Mongoose ODM:**

- [ ] Schema definition mastery
- [ ] Model operations
- [ ] Validation implementation
- [ ] Middleware usage
- [ ] Population techniques

### **Production Skills:**

- [ ] Error handling patterns
- [ ] Testing strategies
- [ ] Performance optimization
- [ ] Deployment procedures
- [ ] Monitoring setup

### **Integration Skills:**

- [ ] Express.js integration
- [ ] Authentication systems
- [ ] API development
- [ ] Real-world patterns
- [ ] Best practices

**🎉 Ready for MERN Stack Development! 🎉**

---

## 💡 Next Steps

After mastering MongoDB + Mongoose:

1. **Express.js integration** patterns
2. **React.js frontend** connection
3. **Authentication** implementation
4. **Full-stack applications**
5. **Production deployment**

**MongoDB + Mongoose provides flexible data layer for modern applications! 🎯**

---

## 🔧 Essential MongoDB + Mongoose Syntax

### **MongoDB Shell Operations:**

```javascript
// Database operations
use myDatabase;

// Insert documents
db.users.insertOne({name: "John", age: 30});
db.users.insertMany([
  {name: "Alice", age: 25},
  {name: "Bob", age: 35}
]);

// Query documents
db.users.find({age: {$gte: 25}});
db.users.findOne({name: "John"});

// Update documents
db.users.updateOne(
  {name: "John"}, 
  {$set: {age: 31}}
);

// Delete documents
db.users.deleteOne({name: "John"});

// Aggregation
db.users.aggregate([
  {$match: {age: {$gte: 25}}},
  {$group: {_id: null, avgAge: {$avg: "$age"}}}
]);
```

### **Mongoose Schema & Model:**

```javascript
const mongoose = require('mongoose');

// Schema definition
const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: [true, 'Name is required'],
    trim: true,
    minlength: 2,
    maxlength: 50
  },
  email: {
    type: String,
    required: true,
    unique: true,
    lowercase: true,
    validate: {
      validator: function(v) {
        return /\S+@\S+\.\S+/.test(v);
      },
      message: 'Invalid email format'
    }
  },
  age: {
    type: Number,
    min: 0,
    max: 120
  },
  isActive: {
    type: Boolean,
    default: true
  },
  tags: [String],
  createdAt: {
    type: Date,
    default: Date.now
  }
});

// Virtual properties
userSchema.virtual('fullName').get(function() {
  return `${this.firstName} ${this.lastName}`;
});

// Instance methods
userSchema.methods.getPublicProfile = function() {
  return {
    name: this.name,
    email: this.email
  };
};

// Static methods
userSchema.statics.findByEmail = function(email) {
  return this.findOne({ email });
};

// Middleware
userSchema.pre('save', function(next) {
  console.log('About to save user:', this.name);
  next();
});

// Model creation
const User = mongoose.model('User', userSchema);
```

### **CRUD Operations với Mongoose:**

```javascript
// Create
const user = new User({
  name: 'John Doe',
  email: 'john@example.com',
  age: 30
});
await user.save();

// Or direct creation
const user = await User.create({
  name: 'Jane Doe',
  email: 'jane@example.com'
});

// Read
const users = await User.find({ age: { $gte: 18 } });
const user = await User.findById(userId);
const user = await User.findOne({ email: 'john@example.com' });

// Update
const user = await User.findByIdAndUpdate(
  userId,
  { age: 31 },
  { new: true, runValidators: true }
);

// Delete
await User.findByIdAndDelete(userId);
await User.deleteMany({ isActive: false });
```

### **Population & Relationships:**

```javascript
// Reference schema
const postSchema = new mongoose.Schema({
  title: String,
  content: String,
  author: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  comments: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Comment'
  }]
});

// Population
const posts = await Post.find()
  .populate('author', 'name email')
  .populate({
    path: 'comments',
    populate: {
      path: 'author',
      select: 'name'
    }
  });
```

### **Aggregation với Mongoose:**

```javascript
// Complex aggregation
const result = await User.aggregate([
  // Match stage
  { $match: { isActive: true } },
  
  // Lookup/Join
  {
    $lookup: {
      from: 'posts',
      localField: '_id',
      foreignField: 'author',
      as: 'posts'
    }
  },
  
  // Add computed fields
  {
    $addFields: {
      postCount: { $size: '$posts' }
    }
  },
  
  // Group
  {
    $group: {
      _id: '$age',
      users: { $push: '$$ROOT' },
      avgPosts: { $avg: '$postCount' }
    }
  },
  
  // Sort
  { $sort: { '_id': 1 } }
]);
```

### **Express.js Integration:**

```javascript
const express = require('express');
const mongoose = require('mongoose');

const app = express();

// Middleware
app.use(express.json());

// Routes
app.get('/users', async (req, res) => {
  try {
    const users = await User.find()
      .select('-password')
      .sort({ createdAt: -1 })
      .limit(10);
    
    res.json({
      success: true,
      data: users
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message
    });
  }
});

app.post('/users', async (req, res) => {
  try {
    const user = await User.create(req.body);
    res.status(201).json({
      success: true,
      data: user
    });
  } catch (error) {
    if (error.name === 'ValidationError') {
      return res.status(400).json({
        success: false,
        message: error.message
      });
    }
    res.status(500).json({
      success: false,
      message: 'Server error'
    });
  }
});
```

**Master these patterns for professional MongoDB + Mongoose development! 🚀**

---

## 📚 Learning Resources

### **Official Documentation:**

- MongoDB Manual
- Mongoose Documentation
- MongoDB University
- MongoDB Compass

### **Practice Projects:**

- Blog management system
- E-commerce product catalog
- Social media API
- Task management app

### **Common Patterns:**

- Repository pattern
- Data validation
- Error handling
- Performance optimization

**MongoDB + Mongoose mastery enables flexible, scalable data solutions! 🎯**