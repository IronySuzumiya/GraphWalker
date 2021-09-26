Gs=('web-ClueWeb09')
Ns=('4780950910')
#Rs=('10000' '100000' '1000000' '10000000' '100000000' '1000000000')
#Rsine=('1e4' '1e5' '1e6' '1e7' '1e8' '1e9')
L=6

for gindex in $(seq 1 ${#Gs[@]}); do
  let "gindex = $gindex - 1"
  graph="${Gs[$gindex]}"
  N="${Ns[$gindex]}"
  echo "bin/apps/rwdomination file Dataset/$graph.txt N $N L $L"
  fname="$graph-RWD-$L.txt"
  echo "bin/apps/rwdomination file Dataset/$graph.txt N $N L $L" > $fname
  for cnt in $(seq 1 3); do
    sysctl -w vm.drop_caches=1
    sysctl -w vm.drop_caches=2
    sysctl -w vm.drop_caches=3
    `LOG_LEVEL="debug" bin/apps/rwdomination file Dataset/$graph.txt N $N L $L >> $fname`
    echo >> $fname
    echo >> $fname
  done
done

