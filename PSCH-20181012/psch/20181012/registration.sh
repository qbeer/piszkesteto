#!/bin/bash
mkdir -p astrom

FITS=.
ASTR=./astrom
 
SHF=2

cat base.list | \
while read base dummy ; do

        if test 1 -lt $SHF ; then
                fitrans $FITS/$base.fits --shrink $SHF 
        else
                cat     $FITS/$base.fits 
        fi | \
        fistar  --input - \
                --flux-threshold 10000 --model elliptic \
                --format id,x,y,s,d,k,flux,mag \
                --output - | \
        awk -v s=$SHF \
         '{     print $1,$2*s,$3*s,$4,$5,$6,$7,$8;
         }' > $ASTR/$base.stars

        l=`cat $ASTR/$base.stars | wc -l`

        echo "$base: done [$l]." >> /dev/stderr

done