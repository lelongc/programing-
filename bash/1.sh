#!/bin/bash
#!/usr/bin/env bash         @ It searches for bash executable in directories, listed in PATH environmental variable

echo "Hello World!" #-- 

chmod +x devdojo.sh #--

./devdojo.sh #--
bash devdojo.sh #--


   #-- "" bash can be used interactively, you could run the following
   #-- command directly in your terminal and you would get the same result: ""

echo "Hello DevDojo!" #--
--------------------------variables--------------------------------------------------

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

----------------------------user-input---------------------------------------
echo "What is your name?"  # What is your name?
read name                  # Bobby
#c2
read -p "What is your name? " name # Bobby


echo "Hi there $name"      # Hi there Bobby
echo "Welcome to DevDojo!" # Welcome to DevDojo!
./devdojo.sh   #--

-------------------------arguments---------------------------------------------------
echo "Argument one is $1" #Argument one is dog
echo "Argument two is $2" #Argument two is cat
echo "Argument three is $3" #Argument three is bird

echo "All arguments: $@" # All arguments: dog cat bird
./arguments.sh dog cat bird #--


echo "The name of the file is: $0 and it is going to be self-
deleted."
rm -f $0

--------------------------array-------------------------------
my_array=("value 1" "value 2" "value 3" "value 4")
# ----------Notice: keep in mind that you need to use curly brackets
echo ${my_array[1]} # value 2
echo ${my_array[-1]} # value 4
echo ${my_array[@]} # value 1 value 2 value 3 value 4
echo ${#my_array[@]} # 4






