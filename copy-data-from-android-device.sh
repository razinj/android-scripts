#!/bin/bash

# Author : RAZINJ
# Description : Copy data from android device to local linux host (Downloads folder).

# Global vars
new_music_path=/storage/emulated/0/Download/SnapTube\ Audio
downloads_folder=/storage/emulated/0/Download
pictures_folder=/storage/emulated/0/Pictures
dcim_folder=/storage/emulated/0/DCIM
bluetooth_folder=/storage/emulated/0/bluetooth

echo "##############################################"
echo "####  1 - Copy New Music Folder           ####"
echo "####  2 - Copy Downloads Folder           ####"
echo "####  3 - Copy Pictures Folder            ####"
echo "####  4 - Copy DCIM Folder                ####"
echo "####  5 - Copy Bluetooth Folder           ####"
echo "####  * - Copy all the mentioned folders  ####"
echo "##############################################"

read -p "Enter operation number : " op_number

printConnectedDevices() {
  adb devices -l
}

# 1st arg : folder name
# 2nd arg : folder path

copyData() {
  echo "Copy $1 from connected device from path : $2"
  echo "Running command : adb pull -a"
  adb pull -a "$2" /home/$USER/Downloads
  echo "Done copying $1."
}

case $op_number in
1)
  printConnectedDevices
  copyData "new music folder" "$new_music_path"
  ;;
2)
  printConnectedDevices
  copyData "downloads folder" $downloads_folder
  ;;
3)
  printConnectedDevices
  copyData "pictures folder" $pictures_folder
  ;;
4)
  printConnectedDevices
  copyData "DCIM folder" $dcim_folder
  ;;
5)
  printConnectedDevices
  copyData "Bluetooth folder" $bluetooth_folder
  ;;
*)
  printConnectedDevices
  copyData "new music folder" "$new_music_path"
  copyData "downloads folder" $downloads_folder
  copyData "pictures folder" $pictures_folder
  copyData "DCIM folder" $dcim_folder
  copyData "Bluetooth folder" $bluetooth_folder
  ;;
esac
