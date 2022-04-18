.protect
.lib 'cic018.l' TT 25
.unprotect
.option
+post
+captab
+ABSTOL=1E-7 RELTOL=1E-7 ACCURATE=1
+Nomod
+DELMAX=1E-9
+measdgt=16
+numdgt=8
.temp 25


*Voltage Source
VSS	vss	gnd	0
VDD	vdd	gnd	1.5



Vin	vin	gnd	DC=0	AC=0
Ein_left	vin_left	vcm_in	vin	gnd	0.5
Ein_right	vin_right	vcm_in	vin	gnd	-0.5


**************************************************************************
*Basing voltage
Vcm_in vcm_in	gnd	0.5
Vx	vx	gnd	0.9
Vb2 vb2 gnd 0.7002046


*MOSFET

* tail current parameters
.param tail_width = 45u
.param tail_length =40u
.param tail_fold = 6


* PMOS parameters
.param PMOS_width  = 20u
.param PMOS_length = 10u
.param PMOS_fold   = 4

* NMOS parameters
.param NMOS_width  = 0.3u
.param NMOS_length = 1.81u
.param NMOS_fold   = 1
***************************************************************************


Mtail	vp		vx		vdd	vdd	p_18	W=tail_width	L=tail_length	m=tail_fold
M1	vout_right	vin_right	vp  	vdd  	p_18	W=PMOS_width 	L=PMOS_length	m=PMOS_fold
M2	vout_left	vin_left	vp	vdd	p_18	W=PMOS_width	L=PMOS_length	m=PMOS_fold
M3	vout_right	Vb2		vss	vss	n_18	W=NMOS_width	L=NMOS_length	m=NMOS_fold
M4	vout_left	Vb2		vss	vss	n_18	W=NMOS_width	L=NMOS_length	m=NMOS_fold







.op
*.dc Vb2 0 1.5	0.0001
.tf V(vout_left, vout_right) vin

.alter 'V = 1.425V'
VDD	vdd	gnd	1.425


.alter 'V = 1.575V'
VDD	vdd	gnd	1.575


.alter 'common mode'
VDD	vdd	gnd	1.5
*.dc Vb2 0.699 0.701	0.0001
.tf V(vout_left) vcm_in




.end
