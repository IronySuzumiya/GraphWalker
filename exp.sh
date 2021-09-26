Gs=('soc-twitter-mpi-sws' 'soc-friendster') #web-ClueWeb09
Ns=('41652231' '65608366') #4780950910
Rs=('10000' '100000' '1000000' '10000000' '100000000' '1000000000')
Rsine=('1e4' '1e5' '1e6' '1e7' '1e8' '1e9')
L=6

for gindex in $(seq 1 ${#Gs[@]}); do
  let "gindex = $gindex - 1"
  graph="${Gs[$gindex]}"
  N="${Ns[$gindex]}"
  for rindex in $(seq 1 ${#Rs[@]}); do
    let "rindex = $rindex - 1"
    echo "bin/apps/rawrandomwalks file Dataset/$graph.txt N $N R ${Rs[$rindex]} L $L"
    fname="$graph-${Rsine[$rindex]}-$L.txt"
    echo "bin/apps/rawrandomwalks file Dataset/$graph.txt N $N R ${Rs[$rindex]} L $L" > $fname
    for cnt in $(seq 1 3); do
      sysctl -w vm.drop_caches=1
      sysctl -w vm.drop_caches=2
      sysctl -w vm.drop_caches=3
      `LOG_LEVEL="debug" bin/apps/rawrandomwalks file Dataset/$graph.txt N $N R ${Rs[$rindex]} L $L >> $fname`
      echo >> $fname
      echo >> $fname
    done
  done
done

