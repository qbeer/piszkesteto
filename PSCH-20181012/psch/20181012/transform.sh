#!/bin/bash
mkdir -p reg

FITS=.
ASTR=./astrom
REG=./reg

cat base.list | \
while read base dummy ; do

        fiign   $FITS/$base.fits --output - | \
        fitrans --input-transformation $ASTR/$base.dtrans \
                -c --reverse --output $REG/$base.fits

        echo "$base: done." >> /dev/stderr

done