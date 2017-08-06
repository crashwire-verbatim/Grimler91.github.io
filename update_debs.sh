#!/bin/bash
echo Status: 200 Okay
echo Content-Type: text/plain
echo
echo Rebuilding APT repository:

{
  #-- settings
  export KEYNAME=9B4E7D27395024EA5A4FC6395AAAC9E0A46BE53C
  cd files

  for folder in dists/testing/{texlive,x,misc,clisp}/{binary-arm,binary-all}; do
    if [ -d "$folder" ]; then
      apt-ftparchive packages $folder > $folder/Packages
      bzip2 -kf $folder/Packages
    fi
  done

  #-- signed Release file
  apt-ftparchive -c ../testing.conf release dists/testing/ > dists/testing/Release
  gpg2 --yes -abs -u $KEYNAME -o dists/testing/Release.gpg dists/testing/Release
  gpg2 --yes --clearsign -u $KEYNAME -o dists/testing/InRelease dists/testing/Release
  cd ..
} 2>&1
