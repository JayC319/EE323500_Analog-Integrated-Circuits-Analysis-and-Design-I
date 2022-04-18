.protect
.lib 'cic018.l' TT 25
.unprotect
.option
+post
+captab
+ABSTOL=1E-7 RELTOL=1E-7 ACCURATE=1
.temp 25


*Voltage Source
VSS	VSS	GND	0
Vin	Vin	VSS     1

*E_element

E_opamp	Vout	GND	Vin	Vin2	1000


*Resistor
R1	Vout	Vin2	38.8K

R2	Vin2	VSS	2K


.op
.tf V(Vout) Vin
.dc Vin	0	5	0.1 
.probe V(Vout)
.meas dc vout_derivative FIND 	deriv('V(Vout)') WHEN V(Vin) = 2.5


.end
