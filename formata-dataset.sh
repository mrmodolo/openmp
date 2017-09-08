#!/bin/bash -
#===============================================================================
#
#          FILE: auxiliar.sh
#
#         USAGE: ./auxiliar.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Marcelo Rezende Módolo (Master), marcelo.rmodolo@gmail.com
#  ORGANIZATION: Linux and Open Source
#       CREATED: 08-09-2017 10:01:43
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

TMP="/tmp/~plot.dat"
printf "static\n" > ${TMP} 
sed -n 2,8p data/media-desvio-padrao.dat >> ${TMP}
printf "\n\ndynamic\n" >> ${TMP}
sed -n 9,15p data/media-desvio-padrao.dat >> ${TMP}
printf "\n\nguided\n" >> ${TMP}
sed -n 16,22p data/media-desvio-padrao.dat >> ${TMP}
printf "\n\nauto\n" >> ${TMP}
sed -n 23,29p data/media-desvio-padrao.dat >> ${TMP}
