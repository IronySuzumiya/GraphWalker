sysctl -w vm.drop_caches=1
sysctl -w vm.drop_caches=2
sysctl -w vm.drop_caches=3
bin/apps/rawrandomwalks file Dataset/web-ClueWeb09.txt N 4780950910 R 10000 L 6 >> DRAM8GB-web-ClueWeb09-1e4-6.txt
sysctl -w vm.drop_caches=1
sysctl -w vm.drop_caches=2
sysctl -w vm.drop_caches=3
bin/apps/rawrandomwalks file Dataset/web-ClueWeb09.txt N 4780950910 R 100000 L 6 >> DRAM8GB-web-ClueWeb09-1e5-6.txt
sysctl -w vm.drop_caches=1
sysctl -w vm.drop_caches=2
sysctl -w vm.drop_caches=3
bin/apps/rawrandomwalks file Dataset/web-ClueWeb09.txt N 4780950910 R 1000000 L 6 >> DRAM8GB-web-ClueWeb09-1e6-6.txt
sysctl -w vm.drop_caches=1
sysctl -w vm.drop_caches=2
sysctl -w vm.drop_caches=3
bin/apps/rawrandomwalks file Dataset/web-ClueWeb09.txt N 4780950910 R 10000000 L 6 >> DRAM8GB-web-ClueWeb09-1e7-6.txt
sysctl -w vm.drop_caches=1
sysctl -w vm.drop_caches=2
sysctl -w vm.drop_caches=3
bin/apps/rawrandomwalks file Dataset/web-ClueWeb09.txt N 4780950910 R 100000000 L 6 >> DRAM8GB-web-ClueWeb09-1e8-6.txt
sysctl -w vm.drop_caches=1
sysctl -w vm.drop_caches=2
sysctl -w vm.drop_caches=3
bin/apps/rawrandomwalks file Dataset/web-ClueWeb09.txt N 4780950910 R 1000000000 L 6 >> DRAM8GB-web-ClueWeb09-1e9-6.txt
sysctl -w vm.drop_caches=1
sysctl -w vm.drop_caches=2
sysctl -w vm.drop_caches=3

