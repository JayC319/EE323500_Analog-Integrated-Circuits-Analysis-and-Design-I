.protect
.lib 'cic018.l' TT 25
.unprotect
.option
+post
+captab
+ABSTOL=1E-7 RELTOL=1E-7 ACCURATE=1
+Nomod
+DELMAX=1E-9
.temp 25



* VOLTAGE SOURCE

*.param AC_increment = 0.5
*.param DC_diff = 0
VSS	VSS	GND	0
VDD	VDD	GND	1.8
*Vin1	Vin1 	VBS	DC='DC_diff*0.5'	AC=AC_increment	0
*Vin2	Vin2	VBS	DC='DC_diff*-0.5'	AC=AC_increment	180
Vin	Vin	gnd	DC=0	AC=1
Ein1	Vin1	VBS	Vin	gnd	0.5
Ein2	Vin2	VBS	Vin	gnd	-0.5



** Bias gate voltage *******
.param gate_bias=0.525
VBS	VBS	GND	gate_bias
VBS1	VBS1	GND	0.521




*Capacitor 
CL1	Vout1	VSS	2p
CL2	Vout2	VSS	2p

*MOSFET
.param MR_width =  2u
.param MR_length = 0.4u
.param Mx_width = 95u
.param Mx_length = 0.5u
.param Ms_width = 93u
.param Ms_length =0.18u


** 1 stands for left, 2 stands for right
.param NMOS_Fold = 1

MR1	Vout1	Vout1	VDD	VDD	p_18	W=MR_width	L=MR_length	m=1
MR2	Vout2	Vout2	VDD	VDD	p_18	W=MR_width	L=MR_length	m=1
Mx1	Vout1	Vin1	Vx	VSS	n_18	W=Mx_width	L=Mx_length	m=1
Mx2	Vout2	Vin2	Vx	VSS	n_18	W=Mx_width	L=Mx_length	m=1
Ms	Vx	VBS1	VSS	VSS	n_18	W=Ms_width 	L=Ms_length	m=1



*.param Vin_diff = V(Vin1,Vin2)
.op
.tf V(Vout1, Vout2) Vin
.dc Vin -1.8 1.8 0.01
*.meas dc Vdiff_derivative FIND deriv('V(Vout1,vout2)') WHEN V('V(Vout1)-V(Vout2)')=0 	

*Frequency Response
.ac dec 10 1 100G
.pz V(Vout1, Vout2) Vin
.probe Vdb(Vout1,Vout2) Vp(Vout1, Vout2)
.meas ac dcgain_in_db find Vdb(Vout1, Vout2) at 1
.meas ac BW when Vdb(Vout1, Vout2) = 'dcgain_in_db-3'
 
*Common Mode
.alter 'Common Mode'
.tf V(Vout1) VBS
.dc VBS	0 1.8 0.01
.probe V(Vout1)
.meas Vout_derivative FIND deriv('V(Vout1)') WHEN V(VBS) = gate_bias


*THD
.alter 'THD'
Vin	Vin 	gnd sin(0 8m 1x 0 0)
.tran 0.1u 10u   
.four 1x v(Vout1)
.four 1x v(Vout2)
.four 1x v(Vout1,Vout2)

.end
