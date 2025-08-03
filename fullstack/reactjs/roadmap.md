# Lộ trình học ReactJS đầy đủ

## 📋 Mục lục

1. [Kiến thức nền tảng](#kiến-thức-nền-tảng)
2. [React cơ bản](#react-cơ-bản)
3. [React nâng cao](#react-nâng-cao)
4. [State Management](#state-management)
5. [Routing](#routing)
6. [Forms & Validation](#forms--validation)
7. [HTTP Requests & APIs](#http-requests--apis)
8. [Testing](#testing)
9. [Performance Optimization](#performance-optimization)
10. [Advanced Patterns](#advanced-patterns)
11. [Ecosystem & Tools](#ecosystem--tools)
12. [Deployment](#deployment)

---

## 🎯 Kiến thức nền tảng

### JavaScript ES6+

- [ ] **Arrow Functions**
- [ ] **Destructuring Assignment**
- [ ] **Template Literals**
- [ ] **Spread/Rest Operators**
- [ ] **Modules (import/export)**
- [ ] **Classes**
- [ ] **Promises & Async/Await**
- [ ] **Array Methods** (map, filter, reduce, forEach)
- [ ] **Object Methods** (Object.keys, Object.values, Object.entries)

### Modern JavaScript Concepts

```javascript
// Destructuring
const { name, age } = user;
const [first, second] = array;

// Spread operator
const newArray = [...oldArray, newItem];
const newObject = { ...oldObject, newProperty: value };

// Template literals
const message = `Hello ${name}, you are ${age} years old`;

// Array methods
const doubled = numbers.map((num) => num * 2);
const filtered = users.filter((user) => user.active);
const total = prices.reduce((sum, price) => sum + price, 0);
```

### HTML & CSS

- [ ] **Semantic HTML**
- [ ] **CSS Flexbox**
- [ ] **CSS Grid**
- [ ] **CSS Variables**
- [ ] **Responsive Design**
- [ ] **CSS-in-JS concepts**

### Development Tools

- [ ] **Node.js & npm/yarn**
- [ ] **Git version control**
- [ ] **VS Code extensions**
- [ ] **Browser DevTools**
- [ ] **Package managers**

---

## ⚛️ React cơ bản

### 1. Giới thiệu React

- [ ] **React là gì?**
- [ ] **Virtual DOM**
- [ ] **Component-based architecture**
- [ ] **Declarative vs Imperative**
- [ ] **React ecosystem overview**

### 2. Environment Setup

```bash
# Create React App
npx create-react-app my-app
cd my-app
npm start

# Vite (alternative)
npm create vite@latest my-react-app -- --template react
cd my-react-app
npm install
npm run dev
```

- [ ] **Create React App**
- [ ] **Vite setup**
- [ ] **Project structure**
- [ ] **Development server**
- [ ] **Build process**

### 3. JSX (JavaScript XML)

```jsx
// Basic JSX
const element = <h1>Hello, World!</h1>;

// JSX with expressions
const name = "John";
const element = <h1>Hello, {name}!</h1>;

// JSX attributes
const element = <img src={user.avatarUrl} alt={user.name} />;

// Conditional rendering
const element = (
  <div>{isLoggedIn ? <h1>Welcome back!</h1> : <h1>Please sign in</h1>}</div>
);

// Lists and keys
const items = ["apple", "banana", "orange"];
const listItems = items.map((item, index) => <li key={index}>{item}</li>);
```

- [ ] **JSX syntax**
- [ ] **Expressions in JSX**
- [ ] **JSX attributes**
- [ ] **JSX children**
- [ ] **JSX vs HTML differences**
- [ ] **Conditional rendering**
- [ ] **Lists and keys**

### 4. Components

```jsx
// Function Component
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}

// Arrow Function Component
const Welcome = (props) => {
  return <h1>Hello, {props.name}</h1>;
};

// Component composition
function App() {
  return (
    <div>
      <Welcome name="Sara" />
      <Welcome name="Cahal" />
      <Welcome name="Edite" />
    </div>
  );
}
```

- [ ] **Function components**
- [ ] **Class components** (legacy knowledge)
- [ ] **Component composition**
- [ ] **Props**
- [ ] **Component naming**
- [ ] **Importing/Exporting components**

### 5. Props

```jsx
// Basic props
function UserCard({ name, email, age }) {
  return (
    <div className="user-card">
      <h2>{name}</h2>
      <p>Email: {email}</p>
      <p>Age: {age}</p>
    </div>
  );
}

// Default props
function Button({ text = "Click me", type = "button" }) {
  return <button type={type}>{text}</button>;
}

// Props validation with PropTypes
import PropTypes from "prop-types";

UserCard.propTypes = {
  name: PropTypes.string.isRequired,
  email: PropTypes.string.isRequired,
  age: PropTypes.number,
};

// Children prop
function Container({ children }) {
  return <div className="container">{children}</div>;
}
```

- [ ] **Passing props**
- [ ] **Destructuring props**
- [ ] **Default props**
- [ ] **PropTypes validation**
- [ ] **Children prop**
- [ ] **Props best practices**

### 6. State & useState Hook

```jsx
import { useState } from "react";

// Basic state
function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
      <button onClick={() => setCount(count - 1)}>Decrement</button>
    </div>
  );
}

// Object state
function UserForm() {
  const [user, setUser] = useState({
    name: "",
    email: "",
    age: 0,
  });

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setUser((prevUser) => ({
      ...prevUser,
      [name]: value,
    }));
  };

  // ...existing code...
}

// Array state
function TodoList() {
  const [todos, setTodos] = useState([]);
  const [inputValue, setInputValue] = useState("");

  const addTodo = () => {
    if (inputValue.trim()) {
      setTodos([
        ...todos,
        {
          id: Date.now(),
          text: inputValue,
          completed: false,
        },
      ]);
      setInputValue("");
    }
  };

  // ...existing code...
}
```

- [ ] **useState hook**
- [ ] **State updates**
- [ ] **Functional updates**
- [ ] **Object state**
- [ ] **Array state**
- [ ] **State best practices**

### 7. Event Handling

```jsx
function EventExample() {
  const handleClick = (e) => {
    e.preventDefault();
    console.log("Button clicked");
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("Form submitted");
  };

  const handleInputChange = (e) => {
    console.log("Input value:", e.target.value);
  };

  return (
    <div>
      <button onClick={handleClick}>Click me</button>

      <form onSubmit={handleSubmit}>
        <input onChange={handleInputChange} placeholder="Type something" />
        <button type="submit">Submit</button>
      </form>
    </div>
  );
}
```

- [ ] **Event handlers**
- [ ] **Event object**
- [ ] **Preventing default behavior**
- [ ] **Event delegation**
- [ ] **Synthetic events**

### 8. Conditional Rendering

```jsx
function ConditionalExample({ user, isLoading, error }) {
  // If statement
  if (isLoading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>Error: {error.message}</div>;
  }

  return (
    <div>
      {/* Ternary operator */}
      {user ? <h1>Welcome, {user.name}!</h1> : <h1>Please log in</h1>}

      {/* Logical AND operator */}
      {user && <p>Email: {user.email}</p>}

      {/* Multiple conditions */}
      {user && user.isAdmin && <button>Admin Panel</button>}
    </div>
  );
}
```

- [ ] **If statements**
- [ ] **Ternary operators**
- [ ] **Logical operators**
- [ ] **Short-circuit evaluation**
- [ ] **Multiple conditions**

### 9. Lists and Keys

```jsx
function ListExample() {
  const users = [
    { id: 1, name: "John", email: "john@example.com" },
    { id: 2, name: "Jane", email: "jane@example.com" },
  ];

  return (
    <div>
      {/* Basic list */}
      <ul>
        {users.map((user) => (
          <li key={user.id}>
            {user.name} - {user.email}
          </li>
        ))}
      </ul>

      {/* Complex list items */}
      <div>
        {users.map((user) => (
          <UserCard key={user.id} user={user} />
        ))}
      </div>
    </div>
  );
}
```

- [ ] **Rendering lists**
- [ ] **Keys importance**
- [ ] **Key selection strategies**
- [ ] **List performance**

---

## 🚀 React nâng cao

### 1. useEffect Hook

```jsx
import { useState, useEffect } from "react";

// Basic useEffect
function Timer() {
  const [seconds, setSeconds] = useState(0);

  useEffect(() => {
    const interval = setInterval(() => {
      setSeconds((prev) => prev + 1);
    }, 1000);

    // Cleanup function
    return () => clearInterval(interval);
  }, []); // Empty dependency array - runs once

  return <div>Seconds: {seconds}</div>;
}

// useEffect with dependencies
function UserProfile({ userId }) {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchUser = async () => {
      setLoading(true);
      try {
        const response = await fetch(`/api/users/${userId}`);
        const userData = await response.json();
        setUser(userData);
      } catch (error) {
        console.error("Error fetching user:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchUser();
  }, [userId]); // Runs when userId changes

  // ...existing code...
}
```

- [ ] **useEffect basics**
- [ ] **Dependency arrays**
- [ ] **Cleanup functions**
- [ ] **Multiple effects**
- [ ] **Effect optimization**
- [ ] **Common useEffect patterns**

### 2. Custom Hooks

```jsx
// useLocalStorage hook
function useLocalStorage(key, initialValue) {
  const [storedValue, setStoredValue] = useState(() => {
    try {
      const item = window.localStorage.getItem(key);
      return item ? JSON.parse(item) : initialValue;
    } catch (error) {
      console.error(`Error reading localStorage key "${key}":`, error);
      return initialValue;
    }
  });

  const setValue = (value) => {
    try {
      const valueToStore =
        value instanceof Function ? value(storedValue) : value;
      setStoredValue(valueToStore);
      window.localStorage.setItem(key, JSON.stringify(valueToStore));
    } catch (error) {
      console.error(`Error setting localStorage key "${key}":`, error);
    }
  };

  return [storedValue, setValue];
}

// useFetch hook
function useFetch(url) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        setLoading(true);
        const response = await fetch(url);
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const result = await response.json();
        setData(result);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [url]);

  return { data, loading, error };
}
```

- [ ] **Creating custom hooks**
- [ ] **Hook naming conventions**
- [ ] **Sharing logic between components**
- [ ] **Custom hook patterns**
- [ ] **Testing custom hooks**

### 3. useContext Hook

```jsx
import { createContext, useContext, useState } from "react";

// Create context
const AuthContext = createContext();

// Context provider component
function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(false);

  const login = async (email, password) => {
    setLoading(true);
    try {
      const response = await fetch("/api/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password }),
      });
      const userData = await response.json();
      setUser(userData);
    } catch (error) {
      console.error("Login failed:", error);
    } finally {
      setLoading(false);
    }
  };

  // ...existing code...

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

// Custom hook to use auth context
function useAuth() {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within an AuthProvider");
  }
  return context;
}
```

- [ ] **Context API**
- [ ] **createContext**
- [ ] **useContext hook**
- [ ] **Provider pattern**
- [ ] **Context best practices**
- [ ] **Avoiding prop drilling**

### 4. useReducer Hook

```jsx
import { useReducer } from "react";

// Todo reducer
const todoReducer = (state, action) => {
  switch (action.type) {
    case "ADD_TODO":
      return {
        ...state,
        todos: [
          ...state.todos,
          {
            id: Date.now(),
            text: action.payload,
            completed: false,
          },
        ],
      };

    case "TOGGLE_TODO":
      return {
        ...state,
        todos: state.todos.map((todo) =>
          todo.id === action.payload
            ? { ...todo, completed: !todo.completed }
            : todo
        ),
      };

    // ...existing cases...

    default:
      return state;
  }
};

const initialState = {
  todos: [],
  filter: "all",
};

function TodoApp() {
  const [state, dispatch] = useReducer(todoReducer, initialState);
  const [inputValue, setInputValue] = useState("");

  const addTodo = () => {
    if (inputValue.trim()) {
      dispatch({ type: "ADD_TODO", payload: inputValue });
      setInputValue("");
    }
  };

  // ...existing code...
}
```

- [ ] **useReducer hook**
- [ ] **Reducer functions**
- [ ] **Actions and dispatch**
- [ ] **Complex state management**
- [ ] **useReducer vs useState**

### 5. useMemo & useCallback

```jsx
import { useState, useMemo, useCallback } from "react";

function ExpensiveComponent() {
  const [count, setCount] = useState(0);
  const [items, setItems] = useState([]);
  const [filter, setFilter] = useState("");

  // Expensive calculation - memoized
  const expensiveValue = useMemo(() => {
    console.log("Calculating expensive value...");
    return count * 1000000;
  }, [count]);

  // Filtered items - memoized
  const filteredItems = useMemo(() => {
    console.log("Filtering items...");
    return items.filter((item) =>
      item.toLowerCase().includes(filter.toLowerCase())
    );
  }, [items, filter]);

  // Callback functions - memoized
  const handleAddItem = useCallback((newItem) => {
    setItems((prev) => [...prev, newItem]);
  }, []);

  // ...existing code...
}
```

- [ ] **useMemo hook**
- [ ] **useCallback hook**
- [ ] **Performance optimization**
- [ ] **Memoization concepts**
- [ ] **When to use memoization**

### 6. useRef Hook

```jsx
import { useRef, useEffect, useState } from "react";

function RefExamples() {
  const inputRef = useRef(null);
  const countRef = useRef(0);
  const intervalRef = useRef(null);

  // Focus input on component mount
  useEffect(() => {
    inputRef.current.focus();
  }, []);

  // Store mutable value without causing re-renders
  const handleClick = () => {
    countRef.current += 1;
    console.log("Clicked", countRef.current, "times");
  };

  // Store timer reference
  const startTimer = () => {
    if (intervalRef.current) return;

    intervalRef.current = setInterval(() => {
      // ...existing code...
    }, 1000);
  };

  // ...existing code...
}

// Forward refs
const CustomInput = React.forwardRef((props, ref) => {
  return (
    <input
      ref={ref}
      style={{ padding: "10px", border: "1px solid #ccc" }}
      {...props}
    />
  );
});
```

- [ ] **useRef hook**
- [ ] **DOM element references**
- [ ] **Mutable values**
- [ ] **forwardRef**
- [ ] **Ref patterns**

---

## 🗂️ State Management

### 1. Context API (Advanced)

```jsx
const AppContext = createContext();

function AppProvider({ children }) {
  const [state, setState] = useState({
    user: null,
    theme: "light",
    notifications: [],
    settings: {
      language: "en",
      timezone: "UTC",
    },
  });

  const updateUser = (user) => {
    setState((prev) => ({ ...prev, user }));
  };

  const toggleTheme = () => {
    setState((prev) => ({
      ...prev,
      theme: prev.theme === "light" ? "dark" : "light",
    }));
  };

  // ...existing methods...
}
```

### 2. Redux Toolkit (Modern Redux)

```bash
npm install @reduxjs/toolkit react-redux
```

```jsx
// store/store.js
import { configureStore } from "@reduxjs/toolkit";
import counterSlice from "./counterSlice";
import userSlice from "./userSlice";

export const store = configureStore({
  reducer: {
    counter: counterSlice,
    user: userSlice,
  },
});

// store/counterSlice.js
import { createSlice } from "@reduxjs/toolkit";

const counterSlice = createSlice({
  name: "counter",
  initialState: {
    value: 0,
  },
  reducers: {
    increment: (state) => {
      state.value += 1;
    },
    decrement: (state) => {
      state.value -= 1;
    },
  },
});

export const { increment, decrement } = counterSlice.actions;
export default counterSlice.reducer;

// Using Redux
import { useSelector, useDispatch } from "react-redux";
import { increment, decrement } from "./store/counterSlice";

function Counter() {
  const count = useSelector((state) => state.counter.value);
  const dispatch = useDispatch();

  return (
    <div>
      <span>{count}</span>
      <button onClick={() => dispatch(increment())}>+</button>
      <button onClick={() => dispatch(decrement())}>-</button>
    </div>
  );
}
```

### 3. Zustand (Lightweight alternative)

```bash
npm install zustand
```

```jsx
import { create } from "zustand";

// Simple store
const useCounterStore = create((set) => ({
  count: 0,
  increment: () => set((state) => ({ count: state.count + 1 })),
  decrement: () => set((state) => ({ count: state.count - 1 })),
  reset: () => set({ count: 0 }),
}));

// Complex store with async actions
const useUserStore = create((set, get) => ({
  users: [],
  loading: false,
  error: null,

  fetchUsers: async () => {
    set({ loading: true });
    try {
      const response = await fetch("/api/users");
      const users = await response.json();
      set({ users, loading: false });
    } catch (error) {
      set({ error: error.message, loading: false });
    }
  },
}));
```

- [ ] **Context API patterns**
- [ ] **Redux Toolkit**
- [ ] **Zustand**
- [ ] **State management patterns**
- [ ] **When to use each solution**

---

## 🧭 Routing

### 1. React Router

```bash
npm install react-router-dom
```

```jsx
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Link,
  useNavigate,
  useParams,
  useLocation,
  Navigate,
} from "react-router-dom";

// Layout component
function Layout() {
  return (
    <div>
      <nav>
        <Link to="/">Home</Link>
        <Link to="/about">About</Link>
        <Link to="/users">Users</Link>
      </nav>
      <main>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/about" element={<About />} />
          <Route path="/users" element={<Users />} />
          <Route path="/users/:id" element={<UserDetail />} />
          <Route
            path="/protected"
            element={
              <ProtectedRoute>
                <Protected />
              </ProtectedRoute>
            }
          />
          <Route path="*" element={<NotFound />} />
        </Routes>
      </main>
    </div>
  );
}

// Using hooks
function UserDetail() {
  const { id } = useParams();
  const [user, setUser] = useState(null);

  useEffect(() => {
    fetchUser(id).then(setUser);
  }, [id]);

  // ...existing code...
}

// Protected Route component
function ProtectedRoute({ children }) {
  const isAuthenticated = useAuth();

  return isAuthenticated ? children : <Navigate to="/login" />;
}
```

### 2. Advanced Routing Patterns

```jsx
// Nested routes
function Dashboard() {
  return (
    <div>
      <h1>Dashboard</h1>
      <nav>
        <Link to="overview">Overview</Link>
        <Link to="analytics">Analytics</Link>
      </nav>
      <Routes>
        <Route path="overview" element={<Overview />} />
        <Route path="analytics" element={<Analytics />} />
        <Route index element={<Navigate to="overview" />} />
      </Routes>
    </div>
  );
}

// Route configuration
const routes = [
  {
    path: "/",
    element: <Layout />,
    children: [
      { index: true, element: <Home /> },
      { path: "about", element: <About /> },
    ],
  },
];
```

- [ ] **BrowserRouter vs HashRouter**
- [ ] **Routes and Route components**
- [ ] **Navigation (Link, NavLink)**
- [ ] **Programmatic navigation**
- [ ] **URL parameters**
- [ ] **Query parameters**
- [ ] **Nested routes**
- [ ] **Protected routes**

---

## 📝 Forms & Validation

### 1. Controlled vs Uncontrolled Components

```jsx
// Controlled components
function ControlledForm() {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    message: "",
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: value,
    }));
  };

  // ...existing code...
}

// Uncontrolled components
function UncontrolledForm() {
  const formRef = useRef();

  const handleSubmit = (e) => {
    e.preventDefault();
    const formData = new FormData(formRef.current);
    const data = Object.fromEntries(formData);
    console.log("Form data:", data);
  };

  // ...existing code...
}
```

### 2. Form Validation

```jsx
// Custom validation hook
function useFormValidation(initialValues, validationRules) {
  const [values, setValues] = useState(initialValues);
  const [errors, setErrors] = useState({});
  const [touched, setTouched] = useState({});

  const validate = (fieldName, value) => {
    const rules = validationRules[fieldName];
    if (!rules) return "";

    for (const rule of rules) {
      const error = rule(value);
      if (error) return error;
    }
    return "";
  };

  // ...existing methods...

  return {
    values,
    errors,
    touched,
    handleChange,
    handleBlur,
    validateAll,
  };
}

// Validation rules
const required = (value) => {
  return !value || value.trim() === "" ? "This field is required" : "";
};

const email = (value) => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return value && !emailRegex.test(value) ? "Invalid email format" : "";
};
```

### 3. Form Libraries

```bash
# React Hook Form
npm install react-hook-form

# Formik
npm install formik yup
```

```jsx
// React Hook Form
import { useForm } from "react-hook-form";

function ReactHookFormExample() {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm();

  const onSubmit = (data) => {
    console.log(data);
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <input
        {...register("name", { required: "Name is required" })}
        placeholder="Name"
      />
      {errors.name && <span>{errors.name.message}</span>}

      <button type="submit">Submit</button>
    </form>
  );
}
```

- [ ] **Controlled vs Uncontrolled forms**
- [ ] **Form validation patterns**
- [ ] **Custom validation hooks**
- [ ] **React Hook Form**
- [ ] **Formik**

---

## 🌐 HTTP Requests & APIs

### 1. Fetch API

```jsx
function ApiExamples() {
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  // GET request
  const fetchUsers = async () => {
    setLoading(true);
    setError(null);

    try {
      const response = await fetch("/api/users");

      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }

      const data = await response.json();
      setUsers(data);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  // POST request
  const createUser = async (userData) => {
    try {
      const response = await fetch("/api/users", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(userData),
      });

      if (!response.ok) {
        throw new Error("Failed to create user");
      }

      const newUser = await response.json();
      setUsers((prev) => [...prev, newUser]);
    } catch (err) {
      setError(err.message);
    }
  };

  // ...existing methods...
}
```

### 2. Axios

```bash
npm install axios
```

```jsx
import axios from "axios";

// Axios configuration
const api = axios.create({
  baseURL: "https://api.example.com",
  timeout: 10000,
  headers: {
    "Content-Type": "application/json",
  },
});

// Request interceptor
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem("token");
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);
```

### 3. React Query / TanStack Query

```bash
npm install @tanstack/react-query
```

```jsx
import {
  QueryClient,
  QueryClientProvider,
  useQuery,
  useMutation,
} from "@tanstack/react-query";

// Setup Query Client
const queryClient = new QueryClient();

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <UserManagement />
    </QueryClientProvider>
  );
}

// Using React Query
function UserManagement() {
  const {
    data: users,
    isLoading,
    error,
    refetch,
  } = useQuery({
    queryKey: ["users"],
    queryFn: async () => {
      const response = await fetch("/api/users");
      if (!response.ok) throw new Error("Failed to fetch users");
      return response.json();
    },
    staleTime: 5 * 60 * 1000,
  });

  // Create user mutation
  const createUserMutation = useMutation({
    mutationFn: async (userData) => {
      const response = await fetch("/api/users", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(userData),
      });
      if (!response.ok) throw new Error("Failed to create user");
      return response.json();
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["users"] });
    },
  });

  // ...existing code...
}
```

- [ ] **Fetch API**
- [ ] **Axios library**
- [ ] **HTTP methods**
- [ ] **Error handling**
- [ ] **Loading states**
- [ ] **React Query/TanStack Query**
- [ ] **Caching strategies**

---

## 🧪 Testing

### 1. Jest & React Testing Library

```bash
npm install --save-dev @testing-library/react @testing-library/jest-dom @testing-library/user-event
```

```jsx
// Counter.test.js
import { render, screen, fireEvent } from "@testing-library/react";
import userEvent from "@testing-library/user-event";
import "@testing-library/jest-dom";
import Counter from "./Counter";

describe("Counter Component", () => {
  test("renders with initial count", () => {
    render(<Counter initialCount={5} />);
    expect(screen.getByText("Count: 5")).toBeInTheDocument();
  });

  test("increments count when increment button is clicked", async () => {
    const user = userEvent.setup();
    render(<Counter />);

    const incrementButton = screen.getByText("Increment");
    await user.click(incrementButton);

    expect(screen.getByText("Count: 1")).toBeInTheDocument();
  });

  test("decrements count when decrement button is clicked", async () => {
    const user = userEvent.setup();
    render(<Counter initialCount={5} />);

    const decrementButton = screen.getByText("Decrement");
    await user.click(decrementButton);

    expect(screen.getByText("Count: 4")).toBeInTheDocument();
  });
});
```

### 2. Testing Hooks

```jsx
// Custom hook testing
import { renderHook, act } from "@testing-library/react";
import { useCounter } from "./useCounter";

describe("useCounter Hook", () => {
  test("should initialize with 0", () => {
    const { result } = renderHook(() => useCounter());
    expect(result.current.count).toBe(0);
  });

  test("should increment count", () => {
    const { result } = renderHook(() => useCounter());

    act(() => {
      result.current.increment();
    });

    expect(result.current.count).toBe(1);
  });
});
```

### 3. Mocking & Integration Tests

```jsx
// Mocking API calls
import { rest } from "msw";
import { setupServer } from "msw/node";

const server = setupServer(
  rest.get("/api/users", (req, res, ctx) => {
    return res(
      ctx.json([{ id: 1, name: "John Doe", email: "john@example.com" }])
    );
  })
);

beforeAll(() => server.listen());
afterEach(() => server.resetHandlers());
afterAll(() => server.close());

test("loads and displays users", async () => {
  render(<UserList />);

  expect(screen.getByText("Loading...")).toBeInTheDocument();

  await waitFor(() => {
    expect(screen.getByText("John Doe")).toBeInTheDocument();
  });
});
```

- [ ] **Jest basics**
- [ ] **React Testing Library**
- [ ] **Testing components**
- [ ] **Testing hooks**
- [ ] **Mocking**
- [ ] **Integration testing**
- [ ] **E2E testing with Cypress**

---

## ⚡ Performance Optimization

### 1. React.memo

```jsx
// Memoized component
const ExpensiveComponent = React.memo(({ items, onItemClick }) => {
  console.log("ExpensiveComponent rendered");

  return (
    <ul>
      {items.map((item) => (
        <li key={item.id} onClick={() => onItemClick(item)}>
          {item.name}
        </li>
      ))}
    </ul>
  );
});

// With custom comparison
const MyComponent = React.memo(
  ({ user, config }) => {
    return <div>{user.name}</div>;
  },
  (prevProps, nextProps) => {
    return prevProps.user.id === nextProps.user.id;
  }
);
```

### 2. Code Splitting & Lazy Loading

```jsx
import { lazy, Suspense } from "react";

// Lazy load components
const LazyComponent = lazy(() => import("./LazyComponent"));
const Dashboard = lazy(() => import("./Dashboard"));

function App() {
  return (
    <div>
      <Suspense fallback={<div>Loading...</div>}>
        <Routes>
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/lazy" element={<LazyComponent />} />
        </Routes>
      </Suspense>
    </div>
  );
}

// Dynamic imports
const loadComponent = async () => {
  const { default: Component } = await import("./HeavyComponent");
  return Component;
};
```

### 3. Virtual Scrolling

```jsx
import { FixedSizeList as List } from "react-window";

function VirtualizedList({ items }) {
  const Row = ({ index, style }) => (
    <div style={style}>{items[index].name}</div>
  );

  return (
    <List height={400} itemCount={items.length} itemSize={50} width="100%">
      {Row}
    </List>
  );
}
```

### 4. Bundle Analysis

```bash
# Bundle analyzer
npm install --save-dev webpack-bundle-analyzer

# Analyze bundle
npm run build
npx webpack-bundle-analyzer build/static/js/*.js
```

- [ ] **React.memo**
- [ ] **useMemo & useCallback**
- [ ] **Code splitting**
- [ ] **Lazy loading**
- [ ] **Virtual scrolling**
- [ ] **Bundle optimization**
- [ ] **Performance profiling**

---

## 🎨 Advanced Patterns

### 1. Higher-Order Components (HOC)

```jsx
// withAuth HOC
function withAuth(WrappedComponent) {
  return function AuthenticatedComponent(props) {
    const { user, loading } = useAuth();

    if (loading) {
      return <div>Loading...</div>;
    }

    if (!user) {
      return <Navigate to="/login" />;
    }

    return <WrappedComponent {...props} user={user} />;
  };
}

// Usage
const ProtectedDashboard = withAuth(Dashboard);

// withLoading HOC
function withLoading(WrappedComponent) {
  return function LoadingComponent({ isLoading, ...props }) {
    if (isLoading) {
      return <div>Loading...</div>;
    }

    return <WrappedComponent {...props} />;
  };
}
```

### 2. Render Props Pattern

```jsx
// MouseTracker with render props
function MouseTracker({ render }) {
  const [position, setPosition] = useState({ x: 0, y: 0 });

  useEffect(() => {
    const handleMouseMove = (e) => {
      setPosition({ x: e.clientX, y: e.clientY });
    };

    window.addEventListener("mousemove", handleMouseMove);
    return () => window.removeEventListener("mousemove", handleMouseMove);
  }, []);

  return render(position);
}

// Usage
function App() {
  return (
    <MouseTracker
      render={({ x, y }) => (
        <div>
          Mouse position: {x}, {y}
        </div>
      )}
    />
  );
}

// Data fetcher with render props
function DataFetcher({ url, render }) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    // ...existing fetch logic...
  }, [url]);

  return render({ data, loading, error });
}
```

### 3. Compound Components

```jsx
// Tab component with compound pattern
function Tabs({ children, defaultTab = 0 }) {
  const [activeTab, setActiveTab] = useState(defaultTab);

  return (
    <div className="tabs">
      {React.Children.map(children, (child, index) => {
        if (React.isValidElement(child)) {
          return React.cloneElement(child, {
            isActive: index === activeTab,
            onActivate: () => setActiveTab(index),
            index,
          });
        }
        return child;
      })}
    </div>
  );
}

function TabList({ children }) {
  return <div className="tab-list">{children}</div>;
}

function Tab({ children, isActive, onActivate }) {
  return (
    <button className={`tab ${isActive ? "active" : ""}`} onClick={onActivate}>
      {children}
    </button>
  );
}

function TabPanels({ children, activeIndex }) {
  return (
    <div className="tab-panels">
      {React.Children.toArray(children)[activeIndex]}
    </div>
  );
}

// Usage
function App() {
  return (
    <Tabs defaultTab={0}>
      <TabList>
        <Tab>Tab 1</Tab>
        <Tab>Tab 2</Tab>
        <Tab>Tab 3</Tab>
      </TabList>
      <TabPanels>
        <div>Panel 1 Content</div>
        <div>Panel 2 Content</div>
        <div>Panel 3 Content</div>
      </TabPanels>
    </Tabs>
  );
}
```

### 4. Error Boundaries

```jsx
class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false, error: null, errorInfo: null };
  }

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    this.setState({
      error: error,
      errorInfo: errorInfo,
    });

    // Log error to service
    console.error("Error caught by boundary:", error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return (
        <div className="error-boundary">
          <h2>Something went wrong!</h2>
          {process.env.NODE_ENV === "development" && (
            <details>
              <summary>Error details</summary>
              <pre>{this.state.error && this.state.error.toString()}</pre>
              <pre>{this.state.errorInfo.componentStack}</pre>
            </details>
          )}
        </div>
      );
    }

    return this.props.children;
  }
}

// Usage
function App() {
  return (
    <ErrorBoundary>
      <Header />
      <Main />
      <Footer />
    </ErrorBoundary>
  );
}
```

### 5. Portal Pattern

```jsx
import { createPortal } from "react-dom";

// Modal component using portals
function Modal({ isOpen, onClose, children }) {
  const modalRoot = document.getElementById("modal-root");

  if (!isOpen) return null;

  return createPortal(
    <div className="modal-overlay" onClick={onClose}>
      <div className="modal-content" onClick={(e) => e.stopPropagation()}>
        <button className="modal-close" onClick={onClose}>
          ×
        </button>
        {children}
      </div>
    </div>,
    modalRoot
  );
}

// Tooltip using portals
function Tooltip({ children, content, position = "top" }) {
  const [isVisible, setIsVisible] = useState(false);
  const [tooltipPosition, setTooltipPosition] = useState({ x: 0, y: 0 });
  const triggerRef = useRef(null);

  const handleMouseEnter = (e) => {
    const rect = e.target.getBoundingClientRect();
    setTooltipPosition({
      x: rect.left + rect.width / 2,
      y: rect.top,
    });
    setIsVisible(true);
  };

  return (
    <>
      <span
        ref={triggerRef}
        onMouseEnter={handleMouseEnter}
        onMouseLeave={() => setIsVisible(false)}
      >
        {children}
      </span>

      {isVisible &&
        createPortal(
          <div
            className={`tooltip tooltip-${position}`}
            style={{
              left: tooltipPosition.x,
              top: tooltipPosition.y,
            }}
          >
            {content}
          </div>,
          document.body
        )}
    </>
  );
}
```

- [ ] **Higher-Order Components**
- [ ] **Render Props**
- [ ] **Compound Components**
- [ ] **Error Boundaries**
- [ ] **Portals**
- [ ] **Controlled vs Uncontrolled**

---

## 🛠️ Ecosystem & Tools

### 1. Styling Solutions

```bash
# CSS Modules
# Built into Create React App

# Styled Components
npm install styled-components

# Emotion
npm install @emotion/react @emotion/styled

# Tailwind CSS
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init
```

```jsx
// Styled Components
import styled from 'styled-components';

const Button = styled.button`
  background-color: ${props => props.primary ? 'blue' : 'white'};
  color: ${props => props.primary ? 'white' : 'blue'};
  border: 2px solid blue;
  padding: 10px 20px;
  border-radius: 4px;
  cursor: pointer;

  &:hover {
    background-color: ${props => props.primary ? 'darkblue' : 'lightblue'};
  }
`;

// Usage
<Button primary>Primary Button</Button>
<Button>Secondary Button</Button>

// CSS Modules
import styles from './Component.module.css';

function Component() {
  return (
    <div className={styles.container}>
      <h1 className={styles.title}>Hello World</h1>
    </div>
  );
}

// Tailwind CSS
function Component() {
  return (
    <div className="container mx-auto px-4">
      <h1 className="text-3xl font-bold text-blue-600 hover:text-blue-800">
        Hello World
      </h1>
    </div>
  );
}
```

### 2. UI Component Libraries

```bash
# Material-UI (MUI)
npm install @mui/material @emotion/react @emotion/styled

# Ant Design
npm install antd
```
