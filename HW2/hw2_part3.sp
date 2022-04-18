.protect
.lib 'cic018.l' TT 25
.unprotect
.option
+post
+captab
+ABSTOL = 1E-7 RELTOL=1E-7 ACCURATE=1
.temp 25

*Voltage

VSS	VSS	GND	0
VDD	VDD	VSS	1.8

Vin	Vin	VSS	1.6

*Resistor
RS	Vout	VSS	123k

*MOSFET

Md	VDD	Vin	Vout	GND	n_18	W=0.5u	L=0.25u	m=1

*simulation setup
.op
.tf V(Vout) Vin
.dc Vin 0 1.8 0.01
.PROBE V(Vout)
.PROBE deriv('V(Vout)')

.end
