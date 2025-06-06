# 🚀 ROADMAP NEXT.JS WITH TYPESCRIPT - Path 2 Enhancement

## 🎯 Thông tin cơ bản

- **Timeline:** 4 tuần (28 ngày)
- **Prerequisites:** React.js với TypeScript mastery, Next.js concepts
- **Goal:** Apply TypeScript to Next.js development để ready cho production deployment

---

## 📋 **NOTE: Reuse Path 1 Next.js Roadmap**

**Base foundation:** Sử dụng 90% roadmap Next.js từ Path 1
**Enhancement:** Thêm TypeScript integration vào mỗi Next.js concept

---

## 📅 ENHANCEMENT PHASE 1: TypeScript Next.js Setup & Pages (Tuần 1)

### **1. TypeScript Next.js Project Setup:**

    - 1.1. Create Next.js với TypeScript: `npx create-next-app@latest --typescript`.
    - 1.2. Project structure: `.tsx` files, TypeScript configs.
    - 1.3. `next.config.js` với TypeScript support.
    - 1.4. `tsconfig.json` optimization cho Next.js.
    - 1.5. Development workflow với TypeScript.

### **2. Pages & Routing với TypeScript:**

    - 2.1. Page component typing: `NextPage<Props>`.
    - 2.2. Dynamic route parameters: `GetServerSidePropsContext<Params>`.
    - 2.3. Query parameters typing.
    - 2.4. Router object typing: `useRouter()` hook.
    - 2.5. Link component với typed routes.

### **3. getServerSideProps với TypeScript:**

    - 3.1. `GetServerSideProps<Props, Params>` typing.
    - 3.2. Context object typing.
    - 3.3. Props interface definitions.
    - 3.4. Error handling patterns.
    - 3.5. Redirect và notFound typing.

### **4. getStaticProps & getStaticPaths:**

    - 4.1. `GetStaticProps<Props, Params>` typing.
    - 4.2. `GetStaticPaths<Params>` implementation.
    - 4.3. Params interface definitions.
    - 4.4. ISR (Incremental Static Regeneration) typing.
    - 4.5. Build-time data fetching patterns.

### **5. API Routes với TypeScript:**

    - 5.1. API handler typing: `NextApiHandler`.
    - 5.2. Request/Response typing: `NextApiRequest`, `NextApiResponse`.
    - 5.3. HTTP method handling patterns.
    - 5.4. Query parameters và body typing.
    - 5.5. Error response standardization.

### **6. Custom App & Document:**

    - 6.1. `_app.tsx` component typing: `AppProps`.
    - 6.2. `_document.tsx` với TypeScript.
    - 6.3. Custom App props enhancement.
    - 6.4. Global styles integration.
    - 6.5. Provider pattern implementation.

### **7. Environment & Configuration:**

    - 7.1. Environment variables typing.
    - 7.2. Runtime configuration typing.
    - 7.3. Public vs server environment vars.
    - 7.4. Configuration validation.
    - 7.5. Type-safe config loading.

---

## 📅 ENHANCEMENT PHASE 2: Advanced Features & Data Fetching (Tuần 2)

### **8. Image Optimization với TypeScript:**

    - 8.1. `next/image` component typing.
    - 8.2. Image props interface.
    - 8.3. Loader function typing.
    - 8.4. Responsive image patterns.
    - 8.5. Image optimization configuration.

### **9. Font & Asset Optimization:**

    - 9.1. `next/font` với TypeScript.
    - 9.2. Font configuration typing.
    - 9.3. Asset import patterns.
    - 9.4. Static asset handling.
    - 9.5. Performance optimization.

### **10. Middleware với TypeScript:**

    - 10.1. Middleware function typing: `NextMiddleware`.
    - 10.2. Request/Response modification.
    - 10.3. URL rewriting patterns.
    - 10.4. Authentication middleware.
    - 10.5. Conditional middleware execution.

### **11. Advanced Routing Patterns:**

    - 11.1. Nested dynamic routes.
    - 11.2. Catch-all routes typing.
    - 11.3. Optional catch-all routes.
    - 11.4. Route groups organization.
    - 11.5. Parallel routes patterns.

### **12. Data Fetching Strategies:**

    - 12.1. SWR integration với TypeScript.
    - 12.2. React Query (TanStack Query) typing.
    - 12.3. Custom hooks for data fetching.
    - 12.4. Error handling patterns.
    - 12.5. Loading states management.

