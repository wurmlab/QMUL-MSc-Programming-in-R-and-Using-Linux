#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

# clear and re-create the out directory
rm -rf out || exit 0;
mkdir out;

# RUN PANDOC and create HTML
for YEAR in */ ; do
  mkdir out/$YEAR

  # copy whatever is in public to `out` directory
  if [[ -n $(find $YEAR/public/ -type f -maxdepth 1) ]]; then
    cp $YEAR/public/* out/$YEAR/
  fi

  for i in *md; do
    if [[ $i != 'README.md' ]]; then
      pandoc -f markdown_github -c theme.css -s $i -o out/$YEAR/${i%%md}html;
    fi
  done
done

cd out

# Push contents of out to new gh-pages
git init

git config user.name "roddypr-travis"
git config user.email "rodrigopracana@gmail.com"
git remote add deploy "https://$GH_TOKEN@github.com/wurmlab/QMUL-MSc-Programming-in-R-and-Using-Linux.git"

git fetch deploy gh-pages
git reset deploy/gh-pages

git add -A .
git commit -m "build website at ${rev}"
git push deploy HEAD:gh-pages
