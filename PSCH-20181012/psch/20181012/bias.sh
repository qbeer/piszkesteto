biaslist=`ls bias*.fits`
rbiaslist=`for i in $biaslist; do echo "r"$i;done`
ficalib -i $biaslist --saturation 46000 --gain 1.735 -o $rbiaslist
ficombine $rbiaslist --mode median -o mbias.fits