Analog IC Term Project VI: closed-loop AC response (light load)
.protect
.lib 'cic018.l' tt
.unprotect
.option post acout=0 accurate
.include "op.sp" * Include your OP netlist

.param cload=5p * Your load
                                                                                
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
                                                                                
vinp test1 0 dc comon ac 0.5 0
vinn test2 0 dc comon ac 0.5 180
                                                                                
.ac dec 10 10 1g
.probe ac vdb(vop,von) vp(vop,von)

.meas ac dcgain_in_db find vdb(vop,von) at=10k
.meas ac maxgain_in_db max vdb(vop,von)

.end
