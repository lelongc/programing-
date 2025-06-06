# 🔐 ROADMAP JWT AUTHENTICATION - Path 3 MERN Stack

## 🎯 Thông tin cơ bản

- **Timeline:** 2 tuần (14 ngày)
- **Prerequisites:** Node.js, Express.js basics
- **Goal:** Master JWT Authentication để ready cho MERN Stack security

---

## 📅 Giai đoạn 1: JWT Fundamentals & Implementation (Tuần 1)

### **1. Authentication Concepts & Security:**

    - 1.1. Authentication vs Authorization concepts.
    - 1.2. Session-based vs Token-based authentication.
    - 1.3. JWT (JSON Web Token) structure và benefits.
    - 1.4. Security considerations: HTTPS, XSS, CSRF.
    - 1.5. Password hashing với bcrypt.

### **2. JWT Structure & Components:**

    - 2.1. JWT anatomy: Header, Payload, Signature.
    - 2.2. JWT claims: iss, sub, aud, exp, iat.
    - 2.3. Custom claims và best practices.
    - 2.4. JWT signing algorithms: HS256, RS256.
    - 2.5. Token expiration và refresh strategies.

### **3. Password Security & Hashing:**

    - 3.1. bcrypt installation và configuration.
    - 3.2. Password hashing implementation.
    - 3.3. Password comparison methods.
    - 3.4. Salt rounds optimization.
    - 3.5. Security best practices for passwords.

### **4. User Registration System:**

    - 4.1. User model với Mongoose.
    - 4.2. Registration endpoint implementation.
    - 4.3. Input validation và sanitization.
    - 4.4. Duplicate email handling.
    - 4.5. Password hashing before save.

### **5. User Login & JWT Generation:**

    - 5.1. Login endpoint implementation.
    - 5.2. Credential verification process.
    - 5.3. JWT token generation.
    - 5.4. Token payload customization.
    - 5.5. Response structure standardization.

### **6. JWT Middleware & Route Protection:**

    - 6.1. JWT verification middleware.
    - 6.2. Token extraction từ headers.
    - 6.3. Protected route implementation.
    - 6.4. User context attachment.
    - 6.5. Error handling for invalid tokens.

### **7. Environment Configuration:**

    - 7.1. JWT secret management.
    - 7.2. Environment variables setup.
    - 7.3. Configuration best practices.
    - 7.4. Development vs production settings.
    - 7.5. Secret rotation strategies.

---

## 📅 Giai đoạn 2: Advanced Authentication & Production (Tuần 2)

### **8. Refresh Token Implementation:**

    - 8.1. Refresh token concepts.
    - 8.2. Refresh token storage strategies.
    - 8.3. Token refresh endpoint.
    - 8.4. Automatic token renewal.
    - 8.5. Refresh token revocation.

### **9. User Profile & Authorization:**

    - 9.1. User profile endpoints.
    - 9.2. Role-based access control (RBAC).
    - 9.3. Permission-based authorization.
    - 9.4. Admin vs user restrictions.
    - 9.5. Dynamic permission checking.

### **10. Password Reset Flow:**

    - 10.1. Password reset request.
    - 10.2. Reset token generation.
    - 10.3. Email integration (optional).
    - 10.4. Reset token validation.
    - 10.5. Password update implementation.

### **11. Account Security Features:**

    - 11.1. Account activation/verification.
    - 11.2. Login attempt limiting.
    - 11.3. Account lockout mechanisms.
    - 11.4. Security event logging.
    - 11.5. Suspicious activity detection.

### **12. Frontend Integration (React):**

    - 12.1. Token storage strategies (localStorage vs httpOnly cookies).
    - 12.2. Axios interceptors for automatic token attachment.
    - 12.3. Protected routes trong React Router.
    - 12.4. Authentication context implementation.
    - 12.5. Login/logout UI components.

