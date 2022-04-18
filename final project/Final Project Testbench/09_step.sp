Analog IC Term Project IX: closed-loop step response+ (light load)
.protect
.lib 'cic018.l' tt
.unprotect
.option post acout=0 accurate
.include "op.sp" * Include your OP netlist
                                                                                
.param cload=5p * Your load
.param steph='comon+0.25'
.param stepl='comon-0.25'
                                                                                                             
Xop Vinp Vinn vdd vss vop von vocm my_op * Modify your subcircuit name

cload1 von 0 cload
cload2 vop 0 cload
rtest1 Vinn test2 25k
rtest2 Vinp test1 25k
rtest3 Vinn Vop 25k
rtest4 Vinp Von 25k
                                                                                
vdd vdd 0 dc supplyp
vgnd vss 0 dc supplyn
vocm vocm 0 dc comon

Vi1 test1 0 pulse(stepl steph 50ns 0 0 1050ns)
Vi2 test2 0 pulse(steph stepl 50ns 0 0 1050ns) 

.tran 1ns 1.05us

.probe tran vout=par('V(vop,von)') vin=par('V(test1,test2)') 

.meas tran final1 find v(vop) at 1049ns
.meas tran hlimit1 param='final1*1.005'
.meas tran llimit1 param='final1*0.995'
.meas tran htime1 when v(vop)=hlimit1 cross=last
.meas tran ltime1 when v(vop)=llimit1 cross=last
.meas tran pos_settling1 param='max(htime1,ltime1)-50n' 

.meas tran final2 find v(von) at 1049ns
.meas tran hlimit2 param='final2*1.005'
.meas tran llimit2 param='final2*0.995'
.meas tran htime2 when v(von)=hlimit2 cross=last
.meas tran ltime2 when v(von)=llimit2 cross=last
.meas tran pos_settling2 param='max(htime2,ltime2)-50n' 

.meas tran SRp_time TRIG v(vop,von) VAL=-0.4 RISE=1
+                   TARG v(vop,von) VAL=0.4 RISE=1 
.meas tran SRp param='0.8/SRp_time'

.end
