#!/bin/bash

mkdir -p phot

FITS=./reg
ASTR=./astrom
PHOT=./phot

cat base.list | \
while read base dummy ; do

	fiphot  $FITS/$base.fits --input-list reg/comp.list --col-id 1 --col-xy 2,3 \
                --gain 1.735 --apertures 3:20:10,4:20:10,5:20:10,6:20:10,7:20:10,8:20:10 \
                --disjoint-annuli --disjoint-apertures \
		        --sky-fit median \
                --format IXY,MmFfBbs \
                --output $PHOT/$base.phot

	echo "$base: done." >> /dev/stderr

done