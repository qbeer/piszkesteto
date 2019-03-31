rflatlist=`ls domeflatr_00*.fits`
vflatlist=`ls domeflatv_00*.fits`

rrflatlist=`for i in $rflatlist;do echo "r"$i;done`
rvflatlist=`for i in $vflatlist;do echo "r"$i;done`

# R 40, V 60 - exptime
ficalib -i $rflatlist --input-master-bias mbias.fits --input-master-dark mdark40.fits --saturation 46000 --gain 1.735 --post-scale 20000 -o $rrflatlist
ficalib -i $vflatlist --input-master-bias mbias.fits --input-master-dark mdark60.fits --saturation 46000 --gain 1.735 --post-scale 20000 -o $rvflatlist

ficombine $rrflatlist --mode median -o rflat.fits
ficombine $rvflatlist --mode median -o vflat.fits