### **13. Error Handling & Validation:**

    - 13.1. Authentication error types.
    - 13.2. Input validation middleware.
    - 13.3. Error response standardization.
    - 13.4. Rate limiting implementation.
    - 13.5. Security headers configuration.

### **14. Testing & Security Auditing:**

    - 14.1. Authentication endpoint testing.
    - 14.2. JWT token validation testing.
    - 14.3. Security vulnerability testing.
    - 14.4. Load testing for auth endpoints.
    - 14.5. Penetration testing basics.

---

## 📅 Project Milestones

### **Week 1 Project:** Basic Auth System

- User registration/login
- JWT token generation
- Protected routes
- Password hashing

### **Week 2 Project:** Complete Auth Solution

- Refresh tokens
- Role-based authorization
- Password reset
- Frontend integration

---

## 🎯 Mastery Checklist

### **Core JWT Skills:**

- [ ] JWT structure understanding
- [ ] Token generation/verification
- [ ] Middleware implementation
- [ ] Route protection
- [ ] Security best practices

### **Advanced Features:**

- [ ] Refresh token system
- [ ] Role-based authorization
- [ ] Password reset flow
- [ ] Account security features
- [ ] Frontend integration

### **Production Skills:**

- [ ] Error handling patterns
- [ ] Security configuration
- [ ] Testing strategies
- [ ] Performance optimization
- [ ] Monitoring setup

---

## 🔧 Essential JWT Authentication Code

### **User Model với Mongoose:**

```javascript
const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');

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
    required: [true, 'Email is required'],
    unique: true,
    lowercase: true,
    validate: {
      validator: function(v) {
        return /\S+@\S+\.\S+/.test(v);
      },
      message: 'Invalid email format'
    }
  },
  password: {
    type: String,
    required: [true, 'Password is required'],
    minlength: 6,
    select: false // Don't include in queries by default
  },
  role: {
    type: String,
    enum: ['user', 'admin'],
    default: 'user'
  },
  isActive: {
    type: Boolean,
    default: true
  },
  lastLogin: Date,
  passwordChangedAt: Date,
  passwordResetToken: String,
  passwordResetExpires: Date
}, {
  timestamps: true
});

// Hash password before saving
userSchema.pre('save', async function(next) {
  // Only hash if password is modified
  if (!this.isModified('password')) return next();
  
  // Hash password with cost of 12
  this.password = await bcrypt.hash(this.password, 12);
  next();
});

// Instance method to check password
userSchema.methods.comparePassword = async function(candidatePassword) {
  return await bcrypt.compare(candidatePassword, this.password);
};

// Instance method to generate JWT
userSchema.methods.generateAuthToken = function() {
  const jwt = require('jsonwebtoken');
  return jwt.sign(
    { 
      id: this._id,
      email: this.email,
      role: this.role
    },
    process.env.JWT_SECRET,
    { expiresIn: process.env.JWT_EXPIRES_IN || '1d' }
  );
};

module.exports = mongoose.model('User', userSchema);
```

### **Auth Controller Implementation:**

