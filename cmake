#!/bin/bash

default="client.c"
client=${1:-$default}
path=$(pwd)

echo 

mkdir -p $path/src
mkdir -p $path/src/c
mkdir -p $path/src/h

echo "#include <stdio.h>" > $client
echo "" >> $client
echo "int main(int argc, char** argv) {" >> $client
echo -e "\t" >> $client
echo -e "\treturn 0;" >> $client
echo "}" >> $client