### **13. Authentication Integration:**

    - 13.1. NextAuth.js với TypeScript.
    - 13.2. Session typing: `Session`, `User`.
    - 13.3. JWT callback typing.
    - 13.4. Provider configuration.
    - 13.5. Protected route patterns.

### **14. Internationalization (i18n):**

    - 14.1. Next.js i18n configuration.
    - 14.2. Locale typing và routing.
    - 14.3. Translation function typing.
    - 14.4. Dynamic locale switching.
    - 14.5. SSR với i18n.

---

## 📅 ENHANCEMENT PHASE 3: Performance & Optimization (Tuần 3)

### **15. Bundle Analysis & Optimization:**

    - 15.1. Webpack bundle analyzer setup.
    - 15.2. Code splitting strategies.
    - 15.3. Dynamic imports với TypeScript.
    - 15.4. Tree shaking optimization.
    - 15.5. Chunk optimization patterns.

### **16. Caching Strategies:**

    - 16.1. ISR caching configuration.
    - 16.2. API route caching headers.
    - 16.3. Static asset caching.
    - 16.4. CDN integration patterns.
    - 16.5. Cache invalidation strategies.

### **17. Database Integration:**

    - 17.1. Prisma với Next.js APIs.
    - 17.2. Database connection patterns.
    - 17.3. Connection pooling trong serverless.
    - 17.4. Database query optimization.
    - 17.5. Error handling patterns.

### **18. Real-time Features:**

    - 18.1. WebSocket integration với Next.js.
    - 18.2. Server-Sent Events (SSE).
    - 18.3. Real-time data synchronization.
    - 18.4. Socket.IO integration.
    - 18.5. Connection management.

### **19. Testing với Next.js:**

    - 19.1. Jest configuration for Next.js.
    - 19.2. Page component testing.
    - 19.3. API route testing patterns.
    - 19.4. E2E testing với Playwright.
    - 19.5. Integration testing strategies.

### **20. Error Handling & Monitoring:**

    - 20.1. Custom error pages typing.
    - 20.2. Global error handling.
    - 20.3. Error boundary implementation.
    - 20.4. Logging strategies.
    - 20.5. Performance monitoring setup.

### **21. Security Implementation:**

    - 21.1. CSP (Content Security Policy) setup.
    - 21.2. CORS configuration.
    - 21.3. Rate limiting implementation.
    - 21.4. Input validation patterns.
    - 21.5. Security headers configuration.

---

## 📅 ENHANCEMENT PHASE 4: Production & Deployment (Tuần 4)

### **22. Production Build Optimization:**

    - 22.1. Production build configuration.
    - 22.2. Environment-specific optimizations.
    - 22.3. Build performance tuning.
    - 22.4. Output file analysis.
    - 22.5. Deployment preparation.

### **23. Serverless Deployment:**

    - 23.1. Vercel deployment optimization.
    - 23.2. Function configuration.
    - 23.3. Edge function implementation.
    - 23.4. Serverless database patterns.
    - 23.5. Cold start optimization.

### **24. Performance Monitoring:**

    - 24.1. Core Web Vitals tracking.
    - 24.2. Performance API integration.
    - 24.3. Real User Monitoring (RUM).
    - 24.4. Lighthouse CI integration.
    - 24.5. Performance budgets.

### **25. SEO & Meta Optimization:**

    - 25.1. `next/head` với TypeScript.
    - 25.2. Structured data implementation.
    - 25.3. Sitemap generation.
    - 25.4. Robot.txt configuration.
    - 25.5. Open Graph optimization.

### **26. Advanced Configuration:**

    - 26.1. Custom webpack configuration.
    - 26.2. Babel configuration.
    - 26.3. PostCSS integration.
    - 26.4. Custom server implementation.
    - 26.5. Plugin development.

### **27. Monitoring & Analytics:**

    - 27.1. Analytics integration (GA4).
    - 27.2. Custom event tracking.
    - 27.3. User behavior analysis.
    - 27.4. Conversion tracking.
    - 27.5. A/B testing setup.

### **28. Tailwind CSS Preparation:**

    - 28.1. Tailwind CSS integration.
    - 28.2. JIT mode configuration.
    - 28.3. Custom design system.
    - 28.4. Component styling patterns.
    - 28.5. Production optimization.

---

## 📅 Project milestones

### **Week 1 Project:** Blog Platform với TypeScript

