#!/bin/bash

echo Builds the addon for release
echo Copying source code to dist folder ...

mkdir -pv dist
cp -r ./popup_wikipedia ./dist/popup_wikipedia
rsync -av --exclude='__pycache__' \
      --exclude='logs' --exclude="*.pickle" \
      --exclude="*.pyc" --exclude="*.sqlite" \
      ./popup_wikipedia ./dist/popup_wikipedia
cd ./dist/popup_wikipedia && zip -r "../popup_wikipedia.zip" .
echo Build complete!
