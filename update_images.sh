#!/bin/bash

# get list of images to download
IMAGES=`grep -o '\<img\(.*\)' index.html | grep -o 'src\([^\ ]*\)' | grep -o '\./images\([^\"]*\)'`

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
		wget -q -c $url -O $img
		thmb_img=`echo $img | sed 's/\.png$/-thumb\.png/'`
		convert -resize 130 $img $thmb_img
	fi
done
