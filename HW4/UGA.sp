.protect
.lib 'cic018.l' TT 25
.unprotect
.option
+post
+captab
+ABSTOL=1E-7 RELTOL=1E-7 ACCURATE=1
.temp 25

*E_element
E_opamp	Vout	VSS	Vin	Vout	1000

*voltage source
VSS	VSS	GND	0
Vin	Vin	VSS	5

.op
.dc	Vin	0	5	0.1
.tf	V(Vout)	Vin
.PROBE	V(Vout)
.meas	dc vout_derivative FIND deriv('V(Vout)') WHEN V(Vin)=2.5

.end