- Static generation
- Dynamic routing
- API routes
- TypeScript integration

### **Week 2 Project:** E-commerce Platform

- Advanced data fetching
- Authentication
- Internationalization
- Performance optimization

### **Week 3 Project:** Dashboard Application

- Real-time features
- Database integration
- Caching strategies
- Security implementation

### **Week 4 Project:** Production-Ready SaaS

- Complete optimization
- Monitoring integration
- Deployment automation
- Performance tracking

---

## 🎯 Mastery Checklist

### **Next.js TypeScript Fundamentals:**

- [ ] Project setup với TypeScript
- [ ] Page component typing
- [ ] Data fetching methods
- [ ] API routes development
- [ ] Routing patterns

### **Advanced Features:**

- [ ] Image optimization
- [ ] Middleware implementation
- [ ] Authentication integration
- [ ] Internationalization
- [ ] Database integration

### **Performance & Optimization:**

- [ ] Bundle optimization
- [ ] Caching strategies
- [ ] Real-time features
- [ ] Testing implementation
- [ ] Error handling

### **Production Deployment:**

- [ ] Build optimization
- [ ] Serverless deployment
- [ ] Performance monitoring
- [ ] SEO optimization
- [ ] Security implementation

**🎉 Ready for Tailwind CSS integration! 🎉**

---

## 💡 Next Steps

After mastering Next.js với TypeScript:

1. **Tailwind CSS** styling framework
2. **Vercel** deployment platform
3. **Advanced performance** optimization
4. **Enterprise architecture** patterns
5. **Full-stack application** deployment

**Next.js với TypeScript provides production-ready full-stack development! 🎯**

---

## 🔧 Essential Next.js TypeScript Examples

### **Page Component với getServerSideProps:**

```typescript
import { GetServerSideProps, NextPage } from "next";
import { ParsedUrlQuery } from "querystring";

interface Post {
  id: number;
  title: string;
  content: string;
  author: string;
}

interface PostPageProps {
  post: Post;
}

interface PostPageParams extends ParsedUrlQuery {
  id: string;
}

const PostPage: NextPage<PostPageProps> = ({ post }) => {
  return (
    <div>
      <h1>{post.title}</h1>
      <p>By: {post.author}</p>
      <div>{post.content}</div>
    </div>
  );
};

export const getServerSideProps: GetServerSideProps<
  PostPageProps,
  PostPageParams
> = async (context) => {
  const { id } = context.params!;

  try {
    const response = await fetch(`${process.env.API_URL}/posts/${id}`);

    if (!response.ok) {
      return {
        notFound: true,
      };
    }

    const post: Post = await response.json();

    return {
      props: {
        post,
      },
    };
  } catch (error) {
    return {
      notFound: true,
    };
  }
};

export default PostPage;
```

### **API Route với TypeScript:**

```typescript
import { NextApiRequest, NextApiResponse } from "next";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

interface CreateUserRequest {
  name: string;
  email: string;
}

interface ApiError {
  error: string;
  details?: string;
}

type ApiResponse<T = any> = T | ApiError;

export default async function handler(
  req: NextApiRequest,
  res: NextApiResponse<ApiResponse>
) {
  if (req.method === "POST") {
    try {
      const { name, email }: CreateUserRequest = req.body;

      // Validation
      if (!name || !email) {
        return res.status(400).json({
          error: "Name and email are required",
        });
      }

      // Create user
      const user = await prisma.user.create({
        data: { name, email },
      });

      res.status(201).json(user);
    } catch (error) {
      console.error("Error creating user:", error);
      res.status(500).json({
        error: "Internal server error",
        details: error instanceof Error ? error.message : "Unknown error",
      });
    }
  } else {
    res.setHeader("Allow", ["POST"]);
    res.status(405).json({
      error: `Method ${req.method} not allowed`,
    });
  }
}
```

### **Custom App với TypeScript:**

```typescript
import type { AppProps } from "next/app";
import { SessionProvider } from "next-auth/react";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";
import { ThemeProvider } from "@/contexts/ThemeContext";
import Layout from "@/components/Layout";
import "@/styles/globals.css";

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      retry: 3,
      refetchOnWindowFocus: false,
    },
  },
});

interface MyAppProps extends AppProps {
  Component: AppProps["Component"] & {
    getLayout?: (page: React.ReactElement) => React.ReactNode;
  };
}

export default function MyApp({
  Component,
  pageProps: { session, ...pageProps },
}: MyAppProps) {
  // Use the layout defined at the page level, if available
  const getLayout = Component.getLayout ?? ((page) => <Layout>{page}</Layout>);

  return (
    <SessionProvider session={session}>
      <QueryClientProvider client={queryClient}>
        <ThemeProvider>{getLayout(<Component {...pageProps} />)}</ThemeProvider>
        <ReactQueryDevtools initialIsOpen={false} />
      </QueryClientProvider>
    </SessionProvider>
  );
}
```

