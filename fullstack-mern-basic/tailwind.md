# Tailwind CSS v4 Complete Learning Guide

## Mục tiêu

Học hoàn chỉnh Tailwind CSS v4 từ cơ bản đến nâng cao để có thể tự tin xây dựng các giao diện web hiện đại, responsive và đẹp mắt.

---

## 1. Giới thiệu Tailwind CSS v4

### Tailwind CSS là gì?

Tailwind CSS là một utility-first CSS framework cung cấp các lớp CSS nhỏ, có mục đích cụ thể để xây dựng giao diện tùy chỉnh nhanh chóng.

### Tính năng mới trong v4

- **Engine mới**: Oxide engine viết bằng Rust cho hiệu suất cực cao
- **Zero-config**: Không cần file cấu hình phức tạp
- **Native CSS**: Hỗ trợ CSS variables và modern CSS features
- **Smaller bundle**: Kích thước file CSS nhỏ hơn đáng kể
- **Better DX**: Developer experience được cải thiện

### Cài đặt Tailwind CSS v4

```bash
# Sử dụng npm
npm install tailwindcss@next @tailwindcss/cli@next

# Sử dụng pnpm
pnpm add tailwindcss@next @tailwindcss/cli@next

# Sử dụng yarn
yarn add tailwindcss@next @tailwindcss/cli@next
```

### Cấu hình cơ bản

```css
/* styles.css */
@import "tailwindcss";
```

```json
// package.json
{
  "scripts": {
    "build-css": "tailwindcss -i ./src/styles.css -o ./dist/output.css --watch"
  }
}
```

---

## 2. Utility-First Fundamentals

### Khái niệm Utility-First

Thay vì viết CSS custom, bạn sử dụng các utility class có sẵn để styling.

```html
<!-- Traditional CSS -->
<div class="chat-notification">
  <div class="chat-notification-logo-wrapper">
    <img
      class="chat-notification-logo"
      src="/img/logo.svg"
      alt="ChitChat Logo"
    />
  </div>
  <div class="chat-notification-content">
    <h4 class="chat-notification-title">ChitChat</h4>
    <p class="chat-notification-message">You have a new message!</p>
  </div>
</div>

<!-- Tailwind CSS -->
<div
  class="p-6 max-w-sm mx-auto bg-white rounded-xl shadow-lg flex items-center space-x-4"
>
  <div class="shrink-0">
    <img class="h-12 w-12" src="/img/logo.svg" alt="ChitChat Logo" />
  </div>
  <div>
    <div class="text-xl font-medium text-black">ChitChat</div>
    <p class="text-slate-500">You have a new message!</p>
  </div>
</div>
```

### Lợi ích của Utility-First

1. **Faster development**: Không cần nghĩ tên class
2. **Easier maintenance**: Thay đổi trực tiếp trong HTML
3. **Smaller CSS bundle**: Chỉ include classes được sử dụng
4. **Consistent design**: Sử dụng design system có sẵn

---

## 3. Layout & Spacing

### Container & Max-Width

```html
<!-- Container với max-width responsive -->
<div class="container mx-auto px-4">
  <h1>Content trong container</h1>
</div>

<!-- Max-width cụ thể -->
<div class="max-w-md mx-auto">Nhỏ (max-width: 28rem)</div>
<div class="max-w-lg mx-auto">Trung bình (max-width: 32rem)</div>
<div class="max-w-xl mx-auto">Lớn (max-width: 36rem)</div>
<div class="max-w-2xl mx-auto">Extra large (max-width: 42rem)</div>
```

### Box Model

```html
<!-- Width & Height -->
<div class="w-32 h-32">32x32 (8rem x 8rem)</div>
<div class="w-full h-screen">Full width, full screen height</div>
<div class="w-1/2 h-64">50% width, 16rem height</div>

<!-- Min & Max dimensions -->
<div class="min-w-0 max-w-xs min-h-0 max-h-full">Responsive dimensions</div>
```

### Padding & Margin

```html
<!-- Padding -->
<div class="p-4">Padding tất cả 4 sides</div>
<div class="px-6 py-4">Padding x-axis: 6, y-axis: 4</div>
<div class="pt-2 pr-4 pb-6 pl-8">Padding từng side riêng</div>

<!-- Margin -->
<div class="m-4">Margin tất cả 4 sides</div>
<div class="mx-auto">Center horizontal</div>
<div class="mt-8 mb-4">Margin top 8, bottom 4</div>
<div class="-mt-4">Negative margin top</div>

<!-- Space between elements -->
<div class="space-y-4">
  <div>Element 1</div>
  <div>Element 2</div>
  <div>Element 3</div>
</div>
```

