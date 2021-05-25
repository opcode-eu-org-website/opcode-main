#!/usr/bin/gnuplot -p

set terminal svg
set output "mosfet_wykres.svg"


# zakres nasycenia
pradDrenuSat(vds, vsat) = vsat*vsat;

# zakres omowy
pradDrenuOhm(vds, vsat) = 2*vsat*vds-vds*vds

# wybór zakresu
pradDrenuX(vds, vsat) = (vds < vsat) ? pradDrenuOhm(vds, vsat) : pradDrenuSat(vds, vsat)

# założenie vsat = vgs - vgsth
pradDrenu(vds, vgs, vgsth) = pradDrenuX(vds*2.0, vgs - vgsth)

set title "zbiór charakterystyk I_D(U_{DS}) dla różnych wartości U_{GS}   (przykład przy U_{GS (th)} = 2V)"
set xlabel "U_{DS}"
set ylabel "I_D"
set yrange [-4:20]
set key off

do for [a=1:4] {
	set label a sprintf("U_{GS} = %d",2+a) at 3, pradDrenu(7, 2+a, 2)+1.2 tc ls a
}

set label 10 "U_{DS} < U_{GS} - U_{GS (th)}\n(obszar liniowy / omowy)" at 0.75, 16.7 center tc 'red'
set label 11 "U_{DS} > U_{GS} - U_{GS (th)}\n(obszar nasycenia)" at 2.45, 13 center tc 'red'

set label 12 "U_{GS} = 2" at 3, -1.1 tc 'red'
set label 13 "U_{GS} < U_{GS (th)} → tranzystor nie przewodzi" at 1.75, -1.5 center  tc 'red'

set multiplot
plot [0 : 3.5] \
	for [a=1:4] pradDrenu(x, 2+a, 2), \
	pradDrenu(x, 2, 2) lc 'red' lw 2, \
	x*x*4 lc 'red' lw 2 dashtype 2

