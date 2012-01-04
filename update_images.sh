#!/bin/bash

echo 123

# get list of images to download
IMAGES=`grep -o '\<img\(.*\)' index.html | grep -o 'src\([^\ ]*\)' | grep -o '\./images\([^\"]*\)'`


mkdir -p
for img in $IMAGES
do
	# make list of url from that
	url=`echo $img | sed -e 's/\.\/images\//https:\/\/github\.com\/JLarky\/solar-wind-extremes\/raw\//g'`
	# https://github.com/JLarky/solar-wind-extremes/raw/
	# https:\/\/github\.com\/JLarky\/solar-wind-extremes\/raw\/
	echo wget -c $url -O $img
	if true
	then
		mkdir -p `dirname $img`
		wget -c $url -O $img
	fi
done
