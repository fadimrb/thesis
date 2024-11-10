* SR Latch using cross-coupled inverters
.include <tech_file>.lib  * Include transistor model file for your technology

* Define Power Supply
Vdd VDD 0 5V  * 5V power supply 

* Inverters for latch
M1 Q 1 VDD VDD PMOS L=0.18u W=0.5u
M2 Q 2 0 0 NMOS L=0.18u W=0.25u
M3 Qbar 2 VDD VDD PMOS L=0.18u W=0.5u
M4 Qbar 1 0 0 NMOS L=0.18u W=0.25u

* Connections for cross-coupling
R1 1 Qbar 1k  * Pull-up/pull-down resistors
R2 2 Q 1k

* Input signals (Set and Reset)
Vset Set 0 PULSE (0 5 0 1n 1n 10n 20n)
Vreset Reset 0 PULSE (0 5 10n 1n 1n 10n 20n)

* Drive latch nodes with Set and Reset
XN1 1 Set Q NMOS
XN2 2 Reset Qbar NMOS

* Simulation parameters
.control
  tran 0.1ns 100ns
  plot v(Q) v(Qbar)
.endc
.end
