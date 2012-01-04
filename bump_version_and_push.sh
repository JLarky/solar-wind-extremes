#!/bin/bash

./update_cache.sh
git commit cache.manifest cache.manifest.src -m 'bump cache.manifest version'
git push
