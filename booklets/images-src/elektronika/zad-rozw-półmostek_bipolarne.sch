v 20130925 2
C 42800 46000 1 0 0 net-gnd-1.sym
C 42700 48500 1 0 0 net-pwr-1.sym
{
T 42900 48850 5 9 1 1 0 5 1
value=Vcc
T 42950 48600 5 5 0 0 0 0 1
net=+12V:1
}
C 42300 48500 1 180 1 transistor-pnp-1.sym
C 42300 46300 1 0 0 transistor-npn-1.sym
N 42900 47500 42900 47300 4
N 42900 47400 43600 47400 4
T 43300 47500 9 10 1 0 0 0 1
wyjście
C 41300 47900 1 0 0 resistor-2.sym
{
T 41700 48250 5 10 0 0 0 0 1
device=RESISTOR
T 41500 48200 5 10 1 1 0 0 1
refdes=R1
}
C 41300 46700 1 0 0 resistor-2.sym
{
T 41700 47050 5 10 0 0 0 0 1
device=RESISTOR
T 41500 47000 5 10 1 1 0 0 1
refdes=R2
}
N 42200 46800 42300 46800 4
N 42200 48000 42300 48000 4
N 41300 48000 41000 48000 4
N 41000 46800 41300 46800 4
T 40100 48000 9 10 1 0 0 1 2
 wejście A
0V lub Vcc
T 40100 46800 9 10 1 0 0 1 2
 wejście B
0V lub Vcc
T 39700 44500 9 10 1 0 0 0 6
UWAGA:
nie wolno podawać 0V na wejście A, gdy na wejście B podajemy Vcc
(doprowadziłoby to do przewodzenia obu tranzystorów i zwarcia)

można natomiast podać Vcc na wejście A i 0V na wejście B,
wtedy uzyskamy stan "wysokiej impedancji" (odłączenia) wyjścia
C 48600 46000 1 0 0 net-gnd-1.sym
C 48500 48500 1 0 0 net-pwr-1.sym
{
T 48750 48600 5 5 0 0 0 0 1
net=+12V:1
T 48700 48850 5 9 1 1 0 5 1
value=Vcc
}
C 48100 48500 1 180 1 transistor-pnp-1.sym
C 48100 46300 1 0 0 transistor-npn-1.sym
N 48700 47500 48700 47300 4
N 48700 47400 49400 47400 4
C 47100 47900 1 0 0 resistor-2.sym
{
T 47500 48250 5 10 0 0 0 0 1
device=RESISTOR
T 47300 48200 5 10 1 1 0 0 1
refdes=R1
}
C 47100 46700 1 0 0 resistor-2.sym
{
T 47500 47050 5 10 0 0 0 0 1
device=RESISTOR
T 47300 47000 5 10 1 1 0 0 1
refdes=R2
}
N 48000 46800 48100 46800 4
N 48000 48000 48100 48000 4
N 47100 48000 47000 48000 4
N 47000 46800 47100 46800 4
T 49100 47500 9 10 1 0 0 0 1
wyjście
T 45800 47400 9 10 1 0 0 1 2
  wejście
0V lub Vcc
N 47000 48000 47000 46800 4
N 47000 47400 46600 47400 4
T 46300 44900 9 10 1 0 0 0 3
Jeżeli nie potrzebujemy możliwości
odłączenia wyjścia zarówno od Vcc jak i od GND
to wejścia możemy połączyć
