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

NPROCS=$(grep '^physical id' /proc/cpuinfo  | sort -u | wc -l)
NCORES=$(grep '^processor' /proc/cpuinfo | sort -u | wc -l)
CORESPERPROC=$(($NCORES/$NPROCS))

INF=2
SUP=9999999
KIND=(static dynamic guided auto)
THREADS=(1 2 3 4 8)
TIME=/usr/bin/time
PROGRAMA="./exemplo01"
INF=2
SUP=9999999

clear
echo "COUNTER,SCHEDULE,THREADS,REAL,USER,SYS,CPU" > openmp.csv
for K in "${KIND[@]}"
do	
	export OMP_schedule=$K
	echo "OMP_schedule=$OMP_schedule"
	echo ""
	for I in $(seq 1 5)
	do
		for T in "${THREADS[@]}"
		do
			echo "OMP_NUM_THREADS=$T; $TIME $PROGRAMA $INF $SUP"
			if (( $T > $CORESPERPROC ))
			then
				echo "!!!!!!OVERSUBSCRIPTION!!!!!!"
			fi
			START=$(date +"%H:%M:%S")
			OUTPUT=$(export OMP_NUM_THREADS=$T; $TIME -f "$K,$T,%e,%U,%S,%P" ./exemplo01 $INF $SUP 2>&1 > /dev/null)
			END=$(date +"%H:%M:%S")
			echo $OUTPUT | tr ' ' ','
			echo $OUTPUT | tr ' ' ',' >> $PROGRAMA.csv
			echo "$START : $END"
			echo ""
		done
	done
done
