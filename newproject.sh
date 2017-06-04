#!/bin/bash

set -o errexit

if [[ -z "$1" ]]; then
  echo "usage: $0 <slug>"
  exit 1
fi

export IMG_DIR="static/img/project/$1"
export FEATURED_IMG=$IMG_DIR/_featured.png
export MARKDOWN="content/project/$1.md"

hugo new project/$1.md
mkdir -p $IMG_DIR
cp static/img/placeholder-1500x750.png $FEATURED_IMG

echo "Success! Edit your project metadata at $MARKDOWN."
echo "Also, overwrite $FEATURED_IMG with a featured image."
