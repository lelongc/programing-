<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Dữ Liệu vào Bảng</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .error {
            color: red;
            font-size: 14px;
        }
        #formContainer {
            display: none;
        }
    </style>
</head>
<body class="container mt-5">

    <h2 class="text-center">Quản Lý Danh Sách</h2>

    <!-- Nút hiển thị form -->
    <button id="showFormBtn" class="btn btn-primary mb-3">Thêm Mới</button>

    <!-- Form nhập thông tin -->
    <div id="formContainer" class="card p-4 shadow">
        <h4>Nhập Thông Tin</h4>
        <form id="dataForm">
            <div class="mb-3">
                <label for="name" class="form-label">Họ và Tên:</label>
                <input type="text" class="form-control" id="name" required>
                <div class="error" id="nameError"></div>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" required>
                <div class="error" id="emailError"></div>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Số Điện Thoại:</label>
                <input type="text" class="form-control" id="phone" required>
                <div class="error" id="phoneError"></div>
            </div>
            <button type="submit" class="btn btn-success">Thêm</button>
            <button type="button" id="hideFormBtn" class="btn btn-secondary">Đóng</button>
        </form>
    </div>

    <!-- Bảng hiển thị dữ liệu -->
    <table class="table table-bordered mt-4">
        <thead class="table-dark">
            <tr>
                <th>Họ và Tên</th>
                <th>Email</th>
                <th>Số Điện Thoại</th>
                <th>Hành Động</th>
            </tr>
        </thead>
        <tbody id="dataTableBody">
            <!-- Dữ liệu sẽ được thêm vào đây -->
        </tbody>
    </table>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Import file script.js -->
    <script src="script.js"></script>

</body>
</html>


-------------
document.addEventListener("DOMContentLoaded", function () {
    const showFormBtn = document.getElementById("showFormBtn");
    const hideFormBtn = document.getElementById("hideFormBtn");
    const formContainer = document.getElementById("formContainer");
    const dataForm = document.getElementById("dataForm");
    const dataTableBody = document.getElementById("dataTableBody");

    // Hiện form khi nhấn nút "Thêm Mới"
    showFormBtn.addEventListener("click", function () {
        formContainer.style.display = "block";
    });

    // Ẩn form khi nhấn nút "Đóng"
    hideFormBtn.addEventListener("click", function () {
        formContainer.style.display = "none";
    });

    // Xử lý khi submit form
    dataForm.addEventListener("submit", function (event) {
        event.preventDefault();
        let isValid = true;

        // Lấy giá trị input
        let name = document.getElementById("name").value.trim();
        let email = document.getElementById("email").value.trim();
        let phone = document.getElementById("phone").value.trim();

        // Regex kiểm tra dữ liệu nhập vào
        let nameRegex = /^[A-Za-zÀ-ỹ\s]+$/;
        let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        let phoneRegex = /^(0[1-9][0-9]{8})$/;

        // Kiểm tra tên
        document.getElementById("nameError").textContent = nameRegex.test(name) && name.length > 2 ? "" : "Tên không hợp lệ!";
        if (!nameRegex.test(name) || name.length < 2) isValid = false;

        // Kiểm tra email
        document.getElementById("emailError").textContent = emailRegex.test(email) ? "" : "Email không hợp lệ!";
        if (!emailRegex.test(email)) isValid = false;

        // Kiểm tra số điện thoại
        document.getElementById("phoneError").textContent = phoneRegex.test(phone) ? "" : "Số điện thoại không hợp lệ!";
        if (!phoneRegex.test(phone)) isValid = false;

        if (!isValid) return;

        // Thêm dữ liệu vào bảng
        let newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td>${name}</td>
            <td>${email}</td>
            <td>${phone}</td>
            <td>
                <button class="btn btn-danger btn-sm delete-btn">Xóa</button>
            </td>
        `;
        dataTableBody.appendChild(newRow);

        // Reset form và ẩn sau khi thêm dữ liệu
        dataForm.reset();
        formContainer.style.display = "none";

        // Xóa hàng khi bấm nút "Xóa"
        newRow.querySelector(".delete-btn").addEventListener("click", function () {
            newRow.remove();
        });
    });
});