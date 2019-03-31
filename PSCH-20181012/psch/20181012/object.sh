objectr=`ls XX_Cyg*R.fits`
objectv=`ls XX_Cyg*V.fits`

robjectr=`for i in $objectr;do echo "r"$i;done`
robjectv=`for i in $objectv;do echo "r"$i;done`

ficalib -i $objectr --input-master-bias mbias.fits --input-master-dark mdark30.fits --input-master-flat rflat.fits --saturation 46000 --gain 1.735 --horizontal-stripe-removal --image 1250:1250:2750:2750 --trim -o $robjectr
ficalib -i $objectv --input-master-bias mbias.fits --input-master-dark mdark30.fits --input-master-flat vflat.fits --saturation 46000 --gain 1.735 --horizontal-stripe-removal --image 1250:1250:2750:2750 --trim -o $robjectv
