v 20130925 2
C 44600 46100 1 0 1 transistor-npn-1.sym
{
T 44600 46100 5 10 1 1 0 6 1
refdes=T1
}
C 45200 46100 1 0 0 transistor-npn-1.sym
{
T 45200 46100 5 10 1 1 0 0 1
refdes=T2
}
C 43900 45800 1 0 0 net-gnd-1.sym
C 45700 45800 1 0 0 net-gnd-1.sym
C 44100 47200 1 90 0 terminal-in_line.sym
{
T 43500 47510 5 10 0 0 90 0 1
footprint=CONNECTOR 1 1
T 43850 47750 5 10 1 1 90 6 1
refdes=in
}
C 45900 47200 1 90 0 terminal-in_line.sym
{
T 45300 47510 5 10 0 0 90 0 1
footprint=CONNECTOR 1 1
T 45650 47750 5 10 1 1 90 6 1
refdes=out
}
N 44000 47100 44000 47300 4
N 44000 47200 44900 47200 4
N 44900 47200 44900 46600 4
N 44600 46600 45200 46600 4
N 45800 47300 45800 47100 4
C 45900 47900 1 90 0 resistor-2.sym
{
T 46300 48400 5 10 1 1 180 0 1
refdes=RL
}
C 44100 47900 1 90 0 resistor-2.sym
{
T 44500 48400 5 10 1 1 180 0 1
refdes=R1
}
C 45600 48800 1 0 0 net-pwr-1.sym
{
T 45800 49150 5 9 1 1 0 5 1
value=Vcc
}
C 43800 48800 1 0 0 net-pwr-1.sym
{
T 44000 49150 5 9 1 1 0 5 1
value=Vcc
}