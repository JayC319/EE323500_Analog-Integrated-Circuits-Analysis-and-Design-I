.protect
.lib 'cic018.l' TT 25
.unprotect
.option
+post
+captab
+ABSTOL=1E-7	RELTOL=1E-7	ACCURATE=1
.temp 25


*Voltage source
VSS	VSS	GND	0
V1	V1	VSS	2
V2	V2	VSS	2


*Resistor
R1	V1	Vx	20k
R2	V2	Vx	12k
RF	Vx	Vout	60.5k

*E_element

E_opamp	Vout	VSS	VSS	Vx	1000

*simulation setup
***
.op

.dc V1 0 5 0.1
.probe V(Vout)
.probe dc Vout_V2_fixed = par('V(VSS) - V(Vout)')
.meas Slope1	FIND	deriv('V(Vout)') WHEN	V(V1) = 2.5

***
.alter 'fixed_V1_2V'

V1	V1	VSS	2
.dc V2 0 5 0.1
.probe V(Vout)
.probe dc Vout_V1_fixed = part('V(VSS) - V(Vout)')
.meas Slope2	FIND	deriv('V(Vout)') WHEN	V(V2) = 2.5 

.end

