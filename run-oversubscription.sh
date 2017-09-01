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
SUP=9999999
NPROCS=1
nprocs=$(grep '^physical id' /proc/cpuinfo  | sort -u | wc -l)
ncores=$(grep '^processor' /proc/cpuinfo | sort -u | wc -l)
coresperproc=$(($ncores/$nprocs))
MAX_THREADS=$(($NPROCS*$coresperproc))

clear

export OMP_NUM_THREADS=$((1*8))
echo "OMP_NUM_THREADS=$OMP_NUM_THREADS ./exemplo01 $INF $SUP"
time ./exemplo01 $INF $SUP

echo ""
export OMP_NUM_THREADS=$((2*8))
echo "OMP_NUM_THREADS=$OMP_NUM_THREADS ./exemplo01 $INF $SUP"
time ./exemplo01 $INF $SUP

echo ""
export OMP_NUM_THREADS=$((3*8))
echo "OMP_NUM_THREADS=$OMP_NUM_THREADS ./exemplo01 $INF $SUP"
time ./exemplo01 $INF $SUP

echo ""
export OMP_NUM_THREADS=$((4*8))
echo "OMP_NUM_THREADS=$OMP_NUM_THREADS ./exemplo01 $INF $SUP"
time ./exemplo01 $INF $SUP

echo ""
