.protect
.lib 'cic018.l' TT 25
.unprotect
.option
+post
+captab
+ABSTOL=1E-7 RELTOL=1E-7 ACCURATE=1
.temp 25

*Voltage
VSS	VSS	GND	0
VDD	VDD	VSS	1.8
Vb2	Vb2	VSS	1.16
Vin	Vin	VSS	DC=0.5




*Resistor
RD	VDD	Vout	100k



*MOSFET
MN2	Vout Vb2	Vin	GND	n_18	w=1.5u	l=0.35u	m=1

*simulation setup
.op
.tf V(Vout) Vin

.end
