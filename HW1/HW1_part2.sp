*AIC HW1_part2
.protect
.lib 'cic018.l' TT
.unprotect
.option
+ post
+ captab
+ ABSTOL=1e-17 RELTOL=1e-7 ACCURATE=1
.temp 25 

*VOLTAGE
VDD vdd gnd 1.8
VSS vss gnd 0
VG vg gnd 0

* MOSFET
.param length=2u
Midn vdd vg vss vss n_18 W=2*length L=length M=1
Midp vss vg vdd vdd p_18 W=2*length L=length M=1

*Simulation setup
.op
.dc vg 0 1.8 0.01 sweep length 2u 10u 2u
.PROBE CDO(Midn)
.PROBE CDO(Midp)

.end
