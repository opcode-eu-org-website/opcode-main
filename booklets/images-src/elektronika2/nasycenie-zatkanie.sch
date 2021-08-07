v 20130925 2
C 42200 47500 1 0 0 transistor-npn-2.sym
C 42900 48700 1 90 0 resistor-2.sym
{
T 42600 48900 5 10 1 1 90 0 1
refdes=RL
}
N 42800 48700 42800 48500 4
N 42800 49800 42800 49600 4
C 42700 47000 1 0 0 net-gnd-1.sym
N 42800 47300 42800 47500 4
C 40000 47400 1 0 0 net-gnd-1.sym
N 40300 48200 40100 48200 4
N 40100 48200 40100 48300 4
N 40300 47800 40100 47800 4
N 40100 47800 40100 47700 4
C 42200 48100 1 180 0 resistor-2.sym
{
T 42000 47800 5 10 1 1 180 0 1
refdes=RB
}
T 41200 49200 9 10 1 0 0 4 4
tranzystor NPN w stanie:
* nasycenia (S: 3-1)
* zatkania (S: 2-1)

C 46800 47400 1 90 0 resistor-2.sym
{
T 46500 47600 5 10 1 1 90 0 1
refdes=RL
}
N 46700 49700 46700 49500 4
C 46600 46900 1 0 0 net-gnd-1.sym
C 45200 48900 1 0 0 resistor-2.sym
{
T 45900 48800 5 10 1 1 180 0 1
refdes=RB
}
T 45100 47700 9 10 1 0 0 4 4
tranzystor PNP w stanie:
* nasycenia (S: 3-1)
* zatkania (S: 2-1)

C 46100 49500 1 180 1 transistor-pnp-2.sym
N 46700 48300 46700 48500 4
N 46700 47400 46700 47200 4
C 43900 48400 1 0 0 net-gnd-1.sym
N 44000 48700 44000 48800 4
N 44200 48800 44000 48800 4
N 44000 49300 44000 49200 4
N 44000 49200 44200 49200 4
T 44600 49800 9 10 1 0 0 0 1
Vster >= Vcc
N 41200 48000 41300 48000 4
N 45100 49000 45200 49000 4
C 46500 49700 1 0 0 net-pwr-1.sym
{
T 46700 50050 5 9 1 1 0 5 1
value=Vcc
}
C 42600 49800 1 0 0 net-pwr-1.sym
{
T 42800 50150 5 9 1 1 0 5 1
value=Vcc
}
C 43800 49300 1 0 0 net-pwr-2.sym
{
T 44000 49650 5 9 1 1 0 3 1
value=Vster
}
C 39900 48300 1 0 0 net-pwr-2.sym
{
T 40100 48650 5 9 1 1 0 3 1
value=Vster
}
C 41700 48600 1 180 0 switch-SPDT.sym
{
T 40900 48400 5 10 1 1 180 0 1
refdes=S
}
C 45600 48400 1 0 1 switch-SPDT.sym
{
T 44800 48600 5 10 1 1 0 6 1
refdes=S
}
