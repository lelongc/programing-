
let a = 2;
document.write(a % 2 == 0 ? "a là số chẵn" : "a là số lẻ");



let a = 3, b = 4, c = 5; // Nhập độ dài 3 cạnh

if (a + b > c && a + c > b && b + c > a) { 
    // Nếu tổng hai cạnh lớn hơn cạnh còn lại thì là tam giác
    if (a === b && b === c) {
        console.log("Tam giác đều");
    } else if (a === b || a === c || b === c) {
        console.log("Tam giác cân");
    } else {
        console.log("Tam giác thường");
    }
} else {
    console.log("Ba cạnh không tạo thành tam giác");
}




let diemTB = 7.5;  

if (diemTB >= 0 && diemTB <= 10) {
    if (diemTB >= 8) {
        console.log("Xếp loại: Giỏi");
    } else if (diemTB >= 6.5) {
        console.log("Xếp loại: Khá");
    } else if (diemTB >= 5) {
        console.log("Xếp loại: Trung bình");
    } else {
        console.log("Xếp loại: Yếu");
    }
} else {
    console.log("Điểm không hợp lệ! Vui lòng nhập giá trị từ 0 đến 10.");
}