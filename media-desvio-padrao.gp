# http://xmodulo.com/how-to-export-gnuplot-output-to-png-jpg-and-pdf.html
# http://web.archive.org/web/20100829220255/http://t16web.lanl.gov/Kawano/gnuplot/datafile2-e.html
# https://edg.uchicago.edu/tutorials/gnuplot/
# https://stackoverflow.com/questions/12328603/how-to-pass-command-line-argument-to-gnuplot
# https://stackoverflow.com/questions/12818797/gnuplot-plotting-several-datasets-with-titles-from-one-file
# https://stackoverflow.com/questions/35785030/plot-multiple-datasets-from-one-file
# http://www.techrepublic.com/blog/linux-and-open-source/how-to-create-conditional-plotting-with-gnuplot/
# COUNTER;SCHEDULE;THREADS;M_REAL;STD_REAL;M_USER;STD_USER;M_SYS;STD_SYS;M_CPU;STD_CPU;

set datafile separator ';'
set style data lines

set title 'Average execution time versus number of threads' font ',14'

set xrange [1:32]
set xtics (1, 2, 3, 4, 8, 16, 32)
set xlabel 'threads' font ',10' 

set yrange [:30]
set ylabel 'Average run time (seconds)' font ',10' 

set terminal png size 800,600 enhanced
set output 'media-desvio-padrao.png'

dat_file = "/tmp/~plot.dat"

set key autotitle columnheader
stats dat_file using 0 nooutput
plot for [IDX=0:STATS_blocks-1] \
	dat_file \
	index IDX \
	using 3:4 \
	title columnheader(1)

