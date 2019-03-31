d120list=`ls dark-120*.fits`
d30list=`ls dark-30*.fits`
d40list=`ls dark-40*.fits`
d60list=`ls dark-60*.fits`

rd120list=`for i in $d120list; do echo "r"$i;done`
rd30list=`for i in $d30list; do echo "r"$i;done`
rd40list=`for i in $d40list; do echo "r"$i;done`
rd60list=`for i in $d60list; do echo "r"$i;done`

ficalib -i $d120list --input-master-bias mbias.fits --saturation 46000 --gain 1.735 -o $rd120list
ficalib -i $d60list --input-master-bias mbias.fits --saturation 46000 --gain 1.735 -o $rd60list
ficalib -i $d40list --input-master-bias mbias.fits --saturation 46000 --gain 1.735 -o $rd40list
ficalib -i $d30list --input-master-bias mbias.fits --saturation 46000 --gain 1.735 -o $rd30list

ficombine $rd120list --mode median -o mdark120.fits
ficombine $rd60list --mode median -o mdark60.fits
ficombine $rd40list --mode median -o mdark40.fits
ficombine $rd30list --mode median -o mdark30.fits