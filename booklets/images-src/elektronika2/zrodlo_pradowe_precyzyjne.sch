v 20130925 2
N 47800 47200 47800 46500 4
N 47800 46600 45500 46600 4
N 45500 46600 45500 47500 4
N 45600 47900 45100 47900 4
N 47000 47700 47200 47700 4
C 47900 45600 1 90 0 resistor-2.sym
{
T 47600 45800 5 10 1 1 90 0 1
refdes=R1
}
C 47200 47200 1 0 0 transistor-npn-2.sym
{
T 47800 47700 5 10 1 1 0 0 1
refdes=Q1
}
C 47700 45200 1 0 0 net-gnd-1.sym
N 47800 45500 47800 45600 4
N 47800 48200 47800 48400 4
N 47800 49300 47800 49200 4
T 47800 48800 9 10 1 0 90 4 1
LOAD
C 45500 47000 1 0 0 operational_amplifier-1.sym
{
T 45675 48250 5 10 1 1 0 0 1
refdes=U?
}
N 45500 47500 45600 47500 4
C 45100 47700 1 90 0 net-pwr-2.sym
{
T 44750 47900 5 9 1 1 90 3 1
value=Vref
}
C 46500 47100 1 180 0 net-pwr-1.sym
{
T 46300 46750 5 9 1 1 180 5 1
value=-12V
}
C 47600 49300 1 0 0 net-pwr-1.sym
{
T 47800 49650 5 9 1 1 0 5 1
value=+12V
}
C 46100 48300 1 0 0 net-pwr-1.sym
{
T 46300 48650 5 9 1 1 0 5 1
value=+12V
}
