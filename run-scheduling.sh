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

clear

export OMP_schedule=static

for T in $(seq 1 4)
do
	echo "OMP_NUM_THREADS=$T"
	export OMP_NUM_THREADS=$T ; time ./exemplo01 $INF $SUP
	echo ""
done
