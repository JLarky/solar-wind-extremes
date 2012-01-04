#!/bin/bash

cp cache.manifest.src cache.manifest

(echo
echo "CACHE:"
echo "#images"
find images/ -type f) >> cache.manifest

(echo '2c'; echo \# `date; git log -1 --oneline;`; echo '.'; echo 'wq') | ed -s cache.manifest
