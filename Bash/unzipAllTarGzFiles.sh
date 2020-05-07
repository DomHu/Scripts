#! /bin/bash


##now we get a list of all .tar.gz files and call eps as many times as required
FILESeps="*.tar.gz"
for f in $FILESeps; do tar -xzf $f; done


