# 🔌 ROADMAP SOCKET.IO - Path 3 MERN Stack

## 🎯 Thông tin cơ bản

- **Timeline:** 2 tuần (14 ngày)
- **Prerequisites:** Node.js, Express.js, React.js basics
- **Goal:** Master Socket.IO để ready cho realtime MERN Stack applications

---

## 📅 Giai đoạn 1: Socket.IO Fundamentals & Basic Implementation (Tuần 1)

### **1. WebSocket & Real-time Concepts:**

    - 1.1. WebSocket protocol vs HTTP request/response.
    - 1.2. Real-time communication use cases.
    - 1.3. Socket.IO vs native WebSocket benefits.
    - 1.4. Fallback mechanisms: polling, long-polling.
    - 1.5. Browser compatibility considerations.

### **2. Socket.IO Installation & Setup:**

    - 2.1. Server-side Socket.IO installation.
    - 2.2. Client-side Socket.IO library setup.
    - 2.3. Basic server configuration.
    - 2.4. CORS configuration for Socket.IO.
    - 2.5. Development vs production setup.

### **3. Basic Connection & Events:**

    - 3.1. Server-side connection handling.
    - 3.2. Client-side connection establishment.
    - 3.3. Built-in events: connect, disconnect.
    - 3.4. Custom event emission và listening.
    - 3.5. Event acknowledgments và callbacks.

### **4. Client-Server Communication:**

    - 4.1. Emitting events from server to client.
    - 4.2. Emitting events from client to server.
    - 4.3. Bidirectional communication patterns.
    - 4.4. Event data serialization.
    - 4.5. Error handling in events.

### **5. Socket Management:**

    - 5.1. Socket instance properties.
    - 5.2. Connection state management.
    - 5.3. Socket disconnection handling.
    - 5.4. Reconnection strategies.
    - 5.5. Connection timeout configuration.

### **6. Basic Chat Application:**

    - 6.1. Chat server setup với Express + Socket.IO.
    - 6.2. Message broadcasting implementation.
    - 6.3. User join/leave notifications.
    - 6.4. Basic message structure.
    - 6.5. Real-time message display.

### **7. React Integration Basics:**

    - 7.1. Socket.IO client trong React components.
    - 7.2. useEffect hooks for socket connections.
    - 7.3. Event listeners setup/cleanup.
    - 7.4. State management với socket events.
    - 7.5. Component lifecycle với socket connections.

---

## 📅 Giai đoạn 2: Advanced Features & Production Ready (Tuần 2)

### **8. Rooms & Namespaces:**

    - 8.1. Socket.IO rooms concept.
    - 8.2. Joining và leaving rooms.
    - 8.3. Broadcasting to specific rooms.
    - 8.4. Namespace creation và usage.
    - 8.5. Room management strategies.

### **9. Advanced Broadcasting:**

    - 9.1. Broadcasting to all clients.
    - 9.2. Broadcasting to all except sender.
    - 9.3. Broadcasting to specific rooms.
    - 9.4. Private messaging implementation.
    - 9.5. Conditional broadcasting patterns.

### **10. Authentication & Authorization:**

    - 10.1. Socket.IO middleware for authentication.
    - 10.2. JWT token validation in sockets.
    - 10.3. User identification strategies.
    - 10.4. Role-based socket permissions.
    - 10.5. Secure connection establishment.

### **11. Error Handling & Reliability:**

    - 11.1. Connection error handling.
    - 11.2. Event error management.
    - 11.3. Reconnection logic implementation.
    - 11.4. Message delivery guarantees.
    - 11.5. Graceful degradation strategies.

### **12. Performance Optimization:**

    - 12.1. Connection pooling strategies.
    - 12.2. Memory management best practices.
    - 12.3. Event throttling và debouncing.
    - 12.4. Scaling Socket.IO applications.
    - 12.5. Redis adapter for clustering.

### **13. Advanced React Integration:**

    - 13.1. Socket.IO context provider.
    - 13.2. Custom hooks for socket operations.
    - 13.3. State synchronization patterns.
    - 13.4. Component communication via sockets.
    - 13.5. Socket event-driven state updates.

### **14. Production Deployment & Monitoring:**

    - 14.1. Production configuration best practices.
    - 14.2. Load balancing Socket.IO servers.
    - 14.3. Monitoring socket connections.
    - 14.4. Logging socket events.
    - 14.5. Debugging production socket issues.

---

## 📅 Project Milestones

### **Week 1 Project:** Real-time Chat Application

- Basic chat functionality
- User join/leave notifications
- Message broadcasting
- React frontend integration

### **Week 2 Project:** Advanced Chat with Rooms

- Private messaging
- Chat rooms
- User authentication
- Online user lists
- Message history

---

## 🎯 Mastery Checklist

### **Core Socket.IO Skills:**

