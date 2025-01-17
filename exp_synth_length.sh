Gs=('rmat2b' 'rmat8b')
Ns=('62499942' '249999941')
R=100000000
Rine='1e8'
Ls=('4' '8' '16' '32' '64' '128' '256' '512' '1024')

for gindex in $(seq 1 ${#Gs[@]}); do
  let "gindex = $gindex - 1"
  graph="${Gs[$gindex]}"
  N="${Ns[$gindex]}"
  for lindex in $(seq 1 ${#Ls[@]}); do
    let "lindex = $lindex - 1"
    echo "bin/apps/rawrandomwalks file Dataset/$graph.txt N $N R $R L ${Ls[$lindex]}"
    fname="$graph-$Rine-${Ls[$lindex]}.txt"
    echo "bin/apps/rawrandomwalks file Dataset/$graph.txt N $N R $R L ${Ls[$lindex]}" > $fname
    for cnt in $(seq 1 3); do
      sysctl -w vm.drop_caches=1
      sysctl -w vm.drop_caches=2
      sysctl -w vm.drop_caches=3
      `LOG_LEVEL="debug" bin/apps/rawrandomwalks file Dataset/$graph.txt N $N R $R L ${Ls[$lindex]} >> $fname`
      echo >> $fname
      echo >> $fname
    done
  done
done

