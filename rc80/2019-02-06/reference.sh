#!/bin/bash

ASTR=./astrom

ref=M51-0001_B

cat base.list | \
while read base dummy ; do

        grmatch --reference $ASTR/$ref.stars --col-ref 2,3 --col-ref-ordering -8 \
                --input $ASTR/$base.stars --col-inp 2,3 --col-inp-ordering -8 \
                --max-distance 1 \
                --order 3 --triangulation auto,unitarity=0.01,maxref=1000,maxinp=1000 \
                --weight reference,column=8,magnitude,power=2 \
                --comment --output-transformation $ASTR/$base.dtrans

        echo "$base: done." >> /dev/stderr

done