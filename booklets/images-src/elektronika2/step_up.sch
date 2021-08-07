v 20130925 2
N 47000 47700 47200 47700 4
C 47200 47200 1 0 0 transistor-npn-2.sym
{
T 47800 47700 5 10 1 1 0 0 1
refdes=Q1
}
T 51500 47600 9 10 1 0 90 4 1
LOAD
N 51500 48400 51500 48000 4
C 51400 46700 1 0 0 net-gnd-1.sym
C 47700 46700 1 0 0 net-gnd-1.sym
N 47800 47000 47800 47200 4
C 47900 48600 1 90 0 coil-2.sym
{
T 47600 48800 5 10 1 1 90 0 1
refdes=L1
T 47200 48800 5 10 0 0 90 0 1
symversion=0.1
}
C 48200 48200 1 0 0 diode-generic-1.sym
{
T 48500 48700 5 10 1 1 0 0 1
refdes=D1
}
C 50400 47000 1 90 0 diode-zener-1.sym
{
T 49900 47300 5 10 1 1 90 0 1
refdes=D2
}
C 46100 47600 1 0 0 resistor-2.sym
{
T 46300 47900 5 10 1 1 0 0 1
refdes=R1
}
C 46100 48200 1 0 0 capacitor-1.sym
{
T 46300 48700 5 10 1 1 0 0 1
refdes=C1
T 46300 49100 5 10 0 0 0 0 1
symversion=0.1
}
C 49600 47000 1 90 0 capacitor-4.sym
{
T 49100 47200 5 10 1 1 90 0 1
refdes=C2
T 48700 47200 5 10 0 0 90 0 1
symversion=0.1
}
C 50300 48300 1 0 0 terminal-in_line.sym
{
T 50610 48900 5 10 0 0 0 0 1
footprint=CONNECTOR 1 1
T 50850 48550 5 10 1 1 0 6 1
refdes=T1
}
N 49100 48400 50400 48400 4
N 50200 47900 50200 48400 4
N 49400 47900 49400 48400 4
C 49300 46700 1 0 0 net-gnd-1.sym
C 50100 46700 1 0 0 net-gnd-1.sym
N 51000 48400 51500 48400 4
N 47800 48600 47800 48200 4
N 48200 48400 47800 48400 4
N 47000 48400 47100 48400 4
N 47100 48400 47100 47700 4
N 46100 48400 46000 48400 4
N 46000 48400 46000 47700 4
N 45700 47700 46100 47700 4
N 51500 47000 51500 47200 4
C 47600 49600 1 0 0 net-pwr-1.sym
{
T 47800 49950 5 9 1 1 0 5 1
value=Vcc
}
L 44500 47600 44600 47600 3 0 0 0 -1 -1
L 44600 47600 44600 47800 3 0 0 0 -1 -1
L 44600 47800 44700 47800 3 0 0 0 -1 -1
L 44700 47800 44700 47600 3 0 0 0 -1 -1
L 44700 47600 44800 47600 3 0 0 0 -1 -1
L 44800 47600 44800 47800 3 0 0 0 -1 -1
L 44800 47800 45000 47800 3 0 0 0 -1 -1
L 45000 47800 45000 47600 3 0 0 0 -1 -1
L 45000 47600 45100 47600 3 0 0 0 -1 -1
L 45100 47600 45100 47800 3 0 0 0 -1 -1
L 45100 47800 45200 47800 3 0 0 0 -1 -1
L 45200 47800 45200 47600 3 0 0 0 -1 -1
L 45200 47600 45400 47600 3 0 0 0 -1 -1
L 45400 47600 45400 47800 3 0 0 0 -1 -1
L 45400 47800 45500 47800 3 0 0 0 -1 -1
T 45200 47300 9 10 1 0 0 0 1
STER
