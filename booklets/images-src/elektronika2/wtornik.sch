v 20130925 2
C 37200 47000 1 0 0 transistor-npn-1.sym
N 37800 48300 37800 48000 4
N 37000 47500 37200 47500 4
C 37700 46700 1 270 0 resistor-2.sym
{
T 37600 46300 5 10 1 1 180 0 1
refdes=Re
}
N 37800 45800 37800 45700 4
N 37800 46700 37800 47000 4
T 34900 45600 9 16 1 0 0 0 3
wtórnik z
sprzężeniem
stałoprądowym
N 37800 46800 38100 46800 4
C 34300 47300 1 0 0 voltage-1.sym
{
T 34200 47200 5 10 1 1 0 0 1
refdes=Uin
}
C 36300 47600 1 180 0 resistor-2.sym
{
T 36000 47800 5 10 1 1 180 0 1
refdes=Rg
}
N 35400 47500 35200 47500 4
N 34100 47500 34300 47500 4
C 34000 47000 1 0 0 net-gnd-1.sym
N 36300 47500 36400 47500 4
N 34100 47300 34100 47500 4
C 39800 46900 1 180 0 resistor-2.sym
{
T 39500 47100 5 10 1 1 180 0 1
refdes=RL
}
N 38700 46800 38900 46800 4
C 39900 46300 1 0 0 net-gnd-1.sym
N 39800 46800 40000 46800 4
N 40000 46600 40000 46800 4
C 38000 46700 1 0 0 terminal-in_line.sym
{
T 38310 47300 5 10 0 0 0 0 1
footprint=CONNECTOR 1 1
T 38550 46950 5 10 1 1 0 6 1
refdes=Tout
}
C 36300 47400 1 0 0 terminal-in_line.sym
{
T 36610 48000 5 10 0 0 0 0 1
footprint=CONNECTOR 1 1
T 36850 47650 5 10 1 1 0 6 1
refdes=Tin
}
C 37600 48300 1 0 0 net-pwr-1.sym
{
T 37800 48650 5 9 1 1 0 5 1
value=Vcc
}
C 38000 45700 1 180 0 net-pwr-1.sym
{
T 37800 45350 5 9 1 1 180 5 1
value=-Vcc
}
