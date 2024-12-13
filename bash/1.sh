#!/bin/bash
#!/usr/bin/env bash         @ It searches for bash executable in directories, listed in PATH environmental variable

# set -euxo pipefail
# -e: Dừng script khi gặp lỗi.
# -u: Báo lỗi khi dùng biến chưa được định nghĩa.
# -x: Hiển thị chi tiết lệnh đang chạy.
# -o pipefail: Báo lỗi nếu bất kỳ lệnh nào trong pipeline thất bại.
echo "Hello World!" #-- 

chmod +x devdojo.sh #--

./devdojo.sh #--
bash devdojo.sh #--


   #-- "" bash can be used interactively, you could run the following
   #-- command directly in your terminal and you would get the same result: ""

echo "Hello DevDojo!" #--
--------------------------variables------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

name="DevDojo"
echo $name
echo ${name};
echo "The name is $name"; # The name is DevDojo


./devdojo.sh Bobby buddy!  #--
echo "Hello there" $1   # Hello there Bobby
# $1 : first parameter
echo "Hello there" $2   # Hello there buddy!
# $2 : second parameter   
echo "Hello there" $@   # Hello there Bobby buddy!
# $@ : all

----------------------------user-input-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo "What is your name?"  # What is your name?
read name                  # Bobby
#c2
read -p "What is your name? " name # Bobby


echo "Hi there $name"      # Hi there Bobby
echo "Welcome to DevDojo!" # Welcome to DevDojo!
./devdojo.sh   #--

-------------------------arguments-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo "Argument one is $1" #Argument one is dog
echo "Argument two is $2" #Argument two is cat
echo "Argument three is $3" #Argument three is bird

echo "All arguments: $@" # All arguments: dog cat bird
./arguments.sh dog cat bird #--


echo "The name of the file is: $0 and it is going to be self-
deleted."
rm -f $0

