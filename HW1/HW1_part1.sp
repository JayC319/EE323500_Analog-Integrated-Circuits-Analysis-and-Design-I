* AIC HW1 part1
.protect
.lib 'cic018.l' TT
.unprotect
.option
+ post
+ captab
+ ABSTOL=1e-7 RELTOL=1e-7 ACCURATE=1
.temp 25
* VOLTAGE
VDD vdd gnd 1.8
VSS vss gnd 0

* CURRENT SOURCE
Ithn vdd in1 40u
Ithp ip1 vss 40u



* MOS
.param length=0.18u
Mthn in1 in1 vss vss n_18 W=2*length L=length m=1  
Mthp ip1 ip1 vdd vdd p_18 W=2*length L=length m=1

* simulation setup
.op
.dc length 0.18u 10u 0.01u
** 1. Threshold Voltage
.PROBE Vthp=LV9(Mthp)
.PROBE Vthn=LV9(Mthn)
** 2. Transconductance
.PROBE GMO(Mthp)
.PROBE GMO(Mthn)
** 3. Output conductance
.PROBE GDSO(Mthp)
.PROBE GDSO(Mthn)
** 4. Satuation drain voltage
.PROBE VD_sat_p=LV10(Mthp)
.PROBE VD_sat_n=LV10(Mthn)
** 5. Intrinsic gain
.PROBE GMRO_p = par('GMO(Mthp)/GDSO(Mthp)')
.PROBE GMRO_n = par('GMO(Mthn)/GDSO(Mthn)')
** 6. Power efficiency
.PROBE Power_Efficiency_p = par ('GMO(Mthp)/CDO(Mthp)')
.PROBE Power_Efficiency_n = par ('GMO(Mthn)/CDO(Mthn)')
** 7. Speed
.PROBE Speed_p = par('GMO(Mthp)/CGGBO(Mthp)')
.PROBE Speed_n = par('GMO(Mthn)/CGGBO(Mthn)')

.end