```javascript
const User = require('../models/User');
const jwt = require('jsonwebtoken');
const { promisify } = require('util');

// Register user
exports.register = async (req, res) => {
  try {
    const { name, email, password } = req.body;

    // Check if user already exists
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({
        success: false,
        message: 'User already exists with this email'
      });
    }

    // Create new user
    const user = await User.create({
      name,
      email,
      password
    });

    // Generate JWT token
    const token = user.generateAuthToken();

    // Remove password from response
    user.password = undefined;

    res.status(201).json({
      success: true,
      message: 'User registered successfully',
      token,
      data: { user }
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
      message: 'Server error during registration'
    });
  }
};

// Login user
exports.login = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Validate input
    if (!email || !password) {
      return res.status(400).json({
        success: false,
        message: 'Email and password are required'
      });
    }

    // Find user and include password
    const user = await User.findOne({ email }).select('+password');
    if (!user || !(await user.comparePassword(password))) {
      return res.status(401).json({
        success: false,
        message: 'Invalid email or password'
      });
    }

    // Check if account is active
    if (!user.isActive) {
      return res.status(401).json({
        success: false,
        message: 'Account is deactivated'
      });
    }

    // Update last login
    user.lastLogin = new Date();
    await user.save({ validateBeforeSave: false });

    // Generate JWT token
    const token = user.generateAuthToken();

    // Remove password from response
    user.password = undefined;

    res.json({
      success: true,
      message: 'Login successful',
      token,
      data: { user }
    });

  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Server error during login'
    });
  }
};

// Get current user profile
exports.getProfile = async (req, res) => {
  try {
    const user = await User.findById(req.user.id);
    
    res.json({
      success: true,
      data: { user }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error fetching profile'
    });
  }
};

// Update user profile
exports.updateProfile = async (req, res) => {
  try {
    const { name } = req.body;
    
    const user = await User.findByIdAndUpdate(
      req.user.id,
      { name },
      { new: true, runValidators: true }
    );

    res.json({
      success: true,
      message: 'Profile updated successfully',
      data: { user }
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error updating profile'
    });
  }
};

// Change password
exports.changePassword = async (req, res) => {
  try {
    const { currentPassword, newPassword } = req.body;

    // Get user with password
    const user = await User.findById(req.user.id).select('+password');

    // Check current password
    if (!(await user.comparePassword(currentPassword))) {
      return res.status(400).json({
        success: false,
        message: 'Current password is incorrect'
      });
    }

    // Update password
    user.password = newPassword;
    user.passwordChangedAt = new Date();
    await user.save();

    res.json({
      success: true,
      message: 'Password changed successfully'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: 'Error changing password'
    });
  }
};
```

### **JWT Authentication Middleware:**

```javascript
const jwt = require('jsonwebtoken');
const { promisify } = require('util');
const User = require('../models/User');

// Protect routes - require authentication
exports.protect = async (req, res, next) => {
  try {
    // 1) Get token from header
    let token;
    if (req.headers.authorization && req.headers.authorization.startsWith('Bearer')) {
      token = req.headers.authorization.split(' ')[1];
    }

    if (!token) {
      return res.status(401).json({
        success: false,
        message: 'Access denied. No token provided.'
      });
    }

    // 2) Verify token
    const decoded = await promisify(jwt.verify)(token, process.env.JWT_SECRET);

    // 3) Check if user still exists
    const user = await User.findById(decoded.id);
    if (!user) {
      return res.status(401).json({
        success: false,
        message: 'User no longer exists'
      });
    }

    // 4) Check if user is active
    if (!user.isActive) {
      return res.status(401).json({
        success: false,
        message: 'Account is deactivated'
      });
    }

    // 5) Check if password was changed after token was issued
    if (user.passwordChangedAt && decoded.iat < user.passwordChangedAt.getTime() / 1000) {
      return res.status(401).json({
        success: false,
        message: 'Password recently changed. Please login again.'
      });
    }

    // Grant access to protected route
    req.user = user;
    next();

  } catch (error) {
    if (error.name === 'JsonWebTokenError') {
      return res.status(401).json({
        success: false,
        message: 'Invalid token'
      });
    }
    
    if (error.name === 'TokenExpiredError') {
      return res.status(401).json({
        success: false,
        message: 'Token expired'
      });
    }

    res.status(500).json({
      success: false,
      message: 'Server error during authentication'
    });
  }
};

// Restrict to specific roles
exports.restrictTo = (...roles) => {
  return (req, res, next) => {
    if (!roles.includes(req.user.role)) {
      return res.status(403).json({
        success: false,
        message: 'Access denied. Insufficient permissions.'
      });
    }
    next();
  };
};

// Optional authentication - doesn't require token
exports.optionalAuth = async (req, res, next) => {
  try {
    let token;
    if (req.headers.authorization && req.headers.authorization.startsWith('Bearer')) {
      token = req.headers.authorization.split(' ')[1];
      
      if (token) {
        const decoded = await promisify(jwt.verify)(token, process.env.JWT_SECRET);
        const user = await User.findById(decoded.id);
        if (user && user.isActive) {
          req.user = user;
        }
      }
    }
    next();
  } catch (error) {
    // Ignore authentication errors for optional auth
    next();
  }
};
```

