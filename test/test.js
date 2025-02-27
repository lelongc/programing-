function kiemTraTamGiac(a, b, c) {
    if (a + b > c && a + c > b && b + c > a) {
        if (a === b && b === c) {
            console.log("Tam giác đều");
        } else if (a === b || a === c || b === c) {
            console.log("Tam giác cân");
        } else {
            console.log("Tam giác thường");
        }
    } else {
        console.log("Không phải là tam giác");
    }
}

function xepLoaiHocLuc(diemTB) {
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
        console.log("Điểm không hợp lệ");
    }
}

function soNgayTrongThang(thang) {
    switch (thang) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            console.log("Tháng " + thang + " có 31 ngày");
            break;
        case 4: case 6: case 9: case 11:
            console.log("Tháng " + thang + " có 30 ngày");
            break;
        case 2:
            console.log("Tháng 2 có 28 hoặc 29 ngày");
            break;
        default:
            console.log("Tháng không hợp lệ");
    }
}

kiemTraTamGiac(3, 4, 5);
kiemTraTamGiac(2, 2, 2);
kiemTraTamGiac(3, 3, 5);
kiemTraTamGiac(1, 2, 3);

xepLoaiHocLuc(9);
xepLoaiHocLuc(7);
xepLoaiHocLuc(5.5);
xepLoaiHocLuc(4);
xepLoaiHocLuc(11);

soNgayTrongThang(2);
soNgayTrongThang(4);
soNgayTrongThang(12);
soNgayTrongThang(13);