Analog IC Term Project: DC sweep
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

.param sweepv=0

vinp vinp 0 dc 'supplyn+sweepv'
vinn vinn 0 dc 'supplyp-sweepv'

.dc sweepv 0 'supplyp-supplyn' 0.0001
.meas dc vomax max v(vop)
.meas dc vomin min v(von)
.meas dc vodmax max v(vop,von)
.meas dc vodmin min v(vop,von)

.end
