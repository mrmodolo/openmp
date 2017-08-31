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
SUP=1000000
CORES=4
export OMP_NUM_THREADS=$(echo "4*8" | bc)

clear

echo ""
echo "Normal: ./exemplo01 $INF $SUP"
time ./exemplo01 $INF $SUP

echo ""
echo "2 Cores: taskset 0x3 ./exemplo01 $INF $SUP"
time taskset 0x3 ./exemplo01 $INF $SUP

echo ""
echo "4 Cores: taskset 0xF ./exemplo01 $INF $SUP"
time taskset 0xF ./exemplo01 $INF $SUP

echo ""
