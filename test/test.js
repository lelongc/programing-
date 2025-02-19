
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





let thang = 2;

switch (thang) {
    case 1: case 3: case 5: case 7: case 8: case 10: case 12:
        console.log("Tháng " + thang + " có 31 ngày.");
        break;
    case 4: case 6: case 9: case 11:
        console.log("Tháng " + thang + " có 30 ngày.");
        break;
    case 2:
        console.log("Tháng 2 có 28 ngày.");
        break;
    default:
        console.log("Tháng không hợp lệ! Vui lòng nhập từ 1 đến 12.");
}