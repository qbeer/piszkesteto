biaslist=`ls cal*_bias.fit`
rbiaslist=`for i in $biaslist; do echo "r"$i;done`
ficalib -i $biaslist --saturation 65000 --gain 1.000 -o $rbiaslist
ficombine $rbiaslist --mode median -o mbias.fits