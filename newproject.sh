#!/bin/bash

set -o errexit

if [[ -z "$1" ]]; then
  echo "usage: $0 <slug>"
  exit 1
fi

export IMG_DIR="static/project/$1"
export FEATURED_IMG=$IMG_DIR/_featured.png
export FEATURED_THUMB_IMG=$IMG_DIR/_featured_thumb.png
export MARKDOWN="content/project/$1.md"

hugo new project/$1.md
mkdir -p $IMG_DIR
cp archetypes/placeholder-1500x750.png $FEATURED_IMG
cp archetypes/placeholder-1500x750.png $FEATURED_THUMB_IMG

echo "Success! Edit your project metadata at $MARKDOWN."
echo "Also, overwrite $FEATURED_IMG with a featured image, "
echo "and $FEATURED_THUMB_IMG with a thumbnail of it."