### **Middleware với TypeScript:**

```typescript
import { NextRequest, NextResponse } from "next/server";
import { getToken } from "next-auth/jwt";

export async function middleware(request: NextRequest) {
  const token = await getToken({
    req: request,
    secret: process.env.NEXTAUTH_SECRET,
  });

  const { pathname } = request.nextUrl;

  // Allow requests if:
  // 1. Token exists
  // 2. It's a request for auth endpoints
  // 3. It's a public route
  if (
    token ||
    pathname.includes("/api/auth") ||
    pathname.startsWith("/login") ||
    pathname.startsWith("/register") ||
    pathname.startsWith("/public")
  ) {
    return NextResponse.next();
  }

  // Redirect to login if no token and trying to access protected route
  if (!token && pathname.startsWith("/dashboard")) {
    const loginUrl = new URL("/login", request.url);
    loginUrl.searchParams.set("callbackUrl", request.url);
    return NextResponse.redirect(loginUrl);
  }

  return NextResponse.next();
}

export const config = {
  matcher: ["/dashboard/:path*", "/profile/:path*", "/admin/:path*"],
};
```

### **Custom Hook cho Data Fetching:**

```typescript
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";

interface User {
  id: number;
  name: string;
  email: string;
}

interface CreateUserData {
  name: string;
  email: string;
}

const useUsers = () => {
  return useQuery<User[]>({
    queryKey: ["users"],
    queryFn: async () => {
      const response = await fetch("/api/users");
      if (!response.ok) {
        throw new Error("Failed to fetch users");
      }
      return response.json();
    },
  });
};

const useCreateUser = () => {
  const queryClient = useQueryClient();

  return useMutation<User, Error, CreateUserData>({
    mutationFn: async (userData) => {
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

      return response.json();
    },
    onSuccess: () => {
      // Invalidate and refetch users query
      queryClient.invalidateQueries({ queryKey: ["users"] });
    },
  });
};

// Usage trong component
const UserManagement: React.FC = () => {
  const { data: users, isLoading, error } = useUsers();
  const createUser = useCreateUser();

  const handleCreateUser = async (userData: CreateUserData) => {
    try {
      await createUser.mutateAsync(userData);
      console.log("User created successfully");
    } catch (error) {
      console.error("Error creating user:", error);
    }
  };

  if (isLoading) return <div>Loading...</div>;
  if (error) return <div>Error: {error.message}</div>;

  return (
    <div>
      {users?.map((user) => (
        <div key={user.id}>
          {user.name} - {user.email}
        </div>
      ))}
    </div>
  );
};
```

### **getStaticProps với ISR:**

```typescript
import { GetStaticProps, NextPage } from "next";

interface Product {
  id: number;
  name: string;
  price: number;
  description: string;
}

interface ProductsPageProps {
  products: Product[];
  lastUpdated: string;
}

const ProductsPage: NextPage<ProductsPageProps> = ({
  products,
  lastUpdated,
}) => {
  return (
    <div>
      <h1>Products</h1>
      <p>Last updated: {lastUpdated}</p>
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {products.map((product) => (
          <div key={product.id} className="border p-4 rounded">
            <h2>{product.name}</h2>
            <p>${product.price}</p>
            <p>{product.description}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export const getStaticProps: GetStaticProps<ProductsPageProps> = async () => {
  try {
    const response = await fetch(`${process.env.API_URL}/products`);
    const products: Product[] = await response.json();

    return {
      props: {
        products,
        lastUpdated: new Date().toISOString(),
      },
      // Revalidate every 10 seconds
      revalidate: 10,
    };
  } catch (error) {
    console.error("Error fetching products:", error);

    return {
      props: {
        products: [],
        lastUpdated: new Date().toISOString(),
      },
      revalidate: 60, // Try again in 1 minute
    };
  }
};

export default ProductsPage;
```

**Master these patterns for professional Next.js với TypeScript development! 🚀**
