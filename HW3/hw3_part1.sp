.protect
.lib 'cic018.l' TT 25
.unprotect
.option
+post
+captab
+ABSTOL=1E-7 RELTOL=1E-7 ACCURATE=1
+measform=3
+measfile=1


*Voltage
VSS	VSS	GND	0
VDD	VDD	VSS	1.8
Vb1	Vb1	VSS	1.1
Vin	Vin	VSS	0.4


*MOSFET
MP1	Vout	Vb1	VDD	VDD	p_18	w=1.91u	l=1.91u	m=1
MN1	Vout	Vin	VSS	VSS	n_18	w=3.82u	l=1.91u	m=1



*simulation setup
.op
.tf V(Vout) Vin
.end