### Position

```html
<!-- Static (default) -->
<div class="static">Static positioning</div>

<!-- Relative -->
<div class="relative top-4 left-4">Relative to normal position</div>

<!-- Absolute -->
<div class="relative">
  <div class="absolute top-0 right-0">Absolute positioned</div>
</div>

<!-- Fixed -->
<div class="fixed top-4 right-4 z-50">Fixed header/notification</div>

<!-- Sticky -->
<div class="sticky top-0 bg-white z-40">Sticky navigation</div>
```

---

## 4. Flexbox

### Flex Container

```html
<!-- Basic flex container -->
<div class="flex">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</div>

<!-- Flex direction -->
<div class="flex flex-col">Vertical (column)</div>
<div class="flex flex-row">Horizontal (row)</div>
<div class="flex flex-row-reverse">Horizontal reverse</div>
<div class="flex flex-col-reverse">Vertical reverse</div>

<!-- Flex wrap -->
<div class="flex flex-wrap">
  <div class="w-1/2">Item 1</div>
  <div class="w-1/2">Item 2</div>
  <div class="w-1/2">Item 3</div>
</div>
```

### Justify Content (Main Axis)

```html
<!-- Horizontal alignment -->
<div class="flex justify-start">Bắt đầu</div>
<div class="flex justify-center">Giữa</div>
<div class="flex justify-end">Cuối</div>
<div class="flex justify-between">Space between</div>
<div class="flex justify-around">Space around</div>
<div class="flex justify-evenly">Space evenly</div>
```

### Align Items (Cross Axis)

```html
<!-- Vertical alignment -->
<div class="flex items-start h-32">Top</div>
<div class="flex items-center h-32">Center</div>
<div class="flex items-end h-32">Bottom</div>
<div class="flex items-stretch h-32">Stretch</div>
<div class="flex items-baseline h-32">Baseline</div>
```

### Flex Item Properties

```html
<div class="flex">
  <!-- Flex grow -->
  <div class="flex-1">Grow to fill</div>
  <div class="flex-2">Grow 2x</div>

  <!-- Flex shrink -->
  <div class="flex-shrink-0">Don't shrink</div>
  <div class="flex-shrink">Can shrink</div>

  <!-- Align self -->
  <div class="self-start">Align self start</div>
  <div class="self-center">Align self center</div>
  <div class="self-end">Align self end</div>
</div>
```

### Practical Flexbox Examples

```html
<!-- Card layout -->
<div class="flex flex-col bg-white rounded-lg shadow-md overflow-hidden">
  <img src="image.jpg" class="h-48 w-full object-cover" />
  <div class="flex-1 p-6">
    <h3 class="text-lg font-semibold mb-2">Card Title</h3>
    <p class="text-gray-600 mb-4">Card description here...</p>
  </div>
  <div class="px-6 pb-6">
    <button class="w-full bg-blue-500 text-white py-2 rounded">Action</button>
  </div>
</div>

<!-- Navigation bar -->
<nav class="flex items-center justify-between px-6 py-4 bg-white shadow">
  <div class="flex items-center space-x-4">
    <img src="logo.svg" class="h-8 w-8" />
    <h1 class="text-xl font-bold">Brand</h1>
  </div>
  <div class="flex items-center space-x-6">
    <a href="#" class="text-gray-600 hover:text-gray-900">Home</a>
    <a href="#" class="text-gray-600 hover:text-gray-900">About</a>
    <a href="#" class="text-gray-600 hover:text-gray-900">Contact</a>
  </div>
</nav>
```

---

## 5. CSS Grid

### Grid Container

```html
<!-- Basic grid -->
<div class="grid grid-cols-3 gap-4">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
  <div>Item 4</div>
  <div>Item 5</div>
  <div>Item 6</div>
</div>

<!-- Responsive grid -->
<div
  class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6"
>
  <!-- Grid items -->
</div>

<!-- Custom grid template -->
<div
  class="grid grid-cols-[200px_1fr_100px] grid-rows-[auto_1fr_auto] h-screen"
>
  <header class="col-span-3">Header</header>
  <aside>Sidebar</aside>
  <main>Main Content</main>
  <aside>Right Sidebar</aside>
  <footer class="col-span-3">Footer</footer>
</div>
```

