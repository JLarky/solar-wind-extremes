#!/bin/bash

cp appcache.manifest.src appcache.manifest

(echo
echo "CACHE:"
echo "#images"
find images/ -type f) >> appcache.manifest

(echo '2c'; echo \# `date; git log -1 --oneline;`; echo '.'; echo 'wq') | ed -s appcache.manifest

(echo '2c'; echo '<!-- last updated:' `date` '-->'; echo '.'; echo 'wq') | ed -s index.html
