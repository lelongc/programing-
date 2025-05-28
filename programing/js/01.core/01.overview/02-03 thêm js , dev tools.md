### **1.2. Cách thêm JavaScript vào HTML (`<script>` tag)**

Để trình duyệt có thể đọc và thực thi mã JavaScript của bạn, bạn phải "nhúng" nó vào file HTML. Có hai cách chính để làm điều này, và cả hai đều sử dụng thẻ `<script>`.

#### **Cách 1: JavaScript Nội tuyến (Internal JavaScript)**

Bạn viết mã JavaScript trực tiếp vào bên trong file HTML, đặt giữa cặp thẻ `<script>` và `</script>`.

**Ví dụ:**

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Trang Web của tôi</title>
  </head>
  <body>
    <h1>Chào mừng bạn!</h1>
    <p id="loi-chao">Đây là một đoạn văn bản.</p>

    <button onclick="thayDoiLoiChao()">Nhấn vào đây</button>

    <script>
      // Đây là mã JavaScript
      function thayDoiLoiChao() {
        document.getElementById("loi-chao").innerHTML =
          "Đoạn văn bản đã được thay đổi bởi JavaScript!";
      }
    </script>
  </body>
</html>
```

**Nên đặt thẻ `<script>` ở đâu?**

- **Trong thẻ `<head>`:** Trình duyệt sẽ đọc và thực thi JavaScript _trước khi_ tải và hiển thị nội dung HTML trong `<body>`. Điều này có thể làm chậm tốc độ hiển thị của trang web nếu file script lớn.
- **Cuối thẻ `<body>` (Khuyến khích):** Đặt thẻ `<script>` ngay trước thẻ đóng `</body>`. Bằng cách này, trình duyệt sẽ hiển thị toàn bộ nội dung HTML và CSS trước, sau đó mới tải và thực thi JavaScript. Điều này cải thiện trải nghiệm người dùng vì họ sẽ thấy nội dung trang web nhanh hơn. Đây là cách làm phổ biến và được khuyến khích nhất.

#### **Cách 2: JavaScript Bên ngoài (External JavaScript)**

Đây là cách làm chuyên nghiệp và được ưa chuộng hơn. Bạn sẽ viết mã JavaScript vào một file riêng biệt có đuôi là `.js`, sau đó liên kết file này với file HTML bằng thẻ `<script>` cùng với thuộc tính `src` (source).

**Bước 1: Tạo file `main.js` (tên file có thể tùy chọn)**

```javascript
// Nội dung file main.js
function thayDoiLoiChao() {
  document.getElementById("loi-chao").innerHTML =
    "Đoạn văn bản đã được thay đổi bởi file JS bên ngoài!";
}
```

**Bước 2: Liên kết file `main.js` vào file `index.html`**

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Trang Web của tôi</title>
  </head>
  <body>
    <h1>Chào mừng bạn!</h1>
    <p id="loi-chao">Đây là một đoạn văn bản.</p>

    <button onclick="thayDoiLoiChao()">Nhấn vào đây</button>

    <script src="main.js"></script>
  </body>
</html>
```

**Tại sao nên dùng cách này?**

- **Tách biệt rõ ràng:** Giữ cho HTML (cấu trúc) và JavaScript (hành vi) ở các file riêng biệt, giúp code sạch sẽ, dễ đọc và dễ bảo trì hơn.
- **Tái sử dụng:** Bạn có thể dùng cùng một file `.js` cho nhiều trang HTML khác nhau.
- **Tăng tốc độ tải trang:** Trình duyệt có thể lưu file `.js` vào bộ nhớ đệm (cache). Khi bạn truy cập các trang khác trên cùng website, trình duyệt sẽ sử dụng lại file đã lưu thay vì phải tải lại từ đầu.

---

### **1.3. Công cụ lập trình cần thiết**

Để bắt đầu hành trình với JavaScript, bạn chỉ cần hai thứ vô cùng đơn giản:

#### **1. Trình duyệt Web (Web Browser)**

Đây chính là môi trường để chạy và kiểm tra mã JavaScript phía client. Bất kỳ trình duyệt hiện đại nào cũng đều có thể làm được việc này.

- **Phổ biến nhất:**
  - **Google Chrome (Khuyến khích):** Rất phổ biến, mạnh mẽ và có bộ công cụ cho nhà phát triển (Developer Tools) cực kỳ tốt.
  - **Mozilla Firefox:** Một lựa chọn tuyệt vời khác, cũng có bộ công cụ mạnh mẽ.
  - **Microsoft Edge:** Phiên bản mới sử dụng nhân Chromium (giống Chrome) nên cũng rất tốt.

Quan trọng nhất, bạn cần biết cách mở **Công cụ cho nhà phát triển (Developer Tools)** bằng cách nhấn phím `F12` (hoặc `Ctrl+Shift+I` / `Cmd+Opt+I` trên Mac). Đặc biệt là tab **`Console`**, đây là nơi bạn sẽ thấy các lỗi JavaScript và kết quả của lệnh `console.log()`, một người bạn đồng hành không thể thiếu của mọi lập trình viên JS.

#### **2. Trình soạn thảo mã (Code Editor)**

Mặc dù bạn có thể viết code bằng Notepad, nhưng việc sử dụng một trình soạn thảo mã chuyên dụng sẽ giúp bạn làm việc hiệu quả hơn rất nhiều lần. Chúng cung cấp các tính năng như: tô màu cú pháp, gợi ý code, quản lý file, tích hợp terminal...

- **Lựa chọn hàng đầu (Miễn phí & Mạnh mẽ nhất):**

  - [**Visual Studio Code (VS Code)**](https://code.visualstudio.com/): Đây là trình soạn thảo phổ biến nhất thế giới hiện nay. Nó nhẹ, nhanh, có một kho tiện ích mở rộng (extensions) khổng lồ giúp hỗ trợ bạn làm việc với JavaScript và hầu hết các ngôn ngữ khác. Đây là công cụ được khuyến khích mạnh mẽ cho người mới bắt đầu và cả các chuyên gia.

- **Các lựa chọn khác:**

  - [Sublime Text](https://www.sublimetext.com/): Rất nhẹ và nhanh.
  - [Atom](https://www.google.com/search?q=https://atom.io/): Được phát triển bởi GitHub, có khả năng tùy biến cao.

**Tóm lại:** Để bắt đầu, bạn chỉ cần **cài đặt VS Code** và **sử dụng trình duyệt Chrome**. Đó là tất cả những gì bạn cần\!

---

Chúng ta đã thiết lập xong "sân chơi" và biết cách đưa kịch bản vào. Bước tiếp theo sẽ là làm quen với người bạn thân nhất của bạn trong quá trình gỡ lỗi.