### Grid Item Placement

```html
<div class="grid grid-cols-4 gap-4">
  <!-- Span multiple columns -->
  <div class="col-span-2">Spans 2 columns</div>
  <div class="col-span-1">1 column</div>
  <div class="col-span-1">1 column</div>

  <!-- Start/end positions -->
  <div class="col-start-1 col-end-3">From col 1 to 3</div>
  <div class="col-start-3 col-end-5">From col 3 to 5</div>

  <!-- Row spanning -->
  <div class="row-span-2">Spans 2 rows</div>
  <div>Item</div>
  <div>Item</div>
  <div>Item</div>
</div>
```

---

## 6. Typography

### Font Family

```html
<!-- Font families -->
<p class="font-sans">Sans-serif font</p>
<p class="font-serif">Serif font</p>
<p class="font-mono">Monospace font</p>

<!-- Custom fonts (v4) -->
<p class="font-['Custom_Font']">Custom font family</p>
```

### Font Size & Weight

```html
<!-- Font sizes -->
<h1 class="text-6xl">Heading 1 (text-6xl)</h1>
<h2 class="text-5xl">Heading 2 (text-5xl)</h2>
<h3 class="text-4xl">Heading 3 (text-4xl)</h3>
<h4 class="text-3xl">Heading 4 (text-3xl)</h4>
<h5 class="text-2xl">Heading 5 (text-2xl)</h5>
<h6 class="text-xl">Heading 6 (text-xl)</h6>
<p class="text-base">Body text (text-base)</p>
<small class="text-sm">Small text (text-sm)</small>

<!-- Font weights -->
<p class="font-thin">Thin (100)</p>
<p class="font-extralight">Extra Light (200)</p>
<p class="font-light">Light (300)</p>
<p class="font-normal">Normal (400)</p>
<p class="font-medium">Medium (500)</p>
<p class="font-semibold">Semibold (600)</p>
<p class="font-bold">Bold (700)</p>
<p class="font-extrabold">Extra Bold (800)</p>
<p class="font-black">Black (900)</p>
```

### Text Styling

```html
<!-- Text alignment -->
<p class="text-left">Left aligned</p>
<p class="text-center">Center aligned</p>
<p class="text-right">Right aligned</p>
<p class="text-justify">Justified text</p>

<!-- Text decoration -->
<p class="underline">Underlined text</p>
<p class="line-through">Strike through</p>
<p class="no-underline">Remove underline</p>

<!-- Text transform -->
<p class="uppercase">UPPERCASE TEXT</p>
<p class="lowercase">lowercase text</p>
<p class="capitalize">Capitalize Each Word</p>
<p class="normal-case">Normal case</p>

<!-- Line height -->
<p class="leading-none">No line height</p>
<p class="leading-tight">Tight line height</p>
<p class="leading-normal">Normal line height</p>
<p class="leading-loose">Loose line height</p>

<!-- Letter spacing -->
<p class="tracking-tighter">Tighter spacing</p>
<p class="tracking-tight">Tight spacing</p>
<p class="tracking-normal">Normal spacing</p>
<p class="tracking-wide">Wide spacing</p>
<p class="tracking-widest">Widest spacing</p>
```

---

## 7. Colors & Backgrounds

### Background Colors

```html
<!-- Solid backgrounds -->
<div class="bg-white">White background</div>
<div class="bg-gray-100">Light gray</div>
<div class="bg-blue-500">Blue background</div>
<div class="bg-red-600">Red background</div>

<!-- Opacity -->
<div class="bg-blue-500/10">10% opacity</div>
<div class="bg-blue-500/75">75% opacity</div>

<!-- Gradients -->
<div class="bg-gradient-to-r from-blue-500 to-purple-600">
  Left to right gradient
</div>
<div class="bg-gradient-to-b from-green-400 via-blue-500 to-purple-600">
  Top to bottom gradient with via
</div>
```

### Background Images

```html
<!-- Background image -->
<div class="bg-[url('image.jpg')] bg-cover bg-center h-64">
  Background image
</div>
```

### Borders

