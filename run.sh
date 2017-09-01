#!/bin/bash -
#===============================================================================
#
#          FILE: run.sh
#
#         USAGE: ./run.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Marcelo Rezende Módolo (Master), marcelo.rmodolo@gmail.com
#  ORGANIZATION: Linux and Open Source
#       CREATED: 31-08-2017 09:15:57
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

INF=2
#SUP=9999999
SUP=1000000
NPROCS=1
nprocs=$(grep '^physical id' /proc/cpuinfo  | sort -u | wc -l)
ncores=$(grep '^processor' /proc/cpuinfo | sort -u | wc -l)
coresperproc=$(($ncores/$nprocs))
OMP_NUM_THREADS=$(($NPROCS*$coresperproc))
KIND=(static dynamic guided auto)

clear

for K in "${KIND[@]}"
do	
	export OMP_schedule=$K
	echo "OMP_schedule=$OMP_schedule"
	echo ""
	for T in $(seq 1 4)
	do
		echo "OMP_NUM_THREADS=$T"
		echo "OMP_NUM_THREADS=$T; time ./exemplo01 $INF $SUP"
		export OMP_NUM_THREADS=$T; time ./exemplo01 $INF $SUP
		echo ""
	done
done
