#!/bin/bash

# Author : RAZINJ
# Description : Copy data to android device from local linux host based on arg path.

# Global vars
downloads_folder=/storage/emulated/0/Download
pictures_folder=/storage/emulated/0/Pictures
root_folder=/storage/emulated/0

echo "##############################################"
echo "####  1 - Copy to Downloads Folder        ####"
echo "####  2 - Copy to Pictures Folder         ####"
echo "####  3 - Copy to root Folder             ####"
echo "##############################################"

read -p "Enter operation number : " op_number
read -p "Enter local directory (Absolute path) : " from_path

printConnectedDevices() {
  adb devices -l
}

# 1st arg : folder name
# 2nd arg : folder path

copyData() {
  echo "Copy data to $1 from path : $from_path"
  echo "Running command : adb push --sync"
  adb push --sync "$from_path" "$1"
  echo "Done copying $from_path."
}

case $op_number in
1)
  printConnectedDevices
  copyData $downloads_folder
  ;;
2)
  printConnectedDevices
  copyData $pictures_folder
  ;;
3)
  printConnectedDevices
  copyData $root_folder
  ;;
esac
