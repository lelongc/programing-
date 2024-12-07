
# True if file exists and is a block special file.
[[ -b ${file} ]]
# Block special file là các file đại diện cho thiết bị lưu trữ, ví dụ: ổ đĩa (/dev/sda).


# True if file exists and is a character special file.
[[ -c ${file} ]]
# Character special file là file giao tiếp với thiết bị đầu vào/đầu ra ký tự, ví dụ: terminal (/dev/tty).


# True if file exists and is a directory.
[[ -d ${file} ]]

# True if file or folder exists.
[[ -e ${file} ]]

# True if file exists and is a regular file.
[[ -f ${file} ]]


# True if file exists and is readable.
[[ -r ${file} ]]

# True if file exists and has a size greater than zero.
[[ -s ${file} ]]

# True if file exists and is writable.
[[ -w ${file} ]]

# True if file exists and is executable.
[[ -x ${file} ]]


[[ -h ${file} ]]
[[ -L ${file} ]] #(thường được dùng hơn)
# Ý nghĩa: Trả về true nếu file tồn tại và là symbolic link.

