Analog IC Term Project VIII: closed-loop THD (light load)
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

Vi1 test1 vocm SIN(0 0.25 100k 0 0 0)
Vi2 test2 vocm SIN(0 -0.25 100k 0 0 0)

.tran 1ns 20us

.four 100k V(vop,von)
.four 100k V(vop)
.four 100k V(von)
.probe tran vout=par('V(vop,von)') vin=par('V(test1,test2)') 

.end
