v 20130925 2
N 46800 47700 47200 47700 4
C 47200 47200 1 0 0 transistor-npn-2.sym
{
T 47800 47700 5 10 1 1 0 0 1
refdes=Q1
}
T 49300 46300 9 10 1 0 90 4 1
LOAD
C 43900 47700 1 90 0 resistor-2.sym
{
T 43600 47900 5 10 1 1 90 0 1
refdes=R1
}
C 46900 48000 1 90 0 resistor-2.sym
{
T 46600 48200 5 10 1 1 90 0 1
refdes=R1
}
C 47900 46000 1 90 0 resistor-2.sym
{
T 47600 46200 5 10 1 1 90 0 1
refdes=RE
}
N 47800 47200 47800 46900 4
N 47800 47000 49300 47000 4
N 49300 47000 49300 46700 4
C 47700 45400 1 0 0 net-gnd-1.sym
C 49200 45400 1 0 0 net-gnd-1.sym
C 46700 46000 1 0 0 net-gnd-1.sym
N 47800 45700 47800 46000 4
C 47000 46500 1 90 0 diode-zener-1.sym
{
T 46500 46800 5 10 1 1 90 0 1
refdes=D1
}
N 46800 46300 46800 46500 4
N 46800 48000 46800 47400 4
N 43800 47600 44900 47600 4
N 44900 47600 44900 47300 4
C 44800 46000 1 0 0 net-gnd-1.sym
C 43700 46000 1 0 0 net-gnd-1.sym
C 44000 46600 1 90 0 diode-zener-1.sym
{
T 43500 46900 5 10 1 1 90 0 1
refdes=D2
}
N 43800 46300 43800 46600 4
T 44900 46900 9 10 1 0 90 4 1
LOAD
N 43800 47700 43800 47500 4
N 44900 46500 44900 46300 4
N 49300 45900 49300 45700 4
C 47600 48200 1 0 0 net-pwr-1.sym
{
T 47800 48550 5 9 1 1 0 5 1
value=Vcc
}
C 46600 48900 1 0 0 net-pwr-1.sym
{
T 46800 49250 5 9 1 1 0 5 1
value=Vcc
}
C 43600 48600 1 0 0 net-pwr-1.sym
{
T 43800 48950 5 9 1 1 0 5 1
value=Vcc
}