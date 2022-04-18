*AIC HW1_part3
.protect
.lib 'cic018.l' TT
.unprotect
.option
+ post
+ captab
+ ABSTOL=1e-7 RELTOL=1e-7 ACCURATE=1
.temp 25

*VOLTAGE
VDD vdd gnd DC=1.8
VSS vss gnd DC=0
VB vb gnd 0

*CURRENT SOURCE
Ibn vdd in1 DC=40u
Ibp ip1 vss DC=40u

*MOS 
.param length=2u
+ width = 2*length
Mbn in1 in1 vss vb n_18 W=width L=length M=1  
Mbp ip1 ip1 Vdd vb p_18 W=width L=length M=1

*Simulation setup
.op
.dc VB 0 1.8 0.01 sweep length 2u 10u 2u
.PROBE Vthn=LV9(Mbn) 
+Vthp=LV9(Mbp)
+Vgs_n=par('V(in1)-V(vss)')
+Vgs_p=par('V(ip1)-V(vdd)')

.end
