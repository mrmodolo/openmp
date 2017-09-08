# http://xmodulo.com/how-to-export-gnuplot-output-to-png-jpg-and-pdf.html
# http://web.archive.org/web/20100829220255/http://t16web.lanl.gov/Kawano/gnuplot/datafile2-e.html
# https://edg.uchicago.edu/tutorials/gnuplot/
# https://stackoverflow.com/questions/12328603/how-to-pass-command-line-argument-to-gnuplot
# COUNTER;SCHEDULE;THREADS;M_REAL;STD_REAL;M_USER;STD_USER;M_SYS;STD_SYS;M_CPU;STD_CPU;

set datafile separator ';'
set title 'Average execution time versus number of threads' font ',14'
set auto x
set xlabel 'threads' font ',10' 
set yrange [:30]
set ylabel 'Average run time (seconds)' font ',10' 
set style data histogram
set style histogram clustered
set style fill solid border -1
set boxwidth 0.9
set xtic rotate by -45 scale 0

set terminal png size 800,600 enhanced
set output 'media-desvio-padrao-histograma.png'
csv_file = "data/histograma.csv"

# Assume o arquivo com o seguinte formato
# THREADS;STATIC;DYNAMIC;GUIDED;AUTO
# 1;24.826;25.694;25.6;24.768
# 2;12.828;13.106;13.104;12.86
# 3;8.482;8.816;8.678;8.524
# 4;6.61;7.55;7.406;6.594
# 8;6.494;7.308;7.128;6.696
# 16;6.52;7.26;6.95;6.61
# 32;6.59;7.112;6.99;6.602

plot for [COL=2:5] csv_file using COL:xticlabels(1) title columnheader(COL)
