.protect
.lib 'cic018.l' TT 25
.unprotect
.option
+post
+captab
+ABSTOL=1E-7 RELTOL=1E-7 ACCURATE=1
.temp 25

*Voltage
VSS 	VSS 	GND  	0
VDD 	VDD 	VSS 	1.8
Vin 	Vin 	VSS 	0.9


*Resistor
RD   VDD	Vout    18.5k


*MOSFET
Ms  Vout    Vin	    VSS	    GND	    n_18	w=0.6u	l=0.3u	m=1



*simulation setup
.op
.tf V(Vout) Vin
.dc 	Vin	0	1.8	0.01
.PROBE	V(Vout)
.meas dc Vout_derivative FIND deriv('V(Vout)') WHEN V(Vin) = 0.9

.end