- [ ] WebSocket concepts understanding
- [ ] Socket.IO server setup
- [ ] Client-server communication
- [ ] Event handling patterns
- [ ] Connection management

### **Advanced Features:**

- [ ] Rooms and namespaces
- [ ] Broadcasting strategies
- [ ] Authentication integration
- [ ] Error handling
- [ ] Performance optimization

### **React Integration:**

- [ ] Socket context setup
- [ ] Custom hooks implementation
- [ ] State management
- [ ] Component lifecycle
- [ ] Event-driven updates

### **Production Skills:**

- [ ] Deployment configuration
- [ ] Scaling strategies
- [ ] Monitoring setup
- [ ] Security implementation
- [ ] Performance tuning

---

## 🔧 Essential Socket.IO Code Examples

### **Server Setup với Express:**

```javascript
const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
const cors = require('cors');

const app = express();
const server = http.createServer(app);

// Socket.IO setup with CORS
const io = socketIo(server, {
  cors: {
    origin: "http://localhost:3000", // React app URL
    methods: ["GET", "POST"],
    credentials: true
  }
});

// Middleware
app.use(cors());
app.use(express.json());

// Socket.IO connection handling
io.on('connection', (socket) => {
  console.log('New client connected:', socket.id);

  // Handle custom events
  socket.on('message', (data) => {
    console.log('Message received:', data);
    
    // Broadcast to all clients
    io.emit('message', {
      id: Date.now(),
      user: data.user,
      text: data.text,
      timestamp: new Date()
    });
  });

  // Handle user joining
  socket.on('join', (userData) => {
    console.log('User joined:', userData);
    
    // Join a room (optional)
    socket.join('general');
    
    // Notify all clients
    socket.broadcast.emit('userJoined', {
      user: userData.name,
      message: `${userData.name} has joined the chat`
    });
  });

  // Handle disconnection
  socket.on('disconnect', (reason) => {
    console.log('Client disconnected:', socket.id, reason);
  });
});

const PORT = process.env.PORT || 5000;
server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

### **Advanced Server với Authentication:**

```javascript
const jwt = require('jsonwebtoken');
const User = require('./models/User');

// Authentication middleware for Socket.IO
io.use(async (socket, next) => {
  try {
    const token = socket.handshake.auth.token;
    
    if (!token) {
      return next(new Error('Authentication error'));
    }

    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const user = await User.findById(decoded.id);
    
    if (!user) {
      return next(new Error('User not found'));
    }

    socket.userId = user._id;
    socket.user = user;
    next();
  } catch (error) {
    next(new Error('Authentication error'));
  }
});

// Enhanced connection handling
io.on('connection', (socket) => {
  console.log(`User ${socket.user.name} connected`);

  // Join user to their personal room
  socket.join(`user_${socket.userId}`);

  // Handle joining chat rooms
  socket.on('joinRoom', (roomId) => {
    socket.join(roomId);
    
    // Notify room members
    socket.to(roomId).emit('userJoinedRoom', {
      user: socket.user.name,
      message: `${socket.user.name} joined the room`
    });
  });

  // Handle private messages
  socket.on('privateMessage', ({ recipientId, message }) => {
    const messageData = {
      from: socket.user.name,
      message,
      timestamp: new Date()
    };

    // Send to specific user
    socket.to(`user_${recipientId}`).emit('privateMessage', messageData);
    
    // Send back to sender for confirmation
    socket.emit('messageSent', messageData);
  });

  // Handle room messages
  socket.on('roomMessage', ({ roomId, message }) => {
    const messageData = {
      user: socket.user.name,
      message,
      timestamp: new Date(),
      roomId
    };

    // Broadcast to room
    io.to(roomId).emit('roomMessage', messageData);
  });

  // Handle typing indicators
  socket.on('typing', ({ roomId, isTyping }) => {
    socket.to(roomId).emit('userTyping', {
      user: socket.user.name,
      isTyping
    });
  });

  socket.on('disconnect', () => {
    console.log(`User ${socket.user.name} disconnected`);
  });
});
```

### **React Socket Context:**

```javascript
// contexts/SocketContext.js
import React, { createContext, useContext, useEffect, useState } from 'react';
import io from 'socket.io-client';
import { useAuth } from './AuthContext';

const SocketContext = createContext();

export const useSocket = () => {
  const context = useContext(SocketContext);
  if (!context) {
    throw new Error('useSocket must be used within SocketProvider');
  }
  return context;
};