```html
<!-- Border width -->
<div class="border">Default border (1px)</div>
<div class="border-2">2px border</div>
<div class="border-4">4px border</div>

<!-- Border colors -->
<div class="border border-gray-300">Gray border</div>
<div class="border border-blue-500">Blue border</div>

<!-- Border radius -->
<div class="rounded">Small radius</div>
<div class="rounded-md">Medium radius</div>
<div class="rounded-lg">Large radius</div>
<div class="rounded-full">Full/Circle</div>
```

### Shadows

```html
<!-- Box shadows -->
<div class="shadow-sm">Small shadow</div>
<div class="shadow">Default shadow</div>
<div class="shadow-md">Medium shadow</div>
<div class="shadow-lg">Large shadow</div>
<div class="shadow-xl">Extra large shadow</div>

<!-- Colored shadows -->
<div class="shadow-lg shadow-blue-500/25">Blue shadow</div>
```

---

## 8. Responsive Design

### Breakpoints

```html
<!-- Tailwind breakpoints:
sm: 640px
md: 768px  
lg: 1024px
xl: 1280px
2xl: 1536px
-->

<!-- Mobile first approach -->
<div class="text-sm md:text-base lg:text-lg xl:text-xl">
  Responsive text size
</div>

<!-- Hide/show at different breakpoints -->
<div class="block md:hidden">Visible on mobile only</div>
<div class="hidden md:block">Hidden on mobile</div>
```

### Responsive Layout

```html
<!-- Responsive grid -->
<div
  class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4"
>
  <div class="bg-white p-4 rounded shadow">Card 1</div>
  <div class="bg-white p-4 rounded shadow">Card 2</div>
  <div class="bg-white p-4 rounded shadow">Card 3</div>
  <div class="bg-white p-4 rounded shadow">Card 4</div>
</div>

<!-- Responsive flexbox -->
<div class="flex flex-col md:flex-row gap-4">
  <div class="flex-1 bg-blue-100 p-4">Main content</div>
  <div class="w-full md:w-64 bg-gray-100 p-4">Sidebar</div>
</div>
```

---

## 9. Interactive States

### Hover States

```html
<!-- Hover colors -->
<button class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
  Hover button
</button>

<!-- Hover transform -->
<div class="transform hover:scale-105 transition-transform duration-200">
  Scale on hover
</div>

<!-- Group hover -->
<div class="group bg-white p-4 rounded hover:bg-gray-50">
  <h3 class="group-hover:text-blue-600">Title changes on parent hover</h3>
  <p class="text-gray-600">Description</p>
</div>
```

### Focus States

```html
<!-- Focus rings -->
<input
  class="border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
  type="text"
  placeholder="Focus me"
/>

<!-- Focus colors -->
<button
  class="bg-blue-500 focus:bg-blue-600 text-white px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-blue-300"
>
  Focus button
</button>
```

---

## 10. Animations & Transitions

### Transitions

```html
<!-- Basic transition -->
<div class="transition duration-300 hover:bg-blue-500">
  Smooth color transition
</div>

<!-- Multiple properties -->
<div class="transition-all duration-500 hover:bg-blue-500 hover:scale-110">
  Transition all properties
</div>

<!-- Timing functions -->
<div class="transition ease-in duration-300">Ease in</div>
<div class="transition ease-out duration-300">Ease out</div>
<div class="transition ease-in-out duration-300">Ease in out</div>
```

### Transforms

```html
<!-- Scale -->
<div class="transform scale-105">Scaled up 5%</div>
<div class="transform hover:scale-110 transition-transform">Scale on hover</div>

<!-- Rotate -->
<div class="transform rotate-45">Rotated 45 degrees</div>
<div class="transform hover:rotate-180 transition-transform duration-500">
  Rotate on hover
</div>

<!-- Translate -->
<div class="transform translate-x-4 translate-y-2">Moved right and down</div>

<!-- Multiple transforms -->
<div class="transform rotate-12 scale-110 translate-x-4">
  Multiple transforms
</div>
```

### Animations

```html
<!-- Built-in animations -->
<div
  class="animate-spin h-8 w-8 border-4 border-blue-500 border-t-transparent rounded-full"
>
  Loading spinner
</div>

<div class="animate-ping h-4 w-4 bg-blue-500 rounded-full">Ping animation</div>

<div class="animate-pulse bg-gray-300 h-4 rounded">
  Pulse animation (skeleton loader)
</div>

<div class="animate-bounce">Bouncing element</div>
```

