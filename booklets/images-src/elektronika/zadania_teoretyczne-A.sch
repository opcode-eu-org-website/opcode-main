v 20130925 2
C 57700 42400 1 0 0 diode-led-1.sym
{
T 57750 42800 5 10 1 1 0 0 1
refdes=D1
T 57700 42300 5 10 1 1 0 0 1
value=czerwona
}
C 56600 42500 1 0 0 resistor-2.sym
{
T 57000 42850 5 10 0 0 0 0 1
device=RESISTOR
T 56800 42800 5 10 1 1 0 0 1
refdes=R1
T 56700 42300 5 10 1 1 0 0 1
value=1k
}
C 58600 42200 1 0 0 net-gnd-1.sym
{
T 58800 42400 5 5 0 1 180 6 1
value=GND
}
C 56200 42700 1 0 0 net-pwr-1.sym
{
T 56400 43050 5 9 1 1 0 5 1
value=+5V
}
N 58600 42600 58700 42600 4
N 58700 42600 58700 42500 4
N 56600 42600 56400 42600 4
N 56400 42600 56400 42700 4
N 57700 42600 57500 42600 4
C 58600 40800 1 0 0 net-gnd-1.sym
{
T 58800 41000 5 5 0 1 180 6 1
value=GND
}
N 58600 41200 58700 41200 4
N 58700 41200 58700 41100 4
C 56600 41100 1 0 0 resistor-2.sym
{
T 57000 41450 5 10 0 0 0 0 1
device=RESISTOR
T 56800 41400 5 10 1 1 0 0 1
refdes=R2
T 56700 40900 5 10 1 1 0 0 1
value=1k
}
C 56200 41300 1 0 0 net-pwr-1.sym
{
T 56400 41650 5 9 1 1 0 5 1
value=+5V
}
N 56600 41200 56400 41200 4
N 56400 41200 56400 41300 4
N 57500 41200 57700 41200 4
C 57700 40300 1 90 0 terminal-end_line.sym
{
T 57475 40550 5 10 1 1 180 6 1
refdes=T1
T 56900 40410 5 10 0 0 90 0 1
footprint=CONNECTOR 1 1
}
N 57600 41000 57600 41200 4
C 59900 41600 1 90 0 resistor-2.sym
{
T 59550 42000 5 10 0 0 90 0 1
device=RESISTOR
T 59600 41800 5 10 1 1 90 0 1
refdes=R3
T 60100 41900 5 10 1 1 90 0 1
value=2k
}
C 59600 42600 1 0 0 net-pwr-1.sym
{
T 59800 42950 5 9 1 1 0 5 1
value=+5V
}
N 59800 42500 59800 42600 4
C 59900 40500 1 90 0 resistor-2.sym
{
T 59550 40900 5 10 0 0 90 0 1
device=RESISTOR
T 59600 40700 5 10 1 1 90 0 1
refdes=R4
T 60100 40800 5 10 1 1 90 0 1
value=3k
}
N 59800 41400 59800 41600 4
C 59700 40100 1 0 0 net-gnd-1.sym
{
T 59900 40300 5 5 0 1 180 6 1
value=GND
}
N 59800 40400 59800 40500 4
C 60700 41600 1 180 0 terminal-end_line.sym
{
T 60625 41450 5 10 1 1 0 6 1
refdes=T2
T 60590 40800 5 10 0 0 180 0 1
footprint=CONNECTOR 1 1
}
N 60000 41500 59800 41500 4
C 63500 42600 1 0 0 net-pwr-1.sym
{
T 63700 42950 5 9 1 1 0 5 1
value=+5V
}
N 63700 42500 63700 42600 4
C 63800 40500 1 90 0 resistor-2.sym
{
T 63450 40900 5 10 0 0 90 0 1
device=RESISTOR
T 63500 40700 5 10 1 1 90 0 1
refdes=R6
T 64000 40800 5 10 1 1 90 0 1
value=3k
}
N 63700 41400 63700 41600 4
C 63600 40100 1 0 0 net-gnd-1.sym
{
T 63800 40300 5 5 0 1 180 6 1
value=GND
}
N 63700 40400 63700 40500 4
C 64600 41600 1 180 0 terminal-end_line.sym
{
T 64490 40800 5 10 0 0 180 0 1
footprint=CONNECTOR 1 1
T 64525 41450 5 10 1 1 0 6 1
refdes=T4
}
N 63900 41500 63700 41500 4
C 61900 40500 1 90 0 diode-zener-1.sym
{
T 61425 40700 5 10 1 1 90 0 1
refdes=D2
T 61900 40700 5 10 1 1 0 0 1
value=3.3V
}
C 61800 41600 1 90 0 resistor-2.sym
{
T 61450 42000 5 10 0 0 90 0 1
device=RESISTOR
T 61500 41800 5 10 1 1 90 0 1
refdes=R5
T 62000 41900 5 10 1 1 90 0 1
value=2k
}
C 61500 42600 1 0 0 net-pwr-1.sym
{
T 61700 42950 5 9 1 1 0 5 1
value=+5V
}
N 61700 42500 61700 42600 4
N 61700 41400 61700 41600 4
C 61600 40100 1 0 0 net-gnd-1.sym
{
T 61800 40300 5 5 0 1 180 6 1
value=GND
}
N 61700 40400 61700 40500 4
C 62600 41600 1 180 0 terminal-end_line.sym
{
T 62490 40800 5 10 0 0 180 0 1
footprint=CONNECTOR 1 1
T 62525 41450 5 10 1 1 0 6 1
refdes=T3
}
N 61900 41500 61700 41500 4
C 63900 41600 1 90 0 diode-zener-1.sym
{
T 63425 41800 5 10 1 1 90 0 1
refdes=D3
T 63900 41800 5 10 1 1 0 0 1
value=13V
}
C 57200 40800 1 0 0 switch-push-NO.sym
{
T 57700 41500 5 10 1 1 0 0 1
refdes=S1
T 57600 42300 5 10 0 0 0 0 1
footprint=dip(4, step=200.00mil)
}