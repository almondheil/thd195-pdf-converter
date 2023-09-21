#!/bin/bash

# stolen from https://www.linuxjournal.com/content/converting-decimals-roman-numerals-bash
# I used the messier version because this is just quick and dirty
# and removed the spaces from the values while printing for my use case

decvalue=$1
romanvalue=

while [ $decvalue -gt 0 ] ; do

  if [ $decvalue -ge 1000 ] ; then
    romanvalue="${romanvalue}M"
    decvalue=$(( $decvalue - 1000 ))
  elif [ $decvalue -ge 900 ] ; then
    romanvalue="${romanvalue}CM"
    decvalue=$(( $decvalue - 900 ))
  elif [ $decvalue -ge 500 ] ; then
    romanvalue="${romanvalue}D"
    decvalue=$(( $decvalue - 500 ))
  elif [ $decvalue -ge 400 ] ; then
    romanvalue="${romanvalue}CD"
    decvalue=$(( $decvalue - 400 ))
  elif [ $decvalue -ge 100 ] ; then
    romanvalue="${romanvalue}C"
    decvalue=$(( $decvalue - 100 ))
  elif [ $decvalue -ge 90 ] ; then
    romanvalue="${romanvalue}XC"
    decvalue=$(( $decvalue - 90 ))
  elif [ $decvalue -ge 50 ] ; then
    romanvalue="${romanvalue}L"
    decvalue=$(( $decvalue - 50 ))
  elif [ $decvalue -ge 40 ] ; then
    romanvalue="${romanvalue}XL"
    decvalue=$(( $decvalue - 40 ))
  elif [ $decvalue -ge 10 ] ; then
    romanvalue="${romanvalue}X"
    decvalue=$(( $decvalue - 10 ))
  elif [ $decvalue -ge 9 ] ; then
    romanvalue="${romanvalue}IX"
    decvalue=$(( $decvalue - 9 ))
  elif [ $decvalue -ge 5 ] ; then
    romanvalue="${romanvalue}V"
    decvalue=$(( $decvalue - 5 ))
  elif [ $decvalue -ge 4 ] ; then
    romanvalue="${romanvalue}IV"
    decvalue=$(( $decvalue - 4 ))
  elif [ $decvalue -ge 1 ] ; then
    romanvalue="${romanvalue}I"
    decvalue=$(( $decvalue - 1 ))
  fi
done

echo $romanvalue
