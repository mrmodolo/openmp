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
OMP_NUM_THREADS=$(($NPROCS*$coresperproc))

clear

echo "OMP_NUM_THREADS=$OMP_NUM_THREADS"
echo ""

echo "1 Core: taskset --cpu-list 0 ./exemplo01 $INF $SUP"
time taskset --cpu-list 0 ./exemplo01 $INF $SUP

echo ""
echo "2 Cores: taskset --cpu-list 0,1 ./exemplo01 $INF $SUP"
time taskset --cpu-list 0,1 ./exemplo01 $INF $SUP

echo ""
echo "3 Cores: taskset --cpu-list 0,1,2 ./exemplo01 $INF $SUP"
time taskset --cpu-list 0,1,2 ./exemplo01 $INF $SUP

echo ""
echo "4 Cores: taskset --cpu-list 0,1,2,3 ./exemplo01 $INF $SUP"
time taskset --cpu-list 0,1,2,3 ./exemplo01 $INF $SUP

echo ""
