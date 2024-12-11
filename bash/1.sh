#!/bin/bash
#!/usr/bin/env bash         @ It searches for bash executable in directories, listed in PATH environmental variable

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
----------------------