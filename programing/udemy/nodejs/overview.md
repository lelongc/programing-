**Node.js là gì?** 🎯

- **Môi trường thực thi JavaScript (JavaScript runtime):** Đơn giản là Node.js cho phép bạn **chạy mã JavaScript bên ngoài trình duyệt web**.
- **Hoạt động ở mọi nơi:** Bạn có thể dùng JavaScript (thông qua Node.js) để viết chương trình chạy trên **server**, hoặc bất kỳ máy tính nào, không chỉ giới hạn trong trình duyệt.

---

**Cách Node.js hoạt động:** ⚙️

1.  **Sử dụng V8 Engine:** Node.js được xây dựng trên **V8 engine** của Google. Đây chính là engine JavaScript mạnh mẽ mà trình duyệt Chrome sử dụng.
2.  **Biên dịch sang mã máy:** V8 engine lấy mã JavaScript của bạn và **biên dịch nó thành mã máy** (machine code) – loại mã mà máy tính có thể hiểu và thực thi trực tiếp, giúp chương trình chạy hiệu quả.

---

**Node.js làm được gì (khác với JavaScript trên trình duyệt):** ✨

- **Mở rộng khả năng:** Node.js **thêm nhiều tính năng** vào JavaScript mà phiên bản chạy trên trình duyệt không có.
  - **Ví dụ quan trọng:** Khả năng **làm việc với hệ thống file** trên máy tính của bạn (đọc, ghi, xóa file). Điều này bị cấm trong trình duyệt vì lý do bảo mật.
- **Không có những gì của trình duyệt:**
  - Vì không chạy trong trình duyệt, Node.js **không có quyền truy cập vào DOM** (Document Object Model) – tức là không thể tương tác trực tiếp với các thành phần HTML của một trang web.

---

**Tóm lại cốt lõi:** 💡

Node.js cho phép bạn sử dụng JavaScript (ngôn ngữ quen thuộc khi làm frontend) để **xây dựng các ứng dụng phía server (backend)** hoặc các công cụ chạy trên máy tính. Nó "mở khóa" nhiều khả năng cho JavaScript bên ngoài môi trường trình duyệt bằng cách bổ sung các tính năng cần thiết (như làm việc với file) dựa trên nền tảng V8 engine mạnh mẽ.
