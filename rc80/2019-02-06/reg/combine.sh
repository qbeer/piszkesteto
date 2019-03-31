rlist=`ls *r.fits`
glist=`ls *g.fits`
blist=`ls *B.fits`

ficombine $rlist --mode median -o masterR.fits
ficombine $glist --mode median -o masterG.fits
ficombine $blist --mode median -o masterB.fits