--------------------------array-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
my_array=("value 1" "value 2" "value 3" "value 4")
# ----------Notice: keep in mind that you need to use curly brackets
echo ${my_array[1]} # value 2
echo ${my_array[-1]} # value 4
echo ${my_array[@]} # value 1 value 2 value 3 value 4
echo ${#my_array[@]} # 4

----arr-slice--
         # ${string:start:length}
         # Where:
         # start is the starting index (0-based)
         # length is the maximum number of characters to extract
array=("A" "B" "C" "D" "E")
# Print entire array
echo "${array[@]}" # Output: A B C D E
# Access a single element
echo "${array[1]}" # Output: B
# Print a range of elements (requires Bash 4.0+)
echo "${array[@]:1:3}" # Output: B C D
# Print from an index to the end
echo "${array[@]:3}" # Output: D E
---string-slice--
         # ${string:start:length}
         # Where:
         # start is the starting index (0-based)
         # length is the maximum number of characters to extract

text="ABCDE"
# Extract from index 0, maximum 2 characters
echo "${text:0:2}" # Output: AB
# Extract from index 3 to the end
echo "${text:3}" # Output: DE
# Extract 3 characters starting from index 1
echo "${text:1:3}" # Output: BCD
# If length exceeds remaining characters, it stops at the end
echo "${text:3:3}" # Output: DE (only 2 characters available)

text="Hello, World!"
# Extract 5 characters starting from index 7
echo "${text:7:5}" # Output: World
# Attempt to extract 10 characters starting from index 7
# (even though only 6 characters remain)
echo "${text:7:10}" # Output: World!

---------------file-expression-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# True if file exists and is a regular file.
[[ -f ${file} ]]

| **Tùy chọn** | **Ý nghĩa**                                |
|--------------|--------------------------------------------|
| `-a`         | File tồn tại (lỗi thời, dùng `-e` thay thế).|
| `-b`         | File là block special.                     |
| `-c`         | File là character special.                 |
| `-d`         | File là thư mục.                           |
| `-e`         | File tồn tại (hiện đại, thay thế `-a`).     |
| `-f`         | File là file thường.                       |
| `-h` hoặc `-L`| File là symbolic link.                    |
| `-r`         | File có quyền đọc.                         |
| `-s`         | File có kích thước > 0.                    |
| `-w`         | File có quyền ghi.                         |
| `-x`         | File có quyền thực thi.                    |



----------------------String-expressions---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


| **Cú pháp**                           | **Ý nghĩa**                                                                                  |
|---------------------------------------|---------------------------------------------------------------------------------------------|
| `[[ -v ${varname} ]]`                 | **True** nếu biến `varname` đã được gán giá trị (được set).                                |
| `[[ -z ${string} ]]`                  | **True** nếu độ dài của chuỗi `string` là **0** (chuỗi rỗng).                              |
| `[[ -n ${string} ]]`                  | **True** nếu độ dài của chuỗi `string` là **khác 0** (chuỗi không rỗng).                  |
| `[[ ${string1} == ${string2} ]]`      | **True** nếu `string1` **bằng** `string2` (hỗ trợ pattern matching trong `[[ ]]`).         |
| `[[ ${string1} != ${string2} ]]`      | **True** nếu `string1` **không bằng** `string2`.                                           |
| `[[ ${string1} < ${string2} ]]`       | **True** nếu `string1` **đứng trước** `string2` theo thứ tự từ điển (lexicographically).  |
| `[[ ${string1} > ${string2} ]]`       | **True** nếu `string1` **đứng sau** `string2` theo thứ tự từ điển (lexicographically).    |

### **Ghi chú**
- `[[ ]]` là cú pháp của Bash, an toàn hơn và hỗ trợ nhiều tính năng hơn so với `[ ]`.
- Với `[[ ]]`, toán tử `==` cũng hỗ trợ **pattern matching** (ví dụ: `abc*` khớp với chuỗi bắt đầu bằng `abc`).

###  **Điểm khác biệt giữa `[ ]` và `[[ ]]`**
| **Đặc điểm**            | **[ ] (test)**                    | **[[ ]] (Compound Command)**              |
|--------------------------|-----------------------------------|-------------------------------------------|
| **POSIX**                | Có (tuân thủ POSIX).             | Không phải POSIX, chỉ hỗ trợ trong Bash.  |
| **Pattern Matching**     | Không hỗ trợ.                    | Hỗ trợ (ví dụ: `abc*`).                   |
| **Toán tử logic**        | Chỉ hỗ trợ cơ bản (`-a`, `-o`).  | Hỗ trợ logic phức tạp (`&&`, `||`).       |
| **Tính bảo mật**         | Có thể gặp lỗi với chuỗi đặc biệt.| An toàn hơn với chuỗi đặc biệt.           |



-----------------------arithmetic----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



### **Tóm tắt các toán tử số học trong Bash**

| **Toán tử**             | **Ý nghĩa**                                                                   | **Ví dụ**                             |
|-------------------------|-------------------------------------------------------------------------------|---------------------------------------|
| `[[ ${arg1} -eq ${arg2} ]]` | **True** nếu `arg1` bằng `arg2`.                                               | `[[ 5 -eq 5 ]]`                      |
| `[[ ${arg1} -ne ${arg2} ]]` | **True** nếu `arg1` không bằng `arg2`.                                         | `[[ 5 -ne 3 ]]`                      |
| `[[ ${arg1} -lt ${arg2} ]]` | **True** nếu `arg1` nhỏ hơn `arg2`.                                            | `[[ 3 -lt 5 ]]`                      |
| `[[ ${arg1} -le ${arg2} ]]` | **True** nếu `arg1` nhỏ hơn hoặc bằng `arg2`.                                  | `[[ 3 -le 5 ]]`                      |
| `[[ ${arg1} -gt ${arg2} ]]` | **True** nếu `arg1` lớn hơn `arg2`.                                           | `[[ 5 -gt 3 ]]`                      |
| `[[ ${arg1} -ge ${arg2} ]]` | **True** nếu `arg1` lớn hơn hoặc bằng `arg2`.                                  | `[[ 5 -ge 3 ]]`                      |
| **Lưu ý**                | `arg1` và `arg2` có thể là số nguyên âm hoặc dương.                            |                                       |
| **AND điều kiện**        | **True** nếu cả hai điều kiện đều đúng.                                        | `[[ test_case_1 ]] && [[ test_case_2 ]]` |
| **OR điều kiện**         | **True** nếu ít nhất một điều kiện đúng.                                       | `[[ test_case_1 ]] || [[ test_case_2 ]]` |

### **Giải thích**:
- Các toán tử này dùng để so sánh hai giá trị số học trong Bash, và hỗ trợ các điều kiện logic **AND** và **OR** cho các biểu thức.

---------------------------------------Exit-status-operators----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

      # $? lưu trữ trạng thái thoát của lệnh vừa thực thi:
      # 0 thường biểu thị rằng lệnh thực thi thành công.
      # Số khác 0 biểu thị rằng lệnh gặp lỗi.
# Thực thi lệnh `echo`
echo "Hello, World!"

# Kiểm tra trạng thái thoát của lệnh
if [[ $? -eq 0 ]]; then #gt 
  echo "Lệnh thực thi thành công!"
else
  echo "Lệnh có lỗi!"
fi
------------------------------if-else-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

read -p "What is your name? " name
if [[ -z ${name} ]]
then
    echo "Please enter your name!"
else
    echo "Hi there ${name}"
fi
--
admin="devdojo"
read -p "Enter your username? " username
# Check if the username provided is the admin
if [[ "${username}" != "${admin}" ]] && [[ $EUID != 0 ]] ; then
    echo "You are not the admin or root user, but please be safe!"
else
    echo "You are the admin user! This could be very destructive!"
fi
# [[ $num -gt 0 ]]

---------------------------Switch-case-statements------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------read -p "Enter the name of your car brand: " car
read -p "Enter the name of your car brand: " car
car=Tesla
case $car in
  Tesla)
    echo -n "${car}'s car factory is in the USA."
    ;;
  BMW | Mercedes | Audi | Porsche)
    echo -n "${car}'s car factory is in Germany."
    ;;
  Toyota | Mazda | Mitsubishi | Subaru)
    echo -n "${car}'s car factory is in Japan."
    ;;
  *)
    echo -n "${car} is an unknown car brand"
    ;;
