#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Must provide a filename (the slideshow as a pdf)"
  exit 1;
fi

slideshow=$1

rm -rf upload
mkdir -p upload

echo "Converting slides to PNGs..."

pdftoppm -png "$slideshow" upload/slide

echo "Done! Renaming PNGs with roman numerals..."

i=1
for img in upload/*; do
  # Prepare pretty versions in roman and zero-padded
  roman=$(./2roman.sh $i)
  i_padded=
  if (( i < 10 )); then
    i_padded="0$i"
  else
    i_padded=$i
  fi

  newname="upload/${i_padded}-Slide-${roman}.png"
  mv "$img" "$newname"

  # Increment i
  i=$((i + 1))
done

echo "Done. Files should be ready to upload."
