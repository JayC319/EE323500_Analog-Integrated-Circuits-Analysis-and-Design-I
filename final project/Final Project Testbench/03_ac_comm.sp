Analog IC Term Project: Common mode AC responses
.protect
.lib 'cic018.l' tt
.unprotect
.option post acout=0 accurate
.include "op.sp" *Include your OP netlist

.param cload=5p *Your load

Xop  Vinp Vinn vdd vss vop von vocm my_op 

cload1 von 0 cload
cload2 vop 0 cload

vdd vdd 0 dc supplyp
vgnd vss 0 dc supplyn
vocm vocm 0 dc comon

vinp vinp 0 dc comon ac 1 0
vinn vinn 0 dc comon ac 1 0

.ac dec 10 10 1g

.meas ac acm_in_db find vdb(vop) at=10k
.end