esac

--------------------------------------loop-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------users="devdojo bobby tony"
users="devdojo bobby tony"
for user in ${users}
do
    echo "${user}" # devdojo bobby tony
done
--
for num in {1..10}
do
    echo ${num} # 1 2 3 4 5 6 7 8 9 10
done
--
counter=1
while [[ $counter -le 10 ]]
do
    echo $counter # 1 2 3 4 5 6 7 8 9 10
    ((counter++))
done
--
read -p "What is your name? " name
while [[ -z ${name} ]]
do
    echo "Your name can not be blank. Please enter a valid name!"
    read -p "Enter your name again? " name
done
--
count=1
until [[ $count -gt 10 ]]
do
    echo $count
    ((count++))
done
------------------------continue-break--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------for i in 1 2 3 4 5
for i in 1 2 3 4 5
do
    if [[ $i -eq 2 ]] 
    then
        echo "skipping number 2"
        continue
    fi
    echo "i is equal to $i"
done
--
num=1
while [[ $num -lt 10 ]] 
do
    if [[ $num -eq 5 ]] 
    then
        break
    fi
    ((num++))
done
echo "Loop completed"
--

for (( a = 1; a < 10; a++ ))
do
    echo "outer loop: $a"
    for (( b = 1; b < 100; b++ ))
    do
        if [[ $b -gt 5 ]] 
        then
            break 
        fi
        echo "Inner loop: $b "
    done
