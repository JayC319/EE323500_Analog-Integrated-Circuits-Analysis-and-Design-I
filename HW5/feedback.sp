.protect
.lib 'cic018.l' TT
.unprotect
.option
+post
+captab
+ABSTOL=1E-7	RELTOL=1E-7	ACCURATE=1
.temp 25



*Voltage Source
VSS	VSS	GND	0
VDD	VDD	VSS	1.8


*MOSFET

**********************************************
* The changable parameters are the W/L ratio *
**********************************************

MP	Vout	Vg	VDD	VDD	p_18	W=86u	L=0.7u m=18
MN	Vout	Vg	VSS	VSS	n_18	W=29u 	L=1.3u m=18

*Resistor
RF	Vg	Vout	1k
RS	Vg	VSS	50K

*Capacitor
CL	Vout	GND	1p

*Current Source

************************
* changable parameters *
************************
.param current = 50u
Iin VSS Vg	DC=current AC=1

 

.op
*.dc current 0 200u 5u
.tf V(Vout) Iin
.ac dec 10 1 100G
.pz V(Vout) Iin
.probe vdb(Vout) vp(Vout)
.meas ac dcgain_in_db find Vdb(Vout) at 1
.meas ac BW when Vdb(Vout) ='dcgain_in_db-3'
.meas ac UGB when Vdb(Vout) = 0
.probe  gain = par('V(Vout) / I(Iin)')
.end

