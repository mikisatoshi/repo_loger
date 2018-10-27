#!/bin/bash
ls
cd pi_loger
python loger.py
cd
files="/home/pi/repo_loger/storage/photo/*"
for pathfile in $files
do
  echo $pathfile
  name="${pathfile##*/}"
  echo $name
  ./dropbox_uploader.sh upload $pathfile /home/pi/projects/pi_loger/photo/$name
  rm $pathfile
done
