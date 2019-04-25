#!/usr/bin/guplot

set terminal postscript eps enhanced color font 'Helvetica,10'

set output 'BPM-x.eps'

set xlabel 'BPM number'
set ylabel 'x'

#set yrange [0:1]
#set xrange [0:1]
#set grid
#set title 'title'

#set grid

plot 'B0-aver.dat' u 1 w lp title '0 loop'