### **Auth Routes Setup:**

```javascript
const express = require('express');
const authController = require('../controllers/authController');
const { protect, restrictTo } = require('../middleware/authMiddleware');

const router = express.Router();

// Public routes
router.post('/register', authController.register);
router.post('/login', authController.login);

// Protected routes
router.use(protect); // All routes after this are protected

router.get('/profile', authController.getProfile);
router.patch('/profile', authController.updateProfile);
router.patch('/change-password', authController.changePassword);

// Admin only routes
router.use(restrictTo('admin'));
router.get('/users', authController.getAllUsers);

module.exports = router;
```

### **React Frontend Integration:**

```javascript
// Auth Context
import React, { createContext, useContext, useReducer, useEffect } from 'react';
import axios from 'axios';

const AuthContext = createContext();

const authReducer = (state, action) => {
  switch (action.type) {
    case 'LOGIN_SUCCESS':
      return {
        ...state,
        isAuthenticated: true,
        user: action.payload.user,
        token: action.payload.token,
        loading: false
      };
    case 'LOGOUT':
      return {
        ...state,
        isAuthenticated: false,
        user: null,
        token: null,
        loading: false
      };
    case 'SET_LOADING':
      return {
        ...state,
        loading: action.payload
      };
    default:
      return state;
  }
};

export const AuthProvider = ({ children }) => {
  const [state, dispatch] = useReducer(authReducer, {
    isAuthenticated: false,
    user: null,
    token: localStorage.getItem('token'),
    loading: true
  });

  // Set up axios interceptor
  useEffect(() => {
    if (state.token) {
      axios.defaults.headers.common['Authorization'] = `Bearer ${state.token}`;
    } else {
      delete axios.defaults.headers.common['Authorization'];
    }
  }, [state.token]);

  // Login function
  const login = async (email, password) => {
    try {
      dispatch({ type: 'SET_LOADING', payload: true });
      
      const response = await axios.post('/api/auth/login', {
        email,
        password
      });

      const { token, data } = response.data;
      
      localStorage.setItem('token', token);
      
      dispatch({
        type: 'LOGIN_SUCCESS',
        payload: {
          user: data.user,
          token
        }
      });

      return { success: true };
    } catch (error) {
      dispatch({ type: 'SET_LOADING', payload: false });
      return {
        success: false,
        message: error.response?.data?.message || 'Login failed'
      };
    }
  };

  // Logout function
  const logout = () => {
    localStorage.removeItem('token');
    dispatch({ type: 'LOGOUT' });
  };

  return (
    <AuthContext.Provider value={{
      ...state,
      login,
      logout
    }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within AuthProvider');
  }
  return context;
};
```

### **Protected Route Component:**

```javascript
import React from 'react';
import { Navigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';

const ProtectedRoute = ({ children, adminOnly = false }) => {
  const { isAuthenticated, user, loading } = useAuth();

  if (loading) {
    return <div>Loading...</div>;
  }

  if (!isAuthenticated) {
    return <Navigate to="/login" replace />;
  }

  if (adminOnly && user?.role !== 'admin') {
    return <Navigate to="/unauthorized" replace />;
  }

  return children;
};

export default ProtectedRoute;
```

**Master JWT Authentication for secure MERN applications! 🔐**

---

## 💡 Next Steps

After mastering JWT Authentication:

1. **OAuth integration** (Google, GitHub)
2. **Two-factor authentication** (2FA)
3. **Social login** implementation
4. **Advanced security features**
5. **Microservices authentication**

**JWT Authentication provides secure user management for modern applications! 🎯**