export const SocketProvider = ({ children }) => {
  const [socket, setSocket] = useState(null);
  const [connected, setConnected] = useState(false);
  const { user, token } = useAuth();

  useEffect(() => {
    if (user && token) {
      // Initialize socket connection
      const newSocket = io('http://localhost:5000', {
        auth: {
          token: token
        }
      });

      // Connection event handlers
      newSocket.on('connect', () => {
        console.log('Connected to server');
        setConnected(true);
      });

      newSocket.on('disconnect', (reason) => {
        console.log('Disconnected from server:', reason);
        setConnected(false);
      });

      newSocket.on('connect_error', (error) => {
        console.error('Connection error:', error);
        setConnected(false);
      });

      setSocket(newSocket);

      // Cleanup on unmount
      return () => {
        newSocket.close();
        setSocket(null);
        setConnected(false);
      };
    }
  }, [user, token]);

  const value = {
    socket,
    connected
  };

  return (
    <SocketContext.Provider value={value}>
      {children}
    </SocketContext.Provider>
  );
};
```

### **Custom Socket Hooks:**

```javascript
// hooks/useChat.js
import { useState, useEffect } from 'react';
import { useSocket } from '../contexts/SocketContext';

export const useChat = (roomId) => {
  const { socket, connected } = useSocket();
  const [messages, setMessages] = useState([]);
  const [onlineUsers, setOnlineUsers] = useState([]);
  const [typingUsers, setTypingUsers] = useState([]);

  useEffect(() => {
    if (!socket || !connected) return;

    // Join room
    if (roomId) {
      socket.emit('joinRoom', roomId);
    }

    // Message listeners
    const handleMessage = (message) => {
      setMessages(prev => [...prev, message]);
    };

    const handleUserJoined = (data) => {
      setMessages(prev => [...prev, {
        type: 'system',
        message: data.message,
        timestamp: new Date()
      }]);
    };

    const handleUserTyping = ({ user, isTyping }) => {
      setTypingUsers(prev => {
        if (isTyping) {
          return [...prev.filter(u => u !== user), user];
        } else {
          return prev.filter(u => u !== user);
        }
      });
    };

    // Attach listeners
    socket.on('message', handleMessage);
    socket.on('roomMessage', handleMessage);
    socket.on('userJoinedRoom', handleUserJoined);
    socket.on('userTyping', handleUserTyping);

    // Cleanup listeners
    return () => {
      socket.off('message', handleMessage);
      socket.off('roomMessage', handleMessage);
      socket.off('userJoinedRoom', handleUserJoined);
      socket.off('userTyping', handleUserTyping);
    };
  }, [socket, connected, roomId]);

  const sendMessage = (message) => {
    if (socket && connected) {
      if (roomId) {
        socket.emit('roomMessage', { roomId, message });
      } else {
        socket.emit('message', { message });
      }
    }
  };

  const sendPrivateMessage = (recipientId, message) => {
    if (socket && connected) {
      socket.emit('privateMessage', { recipientId, message });
    }
  };

  const sendTyping = (isTyping) => {
    if (socket && connected && roomId) {
      socket.emit('typing', { roomId, isTyping });
    }
  };

  return {
    messages,
    onlineUsers,
    typingUsers,
    sendMessage,
    sendPrivateMessage,
    sendTyping,
    connected
  };
};
```

### **Chat Component Implementation:**

```javascript
// components/Chat.js
import React, { useState, useEffect, useRef } from 'react';
import { useChat } from '../hooks/useChat';
import { useAuth } from '../contexts/AuthContext';

const Chat = ({ roomId }) => {
  const [message, setMessage] = useState('');
  const [isTyping, setIsTyping] = useState(false);
  const messagesEndRef = useRef(null);
  const typingTimeoutRef = useRef(null);
  
  const { user } = useAuth();
  const {
    messages,
    typingUsers,
    sendMessage,
    sendTyping,
    connected
  } = useChat(roomId);

  // Auto scroll to bottom
  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [messages]);

  // Handle typing indicators
  const handleTyping = (value) => {
    setMessage(value);

    if (!isTyping) {
      setIsTyping(true);
      sendTyping(true);
    }

    // Clear existing timeout
    if (typingTimeoutRef.current) {
      clearTimeout(typingTimeoutRef.current);
    }

    // Set new timeout
    typingTimeoutRef.current = setTimeout(() => {
      setIsTyping(false);
      sendTyping(false);
    }, 1000);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    
    if (message.trim() && connected) {
      sendMessage({
        user: user.name,
        text: message.trim()
      });
      setMessage('');
      
      // Stop typing indicator
      if (isTyping) {
        setIsTyping(false);
        sendTyping(false);
        clearTimeout(typingTimeoutRef.current);
      }
    }
  };

  return (
    <div className="chat-container">
      {/* Connection Status */}
      <div className={`connection-status ${connected ? 'connected' : 'disconnected'}`}>
        {connected ? '🟢 Connected' : '🔴 Disconnected'}
      </div>

      {/* Messages */}
      <div className="messages-container">
        {messages.map((msg, index) => (
          <div key={index} className={`message ${msg.type || 'user'}`}>
            {msg.type === 'system' ? (
              <div className="system-message">{msg.message}</div>
            ) : (
              <div className="user-message">
                <span className="username">{msg.user}:</span>
                <span className="text">{msg.text}</span>
                <span className="timestamp">
                  {new Date(msg.timestamp).toLocaleTimeString()}
                </span>
              </div>
            )}
          </div>
        ))}
        
        {/* Typing Indicators */}
        {typingUsers.length > 0 && (
          <div className="typing-indicator">
            {typingUsers.join(', ')} {typingUsers.length === 1 ? 'is' : 'are'} typing...
          </div>
        )}
        
        <div ref={messagesEndRef} />
      </div>

      {/* Message Input */}
      <form onSubmit={handleSubmit} className="message-form">
        <input
          type="text"
          value={message}
          onChange={(e) => handleTyping(e.target.value)}
          placeholder="Type a message..."
          disabled={!connected}
          className="message-input"
        />
        <button 
          type="submit" 
          disabled={!connected || !message.trim()}
          className="send-button"
        >
          Send
        </button>
      </form>
    </div>
  );
};