---

## 11. Forms & Components

### Input Styling

```html
<!-- Basic input -->
<input
  class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
  type="text"
  placeholder="Enter text"
/>

<!-- Textarea -->
<textarea
  class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500 resize-none"
  rows="4"
  placeholder="Enter message"
></textarea>

<!-- Select dropdown -->
<select
  class="border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
>
  <option>Option 1</option>
  <option>Option 2</option>
  <option>Option 3</option>
</select>
```

### Form Layout

```html
<!-- Form with proper spacing -->
<form class="space-y-6 max-w-md mx-auto">
  <div>
    <label class="block text-sm font-medium text-gray-700 mb-2">
      Full Name
    </label>
    <input
      type="text"
      class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
      placeholder="Enter your name"
    />
  </div>

  <div>
    <label class="block text-sm font-medium text-gray-700 mb-2"> Email </label>
    <input
      type="email"
      class="w-full border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500"
      placeholder="Enter your email"
    />
  </div>

  <div>
    <button
      type="submit"
      class="w-full bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-4 rounded-md transition duration-200"
    >
      Send Message
    </button>
  </div>
</form>
```

---

## 12. Component Examples

### Card Components

```html
<!-- Product card -->
<div
  class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300"
>
  <img src="product.jpg" alt="Product" class="w-full h-48 object-cover" />
  <div class="p-6">
    <div class="flex items-center justify-between mb-2">
      <h3 class="text-lg font-semibold text-gray-900">Product Name</h3>
      <span
        class="bg-green-100 text-green-800 text-xs font-medium px-2.5 py-0.5 rounded"
        >New</span
      >
    </div>
    <p class="text-gray-600 text-sm mb-4">Product description goes here...</p>
    <div class="flex items-center justify-between">
      <span class="text-2xl font-bold text-gray-900">$99.99</span>
      <button
        class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md text-sm font-medium transition duration-200"
      >
        Add to Cart
      </button>
    </div>
  </div>
</div>
```

### Navigation Bar

```html
<!-- Responsive navigation -->
<nav class="bg-white shadow-lg">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex justify-between h-16">
      <!-- Logo -->
      <div class="flex items-center">
        <img class="h-8 w-auto" src="logo.svg" alt="Logo" />
        <span class="ml-2 text-xl font-bold text-gray-900">Brand</span>
      </div>

      <!-- Desktop menu -->
      <div class="hidden md:flex items-center space-x-8">
        <a
          href="#"
          class="text-gray-600 hover:text-gray-900 px-3 py-2 text-sm font-medium"
          >Home</a
        >
        <a
          href="#"
          class="text-gray-600 hover:text-gray-900 px-3 py-2 text-sm font-medium"
          >About</a
        >
        <a
          href="#"
          class="text-gray-600 hover:text-gray-900 px-3 py-2 text-sm font-medium"
          >Services</a
        >
        <a
          href="#"
          class="text-gray-600 hover:text-gray-900 px-3 py-2 text-sm font-medium"
          >Contact</a
        >
        <button
          class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md text-sm font-medium transition duration-200"
        >
          Get Started
        </button>
      </div>

      <!-- Mobile menu button -->
      <div class="md:hidden flex items-center">
        <button
          class="text-gray-600 hover:text-gray-900 focus:outline-none focus:text-gray-900"
        >
          <svg
            class="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M4 6h16M4 12h16M4 18h16"
            />
          </svg>
        </button>
      </div>
    </div>
  </div>
</nav>
```

---

## 13. Dark Mode

### Setup Dark Mode

```html
<!-- HTML setup -->
<html class="dark"></html>
```

### Dark Mode Classes

```html
<!-- Basic dark mode -->
<div class="bg-white dark:bg-gray-900 text-gray-900 dark:text-white">
  Content adapts to dark mode
</div>

<!-- Navigation with dark mode -->
<nav class="bg-white dark:bg-gray-800 shadow-lg">
  <div class="max-w-7xl mx-auto px-4">
    <div class="flex justify-between h-16">
      <div class="flex items-center">
        <span class="text-xl font-bold text-gray-900 dark:text-white"
          >Brand</span
        >
      </div>
      <div class="flex items-center space-x-4">
        <a
          href="#"
          class="text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white"
          >Home</a
        >
        <a
          href="#"
          class="text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white"
          >About</a
        >
      </div>
    </div>
  </div>
</nav>

<!-- Card with dark mode -->
<div class="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6">
  <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-2">
    Card Title
  </h3>
  <p class="text-gray-600 dark:text-gray-300">Card description...</p>
  <button
    class="mt-4 bg-blue-600 hover:bg-blue-700 dark:bg-blue-500 dark:hover:bg-blue-600 text-white px-4 py-2 rounded-md"
  >
    Action
  </button>
</div>
```

