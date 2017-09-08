# http://xmodulo.com/how-to-export-gnuplot-output-to-png-jpg-and-pdf.html
# http://web.archive.org/web/20100829220255/http://t16web.lanl.gov/Kawano/gnuplot/datafile2-e.html
# https://edg.uchicago.edu/tutorials/gnuplot/
# https://stackoverflow.com/questions/12328603/how-to-pass-command-line-argument-to-gnuplot
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
csv_file = "data/media-desvio-padrao.csv"
plot csv_file index 0 using 3:4 t "static", \
	csv_file index 1 using 3:4 t "dynamic", \
	csv_file index 2 using 3:4 t "guided", \
	csv_file index 3 using 3:4 t "auto"
