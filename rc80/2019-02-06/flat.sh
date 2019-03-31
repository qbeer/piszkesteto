rflatlist=`ls *_flatr.fit`
gflatlist=`ls *_flatg.fit`
bflatlist=`ls *_flatB.fit`

rrflatlist=`for i in $rflatlist;do echo "r"$i;done`
rgflatlist=`for i in $gflatlist;do echo "r"$i;done`
rbflatlist=`for i in $bflatlist;do echo "r"$i;done`

# r 40, g 120, B 60 - exptime
ficalib -i $rflatlist --input-master-bias mbias.fits --input-master-dark mdark40.fits --saturation 65000 --gain 1.000 --post-scale 20000 -o $rrflatlist
ficalib -i $gflatlist --input-master-bias mbias.fits --input-master-dark mdark120.fits --saturation 65000 --gain 1.000 --post-scale 20000 -o $rgflatlist
ficalib -i $bflatlist --input-master-bias mbias.fits --input-master-dark mdark60.fits --saturation 65000 --gain 1.000 --post-scale 20000 -o $rbflatlist

ficombine $rrflatlist --mode median -o rflat.fits
ficombine $rgflatlist --mode median -o gflat.fits
ficombine $rbflatlist --mode median -o bflat.fits
