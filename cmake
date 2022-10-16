#!/bin/bash

#sets the filename
default="main.c"
client=${1:-$default}

#checks to see if file alrady exists and is not empty
#if so the programm stops its execution
[ -s $client ]
if [ $? -eq 0 ]
then
    echo "The file $client already exists and is not empty!"
    exit 0
fi

print_c_stuff() {
    echo "#include <stdio.h>" >> $client
    echo "" >> $client
    echo "int main(int argc, char** argv) {" >> $client
    echo -e "\t" >> $client
    echo "" >> $client
    echo -e "\treturn 0;" >> $client
    echo "}" >> $client
}

print_cpp_stuff() {
    echo "#include <iostream>" >> $client
    echo "" >> $client
    echo "#define print(x) std::cout << x << std::endl" >> $client
    echo "" >> $client
    echo "int main(int argc, char** argv) {" >> $client
    echo -e "\t" >> $client
    echo "" >> $client
    echo -e "\treturn 0;" >> $client
    echo "}" >> $client
}

if [[ $client == *".c" ]]
then
    print_c_stuff
    #echo "its a c file"
elif [[ $client == *".cpp" ]]
then
    print_cpp_stuff
    #echo "its a cpp file"
else
    echo "Please specify a .c or .cpp file!"
fi
