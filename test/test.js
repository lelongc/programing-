
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