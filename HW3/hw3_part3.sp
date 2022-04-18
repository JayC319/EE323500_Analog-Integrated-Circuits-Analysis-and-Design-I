.protect
.lib 'cic018.l' TT 25
.unprotect
.option
+post
+captab
+ABSTOL=1E-7	RELTOL=1E-7	ACCURATE=1
.temp 25

*voltage
VSS	VSS	GND	0
VDD	VDD	VSS	1.8
Vb1	Vb1	VSS	1.1
Vb2	Vb2	VSS	1.16
Vin 	Vin	VSS	dc=0.4 ac=1

*current
I1	Vx	VSS	10u

*Resistor
RD	VDD	Vout	100k	

*MOSFET
MP1	Vx	Vb1	VDD	VDD	p_18	w=1.91u	l=1.91u	m=1
MN1	Vx	Vin	VSS	VSS	n_18	w=3.82u	l=1.91u	m=1
MN2	Vout	Vb2	Vx	GND	n_18	w=1.5u	l=0.35u	m=1



*simulation setup
.op
.tf V(Vout)Vin
.tf V(Vx) Vin
.ac dec 10 1 100G
.pz V(Vout) Vin
.PROBE Vdb(Vout) Vp(Vout)
.meas ac dcgain_in_db max Vdb(Vout)
.meas ac BW when Vdb(Vout) = 'dcgain_in_db-3'
.meas ac UGB when Vdb(Vout) = 0

.end
