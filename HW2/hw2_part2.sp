.protect
.lib 'cic018.l' TT 25
.unprotect
.option
+post
+captab
+ABSTOL=1E-7 RELTOL = 1E-7 ACCURATE=1
.temp25

*voltage
VSS 	VSS 	GND 	0
VDD 	VDD 	VSS 	1.8
Vin 	Vin 	VSS 	0.2
VB	VB	VSS	0.85

*Resistor
RD	VDD  Vout	98.5k

*MOSFET

Mb   Vout   VB    Vin   GND	    n_18	w=0.9u	 l=0.4u	  m=1

*simulation setup
.op
.tf V(Vout) Vin
.dc vin 0 1.8 0.01
.PROBE V(Vout)
.meas dc vout_derivate	FIND	deriv('V(Vout)') WHEN	V(Vin) = 0.2

.end 	
