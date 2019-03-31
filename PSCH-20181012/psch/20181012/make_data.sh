fits=`ls rXX*$1.fits`
dates=`for i in $fits;do echo \`fiheader $i --get jD\`;done`

phot=`ls phot/*$1.phot`

target=`for i in $phot;do echo \`awk 'NR==1{print $39}' $i\`;done`
target_error=`for i in $phot;do echo \`awk 'NR==1{print $40}' $i\`;done`

comp1=`for i in $phot;do echo \`awk 'NR==2{print $39}' $i\`;done`
comp1_error=`for i in $phot;do echo \`awk 'NR==2{print $40}' $i\`;done`

comp2=`for i in $phot;do echo \`awk 'NR==3{print $39}' $i\`;done`
comp2_error=`for i in $phot;do echo \`awk 'NR==3{print $40}' $i\`;done`

comp3=`for i in $phot;do echo \`awk 'NR==4{print $39}' $i\`;done`
comp3_error=`for i in $phot;do echo \`awk 'NR==4{print $40}' $i\`;done`

comp4=`for i in $phot;do echo \`awk 'NR==5{print $39}' $i\`;done`
comp4_error=`for i in $phot;do echo \`awk 'NR==5{print $40}' $i\`;done`

comp5=`for i in $phot;do echo \`awk 'NR==6{print $39}' $i\`;done`
comp5_error=`for i in $phot;do echo \`awk 'NR==6{print $40}' $i\`;done`

comp6=`for i in $phot;do echo \`awk 'NR==7{print $39}' $i\`;done`
comp6_error=`for i in $phot;do echo \`awk 'NR==7{print $40}' $i\`;done`

dates=($dates)
target=($target)
target_error=($target_error)
comp1=($comp1)
comp1_error=($comp1_error)
comp2=($comp2)
comp2_error=($comp2_error)
comp3=($comp3)
comp3_error=($comp3_error)
comp4=($comp4)
comp4_error=($comp4_error)
comp5=($comp5)
comp5_error=($comp5_error)
comp6=($comp6)
comp6_error=($comp6_error)

for i in {0..118} 
do
    echo ${dates[$i]} ${target[$i]} ${target_error[$i]} ${comp1[$i]} ${comp1_error[$i]} ${comp2[$i]} ${comp2_error[$i]} ${comp3[$i]} ${comp3_error[$i]} ${comp4[$i]} ${comp4_error[$i]} ${comp5[$i]} ${comp5_error[$i]} ${comp6[$i]} ${comp6_error[$i]} >> data$1.dat
done