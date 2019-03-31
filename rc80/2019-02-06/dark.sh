d10list=`ls cal*_10.fit`
d40list=`ls cal*_40.fit`
d60list=`ls cal*_60.fit`
d120list=`ls cal*_120.fit`
d180list=`ls cal*_180.fit`
d300list=`ls cal*_300.fit`

rd120list=`for i in $d120list; do echo "r"$i;done`
rd10list=`for i in $d10list; do echo "r"$i;done`
rd40list=`for i in $d40list; do echo "r"$i;done`
rd60list=`for i in $d60list; do echo "r"$i;done`
rd120list=`for i in $d120list; do echo "r"$i;done`
rd180list=`for i in $d180list; do echo "r"$i;done`
rd300list=`for i in $d300list; do echo "r"$i;done`

ficalib -i $d120list --input-master-bias mbias.fits --saturation 65000 --gain 1.000 -o $rd120list
ficalib -i $d60list --input-master-bias mbias.fits --saturation 65000 --gain 1.000 -o $rd60list
ficalib -i $d40list --input-master-bias mbias.fits --saturation 65000 --gain 1.000 -o $rd40list
ficalib -i $d10list --input-master-bias mbias.fits --saturation 65000 --gain 1.000 -o $rd10list
ficalib -i $d300list --input-master-bias mbias.fits --saturation 65000 --gain 1.000 -o $rd300list
ficalib -i $d180list --input-master-bias mbias.fits --saturation 65000 --gain 1.000 -o $rd180list

ficombine $rd120list --mode median -o mdark120.fits
ficombine $rd60list --mode median -o mdark60.fits
ficombine $rd40list --mode median -o mdark40.fits
ficombine $rd10list --mode median -o mdark10.fits
ficombine $rd180list --mode median -o mdark180.fits
ficombine $rd300list --mode median -o mdark300.fits