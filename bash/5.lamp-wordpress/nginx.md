Trong **Nginx**, cách quản lý cấu hình Virtual Hosts cũng tương tự như Apache. Nginx sử dụng hai thư mục: **`/etc/nginx/sites-available/`** và **`/etc/nginx/sites-enabled/`** để quản lý các site (Virtual Hosts).

---

### **Cách quản lý Virtual Hosts trong Nginx**

#### **1. Cấu hình Virtual Hosts với Nginx:**
- **`/etc/nginx/sites-available/`**: 
  - Lưu trữ tất cả các file cấu hình Virtual Hosts (site).
  - Đây là nơi bạn tạo và chỉnh sửa các file cấu hình.
  
- **`/etc/nginx/sites-enabled/`**: 
  - Chứa các liên kết tượng trưng (symbolic links) đến các file trong `/etc/nginx/sites-available/`.
  - Nginx chỉ đọc file cấu hình từ thư mục này khi khởi động hoặc tải lại.

---

#### **2. Kích hoạt site trong Nginx:**
Giống Apache, kích hoạt một site trong Nginx nghĩa là tạo liên kết tượng trưng từ `/sites-available/` sang `/sites-enabled/`.

##### **Ví dụ thực tế:**
1. **Tạo file cấu hình trong `/etc/nginx/sites-available/`:**
   ```bash
   sudo nano /etc/nginx/sites-available/mywebsite
   ```

   Nội dung file cấu hình (ví dụ):
   ```nginx
   server {
       listen 80;
       server_name mywebsite.com www.mywebsite.com;
       root /var/www/mywebsite;

       index index.html;

       location / {
           try_files $uri $uri/ =404;
       }
   }
   ```

2. **Tạo liên kết tượng trưng vào `/sites-enabled/`:**
   ```bash
   sudo ln -s /etc/nginx/sites-available/mywebsite /etc/nginx/sites-enabled/
   ```

3. **Kiểm tra cấu hình:**
   Đảm bảo cấu hình Nginx không có lỗi:
   ```bash
   sudo nginx -t
   ```

4. **Tải lại Nginx để áp dụng thay đổi:**
   ```bash
   sudo systemctl reload nginx
   ```

---

#### **3. Vô hiệu hóa site trong Nginx:**
Để vô hiệu hóa site, bạn chỉ cần xóa liên kết trong `/etc/nginx/sites-enabled/`.

##### **Ví dụ thực tế:**
1. **Xóa liên kết tượng trưng:**
   ```bash
   sudo rm /etc/nginx/sites-enabled/mywebsite
   ```

2. **Tải lại Nginx để áp dụng thay đổi:**
   ```bash
   sudo systemctl reload nginx
   ```

---

### **Lưu ý:**
- File gốc trong `/sites-available/` vẫn còn nguyên khi bạn xóa liên kết trong `/sites-enabled/`.
- **Tổ chức tốt hơn:** Chỉ chỉnh sửa cấu hình trong `/sites-available/` để dễ quản lý và hạn chế lỗi.

---

### **Tóm tắt các lệnh cần thiết trong Nginx:**

| **Tác vụ**                 | **Lệnh thực hiện**                                                                                      |
|----------------------------|-------------------------------------------------------------------------------------------------------|
| **Tạo site mới**            | Tạo file trong `/etc/nginx/sites-available/`.                                                        |
| **Kích hoạt site**          | `sudo ln -s /etc/nginx/sites-available/[site] /etc/nginx/sites-enabled/`.                             |
| **Vô hiệu hóa site**        | `sudo rm /etc/nginx/sites-enabled/[site]`.                                                           |
| **Kiểm tra cấu hình**       | `sudo nginx -t`.                                                                                     |
| **Tải lại Nginx**           | `sudo systemctl reload nginx`.                                                                       |

Cách làm này tương tự Apache, giúp quản lý nhiều site dễ dàng và hiệu quả.