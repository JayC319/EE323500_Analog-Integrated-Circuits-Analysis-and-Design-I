Analog IC Term Project: Differential mode AC responses

.protect
.lib 'cic018.l' tt
.unprotect
.option post acout=0 accurate
.include "op.sp" *Include your OP netlist

.param cload=5p *Your load

Xop Vinp Vinn vdd vss vop von vocm my_op 

cload1 von 0 cload
cload2 vop 0 cload

vdd vdd 0 dc supplyp
vgnd vss 0 dc supplyn
vocm vocm 0 dc comon

vinp vinp 0 dc comon ac 0.5 0
vinn vinn 0 dc comon ac 0.5 180

.ac dec 10 10 1g
.probe ac vdb(vop,von) vp(vop,von)

.meas ac dcgain_in_db max vdb(vop,von)
.meas ac dcgain max vm(vop,von)
.meas ac unity_frequency when vdb(vop,von)=0
.meas ac phase find vp(vop,von) at=unity_frequency
.meas ac phase_margin param='180+phase'

.end

