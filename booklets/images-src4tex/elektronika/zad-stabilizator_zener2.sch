v 20130925 2
N 30300 53200 30900 53200 4
C 32200 51900 1 0 0 net-gnd-1.sym
C 31300 54200 1 0 0 net-pwr-1.sym
{
T 31500 54550 5 9 1 1 0 5 1
value=12V
}
C 30400 53300 1 90 0 resistor-2.sym
{
T 30200 53500 5 10 1 1 90 0 1
refdes=R1
}
N 30300 53300 30300 53100 4
C 30100 54200 1 0 0 net-pwr-1.sym
{
T 30300 54550 5 9 1 1 0 5 1
value=12V
}
C 30200 51900 1 0 0 net-gnd-1.sym
C 30500 52200 1 90 0 diode-zener-1.sym
{
T 30125 52400 5 10 1 1 90 0 1
refdes=Z1
}
N 31500 54200 31500 53700 4
C 32800 52800 1 180 0 resistor-variable-2.sym
{
T 32550 53000 5 10 1 1 180 0 1
refdes=R2
T 32000 51900 5 10 0 1 180 0 1
device=VARIABLE_RESISTOR
}
N 31500 52700 31900 52700 4
C 30900 52700 1 0 0 transistor-npn-1.sym
{
T 31250 53450 5 10 1 1 0 6 1
refdes=NPN
}
