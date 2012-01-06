#!/bin/bash

./update_cache.sh
git commit index.html appcache.manifest appcache.manifest.src -m 'bump version'
git push