---

## 14. Advanced Features & Customization

### Arbitrary Values (v4)

```html
<!-- Arbitrary CSS values -->
<div class="w-[350px] h-[200px]">Custom dimensions</div>
<div class="bg-[#bada55]">Custom hex color</div>
<div class="text-[14px]">Custom font size</div>
<div class="rotate-[17deg]">Custom rotation</div>

<!-- CSS functions -->
<div class="w-[calc(100%-2rem)]">Calc function</div>
<div class="bg-[rgb(59_130_246)]">RGB function</div>
<div class="text-[clamp(1rem,4vw,2rem)]">Clamp function</div>
```

### Custom CSS Properties (v4)

```css
/* Custom properties in CSS */
@import "tailwindcss";

@theme {
  --color-brand-primary: #3b82f6;
  --color-brand-secondary: #8b5cf6;
  --font-family-brand: "Inter", sans-serif;
  --spacing-huge: 5rem;
}
```

```html
<!-- Using custom properties -->
<div class="bg-[--color-brand-primary] text-white p-[--spacing-huge]">
  Custom branded section
</div>
```

---

## 15. Best Practices & Performance

### Performance Tips

1. **Use semantic HTML**:

```html
<!-- Good -->
<button class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded">
  Click me
</button>
```

2. **Group related utilities**:

```html
<!-- Group by category -->
<div
  class="
  /* Layout */
  flex items-center justify-between
  /* Spacing */
  px-6 py-4
  /* Appearance */
  bg-white rounded-lg shadow-md
  /* Interactive */
  hover:shadow-lg transition-shadow
"
>
  Content
</div>
```

### Accessibility Best Practices

```html
<!-- Focus states -->
<button
  class="
  bg-blue-500 text-white px-4 py-2 rounded
  focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2
  disabled:opacity-50 disabled:cursor-not-allowed
"
>
  Accessible button
</button>

<!-- Screen reader utilities -->
<span class="sr-only">Screen reader only text</span>
```

---

## 16. Practical Projects

