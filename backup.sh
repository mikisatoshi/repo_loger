#!/bin/bash
ls
files="/home/pi/repo_loger/storage/now/*"
for pathfile in $files
do
  echo $pathfile
  name="${pathfile##*/}"
  echo $name
  mv $pathfile /home/pi/repo_loger/storage/old/$name
done
cd pi_loger
python backup.py
cd
for pathfile in $files
do
  echo $pathfile
  name="${pathfile##*/}"
  echo $name
  ./dropbox_uploader.sh upload $pathfile /home/pi/projects/pi_loger/storage/$name
done