export default Chat;
```

### **Room Management Component:**

```javascript
// components/RoomList.js
import React, { useState, useEffect } from 'react';
import { useSocket } from '../contexts/SocketContext';

const RoomList = ({ currentRoom, onRoomSelect }) => {
  const [rooms, setRooms] = useState([
    { id: 'general', name: 'General', users: 0 },
    { id: 'tech', name: 'Tech Talk', users: 0 },
    { id: 'random', name: 'Random', users: 0 }
  ]);
  const { socket, connected } = useSocket();

  useEffect(() => {
    if (!socket || !connected) return;

    const handleRoomUpdate = (roomData) => {
      setRooms(prev => prev.map(room => 
        room.id === roomData.id 
          ? { ...room, users: roomData.users }
          : room
      ));
    };

    socket.on('roomUpdate', handleRoomUpdate);

    return () => {
      socket.off('roomUpdate', handleRoomUpdate);
    };
  }, [socket, connected]);

  return (
    <div className="room-list">
      <h3>Chat Rooms</h3>
      {rooms.map(room => (
        <div
          key={room.id}
          className={`room-item ${currentRoom === room.id ? 'active' : ''}`}
          onClick={() => onRoomSelect(room.id)}
        >
          <span className="room-name">{room.name}</span>
          <span className="user-count">{room.users} users</span>
        </div>
      ))}
    </div>
  );
};

export default RoomList;
```

### **Production Deployment Configuration:**

```javascript
// Production server setup
const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
const redis = require('redis');
const redisAdapter = require('@socket.io/redis-adapter');

const app = express();
const server = http.createServer(app);

// Redis setup for scaling
const pubClient = redis.createClient({ 
  host: process.env.REDIS_HOST || 'localhost',
  port: process.env.REDIS_PORT || 6379
});
const subClient = pubClient.duplicate();

const io = socketIo(server, {
  cors: {
    origin: process.env.CLIENT_URL,
    methods: ["GET", "POST"],
    credentials: true
  },
  transports: ['websocket', 'polling'],
  pingTimeout: 60000,
  pingInterval: 25000
});

// Use Redis adapter for clustering
io.adapter(redisAdapter(pubClient, subClient));

// Rate limiting middleware
const rateLimiter = require('./middleware/rateLimiter');
io.use(rateLimiter);

// Enhanced error handling
io.engine.on("connection_error", (err) => {
  console.log('Connection error:', err.req);
  console.log('Error code:', err.code);
  console.log('Error message:', err.message);
  console.log('Error context:', err.context);
});

// Graceful shutdown
process.on('SIGTERM', () => {
  console.log('SIGTERM received, shutting down gracefully');
  server.close(() => {
    console.log('Server closed');
    pubClient.quit();
    subClient.quit();
    process.exit(0);
  });
});
```

**Master Socket.IO for powerful real-time MERN applications! 🔌**

---

## 💡 Next Steps

After mastering Socket.IO:

1. **Advanced scaling** with Redis/RabbitMQ
2. **WebRTC integration** for video/audio
3. **Push notifications** implementation
4. **Microservices communication**
5. **IoT device integration**

**Socket.IO enables rich real-time experiences in modern web applications! 🎯**

---

## 📚 Learning Resources

### **Official Documentation:**
- Socket.IO Official Docs
- Socket.IO Client API
- Socket.IO Server API

### **Practice Projects:**
- Real-time chat application
- Collaborative document editor
- Live notification system
- Multiplayer game basics
- Real-time dashboard

### **Advanced Topics:**
- Load balancing strategies
- Message queuing
- Connection management
- Security best practices
- Performance optimization

**Socket.IO mastery unlocks endless real-time possibilities! 🚀**