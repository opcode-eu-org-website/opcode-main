v 20130925 2
C 63700 35800 1 0 0 resistor-2.sym
{
T 64100 36150 5 10 0 0 0 0 1
device=RESISTOR
T 63900 35600 5 10 1 1 0 0 1
refdes=R1
}
N 63500 35900 63700 35900 4
C 62000 36100 1 0 0 net-pwr-1.sym
{
T 62200 36450 5 9 1 1 0 5 1
value=+5V
}
N 62600 35900 62200 35900 4
N 62200 35900 62200 36100 4
C 64800 35700 1 0 0 capacitor-1.sym
{
T 65000 36400 5 10 0 0 0 0 1
device=CAPACITOR
T 64900 35600 5 10 1 1 0 0 1
refdes=C1
T 65000 36600 5 10 0 0 0 0 1
symversion=0.1
}
N 64800 35900 64600 35900 4
C 65800 34900 1 0 0 net-gnd-1.sym
{
T 66000 35100 5 5 0 1 180 6 1
value=GND
}
N 65700 35900 65900 35900 4
N 65900 35200 65900 36500 4
C 64800 36200 1 0 0 metter-voltage.sym
N 64800 36500 64700 36500 4
N 64700 36500 64700 35900 4
N 65800 36500 65900 36500 4
C 63700 35200 1 0 0 resistor-2.sym
{
T 64100 35550 5 10 0 0 0 0 1
device=RESISTOR
T 63900 35000 5 10 1 1 0 0 1
refdes=R2
}
N 64600 35300 65900 35300 4
N 63700 35300 63600 35300 4
N 63600 35300 63600 35900 4
C 62100 35500 1 0 0 switch-push-NO.sym
{
T 62900 36200 5 10 1 1 0 0 1
refdes=S1
T 62500 37000 5 10 0 0 0 0 1
footprint=DIL2 4 300
}