done
------------------------function--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------function hello() {
                      #######################################
                    # Description: Hello function
                    # Globals:
                    #   None
                    # Arguments:
                    #   Single input argument
                    # Outputs:
                    #   Value of input argument
                    # Returns:
                    #   0 if successful, non-zero on error.
                    #######################################
function hello() {
    echo "Hello World Function!"
}

hello
--
function hello() {
    echo "Hello $1!"
}

hello DevDojo
----------------------stdin-stdout-stderr-----------------------------------------------------------------------------------------

### Tóm tắt kiến thức về STDIN và lệnh `cat`

1. **STDIN và lệnh `cat`:**
   - Khi bạn nhập dữ liệu vào một lệnh, dữ liệu này được truyền qua **STDIN (Standard Input)**.
   - Lệnh `cat` (khi không có đối số) sẽ chờ dữ liệu từ STDIN và in nó ra **STDOUT (Standard Output)**.

2. **Ví dụ cơ bản với `cat`:**
   ```bash
   cat << EOF
   Hello World!
   How are you?
   EOF
   ```
   - `<< EOF` là **here-document**, dùng để chỉ định phần dữ liệu nhập.
   - Kết quả: 
     ```
     Hello World!
     How are you?
     ```

3. **Sử dụng STDIN với lệnh khác (ví dụ `wc`):**
   ```bash
   wc -l << EOF
   Hello World!
   How are you?
   EOF
   ```
   - Lệnh `wc -l` đếm số dòng trong dữ liệu được nhập.
   - Kết quả: `2` (vì có 2 dòng trong đoạn văn bản nhập).

4. **Mở rộng:** 
   - Nhiều lệnh khác cũng có thể nhận đầu vào qua STDIN.
   - Cách này hữu ích khi cần tự động hóa hoặc cung cấp dữ liệu trực tiếp mà không cần file trung gian.

--
# 1 là out 2 là err 
echo "Hello World!" > file.txt # ghi đè #  1>
echo "How are you?" >> file.txt # ghi thêm # 1>>

ls --hello 2> error.txt # 2>>
--

ls --hello 2> /dev/null
# Chỉ hiển thị thông tin thành công, ẩn lỗi:
# Lệnh ls --hello gây lỗi vì --hello không phải là tùy chọn hợp lệ.
# 2> /dev/null: Chuyển hướng STDERR (error message) tới /dev/null, do đó bạn không thấy thông báo lỗi trên terminal.
# /dev/null là một file đặc biệt trong Linux, còn được gọi là "black hole".
# Bất kỳ dữ liệu nào gửi đến /dev/null sẽ bị hủy ngay lập tức.
# Hữu ích khi bạn muốn tránh hiển thị lỗi không quan trọng trong script, nhưng cần cẩn thận để không bỏ qua lỗi quan trọng.

ls --hello &> /dev/null
# &> chuyển hướng cả STDOUT (1) và STDERR (2) tới /dev/null.


./install_package.sh > output.txt 2> error.txt
# để ghi riêng: > file1 2> file2.
# Để ghi cùng file (đề xuất): > file.txt 2>&1 hoặc &> file.txt. #2>&1: Chuyển hướng STDERR (2) để theo STDOUT (1), tức là ghi vào file.txt luôn.

--------------------here-doc/stringstring--------------------------------------------------------------------------------------------------------------------------------------------
### Tóm tắt về **Heredoc** trong Bash:

#### 1. **Heredoc là gì?**
- **Heredoc** (viết tắt của *Here Document*) là một cách để cung cấp đầu vào nhiều dòng cho một lệnh, trực tiếp trong script hoặc dòng lệnh.
- Ký hiệu `<<` dùng để bắt đầu Heredoc, và một **delimiter** (ví dụ: `EOF`, `END`, `randomword`) dùng để xác định điểm bắt đầu và kết thúc.

#### 2. **Cách sử dụng cơ bản:**
```bash
cat << EOF
This is a Heredoc example.
It allows you to write multiple lines.
EOF
```
- **Kết quả:** 
  ```
  This is a Heredoc example.
  It allows you to write multiple lines.
  ```

#### 3. **Sử dụng tên khác thay cho `EOF`:**
```bash
cat << randomword
This is another example.
You can use any word as the delimiter.
randomword
```
- **Kết quả giống nhau.**

#### 4. **Kết hợp với pipes:**
Heredoc có thể được kết hợp với các lệnh khác qua **pipe (`|`)**:
```bash
cat << EOF | wc -l
This is line 1.
This is line 2.
This is line 3.
EOF
```
- **Kết quả:** `3` (số dòng trong nội dung Heredoc).

#### 5. **Sử dụng biến trong Heredoc:**
- Biến có thể được sử dụng bên trong Heredoc nếu không có ký tự ngắt (quote) ở delimiter:
```bash
name="John"
cat << EOF
Hello, $name!
Welcome to Bash scripting.
EOF
```
- **Kết quả:**
  ```
  Hello, John!
  Welcome to Bash scripting.
  ```

- Nếu muốn giữ nguyên nội dung (không xử lý biến):
```bash
cat << 'EOF'
Hello, $name!
EOF
```
- **Kết quả:**
  ```
  Hello, $name!
  ```

#### 6. **Ứng dụng:**
- **Heredoc** làm cho script gọn gàng hơn khi cần nhập dữ liệu nhiều dòng hoặc tạo file tạm thời.
- Ví dụ với `cat`, `wc`, hoặc bất kỳ lệnh nào chấp nhận **STDIN**.

#### 7. **Kết hợp nâng cao:**
```bash
cat << EOF | grep "line"
This is line 1.
This is line 2.
Another line here.
EOF
```
- **Kết quả:**
  ```
  This is line 1.
  This is line 2.
  Another line here.
  ``` 
---
wc -w <<< "Count the words in this line."
---
read var < file.txt
echo $var
--
cat < file.txt



                        # --------------
                        # > Save output to a file
                        # >> Append output to a file
                        # < Read input from a file
                        # 2> Redirect error messages
                        # | Send the output from one program as input to another program
                        # << Pipe multiple lines into a program cleanly
                        # <<< Pipe a single line into a program cleanl
-----------------------sed---------------
sed -i "2d" /etc/apache2/mods-enabled/dir.conf

# Lệnh	Mô tả
# nd	# Xóa dòng thứ n.
# /pattern/d	# Xóa tất cả dòng khớp với pattern.
# ni\ text	 # Chèn dòng text sau dòng thứ n.
# n a\ text	# Thêm dòng text vào ngay sau dòng n.
# s/pattern/replacement/	# Thay thế pattern bằng replacement.
# /pattern/p	#In tất cả các dòng khớp với pattern.
