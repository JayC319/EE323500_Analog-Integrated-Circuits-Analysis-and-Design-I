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
Vin 	Vin	VSS	5


*Resistor
R1	Vin	Vx	98k

*E_element
E_opamp	Vout	GND	GND	Vx	1000

*MOSFET
M1	Vx	GND	Vout	GND	n_18	w=2u	l=1u  m=1

*simulation setup
.op	
.dc	Vin	0	5	0.1

.meas Vov1 FIND par ('V(VSS) - V(Vout) - LV9(M1)') WHEN V(Vin) = 1
.meas Vov2 FIND par ('V(VSS) - V(Vout) - LV9(M1)') WHEN V(Vin) = 2
.meas Vov3 FIND par ('V(VSS) - V(Vout) - LV9(M1)') WHEN V(Vin) = 3
.meas Vov4 FIND par ('V(VSS) - V(Vout) - LV9(M1)') WHEN V(Vin) = 4
.meas Vov5 FIND par ('V(VSS) - V(Vout) - LV9(M1)') WHEN V(Vin) = 5


.meas ID1 FIND CDO(M1) WHEN V(Vin) = 1
.meas ID2 FIND CDO(M1) WHEN V(Vin) = 2
.meas ID3 FIND CDO(M1) WHEN V(Vin) = 3
.meas ID4 FIND CDO(M1) WHEN V(Vin) = 4
.meas ID5 FIND CDO(M1) WHEN V(Vin) = 5


.probe Vov = par('V(VSS) - V(Vout) - LV9(M1)')




.end