### Landing Page Example

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Landing Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body class="bg-gray-50">
    <!-- Header -->
    <header class="bg-white shadow-sm">
      <nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
          <div class="flex items-center">
            <h1 class="text-xl font-bold text-gray-900">Brand</h1>
          </div>
          <div class="hidden md:flex items-center space-x-8">
            <a href="#" class="text-gray-600 hover:text-gray-900">Features</a>
            <a href="#" class="text-gray-600 hover:text-gray-900">Pricing</a>
            <a href="#" class="text-gray-600 hover:text-gray-900">About</a>
            <button
              class="bg-blue-600 text-white px-4 py-2 rounded-md hover:bg-blue-700"
            >
              Get Started
            </button>
          </div>
        </div>
      </nav>
    </header>

    <!-- Hero Section -->
    <section class="py-20 lg:py-32">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center">
          <h1 class="text-4xl md:text-6xl font-bold text-gray-900 mb-6">
            Build Something
            <span class="text-blue-600">Amazing</span>
          </h1>
          <p class="text-xl text-gray-600 mb-8 max-w-3xl mx-auto">
            Create beautiful, responsive websites with our modern tools and
            frameworks.
          </p>
          <div class="flex flex-col sm:flex-row justify-center gap-4">
            <button
              class="bg-blue-600 text-white px-8 py-3 rounded-md text-lg font-medium hover:bg-blue-700 transition"
            >
              Start Free Trial
            </button>
            <button
              class="border border-gray-300 text-gray-700 px-8 py-3 rounded-md text-lg font-medium hover:bg-gray-50 transition"
            >
              Watch Demo
            </button>
          </div>
        </div>
      </div>
    </section>

    <!-- Features Section -->
    <section class="py-16 bg-white">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
          <h2 class="text-3xl font-bold text-gray-900 mb-4">
            Powerful Features
          </h2>
          <p class="text-xl text-gray-600">
            Everything you need to build modern applications
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div class="text-center p-6">
            <div
              class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-4"
            >
              <svg
                class="w-8 h-8 text-blue-600"
                fill="currentColor"
                viewBox="0 0 24 24"
              >
                <!-- Icon -->
              </svg>
            </div>
            <h3 class="text-xl font-semibold text-gray-900 mb-2">
              Fast Development
            </h3>
            <p class="text-gray-600">
              Build faster with our utility-first approach
            </p>
          </div>

          <div class="text-center p-6">
            <div
              class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4"
            >
              <svg
                class="w-8 h-8 text-green-600"
                fill="currentColor"
                viewBox="0 0 24 24"
              >
                <!-- Icon -->
              </svg>
            </div>
            <h3 class="text-xl font-semibold text-gray-900 mb-2">
              Responsive Design
            </h3>
            <p class="text-gray-600">Works perfectly on all devices</p>
          </div>

          <div class="text-center p-6">
            <div
              class="w-16 h-16 bg-purple-100 rounded-full flex items-center justify-center mx-auto mb-4"
            >
              <svg
                class="w-8 h-8 text-purple-600"
                fill="currentColor"
                viewBox="0 0 24 24"
              >
                <!-- Icon -->
              </svg>
            </div>
            <h3 class="text-xl font-semibold text-gray-900 mb-2">
              Easy to Customize
            </h3>
            <p class="text-gray-600">
              Customize every aspect to match your brand
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer class="bg-gray-900 text-white py-12">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
          <div>
            <h3 class="text-lg font-semibold mb-4">Brand</h3>
            <p class="text-gray-300">Building the future of web development.</p>
          </div>
          <div>
            <h4 class="font-semibold mb-4">Product</h4>
            <ul class="space-y-2 text-gray-300">
              <li><a href="#" class="hover:text-white">Features</a></li>
              <li><a href="#" class="hover:text-white">Pricing</a></li>
              <li><a href="#" class="hover:text-white">Documentation</a></li>
            </ul>
          </div>
          <div>
            <h4 class="font-semibold mb-4">Company</h4>
            <ul class="space-y-2 text-gray-300">
              <li><a href="#" class="hover:text-white">About</a></li>
              <li><a href="#" class="hover:text-white">Blog</a></li>
              <li><a href="#" class="hover:text-white">Careers</a></li>
            </ul>
          </div>
          <div>
            <h4 class="font-semibold mb-4">Support</h4>
            <ul class="space-y-2 text-gray-300">
              <li><a href="#" class="hover:text-white">Help Center</a></li>
              <li><a href="#" class="hover:text-white">Contact</a></li>
              <li><a href="#" class="hover:text-white">Status</a></li>
            </ul>
          </div>
        </div>
        <div
          class="border-t border-gray-700 mt-8 pt-8 text-center text-gray-300"
        >
          <p>&copy; 2024 Brand. All rights reserved.</p>
        </div>
      </div>
    </footer>
  </body>
</html>
```

---

## 17. Resources & Next Steps

### Official Resources

- [Tailwind CSS v4 Documentation](https://tailwindcss.com/docs)
- [Tailwind CSS GitHub](https://github.com/tailwindlabs/tailwindcss)
- [Tailwind UI Components](https://tailwindui.com/)

### Community Resources

- [Tailwind CSS Discord](https://discord.gg/7NF8GNe)
- [Tailwind CSS Reddit](https://reddit.com/r/tailwindcss)
- [Tailwind CSS Examples](https://tailwindcomponents.com/)

### Tools & Extensions

- [Tailwind CSS IntelliSense (VS Code)](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)
- [Headless UI](https://headlessui.dev/)
- [Heroicons](https://heroicons.com/)

### Practice Projects

1. **Personal Portfolio**: Showcase your skills
2. **E-commerce Store**: Product listings, cart, checkout
3. **Dashboard**: Admin interface with charts and tables
4. **Blog**: Article layouts, author pages, categories
5. **SaaS Landing Page**: Features, pricing, testimonials

---

**Kết luận**: Tailwind CSS v4 mang đến hiệu suất và trải nghiệm phát triển tốt hơn. Với kiến thức trong guide này, bạn có thể tự tin xây dựng bất kỳ giao diện web nào từ đơn giản đến phức tạp. Hãy thực hành thường xuyên và khám phá thêm các tính năng mới!
