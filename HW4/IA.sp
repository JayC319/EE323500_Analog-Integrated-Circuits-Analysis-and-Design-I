.protect
.lib 'cic018.l' TT 25
.unprotect
.option
+post
+captab
+ABSTOL=1E-7 RELTOL=1E-7 ACCURATE=1
.temp 25


*voltage
VSS	VSS	GND	0
Vin	Vin	VSS	0


*E_element
E_opamp	Vout	VSS	VSS	Vin- 1000


*Resistor
R2	Vin	Vin-	4k
R1	Vin-	Vout	81.8k


*simulation setup
.op
.dc Vin 0 5 0.1
.meas vout_derivative FIND deriv('V(Vout)') WHEN V(Vin) = 2.5
.tf V(Vout) Vin

.end


 
