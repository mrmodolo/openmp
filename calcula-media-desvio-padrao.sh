#!/bin/bash -
#===============================================================================
#
#          FILE: teste.sh
#
#         USAGE: ./teste.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Marcelo Rezende Módolo (Master), marcelo.rmodolo@gmail.com
#  ORGANIZATION: Linux and Open Source
#       CREATED: 07-09-2017 10:00:48
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

HEADER='COUNTER;SCHEDULE;THREADS;M_REAL;STD_REAL;M_USER;STD_USER;M_SYS;STD_SYS;M_CPU;STD_CPU;'
KIND=(static dynamic guided auto)
THREADS=(1 2 3 4 8 16 32)
ARQUIVO="exemplo01.csv"

gera_saida() {
	local FILTRO=$1
	local ARQUIVO=$2
	grep "${FILTRO}" "${ARQUIVO}" | tr -d '%'| awk -F',' \
	 '
	 {
	    dt_real = $4 - avg_real; avg_real += dt_real / NR; mean_real += dt_real * ($4 - avg_real);tot_real+=$4; count_real+=1;
	    dt_user = $5 - avg_user; avg_user += dt_user / NR; mean_user += dt_user * ($5 - avg_user);tot_user+=$5; count_user+=1;
	    dt_sys = $6 - avg_sys; avg_sys += dt_sys / NR; mean_sys += dt_sys * ($6 - avg_sys);tot_sys+=$6; count_sys+=1;
	    dt_cpu = $7 - avg_cpu; avg_cpu += dt_cpu / NR; mean_cpu += dt_cpu * ($7 - avg_cpu);tot_cpu+=$7; count_cpu+=1;    
	 } END  { 
	    printf "%s;%s;%s;%0.3f;%0.3f;%0.3f;%0.3f;%0.3f;%0.3f;%0.3f;%0.3f\n",$1,$2,$3,tot_real/count_real,sqrt(mean_real/NR),tot_user/count_user,sqrt(mean_user/NR),tot_sys/count_sys,sqrt(mean_sys/NR),tot_cpu/count_cpu,sqrt(mean_cpu/NR); 
	 }
	 '
}

echo $HEADER
for K in "${KIND[@]}"
do
	for T in "${THREADS[@]}"
	do
		FILTRO="$K,$T,"
		gera_saida "${FILTRO}" "${ARQUIVO}"
	done
done

exit 0

